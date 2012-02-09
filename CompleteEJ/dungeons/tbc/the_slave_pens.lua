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

local THE_SLAVE_PENS = CreateInstance({
  name = "奴隶围栏",
  desc = "奴隶围栏是盘牙水库副本群的第一个副本. 其结构本身是一个地下水泵站, 娜迦海妖统治着这里.这里囚禁了大量的奴隶,而奸佞的纳迦则是幕后的主使.",
  --texture = "TheSlavePens",
  area = 728,
}, {
  {
    name = "背叛者门努",
    desc = "背叛者门努是奴隶围栏的第一个boss. 他是一个破碎的德莱尼萨满.",
    --icon = true,
    creature = 17941,
    display = 17728,
    coords = {0.486, 0.226, 1},
    loot = {{24359,N5},{24356,N5},{24357,N5},{27545,H5},{27543,H5},{24361,N5},{27546,H5},{24360,N5},{27541,H5},{30603,H5},{27542,H5},{27544,H5},{30605,H5},{30604,H5},},
    sections = {
      Spell(31991), -- Corrupted Nova Totem
      Spell(35010), -- Lightning Bolt
      Spell(34980), -- Mennu's Healing Ward
      Spell(31981), -- Tainted Earthgrab Totem
      Spell(31985), -- Tainted Stoneskin Totem
    },
  },
  {
    name = "巨钳鲁克玛尔",
    desc = "巨钳鲁克玛尔是奴隶围栏的第二个boss.",
    --icon = true,
    creature = 17991,
    display = 17729,
    coords = {0.572, 0.374, 1},
    loot = {{24381,N5},{24376,N5},{24380,N5},{28124,H5},{27547,H5},{24378,N5},{27549,H5},{24379,N5},{27550,H5},{30603,H5},{27548,H5},{27551,H5},{30605,H5},{30604,H5},},
    sections = {
      Spell(31948), -- Ensnaring Moss
      Spell(34970), -- Frenzy
      Spell(31956, {fbd = N5}), -- Grievous Wound
      Spell(38801, {fbd = H5}), -- Grievous Wound
      Spell(35008), -- Water Spit
    },
  },
  {
    name = "夸格米拉",
    desc = "夸格米拉是奴隶围栏的最终boss，他是一个真菌巨人.",
    --icon = true,
    creature = 17942,
    display = 18224,
    coords = {0.852, 0.686, 1},
    loot = {{24364,N5},{24363,N5},{24365,N5},{27800,H5},{24362,N5},{30538,H5},{29242,H5},{27713,H5},{23572,H5},{27742,H5},{32078,H5},{27673,H5},{27712,H5},{24366,N5},{27796,H5},{29349,H5},{27672,H5},{27740,H5},{30604,H5},{27683,H5},{27714,H5},{28337,H5},{30605,H5},{27741,H5},{30603,H5},},
    sections = {
      Spell(38153), -- Acid Spray
      Spell(40504), -- Cleave
      Spell(34780, {fbd = N5, flag1 = POISON}), -- Poison Bolt Volley
      Spell(39340, {fbd = H5, flag1 = POISON}), -- Poison Bolt Volley
      Spell(32055), -- Uppercut
    },
  },
})

table.insert(db, THE_SLAVE_PENS)
