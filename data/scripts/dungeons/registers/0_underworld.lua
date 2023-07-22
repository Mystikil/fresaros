local Underworld = Dungeon()

-- Basic info
Underworld:setTitle("Underworld")
Underworld:setDuration(10 * 60 * 1000)
Underworld:setMapFile("underworld")
Underworld:setStartPosition(Position(7, 7, 7))

-- Boss
Underworld:setBoss("Deathstrike", Position(20, 23, 8))
Underworld:setKillPercent(80)

-- Requirements
Underworld:setRequiredLevel(150)
Underworld:setRequiredGold(1 * 100 * 100) -- 1cc

-- Boss Loot
Underworld:addReward(18430, 1, 100)
Underworld:addReward(38920, 1, 10)
Underworld:addReward(2160, 15, 100)
--Underworld:addReward(26396, 1, 15)
--Underworld:addReward(26393, 1, 10)
--Underworld:addReward(26395, 1, 5)

Underworld:addChallenge(ChallengesIndex.UNDERWORLD_MONSTER_HUNTER)
Underworld:addChallenge(ChallengesIndex.UNDERWORLD_THE_BEGINNING)

-- Instances
Underworld:addInstance(Position(10000, 10000, 0))
--Underworld:addInstance(Position(10080, 10000, 0))
--Underworld:addInstance(Position(10160, 10000, 0))

Underworld:register()
