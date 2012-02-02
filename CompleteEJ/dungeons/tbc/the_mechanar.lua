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

local THE_MECHANAR = CreateInstance({
  name = "The Mechanar",
  desc = "Tempest Keep is a former Naaru fortress in the Netherstorm in Outland. This crystalline fortress is now ruled by Kael'thas Sunstrider, the lord of the blood elves, and dominated by scores of his brethren. The structure is divided into three wings in the skies--satellites of the gigantic structure--with the fourth wing, the Exodar, now in the world of Azeroth as the Draenei capital.",
  --texture = "TheMechanar",
  area = 730,
}, {
  {
    name = "Mechano-Lord Capacitus",
    desc = "Mechano-Lord Capacitus is an arcane titan boss found on the first floor in The Mechanar wing of Tempest Keep.",
    --icon = true,
    creature = 19219,
    display = 19162,
    coords = {0.470, 0.300, 1},
    loot = {28257,{30565,H5},28255,28253,{30566,H5},28254,28256,{30564,H5},35582,},
    sections = {
      Spell(26662, {fbd = H5}), -- Berserk
      Spell(55095, {fbd = N5, flag1 = DISEASE}), -- Frost Fever
      Spell(35161), -- Head Crack
      Spell(39096, {fbd = H5}), -- Polarity Shift
      Spell(35159, {fbd = N5}), -- Reflective Damage Shield
      Spell(35158, {fbd = N5}), -- Reflective Magic Shield
    },
  },
  {
    name = "Nethermancer Sepethrea",
    desc = "Nethermancer Sepethrea is an optional boss found in The Mechanar wing of Tempest Keep.",
    --icon = true,
    creature = 19221,
    display = 19166,
    coords = {0.474, 0.202, 2},
    loot = {28259,{30565,H5},28262,28260,{30566,H5},28258,28263,{30564,H5},},
    sections = {
      Spell(35314), -- Arcane Blast
      Spell(35250, {flag1 = MAGIC}), -- Dragon's Breath
      Spell(45195), -- Frost Attack
    },
  },
  {
    name = "Pathaleon the Calculator",
    desc = "Pathaleon the Calculator is the last boss after Nethermancer Sepethrea in the Mechanar.",
    --icon = true,
    creature = 19220,
    display = 20033,
    coords = {0.282, 0.606, 2},
    loot = {{29251,H5},28267,28288,{30533,H5},28285,28265,27899,28269,{32076,H5},28266,{30566,H5},28286,28278,{30565,H5},28275,{30564,H5},28202,28204,{29362,H5},{23572,H5},},
    sections = {
      Spell(15453, {fbd = H5, flag1 = MAGIC}), -- Arcane Explosion
      Spell(36022, {flag1 = MAGIC}), -- Arcane Torrent
      Spell(35289), -- Disgruntled Anger
      Spell(35280), -- Domination
      Spell(36992), -- Frenzy
      Spell(36021, {flag1 = MAGIC}), -- Mana Tap
    },
  },
})

table.insert(db, THE_MECHANAR)
