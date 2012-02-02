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
  name = "The Blood Furnace",
  desc = "The Blood Furnace is the second wing of the Hellfire Citadel. It is located above Hellfire Ramparts, inside of the tower that overlooks the ramparts themselves. The entrance is on the Alliance (Southern) side of the Citadel, up a ramp. Through this instance, players discover that it is Magtheridon that is entrapped by the Fel Orcs' sorcery, and they're using his blood to manufacture a new Fel Horde, infused with his demonic energy.",
  --texture = "TheBloodFurnace",
  area = 725,
}, {
  {
    name = "The Maker",
    desc = "The Maker is the first boss of The Blood Furnace in Hellfire Citadel.",
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
    name = "Broggok",
    desc = "Broggok is the second boss in The Blood Furnace wing of Hellfire Citadel.",
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
    name = "Keli'dan the Breaker",
    desc = "Keli'dan the Breaker, the Fel Orc jailer of Magtheridon, is the final boss in the The Blood Furnace wing of Hellfire Citadel.",
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
