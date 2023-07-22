Crafting = {}

local maxMasteryLevel = 100
local expForLevel = 100
local expPerCraft = 5
local iLevelPerMastery = 2

local fetchLimit = 10

local categories = {"weaponsmith", "armorsmith", "alchemist", "enchanter", "jeweller"}

local categoryStorage = {
  ["weaponsmith"] = 0,
  ["armorsmith"] = 1,
  ["alchemist"] = 2,
  ["enchanter"] = 3,
  ["jeweller"] = 4
}

local ActionEvent = Action()

function ActionEvent.onUse(player)
  player:showCrafting()
  return true
end

local LoginEvent = CreatureEvent("CraftingLogin")

function LoginEvent.onLogin(player)
  player:registerEvent("CraftingExtended")
  return true
end

local ExtendedEvent = CreatureEvent("CraftingExtended")

function ExtendedEvent.onExtendedOpcode(player, opcode, buffer)
  if opcode == ExtendedOPCodes.CODE_CRAFTING then
    local status, json_data =
      pcall(
      function()
        return json.decode(buffer)
      end
    )

    if not status then
      return false
    end

    local action = json_data.action
    local data = json_data.data

    if action == "fetch" then
      Crafting:sendMoney(player)
      for _, category in ipairs(categories) do
        Crafting:updateMastery(player, category)
        Crafting:sendCrafts(player, category)
      end
    elseif action == "craft" then
      Crafting:craft(player, data.category, data.craftId)
    end
  end
  return true
end

function Crafting:sendCrafts(player, category)
  local data = {}

  for i = 1, #Crafting[category] do
    local craft = {}
    for key, value in pairs(Crafting[category][i]) do
      if key == "materials" then
        craft.materials = {}
        for indx, material in ipairs(value) do
          local itemType = ItemType(material.id)
          craft.materials[indx] = {
            id = material.id,
            count = material.count,
            player = player:getItemCount(material.id)
          }
          if itemType:getDescription():len() > 0 then
            craft.materials[indx].desc = itemType:getDescription()
          end
          craft.materials[indx].weight = itemType:getWeight() * material.count
          craft.materials[indx].itemType = formatItemType(itemType)
          craft.materials[indx].name = itemType:getName()
        end
      else
        local level = player:getMasteryLevel(category)
        local exp = player:getMasteryExp(category)
        local percent = math.floor((exp - (level * expForLevel)) * 100 / expForLevel)
        craft.mastery = {
          level = level,
          exp = expForLevel - (exp - (level * expForLevel)),
          percent = percent,
          need = (expForLevel - (exp - (level * expForLevel))) / expPerCraft
        }
        if key == "itemLvl" then
          craft[key] = value + (level * iLevelPerMastery)
        else
          craft[key] = value
        end
      end
    end

    local itemType = ItemType(craft.id)
    local item_data = itemType:buildTooltip(craft.count)
    if item_data then
      craft.item = item_data
    end

    for x = 1, #craft.materials do
      craft.materials[x].id = ItemType(craft.materials[x].id):getClientId()
    end
    table.insert(data, craft)
  end

  if #data >= fetchLimit then
    local x = 1
    for i = 1, math.floor(#data / fetchLimit) do
      player:sendExtendedOpcode(
        ExtendedOPCodes.CODE_CRAFTING,
        json.encode({action = "fetch", data = {category = category, crafts = {unpack(data, x, math.min(x + fetchLimit - 1, #data))}}})
      )
      x = x + fetchLimit
    end

    if x < #data then
      player:sendExtendedOpcode(ExtendedOPCodes.CODE_CRAFTING, json.encode({action = "fetch", data = {category = category, crafts = {unpack(data, x, #data)}}}))
    end
  else
    player:sendExtendedOpcode(ExtendedOPCodes.CODE_CRAFTING, json.encode({action = "fetch", data = {category = category, crafts = data}}))
  end
end

function Crafting:craft(player, category, craftId)
  local craft = Crafting[category][craftId]

  local money = player:getTotalMoney()

  if money < craft.cost then
    return
  end

  if player:getLevel() < craft.level then
    return
  end

  for i = 1, #craft.materials do
    local material = craft.materials[i]
    if player:getItemCount(material.id) < material.count then
      return
    end
  end

  local item = Game.createItem(craft.id, craft.count)
  if item then
    if player:addItemEx(item) then
      player:removeTotalMoney(craft.cost)

      for i = 1, #craft.materials do
        local material = craft.materials[i]
        player:removeItem(material.id, material.count)
      end

      -- if item:getType():isUpgradable() then
        -- local masteryLevel = player:getMasteryLevel(category)
        -- item:setItemLevel(craft.itemLvl + (masteryLevel * iLevelPerMastery))

        -- local rarity = COMMON
        -- local pCommon = 100
        -- local pRare = masteryLevel * 5
        -- local pEpic = math.floor(masteryLevel * 3.5)
        -- local pLegendary = math.floor(masteryLevel * 1.5)
        -- local pMythic = masteryLevel

        -- local rand = math.random(1, 100)
        -- if rand <= pMythic then
          -- rarity = MYTHIC
        -- elseif rand <= pLegendary then
          -- rarity = LEGENDARY
        -- elseif rand <= pEpic then
          -- rarity = EPIC
        -- elseif rand <= pRare then
          -- rarity = RARE
        -- elseif rand <= pCommon then
          -- rarity = COMMON
        -- end

        -- item:setRarity(rarity)
      -- end

      local masteryExp = player:getMasteryExp(category)
      if masteryExp < maxMasteryLevel * expForLevel then
        player:addMasteryExp(category)
        Crafting:updateMastery(player, category)
      end

      Crafting:sendMoney(player)
      Crafting:sendMaterials(player, category)
      player:sendExtendedOpcode(ExtendedOPCodes.CODE_CRAFTING, json.encode({action = "crafted"}))
    end
  end
end

function Crafting:sendMaterials(player, category)
  local data = {}

  for i = 1, #Crafting[category] do
    local materials = {}
    for key, value in pairs(Crafting[category][i]) do
      if key == "materials" then
        for matId, matData in ipairs(value) do
          materials[matId] = player:getItemCount(matData.id)
        end
      end
    end
    table.insert(data, materials)
  end

  if #data >= fetchLimit then
    local x = 1
    for i = 1, math.floor(#data / fetchLimit) do
      player:sendExtendedOpcode(
        ExtendedOPCodes.CODE_CRAFTING,
        json.encode({action = "materials", data = {category = category, from = x, materials = {unpack(data, x, math.min(x + fetchLimit - 1, #data))}}})
      )
      x = x + fetchLimit
    end

    if x < #data then
      player:sendExtendedOpcode(
        ExtendedOPCodes.CODE_CRAFTING,
        json.encode({action = "materials", data = {category = category, from = x, materials = {unpack(data, x, #data)}}})
      )
    end
  else
    player:sendExtendedOpcode(ExtendedOPCodes.CODE_CRAFTING, json.encode({action = "materials", data = {category = category, from = 1, materials = data}}))
  end
end

function Crafting:sendMoney(player)
  player:sendExtendedOpcode(ExtendedOPCodes.CODE_CRAFTING, json.encode({action = "money", data = player:getTotalMoney()}))
end

function Crafting:updateMastery(player, category)
  local level = player:getMasteryLevel(category)
  local exp = player:getMasteryExp(category)
  local percent = math.floor((exp - (level * expForLevel)) * 100 / expForLevel)
  player:sendExtendedOpcode(
    ExtendedOPCodes.CODE_CRAFTING,
    json.encode(
      {
        action = "mastery",
        data = {
          category = category,
          level = level,
          exp = expForLevel - (exp - (level * expForLevel)),
          percent = percent,
          need = (expForLevel - (exp - (level * expForLevel))) / expPerCraft
        }
      }
    )
  )
end

function Player:showCrafting()
  Crafting:sendMoney(self)
  for _, category in ipairs(categories) do
    Crafting:sendMaterials(self, category)
  end
  self:sendExtendedOpcode(ExtendedOPCodes.CODE_CRAFTING, json.encode({action = "show"}))
end

function Player:getMasteryExp(category)
  local exp = self:getStorageValue(PlayerStorageKeys.craftingMastery + categoryStorage[category])
  if exp == -1 then
    exp = 0
  end

  return exp
end

function Player:getMasteryLevel(category)
  local exp = self:getStorageValue(PlayerStorageKeys.craftingMastery + categoryStorage[category])
  if exp == -1 then
    exp = 0
  end

  return math.floor(exp / expForLevel)
end

function Player:addMasteryExp(category)
  local exp = self:getMasteryExp(category)
  exp = exp + expPerCraft
  self:setStorageValue(PlayerStorageKeys.craftingMastery + categoryStorage[category], exp)
end

ActionEvent:aid(38820)
ActionEvent:register()
LoginEvent:type("login")
LoginEvent:register()
ExtendedEvent:type("extendedopcode")
ExtendedEvent:register()
