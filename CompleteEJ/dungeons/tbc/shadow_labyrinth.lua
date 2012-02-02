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

local SHADOW_LABYRINTH = CreateInstance({
  name = "Shadow Labyrinth",
  desc = "Auchindoun is a former draenei holy site and Horde fortress in the middle of the Bone Wastes in Outland's Terokkar Forest. It was a hallowed ground until the Shadow Council took over, summoned an extremely powerful demon as old as time itself, and destroyed half of Terokkar Forest in the process. Different factions now vie for power in this magical spot: Ethereals suck the arcane energy from the Mana-Tombs, the Burning Legion harvests souls inside the Auchenai Crypts, arakkoa zealots work dark magic in the Sethekk Halls, and the Shadow Council plots its domination of Outland from within the Shadow Labyrinth. Shadow Labyrinth is the southern wing of Auchindoun.",
  --texture = "ShadowLabyrinth",
  area = 724,
}, {
  {
    name = "Ambassador Hellmaw",
    desc = "Ambassador Hellmaw is the first boss found in Shadow Labyrinth.",
    --icon = true,
    creature = 18731,
    display = 18821,
    coords = {0.218, 0.394, 1},
    loot = {{30559,H5},27889,27884,27885,27886,{30563,H5},27887,27888,{30560,H5},},
    sections = {
      Spell(30231), -- Banish
      Spell(33551), -- Corrosive Acid
      Spell(33547, {flag1 = MAGIC}), -- Fear
    },
  },
  {
    name = "Blackheart the Inciter",
    desc = "Blackheart the Inciter is the second boss found in Shadow Labyrinth.",
    --icon = true,
    creature = 18667,
    display = 18058,
    coords = {0.266, 0.686, 1},
    loot = {{30560,H5},27893,27890,27892,27468,{30563,H5},28134,27891,25728,{30559,H5},},
    sections = {
      Spell(33709), -- Charge
      Spell(33676), -- Incite Chaos
      Spell(33707), -- War Stomp
    },
  },
  {
    name = "Grandmaster Vorpil",
    desc = "Grandmaster Vorpil is the third boss found in Shadow Labyrinth.",
    --icon = true,
    creature = 18732,
    display = 18535,
    coords = {0.532, 0.558, 1},
    loot = {27775,{30559,H5},27898,27900,{30563,H5},27897,27901,{30560,H5},},
    sections = {
      Spell(38791, {fbd = H5, flag1 = MAGIC}), -- Banish
      Spell(33563), -- Draw Shadows
      Spell(33617, {fbd = N5}), -- Rain of Fire
      Spell(39363, {fbd = H5}), -- Rain of Fire
      Spell(33841), -- Shadow Bolt Volley
    },
  },
  {
    name = "Murmur",
    desc = "Murmur is the final boss of the Shadow Labyrinth. Codex of Blood reveals some of his history, explaining that Murmur is the primordial essence of sound.",
    --icon = true,
    creature = 18708,
    display = 18839,
    coords = {0.812, 0.392, 1},
    loot = {28232,24309,27778,27908,27905,27913,27803,{29357,H5},{30560,H5},27912,{30563,H5},27902,27903,{29353,H5},{30559,H5},27909,28230,27910,{30532,H5},{23572,H5},{29261,H5},},
    sections = {
      Spell(33689, {fbd = N5}), -- Magnetic Pull
      Spell(38794, {fbd = H5}), -- Murmur's Touch
      Spell(33711, {fbd = N5}), -- Murmur's Touch
      Spell(33657), -- Resonance
      Spell(33666, {fbd = N5}), -- Sonic Boom
      Spell(38795, {fbd = H5}), -- Sonic Boom
      Spell(38796, {fbd = H5}), -- Sonic Boom
      Spell(33923, {fbd = N5}), -- Sonic Boom
      Spell(38797, {fbd = H5, flag1 = MAGIC}), -- Sonic Shock
      Spell(39365, {fbd = H5}), -- Thundering Storm
    },
  },
})

table.insert(db, SHADOW_LABYRINTH)
