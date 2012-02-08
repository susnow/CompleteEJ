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

local THE_OCULUS = CreateInstance({
  name = "魔环",
  desc = "魔环位于北风苔原西北部的考达拉高地的中心，是蓝龙军团的老巢。魔环是蓝龙军团控制魔网的重要场所，这里也囚禁着三位龙眠联军的将领。蓝龙之王玛利苟斯陷入疯狂之后，红龙军团下令进攻考达拉，而魔环的最高指挥官是魔网守护者埃雷苟斯，由于埃雷苟斯盘旋在魔环的上空，冒险者们必须要先从审讯者达库斯手上救出三位龙眠联军将领，再借用巨龙的力量打败埃雷苟斯.",
  --texture = "TheOculus",
  area = 528,
}, {
  {
    name = "审讯者达库斯",
    desc = "击败审讯者达库斯后,玩家就可以解救出他关押的三名龙眠联军将领,并且使用不同的飞龙坐骑来完成接下来的战斗.",
    --icon = true,
    creature = 27654,
    display = 27032,
    coords = {0.494, 0.780, 1},
    loot = {{37258,H5},{36946,N5},{37255,H5},{36945,N5},{37256,H5},{37257,H5},{36943,N5},{36944,N5},},
    sections = {
      Spell(51336), -- Magic Pull
      Spell(50774, {fbd = N5}), -- Thundering Stomp
      Spell(59370, {fbd = H5, flag1 = MAGIC}), -- Thundering Stomp
    },
  },
  {
    name = "瓦尔洛斯·云击",
    desc = "瓦尔洛斯·云击 蓝龙军团的领主,他镇守着魔环的中心层,并且阻挠玩家进一步的推进.",
    --icon = true,
    creature = 27447,
    display = 27033,
    coords = {0.462, 0.212, 2},
    loot = {{37261,H5},{36947,N5},{37260,H5},{36949,N5},{37262,H5},{37263,H5},{36948,N5},{36950,N5},},
    sections = {
      Spell(59371, {fbd = H5, flag1 = MAGIC}), -- Amplify Magic
      Spell(51054, {fbd = N5, flag1 = MAGIC}), -- Amplify Magic
      Spell(51008), -- Call Azure Ring Captain
      Spell(51007), -- Call Azure Ring Captain
      Spell(51002), -- Call Azure Ring Captain
      Spell(51006), -- Call Azure Ring Captain
      Spell(50053), -- Centrifuge Shield
      Spell(50785, {fbd = N5}), -- Energize Cores
      Spell(59372, {fbd = H5}), -- Energize Cores
    },
  },
  {
    name = "法师领主伊洛姆",
    desc = "既然蓝龙引以为傲的是奥术魔法,那么会有这样一个以法术攻击为主的BOSS出现就不是什么奇怪的事情了.法师领主伊罗姆,镇守着魔环前往顶层的通道.",
    --icon = true,
    creature = 27655,
    display = 25010,
    coords = {0.372, 0.342, 4},
    loot = {{37289,H5},{36953,N5},{37195,H5},{36954,N5},{37288,H5},{37264,H5},{36951,N5},{36952,N5},},
    sections = {
      Spell(53813), -- Arcane Shield
      Spell(59377, {fbd = H5, flag1 = MAGIC}), -- Empowered Arcane Explosion
      Spell(51110, {fbd = N5, flag1 = MAGIC}), -- Empowered Arcane Explosion
      Spell(58025, {fbd = H5}), -- Frost Buffet
      Spell(51103), -- Frostbomb
      Spell(50495), -- Summon Menagerie
      Spell(50496), -- Summon Menagerie
      Spell(50476), -- Summon Menagerie
      Spell(51112), -- Teleport
      Spell(59376, {fbd = H5}), -- Time Bomb
      Spell(51121, {fbd = N5}), -- Time Bomb
    },
  },
  {
    name = "魔网守护者埃雷苟斯",
    desc = "在击倒法师领主伊洛姆之后魔网守护者埃雷苟斯就会出现并且在魔环的天空中飞行，玩家需要使用飞龙座骑在天空中使用飞龙的特殊能力去击败他.",
    --icon = true,
    creature = 27656,
    display = 27034,
    coords = {0.404, 0.188, 4},
    loot = {{37292,H5},{36971,N5},{37291,H5},{37294,H5},{36973,N5},{37360,H5},{37363,H5},{37362,H5},{36972,N5},{43102,H5},{37293,H5},{36961,N5},{36962,N5},{37361,H5},41798,{36975,N5},{36969,N5},{36974,N5},},
    sections = {
      Spell(50804, {fbd = N5}), -- Arcane Barrage
      Spell(59381, {fbd = H5}), -- Arcane Barrage
      Spell(59382, {fbd = H5}), -- Arcane Volley
      Spell(51153, {fbd = N5}), -- Arcane Volley
      Spell(51170), -- Enraged Assault
      Spell(57959, {fbd = H5}), -- Planar Anomalies
      Spell(51162, {fbd = H5}), -- Planar Shift
    },
  },
})

table.insert(db, THE_OCULUS)
