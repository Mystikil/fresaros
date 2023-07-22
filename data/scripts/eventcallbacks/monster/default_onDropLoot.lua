local ec = EventCallback

local difficultyGold = {1.0, 1.75, 2.0, 3.0, 4.0, 5.0}
local difficultyLoot = {0.0, 0.0, 0.15, 0.3, 0.45, 0.6}

ec.onDropLoot = function(self, corpse)
	if configManager.getNumber(configKeys.RATE_LOOT) == 0 then
		return
	end

	local player = Player(corpse:getCorpseOwner())
	local mType = self:getType()
	if not player or player:getStamina() > 840 then
    local realDifficulty = self:getDifficulty()
		local difficulty = self:getDifficulty()
		if difficulty == 0 then
			difficulty = 1
		end

		local gold = 0
		local monsterLoot = mType:getLoot()
		for i = 1, #monsterLoot do
			if realDifficulty == 0 then
				local item = corpse:createLootItem(monsterLoot[i])
				if not item then
					print("[Warning] DropLoot:", "Could not add loot item to corpse.")
				end
			else
				local randvalue = getLootRandom()
				monsterLoot[i].chance = monsterLoot[i].chance + math.floor((monsterLoot[i].chance * difficultyLoot[difficulty]) + 0.5)
				if isInArray({ITEM_GOLD_COIN, ITEM_PLATINUM_COIN, ITEM_CRYSTAL_COIN}, monsterLoot[i].itemId) then
					if randvalue < monsterLoot[i].chance then
						gold = gold + (math.min(randvalue % monsterLoot[i].maxCount + 1, 100) * getCoinWorth(monsterLoot[i].itemId))
					end
				else
					local item = corpse:createLootItem(monsterLoot[i])
					if not item then
						print("[Warning] DropLoot:", "Could not add loot item to corpse.")
					end
				end
			end
		end

		if player then
      if gold > 0 then
				gold = math.floor((gold * difficultyGold[difficulty]) + 0.5)

				player:setBankBalance(player:getBankBalance() + gold)
				player:sendTextMessage(MESSAGE_STATUS_SMALL, "Added " .. gold .. " gold to bank.")
			end
			local text = ("Loot of %s: %s"):format(mType:getNameDescription(), corpse:getContentDescription())
			local party = player:getParty()
			if party then
				party:broadcastPartyLoot(text)
			else
				player:sendTextMessage(MESSAGE_LOOT, text)
			end
		end
	else
		local text = ("Loot of %s: nothing (due to low stamina)"):format(mType:getNameDescription())
		local party = player:getParty()
		if party then
			party:broadcastPartyLoot(text)
		else
			player:sendTextMessage(MESSAGE_LOOT, text)
		end
	end
end

function getCoinWorth(coin)
	if coin == ITEM_CRYSTAL_COIN then
		return 10000
	elseif coin == ITEM_PLATINUM_COIN then
		return 100
	end

	return 1
end

ec:register()
