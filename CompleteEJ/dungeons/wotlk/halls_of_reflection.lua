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

local HALLS_OF_REFLECTION = CreateInstance({
  name = "映像大厅",
  desc = "映像大厅 is the third and final wing of the Frozen Halls, located within Icecrown Citadel. The The Forge of Souls and Pit of Saron must be completed before a player can enter the Halls of Reflection for the first time.",
  --texture = "HallsofReflection",
  area = 603,
}, {
  {
    name = "法勒瑞克",
    desc = "法勒瑞克, a captain for Arthas in both life and death, is the first boss in the Halls of Reflection. He will engage the party after 4 spirit waves have been defeated.",
    --icon = true,
    creature = 38112,
    display = 30972,
    coords = {0.349, 0.749, 1},
    loot = {{50291,H5},{49828,N5},{50292,H5},{49830,N5},{50293,H5},{50290,H5},{50294,H5},{49832,N5},{50295,H5},{49829,N5},{49831,N5},{49827,N5},},
    sections = {
      Spell(72452, {fbd = H5}), -- Defiling Horror
      Spell(72435, {fbd = N5}), -- Defiling Horror
      Spell(72390, {fbd = H5}), -- Hopelessness
      Spell(72393, {fbd = H5}), -- Hopelessness
      Spell(72397, {fbd = N5}), -- Hopelessness
      Spell(72395, {fbd = N5}), -- Hopelessness
      Spell(72396, {fbd = N5}), -- Hopelessness
      Spell(72391, {fbd = H5}), -- Hopelessness
      Spell(72426, {flag1 = MAGIC}), -- Impending Despair
      Spell(72422, {fbd = N5, flag1 = MAGIC}), -- Quivering Strike
      Spell(72453, {fbd = H5, flag1 = MAGIC}), -- Quivering Strike
    },
  },
  {
    name = "玛维恩",
    desc = "玛维恩, Arthas Menethil's second captain, is the second boss in the Halls of Reflection. He will engage the party after the 9th spirit wave has been defeated.",
    --icon = true,
    creature = 38113,
    display = 30973,
    coords = {0.430, 0.627, 1},
    loot = {{50299,H5},{49835,N5},{50298,H5},{49834,N5},{50300,H5},{50296,H5},{50260,H5},{49838,N5},{50297,H5},{49837,N5},{49836,N5},{49833,N5},},
    sections = {
      Spell(72436, {fbd = H5}), -- Corrupted Flesh
      Spell(72363, {fbd = N5}), -- Corrupted Flesh
      Spell(72360, {fbd = N5}), -- Obliterate
      Spell(72434, {fbd = H5}), -- Obliterate
      Spell(72369, {fbd = H5, flag1 = MAGIC}), -- Shared Suffering
      Spell(72368, {fbd = N5, flag1 = MAGIC}), -- Shared Suffering
      Spell(72362), -- Well of Corruption
    },
  },
})

table.insert(db, HALLS_OF_REFLECTION)
