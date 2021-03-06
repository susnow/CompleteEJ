﻿local _, db = ...
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

local PIT_OF_SARON = CreateInstance({
  name = "萨隆矿坑",
  desc = "位于冰冠要塞的萨隆矿坑是冰冠要塞副本群中的第二个5人副本,玩家可以通过灵魂熔炉最后的传送器进入这个副本,当完成萨隆矿坑之后,玩家可以传送到映像大厅.",
  --texture = "PitofSaron",
  area = 602,
}, {
  {
    name = "熔炉之主加弗斯特",
    desc = "熔炉之主加弗斯特,装备着萨隆邪铁打造的武装的天灾巨人,如果你想继续完成萨隆矿坑的剧情,你必须击败他.与成就<11大限>相关。",
    --icon = true,
    creature = 36494,
    display = 30843,
    coords = {0.676, 0.547, 1},
    loot = {{50229,H5},{49803,N5},{50234,H5},{49804,N5},{50233,H5},{50227,H5},{50230,H5},{49805,N5},{50228,H5},{49806,N5},{49802,N5},{49801,N5},},
    sections = {
      Spell(68778, {fbd = N5, flag1 = MAGIC}), -- Chilling Wave
      Spell(70333, {fbd = H5, flag1 = MAGIC}), -- Chilling Wave
      Spell(70381, {fbd = N5}), -- Deep Freeze
      Spell(72930, {fbd = H5}), -- Deep Freeze
      Spell(70335, {fbd = H5}), -- Forge Frostborn Mace
      Spell(68785, {fbd = N5}), -- Forge Frostborn Mace
      Spell(68774, {fbd = N5}), -- Forge Frozen Blade
      Spell(70334, {fbd = H5}), -- Forge Frozen Blade
      Spell(70326), -- Permafrost
      Spell(68786, {fbd = N5, flag1 = MAGIC}), -- Permafrost
      Spell(70336, {fbd = H5, flag1 = MAGIC}), -- Permafrost
      Spell(68788), -- Throw Saronite
      Spell(68771), -- Thundering Stomp
    },
  },
  {
    name = "伊克",
    desc = "伊克 瘟疫混合的变异体,如果你想继续完成萨隆矿坑的剧情,你必须击败他.",
    --icon = true,
    creature = 36476,
    display = 30347,
    --coords = {x, y, level},
    loot = {{50264,H5},{49810,N5},{50265,H5},{49811,N5},{50235,H5},{50262,H5},{50263,H5},{49808,N5},{50266,H5},{49809,N5},{49812,N5},{49807,N5},},
    sections = {
      Spell(69263), -- Explosive Barrage
      Spell(69021), -- Mighty Kick
      Spell(68989, {fbd = N5, flag1 = POISON}), -- Poison Nova
      Spell(70434, {fbd = H5, flag1 = POISON}), -- Poison Nova
      Spell(68987), -- Pursuit
      Spell(70850, {fbd = H5}), -- Pursuit Confusion
      Spell(69029, {fbd = N5}), -- Pursuit Confusion
    },
  },
  {
    name = "克莱克",
    desc = "克莱克 是伊克的主人,归降于巫妖王意志的麻风侏儒,操纵着伊克与玩家作战.",
    --icon = true,
    creature = 36477,
    display = 30331,
    coords = {0.474, 0.401, 1},
    loot = {},
    sections = {
      Spell(69012), -- Explosive Barrage
      Spell(69028), -- Shadow Bolt
      Spell(69413), -- Strangulating
      Spell(70436, {fbd = H5}), -- Toxic Waste
      Spell(69024, {fbd = N5}), -- Toxic Waste
    },
  },
  {
    name = "天灾领主泰兰努斯",
    desc = "天灾领主泰兰努斯 ,操纵着寒冰之力的死亡骑士,  他是萨隆矿坑的最后首领。",
    --icon = true,
    creature = 36658,
    display = 30277,
    coords = {0.443, 0.260, 1},
    loot = {{49824,N5},{50283,H5},{50268,H5},{50273,H5},{50267,H5},{50259,H5},{49819,N5},{50285,H5},{50284,H5},{49816,N5},{50269,H5},{50270,H5},{43102,H5},{50272,H5},{50286,H5},{49820,N5},{49818,N5},{49817,N5},{50271,H5},{49821,N5},{49822,N5},{49826,N5},{49825,N5},{49823,N5},{49813,N5},},
    sections = {
      Spell(69155, {fbd = N5}), -- Forceful Smash
      Spell(69627, {fbd = H5}), -- Forceful Smash
      Spell(69275), -- Mark of Rimefang
      Spell(69172), -- Overlord's Brand
      Spell(69629, {fbd = H5}), -- Unholy Power
      Spell(69167, {fbd = N5}), -- Unholy Power
    },
  },
})

table.insert(db, PIT_OF_SARON)
