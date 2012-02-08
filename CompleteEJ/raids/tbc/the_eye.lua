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

local THE_EYE = CreateInstance({
  name = "风暴要塞",
  desc = "外域的风暴要塞原来是神秘的纳鲁用来宇宙航行的飞船。这个水晶要塞现在被血精灵王子，凯尔萨斯逐日者掌控。风暴要塞被分成四个部分，其中的三个部分像卫星一样连在一起，但第四部分已经落到了艾泽拉斯世界，即德莱尼主城，埃索达。这个副本最令人垂涎的就是奥的灰烬，魔兽世界中最稀有的坐骑之一。",
  --texture = "TheEye",
  area = 782,
}, {
  {
    name = "空灵机甲",
    desc = "风暴要塞中，空灵机甲是一个机器人BOSS。",
    --icon = true,
    creature = 19516,
    display = 18951,
    coords = {0.242, 0.500, 1},
    loot = {30450,30248,30250,29983,32515,},
    sections = {
      Spell(34172, {fbd = N10}), -- Arcane Orb
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(25778, {fbd = N10}), -- Knock Away
      Spell(34162, {fbd = N10}), -- Pounding
    },
  },
  {
    name = "奥",
    desc = "奥是风暴要塞中的第一个BOSS，它是凯尔萨斯逐日者的凤宠物。",
    --icon = true,
    creature = 19514,
    display = 18945,
    --coords = {x, y, level},
    loot = {29925,29924,29918,29949,29922,29923,},
    sections = {
      Spell(35412, {fbd = N10}), -- Charge
      Spell(34341, {fbd = N10}), -- Ember Blast
      Spell(34121, {fbd = N10}), -- Flame Buffet
      Spell(34229, {fbd = N10}), -- Flame Quills
      Spell(35410, {fbd = N10}), -- Melt Armor
      Spell(35369, {fbd = N10}), -- Rebirth
      Spell(34342, {fbd = N10}), -- Rebirth
      Spell(25104, {fbd = N10}), -- Summon Player
    },
  },
  {
    name = "大星术师索兰莉安",
    desc = "大星术师索兰莉安是风暴要塞中的三号BOSS，由于BOSS战斗流程复杂，容错性不高，掉落一般导致她成为了TBC最无人问津的BOSS。",
    --icon = true,
    creature = 18805,
    display = 18239,
    coords = {0.732, 0.488, 1},
    loot = {29950,29977,29965,29966,30449,29976,},
    sections = {
      Spell(39414, {fbd = N10}), -- Arcane Missiles
      Spell(33009, {fbd = N10}), -- Blinding Light
      Spell(34322, {fbd = N10, flag1 = MAGIC}), -- Psychic Scream
      Spell(39329, {fbd = N10}), -- Void Bolt
      Spell(42783, {fbd = N10}), -- Wrath of the Astromancer
    },
  },
  {
    name = "凯尔萨斯·逐日者",
    desc = "凯尔萨斯逐日者与他的四名手下，是风暴要塞的第四场BOSS战。在这场史诗级别的BOSS战中，你可以使用七把传说级别的武器来击败凯尔萨斯逐日者，这七把武器只能在这场战斗中使用。凯尔萨斯逐日者因为掉落奥的灰烬而特别受人青睐，每周都要被无数人蹂躏……",
    --icon = true,
    creature = 19622,
    display = 20023,
    --coords = {x, y, level},
    loot = {29995,29993,30237,32405,29994,29992,29989,29996,},
    sections = {
      Spell(36834, {fbd = N10}), -- Arcane Disruption
      Spell(36805, {fbd = N10}), -- Fireball
      Spell(35941, {fbd = N10}), -- Gravity Lapse
      Spell(13810, {fbd = N10}), -- Ice Trap
      Spell(36797, {fbd = N10}), -- Mind Control
      Spell(35869, {fbd = N10}), -- Nether Beam
      Spell(36723, {fbd = N10}), -- Phoenix
      Spell(36819, {fbd = N10}), -- Pyroblast
      Spell(36815, {fbd = N10}), -- Shock Barrier
      Spell(20477, {fbd = N10}), -- Summon Player
      Spell(24131, {fbd = N10, flag1 = POISON}), -- Wyvern Sting
    },
  },
})

table.insert(db, THE_EYE)
