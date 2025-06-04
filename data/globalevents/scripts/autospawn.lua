-- Automatically spawn elemental monsters and bosses without using spawn.xml

local AutoSpawn = {}

-- Define elemental areas with coordinates and spawn lists
AutoSpawn.areas = {
    {
        element = "fire",
        fromPos = Position(100, 100, 7),
        toPos = Position(110, 110, 7),
        monsters = {"Fire Elemental", "Fire Devil"},
        boss = {name = "The Big Bad One", position = Position(105, 105, 7)}
    },
    {
        element = "energy",
        fromPos = Position(120, 100, 7),
        toPos = Position(130, 110, 7),
        monsters = {"Energy Elemental", "Charged Energy Elemental"},
        boss = {name = "Massive Energy Elemental", position = Position(125, 105, 7)}
    }
}

local function spawnArea(area)
    for x = area.fromPos.x, area.toPos.x do
        for y = area.fromPos.y, area.toPos.y do
            local pos = Position(x, y, area.fromPos.z)
            local tile = Tile(pos)
            if tile and tile:isWalkable() and not tile:getTopCreature() then
                Game.createMonster(area.monsters[math.random(#area.monsters)], pos, true, true)
            end
        end
    end

    if area.boss then
        Game.createMonster(area.boss.name, area.boss.position, true, true)
    end
end

function onStartup()
    for _, area in ipairs(AutoSpawn.areas) do
        spawnArea(area)
    end
    return true
end

