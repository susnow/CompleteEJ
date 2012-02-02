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

local SETHEKK_HALLS = CreateInstance({
  name = "Sethekk Halls",
  desc = "Auchindoun is a former draenei holy site and Horde fortress in the middle of the Bone Wastes in Outland's Terokkar Forest. It was a hallowed ground until the Shadow Council took over, summoned an extremely powerful demon as old as time itself, and destroyed half of Terokkar Forest in the process. Different factions now vie for power in this magical spot: Ethereals suck the arcane energy from the Mana-Tombs, the Burning Legion harvests souls inside the Auchenai Crypts, arakkoa zealots work dark magic in the Sethekk Halls, and the Shadow Council plots its domination of Outland from within the Shadow Labyrinth. Sethekk Halls is a wing of Auchindoun and its entrance is on the east side of the Ring of Observance. On heroic mode, it contains a boss which drops a coveted rare mount: Reins of the Raven Lord.",
  --texture = "SethekkHalls",
  area = 723,
}, {
  {
    name = "Darkweaver Syth",
    desc = "Darkweaver Syth is the first boss found in Sethekk Halls.",
    --icon = true,
    creature = 18472,
    display = 20599,
    coords = {0.486, 0.670, 1},
    loot = {{30552,H5},27917,27914,27919,27918,{30553,H5},27915,27916,24160,{30554,H5},},
    sections = {
      Spell(33534, {fbd = N5, flag1 = MAGIC}), -- Arcane Shock
      Spell(38135, {fbd = H5, flag1 = MAGIC}), -- Arcane Shock
      Spell(15305, {fbd = H5}), -- Chain Lightning
      Spell(15659, {fbd = N5}), -- Chain Lightning
      Spell(15616, {fbd = H5, flag1 = MAGIC}), -- Flame Shock
      Spell(15039, {fbd = N5, flag1 = MAGIC}), -- Flame Shock
      Spell(21401, {fbd = H5, flag1 = MAGIC}), -- Frost Shock
      Spell(12548, {fbd = N5, flag1 = MAGIC}), -- Frost Shock
      Spell(38136, {fbd = H5, flag1 = MAGIC}), -- Shadow Shock
      Spell(33620, {fbd = N5, flag1 = MAGIC}), -- Shadow Shock
    },
  },
  {
    name = "Talon King Ikiss",
    desc = "Talon King Ikiss is one of the leaders of the arkoaa along with Darkweaver Syth. He is the final boss in the Sethekk Halls.",
    --icon = true,
    creature = 18473,
    display = 18636,
    coords = {0.324, 0.290, 2},
    loot = {{30554,H5},{29355,H5},27936,27776,27948,{30552,H5},27925,27875,{30553,H5},27981,27946,27985,27980,27838,{23572,H5},27986,{32073,H5},{29249,H5},{29259,H5},},
    sections = {
      Spell(9438), -- Arcane Bubble
      Spell(40425, {fbd = H5, flag1 = MAGIC}), -- Arcane Explosion
      Spell(38197, {fbd = N5, flag1 = MAGIC}), -- Arcane Explosion
      Spell(40424, {fbd = H5}), -- Arcane Volley
      Spell(35059, {fbd = N5}), -- Arcane Volley
      Spell(38194), -- Blink
      Spell(38151, {flag1 = MAGIC}), -- Mana Shield
      Spell(43309, {fbd = H5, flag1 = MAGIC}), -- Polymorph
      Spell(38245, {fbd = N5, flag1 = MAGIC}), -- Polymorph
      Spell(35032, {fbd = H5, flag1 = MAGIC}), -- Slow
    },
  },
  {
    name = "Anzu",
    desc = "Anzu the Raven God is a boss in Sethekk Halls appearing on Heroic difficulty only. He used to be able to be summoned only by the druid class, but anyone can summoned him now. He drops the rare mount, Reins of the Raven Lord.",
    --icon = true,
    creature = 23035,
    display = 21492,
    coords = {0.324, 0.576, 2},
    loot = {{30552,H5},{32781,H5},{30554,H5},{32769,H5},{32778,H5},{32780,H5},{30553,H5},{32779,H5},{32768,H5},},
    sections = {
      Spell(40321, {fbd = H5, flag1 = MAGIC}), -- Cyclone of Feathers
      Spell(40199, {fbd = H5}), -- Flesh Rip
      Spell(40184, {fbd = H5}), -- Paralyzing Screech
      Spell(40303, {fbd = H5, flag1 = CURSE}), -- Spell Bomb
    },
  },
})

table.insert(db, SETHEKK_HALLS)
