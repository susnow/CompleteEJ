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

local THE_BLOOD_FURNACE = CreateInstance({
  name = "鲜血熔炉",
  desc = "鲜血熔炉位于地狱火堡垒的右上方.这里囚禁着恶魔玛瑟里顿,伊利丹的仆从利用玛瑟里顿的鲜血造出了战斗能力更强的邪兽人种族.恶魔的鲜血被抽出在熔炉中炼化后,最后注入兽人体内.伊利丹最强大的队伍源源不断从此而出.",
  --texture = "TheBloodFurnace",
  area = 725,
}, {
  {
    name = "制造者",
    desc = "制造者是鲜血熔炉的第一个boss.",
    --icon = true,
    creature = 17381,
    display = 18369,
    coords = {0.378, 0.410, 1},
    loot = {{24387,N5},{24388,N5},{24384,N5},{27485,H5},{27488,H5},{24385,N5},{27483,H5},{24386,N5},{27487,H5},{30600,H5},{27484,H5},{30602,H5},{30601,H5},},
    sections = {
      Spell(30923), -- Domination
      Spell(30925, {fbd = N5}), -- Exploding Beaker
      Spell(40059, {fbd = H5}), -- Exploding Beaker
    },
  },
  {
    name = "布洛戈克",
    desc = "布洛戈克是鲜血熔炉的第一个boss.",
    --icon = true,
    creature = 17380,
    display = 19372,
    coords = {0.454, 0.220, 1},
    loot = {{24390,N5},{24391,N5},{24392,N5},{27490,H5},{27492,H5},{24393,N5},{27489,H5},{24389,N5},{27848,H5},{30600,H5},{27491,H5},{30602,H5},{30601,H5},},
    sections = {
      Spell(38459, {fbd = H5, flag1 = POISON}), -- Poison Bolt
      Spell(30917, {fbd = N5, flag1 = POISON}), -- Poison Bolt
      Spell(30916), -- Poison Cloud
      Spell(30913, {fbd = N5}), -- Slime Spray
      Spell(38458, {fbd = H5}), -- Slime Spray
    },
  },
  {
    name = "击碎者克里丹",
    desc = "击碎者克里丹, 恶魔兽人,玛瑟里顿之卒, 是鲜血熔炉的最终boss.",
    --icon = true,
    creature = 17377,
    display = 17153,
    --coords = {x, y, level},
    loot = {{24396,N5},{24394,N5},{24398,N5},{27495,H5},{24395,N5},{29245,H5},{29239,H5},{27788,H5},{23572,H5},{27506,H5},{32080,H5},{28121,H5},{27505,H5},{24397,N5},{27522,H5},{29347,H5},{27507,H5},{27497,H5},{30600,H5},{27512,H5},{27494,H5},{27514,H5},{30602,H5},{28264,H5},{30601,H5},},
    sections = {
      Spell(30940, {flag1 = MAGIC}), -- Burning Nova
      Spell(30938, {flag1 = MAGIC}), -- Corruption
      Spell(30935, {fbd = N5}), -- Evocation
      Spell(37371, {fbd = H5}), -- Fire Nova
      Spell(33775, {fbd = N5}), -- Fire Nova
      Spell(17228, {fbd = N5}), -- Shadow Bolt Volley
      Spell(40070, {fbd = H5}), -- Shadow Bolt Volley
      Spell(37370, {fbd = H5}), -- Vortex
    },
  },
})

table.insert(db, THE_BLOOD_FURNACE)
