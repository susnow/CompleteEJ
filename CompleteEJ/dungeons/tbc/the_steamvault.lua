local _, db = ...
local db, CreateInstance, Stage, Spell = db[1], db.CreateInstance, db.Stage, db.Spell

local VANILLA, TBC, WOTLK = 1, 2, 3

local N5, H5, N10, N25, H10, H25, RF = 1, 2, 1, 2, 3, 4, 5

local PHASE, CREATURE, ABILITY = 0, 1, 2

local TANK = 0
local DPS = 1
local HEALER = 2
local HEROIC = 3
local DEADLY = 4
local IMPORTANT = 5
local INTERRUPT = 6
local MAGIC = 7
local CURSE = 8
local POISON = 9
local DISEASE = 10
local ENRAGE = 11
local ENRAGE2 = 12

local THE_STEAMVAULT = CreateInstance({
  name = "The Steamvault",
  desc = "Coilfang Reservoir is an instance located in Zangarmarsh. The structure itself is a subterranean water pumping station, operated by the Naga. The dungeon is made up of gigantic caverns with huge pipes descending from the ceiling powered by titanic crystal capacitors. While the entrance to the Reservoir is underwater, the instance itself is only partially submerged, similar to the Blackfathom Deeps. It is also the only Coilfang Reservoir instance that a player can run in Normal mode and receive Cenarion Expedition reputation all the way to Exalted.",
  --texture = "TheSteamvault",
  area = 727,
}, {
  {
    name = "Hydromancer Thespia",
    desc = "Hydromancer Thespia is the first boss of The Steamvault in Coilfang Reservoir.",
    --icon = true,
    creature = 17797,
    display = 11268,
    coords = {0.542, 0.124, 1},
    loot = {27508,{30551,H5},27783,27787,{30549,H5},27789,27784,{30550,H5},},
    sections = {
      Spell(31718, {flag1 = MAGIC}), -- Enveloping Winds
      Spell(25033), -- Lightning Cloud
      Spell(31481, {flag1 = MAGIC}), -- Lung Burst
    },
  },
  {
    name = "Mekgineer Steamrigger",
    desc = "Mekgineer Steamrigger is the second boss of The Steamvault in Coilfang Reservoir. You will need to slay him in order to proceed to Warlord Kalithresh, the final boss of the instance.",
    --icon = true,
    creature = 17796,
    display = 18638,
    coords = {0.324, 0.826, 1},
    loot = {27793,{30551,H5},27794,27791,{30550,H5},27790,27792,23887,{30549,H5},},
    sections = {
      Spell(35107), -- Electrified Net
      Spell(31486), -- Saw Blade
      Spell(31485), -- Super Shrink Ray
    },
  },
  {
    name = "Warlord Kalithresh",
    desc = "Warlord Kalithresh is the third and last boss of The Steamvault in Coilfang Reservoir.",
    --icon = true,
    creature = 17798,
    display = 20235,
    coords = {0.806, 0.434, 1},
    loot = {{30550,H5},27805,27738,27799,27806,27737,27804,{30549,H5},27795,27475,{30551,H5},27801,{29351,H5},27510,28203,27874,24313,{29463,H5},{30543,H5},{29243,H5},{23572,H5},},
    sections = {
      Spell(55095, {flag1 = DISEASE}), -- Frost Fever
      Spell(16172), -- Head Crack
      Spell(31589, {flag1 = MAGIC}), -- Slow
      Spell(31534), -- Spell Reflection
      Spell(37081), -- Warlord's Rage
      Spell(36453), -- Warlord's Rage
    },
  },
})

table.insert(db, THE_STEAMVAULT)
