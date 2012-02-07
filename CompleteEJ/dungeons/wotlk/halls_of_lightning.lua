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

local HALLS_OF_LIGHTNING = CreateInstance({
  name = "闪电大厅",
  desc = "Ulduar is a dungeon hub located at The Storm Peaks of Northrend, revealing many details about the Titans and their activities. Halls of LIghtning is home to Loken, a corrupted Titan watcher. Halls of Lightning is the second and highest level 5 five-man dungeon connected to the titan city Ulduar.",
  --texture = "HallsofLightning",
  area = 525,
}, {
  {
    name = "比亚格里将军",
    desc = "比亚格里将军, an Iron Vrykul, is the first boss in the Halls of Lightning. He patrols around the Unyielding Garrison and与成就<雷击>相关。",
    --icon = true,
    creature = 28586,
    display = 27301,
    coords = {0.552, 0.698, 1},
    loot = {{37814,H5},{36979,N5},{37826,H5},{36982,N5},{37818,H5},{37825,H5},{36980,N5},{36981,N5},},
    sections = {
      Spell(41106), -- Battle Aura
      Spell(53792), -- Battle Stance
      Spell(41107), -- Berserker Aura
      Spell(53791), -- Berserker Stance
      Spell(52098), -- Charge Up
      Spell(15284), -- Cleave
      Spell(41105), -- Defensive Aura
      Spell(53790), -- Defensive Stance
      Spell(55095, {flag1 = DISEASE}), -- Frost Fever
      Spell(58769), -- Intercept
      Spell(58747), -- Intercept
      Spell(52022), -- Ironform
      Spell(52029), -- Knock Away
      Spell(16856), -- Mortal Strike
      Spell(12555), -- Pummel
      Spell(52026), -- Slam
      Spell(31589, {flag1 = MAGIC}), -- Slow
      Spell(36096, {flag1 = MAGIC}), -- Spell Reflection
      Spell(52097), -- Temporary Electrical Charge
      Spell(52028), -- Whirlwind
      Spell(52027), -- Whirlwind
    },
  },
  {
    name = "沃尔坎",
    desc = "沃尔坎, a Fire Giant, 闪电大厅中的第二个BOSS。与成就<破碎的抵抗>相关。",
    --icon = true,
    creature = 28587,
    display = 27071,
    coords = {0.396, 0.218, 2},
    loot = {{37840,H5},{36986,N5},{37841,H5},{36983,N5},{37842,H5},{37843,H5},{36985,N5},{36984,N5},},
    sections = {
      Spell(59528, {fbd = H5}), -- Heat
      Spell(52387, {fbd = N5}), -- Heat
      Spell(52237, {fbd = N5}), -- Shattering Stomp
      Spell(59529, {fbd = H5}), -- Shattering Stomp
      Spell(52238), -- Temper
    },
  },
  {
    name = "艾欧纳尔",
    desc = "艾欧纳尔, a Lightning Revenant,闪电大厅中的第三个BOSS。",
    --icon = true,
    creature = 28546,
    display = 27484,
    coords = {0.610, 0.726, 2},
    loot = {{37846,H5},{39534,N5},{37844,H5},{39535,N5},{37847,H5},{37845,H5},{39657,N5},{39536,N5},},
    sections = {
      Spell(59800, {fbd = H5}), -- Ball Lightning
      Spell(52780, {fbd = N5}), -- Ball Lightning
      Spell(52770), -- Disperse
      Spell(52658, {fbd = N5}), -- Static Overload
      Spell(59795, {fbd = H5}), -- Static Overload
    },
  },
  {
    name = "洛肯",
    desc = "洛肯, a Titan Watcher,闪电大厅的最后BOSS。与成就<适时死亡>相关。",
    --icon = true,
    creature = 28923,
    display = 27485,
    coords = {0.192, 0.540, 2},
    loot = {{36989,N5},{37848,H5},{36995,N5},{37852,H5},{37851,H5},{36991,N5},{37855,H5},{37849,H5},{43102,H5},{37850,H5},{37854,H5},{36992,N5},{36993,N5},{37853,H5},41799,{36994,N5},{36988,N5},{36996,N5},},
    sections = {
      Spell(52921, {fbd = H5}), -- Arc Lightning
      Spell(59835, {fbd = H5}), -- Lightning Nova
      Spell(52960, {fbd = N5}), -- Lightning Nova
    },
  },
})

table.insert(db, HALLS_OF_LIGHTNING)
