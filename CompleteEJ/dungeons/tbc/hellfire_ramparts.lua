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

local HELLFIRE_RAMPARTS = CreateInstance({
  name = "Hellfire Ramparts",
  desc = "The Hellfire Ramparts (often known as just \"Ramparts\") are the first wing of the Hellfire Citadel instance in Hellfire Peninsula. The citadel itself sits in the center of the zone, in the middle of a broken-up wall that divided the zone before the conflict began. The Ramparts takes place atop this wall along the sides of the citadel.",
  --texture = "HellfireRamparts",
  area = 797,
}, {
  {
    name = "Watchkeeper Gargolmar",
    desc = "The first boss encounter of the Hellfire Ramparts wing of the Hellfire Citadel instance in Hellfire Peninsula.",
    --icon = true,
    creature = 17306,
    display = 18236,
    coords = {0.772, 0.342, 1},
    loot = {{24020,N5},{24022,N5},{24023,N5},{27447,H5},{24021,N5},{27448,H5},{24024,N5},{27450,H5},{30593,H5},{27451,H5},{27449,H5},{30594,H5},},
    sections = {
      Spell(30641, {fbd = N5}), -- Mortal Wound
      Spell(36814, {fbd = H5}), -- Mortal Wound
      Spell(32154), -- Overpower
      Spell(22857), -- Retaliation
      Spell(34645), -- Surge
    },
  },
  {
    name = "Omor the Unscarred",
    desc = "Omor the Unscarred is the second or third boss encounter of the Hellfire Ramparts wing of the Hellfire Citadel instance in Hellfire Peninsula. You can choose whether you wish to fight him before or after Vazruden and Nazan.",
    --icon = true,
    creature = 17308,
    display = 18237,
    coords = {0.396, 0.218, 1},
    loot = {{24091,N5},{24069,N5},{24096,N5},{27478,H5},{24073,N5},{24090,N5},{27463,H5},{27465,H5},{24094,N5},{27464,H5},{23572,H5},{27895,H5},{27466,H5},{30593,H5},{27539,H5},{27477,H5},{27906,H5},{27476,H5},{27467,H5},{27462,H5},{30594,H5},},
    sections = {
      Spell(37566, {fbd = H5}), -- Bane of Treachery
      Spell(31901), -- Demonic Shield
      Spell(30686, {fbd = N5}), -- Shadow Bolt
      Spell(39297, {fbd = H5}), -- Shadow Bolt
      Spell(30707), -- Summon Fiendish Hound
      Spell(30695, {fbd = N5, flag1 = CURSE}), -- Treacherous Aura
    },
  },
  {
    name = "Nazan",
    --desc = "",
    --icon = true,
    creature = 17536,
    display = 18812,
    --coords = {x, y, level},
    loot = {},
    sections = {
    },
  },
})

table.insert(db, HELLFIRE_RAMPARTS)
