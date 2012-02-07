local _, db = ...
local db, CreateInstance, Stage, Spell = db[2], db.CreateInstance, db.Stage, db.Spell

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

local HYJAL_SUMMIT = CreateInstance({
  name = "海加尔峰",
  desc = "海加尔峰是第一棵世界之树”诺达希尔“所在地。 通过时光之穴玩家可以重温魔兽世界中的主要历史事件。 海加尔峰的战斗发生在魔兽争霸3：混乱之治——暗夜精灵篇第七章——诸神的黄昏中。 污染者阿克蒙德将会带领他的四位手下，毁灭领主 卡兹洛加、深渊领主 阿兹加洛、巫妖 雷基·冬寒和恐惧魔王 安纳塞隆在副本中一同毁灭世界之树。（卡兹洛加没有在魔兽争霸3的战役中出现）",
  --texture = "HyjalSummit",
  area = 775,
}, {
  {
    name = "雷基·冬寒",
    desc = "巫妖 雷基·冬寒受燃烧军团命令前来参与海加尔峰的战斗，他是海加尔峰的第一个BOSS。",
    --icon = true,
    creature = 17767,
    display = 17444,
    coords = {0.078, 0.694, 1},
    loot = {32297,30863,30873,30871,30870,30862,32295,30865,32307,},
    sections = {
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(31257, {fbd = N10, flag1 = MAGIC}), -- Chilled
      Spell(31258, {fbd = N10}), -- Death & Decay
      Spell(31256, {fbd = N10}), -- Frost Armor
      Spell(31250, {fbd = N10, flag1 = MAGIC}), -- Frost Nova
      Spell(31249, {fbd = N10}), -- Icebolt
    },
  },
  {
    name = "安纳塞隆",
    desc = "安纳塞隆是一名强力的恐惧魔王, 他是海加尔峰的第二个BOSS。",
    --icon = true,
    creature = 17808,
    display = 21069,
    coords = {0.006, 0.740, 1},
    loot = {32298,30886,30880,30882,30888,30874,32297,30884,32289,},
    sections = {
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(31306, {fbd = N10}), -- Carrion Swarm
      Spell(31299, {fbd = N10}), -- Inferno
      Spell(31298, {fbd = N10}), -- Sleep
      Spell(38196, {fbd = N10}), -- Vampiric Aura
    },
  },
  {
    name = "卡兹洛加",
    desc = "毁灭领主 卡兹洛加是海加尔峰的第三个BOSS。",
    --icon = true,
    creature = 17888,
    display = 17886,
    --coords = {x, y, level},
    loot = {32298,30918,30892,30894,30916,30917,32285,30895,32289,},
    sections = {
      Spell(31477, {fbd = N10}), -- Cripple
      Spell(31436, {fbd = N10}), -- Malevolent Cleave
      Spell(31447, {fbd = N10}), -- Mark of Kaz'rogal
      Spell(31480, {fbd = N10}), -- War Stomp
    },
  },
  {
    name = "阿兹加洛",
    desc = "阿兹加洛曾经是恶魔陆军的领导者玛诺洛斯的副官。 他是海加尔峰的第四个BOSS。",
    --icon = true,
    creature = 17842,
    display = 18526,
    coords = {0.428, 0.360, 1},
    loot = {32295,30901,31092,31093,30900,32285,30897,32297,},
    sections = {
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(31345, {fbd = N10}), -- Cleave
      Spell(31347, {fbd = N10}), -- Doom
      Spell(31344, {fbd = N10}), -- Howl of Azgalor
      Spell(31340, {fbd = N10}), -- Rain of Fire
    },
  },
  {
    name = "阿克蒙德",
    desc = "污染者 阿克蒙德是堕落泰坦萨格拉斯的左膀右臂。 他是海加尔峰的最终BOSS。推倒他，灾变与阿古斯在向你招手。",
    --icon = true,
    creature = 17968,
    display = 20939,
    --coords = {x, y, level},
    loot = {30905,31097,31096,30910,32295,30907,30906,30911,32285,30904,32307,},
    sections = {
      Spell(32014, {fbd = N10}), -- Air Burst
      Spell(31970, {fbd = N10, flag1 = MAGIC}), -- Fear
      Spell(39369, {fbd = N10}), -- Finger of Death
      Spell(31984, {fbd = N10}), -- Finger of Death
      Spell(32111, {fbd = N10}), -- Finger of Death
      Spell(31972, {fbd = N10, flag1 = CURSE}), -- Grip of the Legion
      Spell(35354, {fbd = N10}), -- Hand of Death
      Spell(32054, {fbd = N10}), -- Soul Charge
      Spell(32057, {fbd = N10}), -- Soul Charge
      Spell(32053, {fbd = N10}), -- Soul Charge
    },
  },
})

table.insert(db, HYJAL_SUMMIT)
