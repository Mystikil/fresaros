local creatureevent = CreatureEvent("MonsterIntelligenceKill")

function creatureevent.onKill(creature, target)
    local monster = creature:getMonster()
    if not monster or monster:getMaster() then
        return true
    end

    if target and (target:isPlayer() or target:isMonster()) then
        local kills = monster:getStorageValue(MonsterStorageKeys.intelligenceExperience)
        if kills < 0 then
            kills = 0
        end
        kills = kills + 1
        monster:setStorageValue(MonsterStorageKeys.intelligenceExperience, kills)

        if kills % 3 == 0 then
            monster:say("I grow stronger!", TALKTYPE_MONSTER_SAY)
            monster:setMaxHealth(monster:getMaxHealth() + 50)
            monster:addHealth(50)
            monster:setBaseSpeed(monster:getBaseSpeed() + 10)
            monster:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        end
    end
    return true
end

function creatureevent.onSpawn(monster, position, startup, artificial)
    monster:setStorageValue(MonsterStorageKeys.intelligenceExperience, 0)
    return true
end

creatureevent:type("kill")
creatureevent:register()
