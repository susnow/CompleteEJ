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

local THE_SHATTERED_HALLS = CreateInstance({
  name = "破碎大厅",
  desc = "破碎大厅是邪兽人在外域的老巢.这里的指挥官就是碎手氏族的大酋长,卡加斯·刃拳.用双刃替代双手的他是暗影议会的一员,也是暗影议会核心成员中唯一一个不是术士的人.当黑暗之门被摧毁后,卡加斯与玛瑟里顿暗中有了勾结,他占据了地狱火堡垒,声称自己才是部落真正的酋长.",
  --texture = "TheShatteredHalls",
  area = 710,
}, {
  {
    name = "高阶术士奈瑟库斯",
    desc = "高阶术士奈瑟库斯是破碎大厅的第一个boss.",
    --icon = true,
    creature = 16807,
    display = 16628,
    coords = {0.324, 0.626, 1},
    loot = {27521,{30547,H5},27518,27519,{30546,H5},27520,27517,24312,{30548,H5},},
    sections = {
      Spell(30502), -- Dark Spin
      Spell(30500), -- Death Coil
      Spell(30741), -- Death Coil
      Spell(30496), -- Lesser Shadow Fissure
      Spell(30505), -- Shadow Bolt
      Spell(30495, {fbd = N5}), -- Shadow Cleave
      Spell(30735), -- Shadow Sear
      Spell(35953, {fbd = H5}), -- Shadow Slam
      Spell(30745), -- Target Fissures
    },
  },
  {
    name = "血卫士伯鲁恩",
    desc = "血卫士伯鲁恩只有在英雄模式下的破碎大厅才会出现.",
    --icon = true,
    creature = 20923,
    display = 17725,
    coords = {0.296, 0.156, 1},
    loot = {{30710,H5},{30546,H5},{30709,H5},{30707,H5},{30705,H5},{30548,H5},{30708,H5},{30547,H5},},
    sections = {
      Spell(15496, {fbd = H5}), -- Cleave
    },
  },
  {
    name = "战争使者沃姆罗格",
    desc = "战争使者沃姆罗格是个双头怪物,是破碎大厅的第二个boss.",
    --icon = true,
    creature = 16809,
    display = 18031,
    --coords = {x, y, level},
    loot = {27525,{30548,H5},27526,27524,{30547,H5},27802,27868,{30546,H5},},
    sections = {
      Spell(30600), -- Blast Wave
      Spell(30584, {flag1 = MAGIC}), -- Fear
      Spell(30633, {flag1 = MAGIC}), -- Thunderclap
    },
  },
  {
    name = "酋长卡加斯·刃拳",
    desc = "卡加斯·刃拳是破碎大厅的最终boss.",
    --icon = true,
    creature = 16808,
    display = 19799,
    coords = {0.672, 0.530, 1},
    loot = {{30546,H5},27540,27537,{29348,H5},27528,27534,27531,27536,27538,{30547,H5},27533,{30548,H5},27529,27474,27527,{29254,H5},27535,{23572,H5},{29263,H5},{29255,H5},},
    sections = {
      Spell(25821, {fbd = H5}), -- Charge
    },
  },
})

table.insert(db, THE_SHATTERED_HALLS)
