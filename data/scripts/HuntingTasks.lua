local REROLL_PRICE_PER_LEVEL = 100
local CANCEL_PRICE_PER_LEVEL = 100
local PICK_FROM_LIST_PRICE = 3
local UPGRADE_TASK_PRICE = 1
local CODE_HUNTINGTASKS = 110

local TaskStorage = {
	Wildcards = 87966,
	HuntingTasksPoints = 87967
}

local creaturesList = {
  {
    {name = "Scorpion", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Skeleton", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Crab", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Jellyfish", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Swamp Troll", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Goblin Scavenger", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Hyaena", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Cobra", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Skeleton Warrior", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Chakoya Tribewarden", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Centipede", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Larva", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Orc", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Salamander", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Goblin Assassin", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Tiger", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Troll Champion", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Bear", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Chakoya Toolshaper", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Dworc Venomsniper", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Dworc Voodoomaster", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Lion", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Panda", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Swampling", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Chakoya Windcaller", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Dworc Fleshhunter", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Polar Bear", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Dwarf", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Leaf Golem", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Barbarian Headsplitter", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Crazed Beggar", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Elf", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Ghoul", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Marsh Stalker", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Minotaur", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Minotaur Archer", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Crocodile", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Orc Spearman", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Amazon", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Orc Shaman", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Gazer", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Stalker", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Feverish Citizen", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Orc Warrior", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Smuggler", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Barbarian Skullhunter", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Dwarf Soldier", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Toad", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Wild Warrior", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "War Wolf", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Barbarian Brutetamer", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Carrion Worm", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Ghost", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Hunter", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Mercury Blob", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Slime", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Spit Nettle", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Minotaur Mage", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Elf Scout", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Nomad", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Assassin", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Orc Rider", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Gladiator", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Minotaur Guard", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Tortoise", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Dark Monk", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Deepling Worker", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Pirate Skeleton", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Valkyrie", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Boar", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Gnarlhound", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Fire Devil", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Pirate Marauder", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Elf Arcanist", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Dark Apprentice", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Sibang", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Tarantula", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Insectoid Scout", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Merlkin", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Gozzler", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Monk", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Mummy", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Bandit", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Dwarf Guard", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Corym Charlatan", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Gargoyle", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Bonelord", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Cyclops", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Rorc", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Lizard Sentinel", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Frost Giant", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Stone Golem", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Frost Giantess", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Pirate Ghost", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Novice of the Cult", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Blood Crab", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Gang Member", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Terror Bird", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Thornback Tortoise", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Witch", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Elephant", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Mammoth", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Scarab", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Dark Magician", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Mad Scientist", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Crypt Shambler", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Kongra", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Iron Servant", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Terramite", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}},
    {name = "Lizard Templar", amounts = {100, 400}, points = {{1, 2, 3, 4, 5}, {4, 8, 12, 16, 20}}}
  },
  {
    {name = "Acid Blob", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Acolyte of the Cult", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Adept of the Cult", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Ancient Scarab", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Animated Snowman", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Arctic Faun", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Askarak Demon", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Askarak Lord", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Askarak Prince", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Banshee", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Barbarian Bloodwalker", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Behemoth", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Bellicose Orger", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Betrayed Wraith", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Blood Beast", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Blood Hand", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Blood Priest", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Blue Djinn", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Bog Raider", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Bonebeast", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Boogy", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Braindeath", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Brimstone Bug", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Broken Shaper", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Carniphila", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Clay Guardian", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Clomp", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Corym Skirmisher", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Corym Vanguard", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Crawler", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Cow", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Crustacea Gigantica", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Crystal Spider", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Crystal Wolf", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Crystalcrusher", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Cult Believer", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Cult Enforcer", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Cult Scholar", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Cyclops Drone", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Cyclops Smith", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Dark Faun", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Death Priest", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Deepling Brawler", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Deepling Elite", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Deepling Guard", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Deepling Master Librarian", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Deepling Scout", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Deepling Spellsinger", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Deepling Warrior", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Demon Skeleton", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Destroyer", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Devourer", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Diabolic Imp", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Diamond Servant Replica", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Diamond Servant", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Dragon Hatchling", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Dragon Lord Hatchling", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Dragon Lord", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Dragon", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Dragonling", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Draken Warmaster", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Draptor", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Drillworm", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Dryad", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Dwarf Geomancer", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Earth Elemental", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Efreet", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Elder Bonelord", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Elder Forest Fury", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Elder Mummy", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Elf Overseer", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Energy Elemental", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Enfeebled Silencer", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Enlightened of the Cult", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Enraged Crystal Golem", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Enslaved Dwarf", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Eternal Guardian", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Execowtioner", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Exotic Bat", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Exotic Cave Spider", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Faun", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Feversleep", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Fire Elemental", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Forest Fury", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Frost Dragon Hatchling", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Frost Dragon", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Frost Flower Asura", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Ghoulish Hyaena", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Giant Spider", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Glooth Anemone", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Glooth Bandit", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Glooth Blob", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Glooth Brigand", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Glooth Golem", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Golden Servant", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Goldhanded Cultist Bride", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Goldhanded Cultist", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Grave Guard", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Gravedigger", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Green Djinn", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Haunted Treeling", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Hellspawn", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Herald of Gloom", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Hero", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "High Voltage Elemental", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Hydra", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Ice Dragon", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Ice Golem", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Ice Witch", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Insectoid Worker", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Instable Breach Brood 	", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Instable Sparkion", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Killer Caiman", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Kollos", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Lancer Beetle", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Lich", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Lizard Chosen", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Lizard Dragon Priest", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Lizard High Guard", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Lizard Legionnaire", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Lizard Magistratus", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Lizard Snakecharmer", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Lizard Zaogun", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Loricate Orger", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Lost Basher", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Lost Exile", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Lost Husher", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Lost Soul", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Lost Thrower", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Lumbering Carnivor", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Marid", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Massive Earth Elemental", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Massive Energy Elemental", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Massive Fire Elemental", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Massive Water Elemental", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Metal Gargoyle", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Midnight Asura", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Midnight Panther", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Minotaur Cult Follower", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Minotaur Cult Prophet", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Minotaur Cult Zealot", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Minotaur Hunter", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Misguided Thief", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Misguided Bully", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Mooh'Tah Warrior", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Moohtant", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Mutated Bat", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Mutated Human", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Mutated Rat", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Mutated Tiger", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Necromancer", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Nightfiend", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Nightmare Scion", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Nightmare", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Nightstalker", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Roaring Lion", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Nymph", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Ogre Brute", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Ogre Savage", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Ogre Shaman", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Omnivora", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Orc Berserker", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Orc Cult Fanatic", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Orc Cult Inquisitor", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Orc Cult Minion", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Orc Cult Priest", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Orc Cultist", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Orc Leader", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Orc Marauder", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Orc Warlord", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Orclops Doomhauler", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Orclops Ravager", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Orger", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Percht", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Pirat Bombardier", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Pirat Cutthroat", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Pirat Mate", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Pirat Scoundrel", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Pirate Buccaneer", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Pirate Corsair", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Pirate Cutthroat", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Pixie", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Plaguesmith", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Pooka", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Priestess", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Putrid Mummy", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Quara Constrictor", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Quara Hydromancer", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Quara Mantassin", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Quara Pincher", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Quara Predator", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Renegade Knight", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Roast Pork", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Rot Elemental", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Rustheap Golem", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Sandstone Scorpion", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Schiach", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Sea Serpent", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Serpent Spawn", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Shaburak Demon", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Shaburak Lord", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Shaburak Prince", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Shadow Pupil", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Shaper Matriarch", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Shark", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Silencer", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Souleater", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Spectre", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Spidris", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Spitter", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Stabilizing Dread Intruder", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Stabilizing Reality Reaver", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Stampor", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Stone Rhino", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Stonerefiner", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Swan Maiden", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Thornfire Wolf", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Tomb Servant", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Twisted Pooka", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Twisted Shaper", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Undead Cavebear", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Undead Gladiator", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Vampire Bride", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Vampire Viscount", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Vampire", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Vicious Manbat", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Vicious Squire", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Vile Grandmaster", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Wailing Widow", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Walker", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "War Golem", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Warlock", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Waspoid", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Water Elemental", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Weakened Frazzlemaw", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Werebadger", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Werebear", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Wereboar", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Werefox", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Werehyaena Shaman", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Werehyaena", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Werewolf", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Wiggler", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Wilting Leaf Golem", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Worker Golem", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Worm Priestess", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Wyrm", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Wyvern", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Yeti", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Yielothax", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Young Sea Serpent", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}},
    {name = "Zombie", amounts = {2000, 5000}, points = {{20, 40, 60, 80, 100}, {50, 100, 150, 200, 250}}}
  },
  {
    {name = "Adult Goanna", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Afflicted Strider", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Animated Feather", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Arachnophobica", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Armadile", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Bashmu", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Biting Book", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Black Sphinx Acolyte", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Blightwalker", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Brain Squid", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Breach Brood", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Burning Book", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Burning Gladiator", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Burster Spectre", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Cave Chimera", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Cave Devourer", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Chasm Spawn", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Choking Fear", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Cliff Strider", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Cobra Assassin", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Cobra Scout", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Cobra Vizier", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Crazed Summer Rearguard", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Crazed Summer Vanguard", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Crazed Winter Rearguard", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Crazed Winter Vanguard", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Crypt Warden", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Cursed Book", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Cursed Prospector", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Dark Torturer", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Dawnfire Asura", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Deathling Scout", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Deathling Spellsinger", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Deepling Tyrant", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Deepworm", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Defiler", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Demon Outcast", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Demon", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Diremaw", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Draken Abomination", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Draken Elite", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Draken Spellweaver", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Dread Intruder", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Elder Wyrm", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Energetic Book", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Energuardian of Tales", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Evil Prospector", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Falcon Knight", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Falcon Paladin", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Feral Sphinx", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Flimsy Lost Soul", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Floating Savant", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Frazzlemaw", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Freakish Lost Soul", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Fury", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Gazer Spectre", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Ghastly Dragon", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Grim Reaper", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Grimeleech", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Guardian of Tales", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Guzzlemaw", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Hand of Cursed Fate", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Haunted Dragon", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Hellfire Fighter", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Hellflayer", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Hellhound", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Hideous Fungus", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Hive Overseer", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Humongous Fungus", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Icecold Book", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "nfected Weeper", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Infernalist", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Ink Blob", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Insane Siren", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Ironblight", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Juggernaut", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Knowledge Elemental", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Lamassu", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Lava Golem", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Lizard Noble", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Lost Berserker", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Magma Crawler", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Manticore", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Mean Lost Soul", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Medusa", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Menacing Carnivor", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Minotaur Amazon", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Ogre Rowdy", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Ogre Ruffian", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Ogre Sage", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Orewalker", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Phantasm", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Priestess of the Wild Sun", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Rage Squid", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Reality Reaver", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Retching Horror", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Ripper Spectre", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Seacrest Serpent", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Sight of Surrender", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Skeleton Elite Warrior", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Soul-Broken Harbinger", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Sparkion", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Sphinx", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Spiky Carnivor", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Squid Warden", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Stone Devourer", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Terrorsleep", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Thanatursus", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "True Dawnfire Asura", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "True Frost Flower Asura", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "True Midnight Asura", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Tunnel Tyrant", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Undead Dragon", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Undead Elite Gladiator", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Usurper Archer", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Usurper Knight", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Usurper Warlock", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Venerable Girtablilu", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Vexclaw", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Vulcongra", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Weeper", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Werelion", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Werelioness", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "White Lion", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}},
    {name = "Young Goanna", amounts = {8000, 16000}, points = {{140, 160, 180, 200, 220}, {280, 320, 360, 400, 440}}}
  }
}

local slotsData = {}

local KillEvent = CreatureEvent("HuntingTasksKill")
local LoginEvent = CreatureEvent("HuntingTasksLogin")

function LoginEvent.onLogin(player)
  player:registerEvent("HuntingTasksExtended")
  player:registerEvent("HuntingTasksKill")
  return true
end

local LogoutEvent = CreatureEvent("HuntingTasksLogout")

function LogoutEvent.onLogout(player)
  slotsData[player:getId()] = nil
  return true
end

local ExtendedEvent = CreatureEvent("HuntingTasksExtended")

function ExtendedEvent.onExtendedOpcode(player, opcode, buffer)
  if opcode == CODE_HUNTINGTASKS then
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
      player:sendHuntingTasks()
    elseif action == "resources" then
      player:sendHuntingTasksResources()
    elseif action == "reroll" then
      player:rerollHuntingTasks(data)
    elseif action == "upgrade" then
      player:upgradeHuntingTask(data)
    elseif action == "accept" then
      player:acceptHuntingTask(data)
    elseif action == "cancel" then
      player:cancelHuntingTask(data)
    elseif action == "finish" then
      player:finishHuntingTask(data)
    elseif action == "pick" then
      player:sendPickCreatures(data)
    end
  end
  return true
end

function Player:sendHuntingTasksResources()
  local totalMoney = self:getTotalMoney()
  local data = {
    balance = totalMoney,
    wildcards = self:getWildcards(),
    points = self:getHuntingTasksPoints(),
    rerollPrice = self:getLevel() * REROLL_PRICE_PER_LEVEL,
    cancelPrice = self:getLevel() * CANCEL_PRICE_PER_LEVEL,
    pickPrice = PICK_FROM_LIST_PRICE,
    upgradePrice = UPGRADE_TASK_PRICE,
    canReroll = (totalMoney >= self:getLevel() * REROLL_PRICE_PER_LEVEL),
    canCancel = (totalMoney >= self:getLevel() * CANCEL_PRICE_PER_LEVEL),
    canPick = (self:getWildcards() >= PICK_FROM_LIST_PRICE)
  }
  data.canUpgrade = {}
  for i = 1, 3 do
    local huntingTask = self:getHuntingTask(i)
    if huntingTask.status == HUNTINGTASK_ACTIVE then
      data.canUpgrade[i] = (self:getWildcards() >= UPGRADE_TASK_PRICE and huntingTask.stars < 5)
    else
      data.canUpgrade[i] = false
    end
  end

  self:sendExtendedOpcode(CODE_HUNTINGTASKS, json.encode({action = "resources", data = data}))
end

function Player:sendHuntingTasks()
  local pid = self:getId()
  if not slotsData[pid] then
    slotsData[pid] = {}
  end

  local huntingTasks = self:getHuntingTasks()
  local data = {}
  for i = 1, 3 do
    data[i] = {}
    local huntingTask = huntingTasks[i]
    if huntingTask.status == HUNTINGTASK_EMPTY then
      local creatures = self:generateHuntingTasks(i)
      self:resetHuntingTaskCreatures(i)
      for k = 1, 9 do
        self:addHuntingTaskCreature(i, creatures[k].name)
      end
      self:setHuntingTaskStatus(i, HUNTINGTASK_INACTIVE)

      data[i].status = HUNTINGTASK_INACTIVE
      data[i].creatures = {}
      for k = 1, 9 do
        local monster = MonsterType(creatures[k].name)
        local outfit = monster:outfit()
        data[i].creatures[k] = creatures[k]
        data[i].creatures[k].outfit = {
          type = outfit.lookType,
          auxType = outfit.lookTypeEx,
          head = outfit.lookHead,
          body = outfit.lookBody,
          legs = outfit.lookLegs,
          feet = outfit.lookFeet,
          addons = outfit.lookAddons,
          mount = outfit.lookMount
        }
      end
    else
      data[i].status = huntingTask.status
      if huntingTask.status == HUNTINGTASK_INACTIVE then
        data[i].creatures = {}
        for k = 1, 9 do
          local creature = getHuntingTaskCreatureByName(huntingTask.creatures[k])
          local monster = MonsterType(creature.name)
          local outfit = monster:outfit()
          data[i].creatures[k] = creature
          data[i].creatures[k].outfit = {
            type = outfit.lookType,
            auxType = outfit.lookTypeEx,
            head = outfit.lookHead,
            body = outfit.lookBody,
            legs = outfit.lookLegs,
            feet = outfit.lookFeet,
            addons = outfit.lookAddons,
            mount = outfit.lookMount
          }
        end
      elseif huntingTask.status == HUNTINGTASK_ACTIVE then
        local creature = getHuntingTaskCreatureByName(huntingTask.creature)
        local monster = MonsterType(creature.name)
        local outfit = monster:outfit()
        data[i].creature = creature
        data[i].creature.outfit = {
          type = outfit.lookType,
          auxType = outfit.lookTypeEx,
          head = outfit.lookHead,
          body = outfit.lookBody,
          legs = outfit.lookLegs,
          feet = outfit.lookFeet,
          addons = outfit.lookAddons,
          mount = outfit.lookMount
        }
        data[i].stars = huntingTask.stars
        data[i].points = creature.points[huntingTask.amount][huntingTask.stars]
        data[i].kills = huntingTask.kills
        data[i].amount = huntingTask.amount
        data[i].canUpgrade = (self:getWildcards() >= UPGRADE_TASK_PRICE and huntingTask.stars < 5)
      end
    end
  end
  self:sendExtendedOpcode(CODE_HUNTINGTASKS, json.encode({action = "slots", data = data}))
end

function Player:rerollHuntingTasks(slotId)
  if self:getTotalMoney() < self:getLevel() * REROLL_PRICE_PER_LEVEL then
    return
  end

  self:removeTotalMoney(self:getLevel() * REROLL_PRICE_PER_LEVEL)
  self:sendHuntingTasksResources()

  local creatures = self:generateHuntingTasks(slotId)
  self:resetHuntingTaskCreatures(slotId)
  for k = 1, 9 do
    self:addHuntingTaskCreature(slotId, creatures[k].name)
  end

  local data = {}
  data.slot = slotId
  data.creatures = {}
  for k = 1, 9 do
    local monster = MonsterType(creatures[k].name)
    local outfit = monster:outfit()
    data.creatures[k] = creatures[k]
    data.creatures[k].outfit = {
      type = outfit.lookType,
      auxType = outfit.lookTypeEx,
      head = outfit.lookHead,
      body = outfit.lookBody,
      legs = outfit.lookLegs,
      feet = outfit.lookFeet,
      addons = outfit.lookAddons,
      mount = outfit.lookMount
    }
  end

  self:sendExtendedOpcode(CODE_HUNTINGTASKS, json.encode({action = "creatures", data = data}))
end

function Player:upgradeHuntingTask(slotId)
  if self:getWildcards() < UPGRADE_TASK_PRICE then
    return
  end

  self:removeWildcards(UPGRADE_TASK_PRICE)

  local upgrade = math.random(100) <= 50 and 2 or 1
  local huntingTask = self:getHuntingTask(slotId)
  local creature = getHuntingTaskCreatureByName(huntingTask.creature)
  local stars = math.min(5, huntingTask.stars + upgrade)
  self:setHuntingTaskStars(slotId, stars)
  self:sendHuntingTasksResources()

  local data = {}
  data.slot = slotId
  data.stars = stars
  data.points = creature.points[huntingTask.amount][stars]
  self:sendExtendedOpcode(CODE_HUNTINGTASKS, json.encode({action = "upgrade", data = data}))
end

function Player:acceptHuntingTask(data)
  local slotId, creatureId, amount = data.slot, data.creature, data.amount
  local huntingTask = self:getHuntingTask(slotId)
  local creature = getHuntingTaskCreatureByName(data.pick and data.creature or huntingTask.creatures[creatureId])
  self:setHuntingTaskCreature(slotId, creature.name)
  local stars = rollHuntingTaskUpgrade()
  self:resetHuntingTaskCreatures(slotId)
  self:setHuntingTaskStars(slotId, stars)
  self:setHuntingTaskAmount(slotId, amount)
  self:setHuntingTaskKills(slotId, 0)
  self:setHuntingTaskStatus(slotId, HUNTINGTASK_ACTIVE)

  local data = {}
  data.slot = slotId
  data.stars = stars
  data.points = creature.points[amount][stars]
  data.amount = amount
  data.kills = 0
  data.status = HUNTINGTASK_ACTIVE
  data.cancelPrice = self:getLevel() * CANCEL_PRICE_PER_LEVEL
  data.upgradePrice = UPGRADE_TASK_PRICE
  data.canCancel = (self:getTotalMoney() >= self:getLevel() * CANCEL_PRICE_PER_LEVEL)
  data.canUpgrade = (self:getWildcards() >= UPGRADE_TASK_PRICE and stars < 5)
  data.creature = {}
  local monster = MonsterType(creature.name)
  local outfit = monster:outfit()
  data.creature = creature
  data.creature.outfit = {
    type = outfit.lookType,
    auxType = outfit.lookTypeEx,
    head = outfit.lookHead,
    body = outfit.lookBody,
    legs = outfit.lookLegs,
    feet = outfit.lookFeet,
    addons = outfit.lookAddons,
    mount = outfit.lookMount
  }
  self:sendExtendedOpcode(CODE_HUNTINGTASKS, json.encode({action = "accept", data = data}))
end

function Player:cancelHuntingTask(slotId)
  if self:getTotalMoney() < self:getLevel() * CANCEL_PRICE_PER_LEVEL then
    return
  end

  self:removeTotalMoney(self:getLevel() * CANCEL_PRICE_PER_LEVEL)
  self:sendHuntingTasksResources()

  local creatures = self:generateHuntingTasks(slotId)
  self:resetHuntingTaskCreatures(slotId)
  for k = 1, 9 do
    self:addHuntingTaskCreature(slotId, creatures[k].name)
  end
  self:setHuntingTaskCreature(slotId, nil)
  self:setHuntingTaskStatus(slotId, HUNTINGTASK_INACTIVE)

  local data = {}
  data.slot = slotId
  data.status = HUNTINGTASK_INACTIVE
  data.pickPrice = PICK_FROM_LIST_PRICE
  data.canPick = (self:getWildcards() >= PICK_FROM_LIST_PRICE)
  data.rerollPrice = self:getLevel() * REROLL_PRICE_PER_LEVEL
  data.canReroll = (self:getTotalMoney() >= self:getLevel() * REROLL_PRICE_PER_LEVEL)
  data.creatures = {}
  for k = 1, 9 do
    local monster = MonsterType(creatures[k].name)
    local outfit = monster:outfit()
    data.creatures[k] = creatures[k]
    data.creatures[k].outfit = {
      type = outfit.lookType,
      auxType = outfit.lookTypeEx,
      head = outfit.lookHead,
      body = outfit.lookBody,
      legs = outfit.lookLegs,
      feet = outfit.lookFeet,
      addons = outfit.lookAddons,
      mount = outfit.lookMount
    }
  end
  self:sendExtendedOpcode(CODE_HUNTINGTASKS, json.encode({action = "cancel", data = data}))
end

function Player:finishHuntingTask(slotId)
  local huntingTask = self:getHuntingTask(slotId)
  local creature = getHuntingTaskCreatureByName(huntingTask.creature)
  if huntingTask.kills < creature.amounts[huntingTask.amount] then
    return
  end

  self:addHuntingTasksPoints(creature.points[huntingTask.amount][huntingTask.stars])
  self:sendHuntingTasksResources()

  local creatures = self:generateHuntingTasks(slotId)
  self:resetHuntingTaskCreatures(slotId)
  for k = 1, 9 do
    self:addHuntingTaskCreature(slotId, creatures[k].name)
  end
  self:setHuntingTaskCreature(slotId, nil)
  self:setHuntingTaskStatus(slotId, HUNTINGTASK_INACTIVE)

  local data = {}
  data.slot = slotId
  data.status = HUNTINGTASK_INACTIVE
  data.pickPrice = PICK_FROM_LIST_PRICE
  data.canPick = (self:getWildcards() >= PICK_FROM_LIST_PRICE)
  data.rerollPrice = self:getLevel() * REROLL_PRICE_PER_LEVEL
  data.canReroll = (self:getTotalMoney() >= self:getLevel() * REROLL_PRICE_PER_LEVEL)
  data.creatures = {}
  for k = 1, 9 do
    local monster = MonsterType(creatures[k].name)
    local outfit = monster:outfit()
    data.creatures[k] = creatures[k]
    data.creatures[k].outfit = {
      type = outfit.lookType,
      auxType = outfit.lookTypeEx,
      head = outfit.lookHead,
      body = outfit.lookBody,
      legs = outfit.lookLegs,
      feet = outfit.lookFeet,
      addons = outfit.lookAddons,
      mount = outfit.lookMount
    }
  end
  self:sendExtendedOpcode(CODE_HUNTINGTASKS, json.encode({action = "finish", data = data}))
end

function Player:sendHuntingTaskUpdate(slotId, kills)
  local data = {
    slot = slotId,
    kills = kills
  }
  self:sendExtendedOpcode(CODE_HUNTINGTASKS, json.encode({action = "update", data = data}))
end

function Player:sendPickCreatures(slotId)
  if self:getWildcards() < UPGRADE_TASK_PRICE then
    return
  end

  self:removeWildcards(PICK_FROM_LIST_PRICE)
  self:sendHuntingTasksResources()

  local data = {}
  local index = 1
  local huntingTasks = self:getHuntingTasks()
  for i = 1, 3 do
    for k = 1, #creaturesList[i] do
      local creature = creaturesList[i][k]
      if not self:hasCreatureHuntingTask(huntingTasks, nil, creature.name, slotId) then
        local monster = MonsterType(creature.name)
        if monster then
          data[index] = {}
          data[index].name = creature.name
          local outfit = monster:outfit()
          data[index].outfit = {
            type = outfit.lookType,
            auxType = outfit.lookTypeEx,
            head = outfit.lookHead,
            body = outfit.lookBody,
            legs = outfit.lookLegs,
            feet = outfit.lookFeet,
            addons = outfit.lookAddons,
            mount = outfit.lookMount
          }
          data[index].amounts = creature.amounts
          data[index].points = {}
          data[index].points[1] = {creature.points[1][1], creature.points[1][5]}
          data[index].points[2] = {creature.points[2][1], creature.points[2][5]}
          index = index + 1
        end
      end
    end
  end
  self:sendExtendedOpcode(CODE_HUNTINGTASKS, json.encode({action = "pickC", data = data}))
  self:sendExtendedOpcode(CODE_HUNTINGTASKS, json.encode({action = "pick", data = slotId}))
end

function Player:hasCreatureHuntingTask(huntingTasks, creatures, creatureName, ignore)
  for i = 1, 3 do
    if not ignore or ignore ~= i then
      if huntingTasks[i].creature == creatureName then
        return true
      end

      if table.contains(huntingTasks[i].creatures, creatureName) then
        return true
      end
    end
  end

  if creatures then
    for _, creature in ipairs(creatures) do
      if creature.name == creatureName then
        return true
      end
    end
  end

  return false
end

function Player:generateHuntingTasks(slotId)
  local creatures = {}

  local huntingTasks = self:getHuntingTasks()
  for i = 1, 3 do
    for k = 1, 3 do
      local creature = creaturesList[i][math.random(1, #creaturesList[i])]
      while not MonsterType(creature.name) or self:hasCreatureHuntingTask(huntingTasks, creatures, creature.name) do
        creature = creaturesList[i][math.random(1, #creaturesList[i])]
      end
      creatures[#creatures + 1] = creature
    end
  end

  return creatures
end

function Player:setWildcards(amount)
  self:setStorageValue(TaskStorage.Wildcards, amount)
end

function Player:addWildcards(amount)
  self:setStorageValue(TaskStorage.Wildcards, self:getWildcards() + amount)
end

function Player:removeWildcards(amount)
  self:setStorageValue(TaskStorage.Wildcards, self:getWildcards() - amount)
end

function Player:getWildcards()
  return math.max(0, self:getStorageValue(TaskStorage.Wildcards))
end

function Player:setHuntingTasksPoints(amount)
  self:setStorageValue(TaskStorage.HuntingTasksPoints, amount)
end

function Player:addHuntingTasksPoints(amount)
  self:setStorageValue(TaskStorage.HuntingTasksPoints, self:getHuntingTasksPoints() + amount)
end

function Player:removeHuntingTasksPoints(amount)
  self:setStorageValue(TaskStorage.HuntingTasksPoints, self:getHuntingTasksPoints() - amount)
end

function Player:getHuntingTasksPoints()
  return math.max(0, self:getStorageValue(TaskStorage.HuntingTasksPoints))
end

function getHuntingTaskCreatureByName(creatureName)
  for i = 1, 3 do
    for _, creature in ipairs(creaturesList[i]) do
      if creature.name == creatureName then
        return creature
      end
    end
  end
  return nil
end

function rollHuntingTaskUpgrade()
  local chance = math.random(100)
  if chance <= 4 then
    return 5
  elseif chance <= 12 then
    return 4
  elseif chance <= 26 then
    return 3
  elseif chance <= 47 then
    return 2
  end

  return 1
end

function KillEvent.onKill(player, target)
  if not target or target:isPlayer() or target:getMaster() then
    return true
  end

  local creatureName = target:getName()

  for i = 1, 3 do
    local huntingTask = player:getHuntingTask(i)
    if huntingTask.status == HUNTINGTASK_ACTIVE then
      if huntingTask.creature == creatureName then
        local creature = getHuntingTaskCreatureByName(creatureName)
        local kills = math.min(creature.amounts[huntingTask.amount], huntingTask.kills + 1)
        player:setHuntingTaskKills(i, kills)
        player:sendHuntingTaskUpdate(i, kills)
        return true
      end
    end
  end

  return true
end

KillEvent:type("kill")
KillEvent:register()
LoginEvent:type("login")
LoginEvent:register()
LogoutEvent:type("logout")
LogoutEvent:register()
ExtendedEvent:type("extendedopcode")
ExtendedEvent:register()
