local mType = Game.createMonsterType("electric wisp")
local monster = {}
monster.description = "an electric wisp"
monster.experience = 100
monster.outfit = {
        lookType = 245
}

monster.health = 150
monster.maxHealth = monster.health
monster.race = "energy"
monster.speed = 260

monster.changeTarget = {
        interval = 4000,
        chance = 10
}

monster.flags = {
        summonable = false,
        attackable = true,
        hostile = true,
        convinceable = false,
        pushable = true,
        canPushItems = true,
        canPushCreatures = false,
        targetDistance = 4,
        staticAttackChance = 90
}

monster.attacks = {
        {name = "melee", interval = 2000, minDamage = -15, maxDamage = -30},
        {name = "speed", interval = 4000, chance = 15, speed = -200, duration = 4000, effect = CONST_ME_ENERGYHIT, range = 7, target = true},
        {name = "combat", type = COMBAT_ENERGYDAMAGE, chance = 20, interval = 2000, range = 7, minDamage = -20, maxDamage = -40, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = true}
}

monster.defenses = {
        defense = 5,
        armor = 5
}

monster.elements = {
        {type = COMBAT_ENERGYDAMAGE, percent = 0},
        {type = COMBAT_EARTHDAMAGE, percent = 50}
}

mType.onThink = function(monster, interval)
        if math.random(100) <= 5 then
                monster:getPosition():sendMagicEffect(CONST_ME_ENERGYAREA)
        end
end

mType:register(monster)
