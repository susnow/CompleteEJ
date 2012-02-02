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

local TRIAL_OF_THE_CHAMPION = CreateInstance({
  name = "Trial of the Champion",
  desc = "Trial of the Champion is a 5-man instance located in the northeast corner of Icecrown, inside the Crusaders' Coliseum at the Argent Tournament grounds. The entrance can be found on the north side of the building. One member of your party needs to talk to a NPC present to start each encounter.",
  --texture = "TrialoftheChampion",
  area = 542,
}, {
  {
    name = "The Black Knight",
    desc = "The Black Knight is the third and last boss of the Trial of the Champion. Players fight him in Forsaken, skeletal, and wraith forms. He is linked to the achievement I've Had Worse.",
    --icon = true,
    creature = 35451,
    display = 29837,
    coords = {0.490, 0.522, 1},
    loot = {{47220,N5},{47527,H5},{47560,H5},{47529,H5},{47561,H5},{47563,H5},{47565,H5},{47216,N5},{47562,H5},{47567,H5},{47221,N5},{47566,H5},{47564,H5},{47568,H5},{43102,H5},{47569,H5},{47226,N5},{47231,N5},{47232,N5},{49682,H5},{47228,N5},{47229,N5},{47227,N5},{47215,N5},{47230,N5},{47222,N5},},
    sections = {
      Spell(67761, {fbd = N5}), -- Army of the Dead
      Spell(67874, {fbd = H5}), -- Army of the Dead
      Spell(67885, {fbd = H5, flag1 = DISEASE}), -- Blood Plague
      Spell(67722, {fbd = N5, flag1 = DISEASE}), -- Blood Plague
      Spell(67808, {fbd = N5}), -- Death's Bite
      Spell(67875, {fbd = H5}), -- Death's Bite
      Spell(68306, {fbd = H5}), -- Death's Respite
      Spell(67745, {fbd = N5}), -- Death's Respite
      Spell(66798), -- Death's Respite
      Spell(67877, {fbd = H5}), -- Desecration
      Spell(67778, {fbd = N5}), -- Desecration
      Spell(67719, {fbd = N5, flag1 = DISEASE}), -- Frost Fever
      Spell(67878, {fbd = H5, flag1 = DISEASE}), -- Frost Fever
      Spell(67751), -- Ghoul Explode
      Spell(67881, {fbd = H5}), -- Icy Touch
      Spell(67718, {fbd = N5}), -- Icy Touch
      Spell(67882, {fbd = H5}), -- Marked For Death
      Spell(67823, {fbd = N5}), -- Marked For Death
      Spell(67725, {fbd = N5}), -- Obliterate
      Spell(67883, {fbd = H5}), -- Obliterate
      Spell(67884, {fbd = H5, flag1 = DISEASE}), -- Plague Strike
      Spell(67724, {fbd = N5, flag1 = DISEASE}), -- Plague Strike
    },
  },
})

table.insert(db, TRIAL_OF_THE_CHAMPION)
