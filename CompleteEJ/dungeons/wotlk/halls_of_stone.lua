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

local HALLS_OF_STONE = CreateInstance({
  name = "岩石大厅",
  desc = "Ulduar is a dungeon hub located at The Storm Peaks of Northrend, revealing many details about the Titans and their activities. In particular, Halls of Stone is controlled by storm giants and crystal golems. These giants are a dying race desperately avoiding their fate, avoiding conflict with the Scourge. Halls of Stone is a large 5 five-man dungeon, and is the first instance of the titan city Ulduar wing.",
  --texture = "HallsofStone",
  area = 526,
}, {
  {
    name = "悲伤圣女",
    desc = "悲伤圣女是岩石大厅中的BOSS之一。与成就<无尽悲伤>相关。",
    --icon = true,
    creature = 27975,
    display = 26657,
    coords = {0.500, 0.854, 1},
    loot = {{38614,N5},{38613,N5},{38617,H5},{38611,N5},{38618,H5},{38616,H5},{38615,H5},},
    sections = {
      Spell(59723, {fbd = H5}), -- Parting Sorrow
      Spell(50761, {fbd = N5, flag1 = MAGIC}), -- Pillar of Woe
      Spell(59727, {fbd = H5, flag1 = MAGIC}), -- Pillar of Woe
      Spell(50760, {fbd = N5}), -- Shock of Sorrow
      Spell(59726, {fbd = H5}), -- Shock of Sorrow
      Spell(50752, {fbd = N5}), -- Storm of Grief
      Spell(59772, {fbd = H5}), -- Storm of Grief
    },
  },
  {
    name = "克莱斯塔卢斯",
    desc = "克莱斯塔卢斯是岩石大厅中的BOSS之一，a sub-zone of Ulduar. 他通常是玩家在这个地下城中第一个进行战斗的BOSS，不过玩家也可以略过他。",
    --icon = true,
    creature = 27977,
    display = 20909,
    coords = {0.394, 0.612, 1},
    loot = {{37651,H5},{35670,N5},{37650,H5},{35672,N5},{35673,N5},{37652,H5},},
    sections = {
      Spell(50843, {fbd = N5}), -- Boulder Toss
      Spell(59742, {fbd = H5}), -- Boulder Toss
      Spell(59750, {fbd = H5}), -- Ground Spike
      Spell(50810, {fbd = N5}), -- Shatter
      Spell(61546, {fbd = H5}), -- Shatter
      Spell(50868, {fbd = N5}), -- Stomp
      Spell(59744, {fbd = H5}), -- Stomp
    },
  },
  {
    name = "远古法庭宝箱",
    desc = "T远古法庭宝箱 is a scripted encounter with many waves of adds.与成就<毫发无伤的布莱恩>相关。",
    --icon = true,
    creature = 28234,
    display = Array,
    --coords = {x, y, level},
    loot = {{35677,N5},{35675,N5},{37653,H5},{35676,N5},{37655,H5},{37656,H5},{37654,H5},},
    sections = {
    },
  },
  {
    name = "塑铁者斯约尼尔",
    desc = "塑铁者斯约尼尔是岩石大厅的最后BOSS。与成就<清扫淤泥>相关。",
    --icon = true,
    creature = 27978,
    display = 27483,
    coords = {0.498, 0.148, 1},
    loot = {{35678,N5},{35680,N5},{37670,H5},{35679,N5},{37658,H5},{43102,H5},{37657,H5},{37666,H5},{37660,H5},{37668,H5},{37669,H5},{37667,H5},},
    sections = {
      Spell(50830, {fbd = N5}), -- Chain Lightning
      Spell(59844, {fbd = H5}), -- Chain Lightning
      Spell(28747), -- Frenzy
      Spell(50840, {fbd = N5}), -- Lightning Ring
      Spell(51849, {fbd = N5}), -- Lightning Ring
      Spell(59849, {fbd = H5, flag1 = MAGIC}), -- Lightning Ring
      Spell(50841, {fbd = N5, flag1 = MAGIC}), -- Lightning Ring
      Spell(59848, {fbd = H5}), -- Lightning Ring
      Spell(59861, {fbd = H5}), -- Lightning Ring
      Spell(59845, {fbd = H5, flag1 = MAGIC}), -- Lightning Shield
      Spell(50831, {fbd = N5, flag1 = MAGIC}), -- Lightning Shield
      Spell(59846, {fbd = H5, flag1 = MAGIC}), -- Static Charge
      Spell(50834, {fbd = N5, flag1 = MAGIC}), -- Static Charge
    },
  },
})

table.insert(db, HALLS_OF_STONE)
