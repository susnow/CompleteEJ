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
  name = "The Shattered Halls",
  desc = "Hellfire Citadel is the headquarters of the Fel Orcs of Outland; it's an impenetrable bastion that once served as the base of operations for the orcs throughout the First and Second Wars. Kargath Bladefist and his Fel orcs now make their home in the citadel. The Shattered Halls is a level 70 instance in Hellfire Peninsula commonly referred to as \"SH,\" serving as the third wing of Hellfire Citadel, with Kargath Bladefist as the final boss. Although it originally required a specific key just to open up normal modes, it has been removed along with other keys in patch 4.2.",
  --texture = "TheShatteredHalls",
  area = 710,
}, {
  {
    name = "Grand Warlock Nethekurse",
    desc = "Grand Warlock Nethekurse is a Fel Orc warlock and first boss in the Shattered Halls wing of Hellfire Citadel, located in Hellfire Peninsula.",
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
    name = "Blood Guard Porung",
    desc = "Blood Guard Porung is a fel orc boss found after the Archer Gauntlet only in Heroic Shattered Halls.",
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
    name = "Warbringer O'mrogg",
    desc = "Warbringer O'mrogg is a two-headed Ogre, and the second boss in the Shattered Halls.",
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
    name = "Warchief Kargath Bladefist",
    desc = "Warchief Kargath Bladefist is the master of the fel orcs and former Chieftain of the Shattered Hand Clan. He is the final boss of the Shattered Halls.",
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
