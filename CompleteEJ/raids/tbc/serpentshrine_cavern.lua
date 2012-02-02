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

local SERPENTSHRINE_CAVERN = CreateInstance({
  name = "Serpentshrine Cavern",
  desc = "Serpentshrine Cavern is the final wing of Coilfang Reservoir, where Lady Vashj has made her lair. It is a 25-man raid instance with six bosses.",
  --texture = "SerpentshrineCavern",
  area = 780,
}, {
  {
    name = "Hydross the Unstable",
    desc = "Hydross the Unstable is the first boss of Serpentshrine Cavern.",
    --icon = true,
    creature = 21216,
    display = 20162,
    coords = {0.362, 0.844, 1},
    loot = {30306,30047,30324,30050,30307,30049,30629,30054,30283,33055,30308,30053,30281,},
    sections = {
      Spell(37961, {fbd = N10}), -- Corruption
      Spell(38222, {fbd = N10}), -- Mark of Corruption
      Spell(38220, {fbd = N10}), -- Mark of Corruption
      Spell(40583, {fbd = N10}), -- Mark of Corruption
      Spell(38219, {fbd = N10}), -- Mark of Corruption
      Spell(38221, {fbd = N10}), -- Mark of Corruption
      Spell(38230, {fbd = N10}), -- Mark of Corruption
      Spell(38215, {fbd = N10}), -- Mark of Hydross
      Spell(38231, {fbd = N10}), -- Mark of Hydross
      Spell(38218, {fbd = N10}), -- Mark of Hydross
      Spell(40584, {fbd = N10}), -- Mark of Hydross
      Spell(38216, {fbd = N10}), -- Mark of Hydross
      Spell(38217, {fbd = N10}), -- Mark of Hydross
      Spell(36459, {fbd = N10}), -- Summon Water Elemental
      Spell(45573, {fbd = N10}), -- Vile Sludge
      Spell(38246, {fbd = N10}), -- Vile Sludge
      Spell(38235, {fbd = N10}), -- Water Tomb
      Spell(45574, {fbd = N10}), -- Water Tomb
    },
  },
  {
    name = "The Lurker Below",
    desc = "The Lurker Below is the second boss of Serpentshrine Cavern in Coilfang Reservoir. In order to access the boss, he must be fished out of the \"Strange Pool\" where he is located.",
    --icon = true,
    creature = 21217,
    display = 20216,
    coords = {0.404, 0.588, 1},
    loot = {30067,30064,30062,30059,30063,30665,30058,30323,},
    sections = {
      Spell(37478, {fbd = N10}), -- Geyser
      Spell(37138, {fbd = N10}), -- Water Bolt
    },
  },
  {
    name = "Leotheras the Blind",
    desc = "Leotheras the Blind is the third boss of Serpentshrine Cavern. He has two forms, which he will alternate about every 60 seconds. Once he reaches 15% health, his two forms will separate and you will need to engage them together.",
    --icon = true,
    creature = 21215,
    display = 20514,
    coords = {0.408, 0.260, 1},
    loot = {30307,30096,30239,30240,30091,30308,30097,30282,},
    sections = {
      Spell(27680, {fbd = N10}), -- Berserk
      Spell(37675, {fbd = N10}), -- Chaos Blast
      Spell(37749, {fbd = N10}), -- Consuming Madness
      Spell(37676, {fbd = N10}), -- Insidious Whisper
      Spell(37640, {fbd = N10}), -- Whirlwind
      Spell(37641, {fbd = N10}), -- Whirlwind
    },
  },
  {
    name = "Fathom-Lord Karathress",
    desc = "Fathom-Guards Sharkkis (Hunter) Tidalvess (Shaman) Caribdis (Priest)  Fathom-Lord Karathress is the fourth boss in Serpentshrine Cavern. He remains very hard to solo at 85, largely because he has an ability that does 50% of your HP regardless of level--making him able to kill you easily.",
    --icon = true,
    creature = 21214,
    display = 20662,
    coords = {0.480, 0.170, 1},
    loot = {30324,30245,30283,30100,30247,30663,30307,30090,30281,},
    sections = {
      Spell(27680, {fbd = N10}), -- Berserk
      Spell(38441, {fbd = N10}), -- Cataclysmic Bolt
      Spell(38445, {fbd = N10}), -- Sear Nova
      Spell(38373, {fbd = N10}), -- The Beast Within
    },
  },
  {
    name = "Morogrim Tidewalker",
    desc = "Morogrim Tidewalker is the fifth boss of Serpentshrine Cavern in Coilfang Reservoir.",
    --icon = true,
    creature = 21213,
    display = 20739,
    coords = {0.594, 0.258, 1},
    loot = {30008,30324,30098,30283,33058,30720,30082,30282,30084,30307,30080,30302,},
    sections = {
      Spell(37764, {fbd = N10}), -- Earthquake
      Spell(37730, {fbd = N10}), -- Tidal Wave
      Spell(37850, {fbd = N10}), -- Watery Grave
      Spell(38028, {fbd = N10}), -- Watery Grave
      Spell(38023, {fbd = N10}), -- Watery Grave
      Spell(38024, {fbd = N10}), -- Watery Grave
      Spell(38025, {fbd = N10}), -- Watery Grave
    },
  },
  {
    name = "Lady Vashj",
    desc = "Lady Vashj is the final encounter in Serpentshrine Cavern in Coilfang Reservoir. She used to require players defeat all prior bosses to unlock her, but that was changed so players can now walk in and start her without having to clear the instance.",
    --icon = true,
    creature = 21212,
    display = 20748,
    coords = {0.714, 0.590, 1},
    loot = {30242,30281,30243,30308,30112,30323,30107,30621,30104,30306,30105,30324,30108,30301,},
    sections = {
      Spell(38316, {fbd = N10}), -- Entangle
      Spell(38145, {fbd = N10}), -- Forked Lightning
      Spell(38310, {fbd = N10}), -- Multi-Shot
      Spell(38509, {fbd = N10}), -- Shock Blast
      Spell(38295, {fbd = N10}), -- Shoot
      Spell(38280, {fbd = N10}), -- Static Charge
    },
  },
})

table.insert(db, SERPENTSHRINE_CAVERN)
