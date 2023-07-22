ChallengesIndex = {
  UNDERWORLD_MONSTER_HUNTER = 1,
  UNDERWORLD_THE_BEGINNING = 2
}

ChallengesList = {
  [ChallengesIndex.UNDERWORLD_MONSTER_HUNTER] = {
    title = "Monster Hunter",
    description = "Kill all monster on Normal difficulty.",
    points = 15
  },
  [ChallengesIndex.UNDERWORLD_THE_BEGINNING] = {
    title = "The Beginning",
    description = "Finish dungeon on Normal difficulty.",
    points = 5
  }
}

function Player:addChallengeProgress(id, value)
  self:setStorageValue(PlayerStorageKeys.challengeComplete + id, self:getChallengeProgress(id) + value)
end

function Player:getChallengeProgress(id)
  local progress = self:setgetSorageValue(PlayerStorageKeys.challengeProgress + id)
  if progress == -1 then
    progress = 0
  end
  return progress
end

function Player:completeChallenge(id)
  self:setStorageValue(PlayerStorageKeys.challengeComplete + id, 1)
  self:addChallengePoints(ChallengesList[id].points)
  self:sendExtendedOpcode(ExtendedOPCodes.CODE_DUNGEONS, json.encode({action = "challenge", data = ChallengesList[id].title}))
end

function Player:hasCompletedChallenge(id)
  return self:getStorageValue(PlayerStorageKeys.challengeComplete + id) > 0
end

function Player:addChallengePoints(value)
  self:setStorageValue(PlayerStorageKeys.challengePoints, self:getChallengePoints() + value)
end

function Player:setChallengePoints(value)
  self:setStorageValue(PlayerStorageKeys.challengePoints, value)
end

function Player:getChallengePoints()
  local points = self:getStorageValue(PlayerStorageKeys.challengePoints)
  if points == -1 then
    points = 0
  end

  return points
end
