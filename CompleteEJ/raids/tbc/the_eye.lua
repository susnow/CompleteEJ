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
  name = "The Eye",
  desc = "Tempest Keep is a former Naaru fortress in the Netherstorm in Outland. This crystalline fortress is now ruled by Kael'thas Sunstrider, the lord of the blood elves, and dominated by scores of his brethren. The structure is divided into three wings in the skies--satellites of the gigantic structure--with the fourth wing, the Exodar, now in the world of Azeroth as the Draenei capital. This raid instance is most notable for dropping Ashes of Al'ar, one of the most coveted mounts in World of Warcraft.",
  --texture = "TheEye",
  area = 782,
}, {
  {
    name = "Void Reaver",
    desc = "Void Reaver is a large mechanical reaver boss found in The Eye.",
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
    name = "Al'ar",
    desc = "Al'ar is the first boss of The Eye. It is Kael'thas Sunstrider's phoenix.",
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
    name = "High Astromancer Solarian",
    desc = "High Astromancer Solarian is the third boss found in The Eye.",
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
    name = "Kael'thas Sunstrider",
    desc = "Kael'thas' Advisors Thaladred the Darkener Lord Sanguinar Grand Astromancer Capernian Master Engineer Telonicus  Kael'thas Sunstrider, Lord of the Blood Elves, is the fourth and final boss encounter of the Eye. He is accompanied by his council of four advisors: Thaladred the Darkener, Master Engineer Telonicus, Grand Astromancer Capernian and Lord Sanguinar. He spawns seven powerful legendary items which you have to fight, defeat and then equip in order to defeat Kael'thas. These items are usable only during the encounter; reseting the encounter, wiping, or releasing to the graveyard will cause them to desummon. He is famous for dropping Ashes of Al'ar, one of the most popular mounts in the game.",
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
