local creatureevent = CreatureEvent("ElectricWispThink")

function creatureevent.onThink(creature, interval)
        local monster = creature:getMonster()
        if not monster or monster:getMaster() then
                return true
        end

        if math.random(100) <= 10 then
                monster:say("Bzzzzt!", TALKTYPE_MONSTER_SAY)
                monster:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
        end
        return true
end

creatureevent:register()
