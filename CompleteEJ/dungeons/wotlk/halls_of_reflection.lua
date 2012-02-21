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
  desc = "映像大厅 冰冠要塞副本群中的最后一个5人副本,传说中霜之哀伤就隐匿于此.",
  --texture = "HallsofReflection",
  area = 603,
}, {
  {
    name = "法勒瑞克",
    desc = "法勒瑞克, 阿尔萨斯的副官之一,映像大厅的第一名首领,在玩家抵御了4波天灾部队的进攻之后出现.",
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
    desc = "玛维恩, 阿尔萨斯的副官之一,映像大厅的第二名首领,玩家在前厅中抵御了8波天灾部队的进攻之后出现 .",
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
