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

local MAGISTERS_TERRACE = CreateInstance({
  name = "Magisters' Terrace",
  desc = "Magisters' Terrace is a 5-man instance located on the Isle of Quel'Danas. The instance features four bosses: Selin Fireheart, Vexallus, Priestess Delrissa and Kael'thas Sunstrider himself, who has returned despite his \"defeat\" in Tempest Keep: The Eye. Uniquely, this 5-man drops all epics, starting what would become a trend repeating in WotLK of 5-mans being added towards the end of an expansion with epic loot. Swift White Hawkstrider and Phoenix Hatchling drop off Kael'thas, too, serving as popular vanity items while every boss has a chance to drop Orb of the Sin'dorei which turns the user temporarily into a blood elf.",
  --texture = "MagistersTerrace",
  area = 798,
}, {
  {
    name = "Selin Fireheart",
    --desc = "",
    --icon = true,
    creature = 24723,
    display = 22642,
    coords = {0.424, 0.228, 2},
    loot = {{34603,H5},{35275,H5},{34604,H5},{34702,N5},{34701,N5},{34700,N5},{34602,H5},{34698,N5},{34699,N5},{34601,H5},{34697,N5},},
    sections = {
      Spell(44294, {fbd = N5, flag1 = MAGIC}), -- Drain Life
      Spell(46155, {fbd = H5, flag1 = MAGIC}), -- Drain Life
      Spell(46153, {fbd = H5, flag1 = MAGIC}), -- Drain Mana
      Spell(44314), -- Fel Explosion
    },
  },
  {
    name = "Vexallus",
    desc = "Vexallus is a voidwraith infused with arcane energy. He is the second boss in the Magisters' Terrace.",
    --icon = true,
    creature = 24744,
    display = 22731,
    coords = {0.812, 0.266, 2},
    loot = {{34605,H5},{35275,H5},{34607,H5},{34707,N5},{34705,N5},{34708,N5},{34606,H5},{34706,N5},{34704,N5},{34608,H5},{34703,N5},},
    sections = {
      Spell(44319, {fbd = N5, flag1 = MAGIC}), -- Arcane Shock
      Spell(46381, {fbd = H5, flag1 = MAGIC}), -- Arcane Shock
      Spell(46380, {fbd = H5}), -- Chain Lightning
      Spell(44318, {fbd = N5}), -- Chain Lightning
      Spell(44353), -- Overload
    },
  },
  {
    name = "Priestess Delrissa",
    desc = "Delrissa's Minions Kagani Nightstrike (Rogue) Ellrys Duskhallow (Warlock) Eramas Brightblaze (Monk) Yazzai (Mage) Warlord Salaris (Warrior) Garaxxas (Hunter) Apoko (Shaman) Zelfan (Engineer)  Priestess Delrissa is the third boss within Magisters' Terrace. Upon instance creation, she randomly chooses four companions with their own unique abilities. All five, including Delrissa, must be defeated in order to complete the event.",
    --icon = true,
    creature = 24560,
    display = 22596,
    coords = {0.402, 0.562, 1},
    loot = {{34470,H5},35756,{35275,H5},{34783,N5},{34471,H5},{34789,N5},{34472,H5},{34788,N5},{34790,N5},{34792,N5},{34791,N5},{34473,H5},},
    sections = {
      Spell(27609), -- Dispel Magic
      Spell(17843), -- Flash Heal
      Spell(46227, {fbd = H5}), -- Medallion of Immunity
      Spell(44291, {flag1 = MAGIC}), -- Power Word: Shield
      Spell(46193, {fbd = H5, flag1 = MAGIC}), -- Power Word: Shield
      Spell(44175, {fbd = N5, flag1 = MAGIC}), -- Power Word: Shield
      Spell(27610), -- Psychic Scream
      Spell(46192, {fbd = H5, flag1 = MAGIC}), -- Renew
      Spell(44174, {fbd = N5, flag1 = MAGIC}), -- Renew
      Spell(15654, {fbd = H5, flag1 = MAGIC}), -- Shadow Word: Pain
      Spell(14032, {fbd = N5, flag1 = MAGIC}), -- Shadow Word: Pain
      Spell(6788), -- Weakened Soul
    },
  },
  {
    name = "Kael'thas Sunstrider",
    desc = "Kael'thas Sunstrider is the final boss within Magisters' Terrace. Although believed to have been defeated in The Eye, Kael'thas has been kept alive by a green crystal embedded within his chest. He has a chance to drop Phoenix Hatchling and Swift White Hawkstrider, two popular vanity items for collectors.",
    --icon = true,
    creature = 24664,
    display = 22906,
    --coords = {x, y, level},
    loot = {{35275,H5},35504,{34616,H5},{23572,H5},{34610,H5},35297,{35513,H5},{34808,N5},{34795,N5},{34613,H5},{34796,N5},{34615,H5},{34809,N5},{34614,H5},{34799,N5},{34611,H5},{34794,N5},{34612,H5},{34793,N5},{34625,N5},{34807,N5},{34810,N5},{34798,N5},{34797,N5},{34609,H5},},
    sections = {
      Spell(44189, {fbd = N5}), -- Fireball
      Spell(46164, {fbd = H5}), -- Fireball
      Spell(44224), -- Gravity Lapse
      Spell(44194), -- Phoenix
      Spell(36819, {fbd = H5}), -- Pyroblast
      Spell(46165, {fbd = H5}), -- Shock Barrier
    },
  },
})

table.insert(db, MAGISTERS_TERRACE)
