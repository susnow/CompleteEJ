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
  desc = "\"Whoever controls the water controls Outland.\"  These are the words of Lord Illidan Stormrage to his most trusted lieutenant, Lady Vashj. Shortly after the Third War, when Illidan requested the aid of the naga, a group of naga led by Lady Vashj answered his call. Ever since, Vashj has displayed a fierce dedication to Illidan.\n\nNow the naga witch carefully monitors Coilfang's operations from her seat of power within Serpentshrine Cavern. Far more at home here among the waters of the reservoir than locked within the cold stone walls of Black Temple, Vashj maintains a close eye on her minions and personally oversees the draining of Zangarmarsh.\n\nWhether her loyalties belong to Illidan alone, however, remains to be seen.",
  --texture = "SerpentshrineCavern",
  area = 780,
  dflag = N25,
}, {
  {
    name = "Hydross the Unstable",
    desc = "Hydross the Unstable is the first boss you encounter. There are two columns which channel beams of energy into him. It seems that the beams are keeping his body purified and \"stable\". If he crosses the threshold, the columns will stop channeling energy into him, causing him to revert into his \"unstable\", poisonous form, causing him great pain. Thus, he is more or less a prisoner of Lady Vashj, forced to guard the way and to prevent any intruders from getting past. He could have been captured by the naga and struck a deal with them, with him guarding the area and them finding a way to purify his body. It seems now that he has no choice in the matter.",
    --icon = true,
    creature = 21216,
    display = 20162,
    coords = {0.362, 0.844, 1},
    loot = {30306,30047,30324,30050,30307,30049,30629,30054,30283,33055,30308,30053,30281,},
    sections = {
      Stage({
        name = "Water Form",
        desc = "He starts in between both beams, thus he starts in his water form once engaged. He is immune to frost damage and attacks with frost based abilities.",
        sections = {
          Spell(45574, {desc = "Encases a random enemy and any of its nearby allies in a tomb of water, stunning them and dealing 900 Frost damage every second for 4 seconds."}), -- Water Tomb (38235 old?)
          --Spell(38215), -- Mark of Hydross (10%)
          --Spell(38216), -- Mark of Hydross (25%)
          --Spell(38217), -- Mark of Hydross (50%)
          --Spell(38218), -- Mark of Hydross (100%)
          --Spell(38231), -- Mark of Hydross (250%)
          Spell(40584, {desc = "Each 15 to 30 seconds, Hydross applies a raid wide debuff on all enemy targets that increases Frost damage taken by 10/25/50/100/250/500%, each application increases the damage increased."}), -- Mark of Hydross (500%)
        },
      }),
      Stage({
        name = "Poison Form",
        desc = "When pulled away from both beams, he enters his poison form. He is immune to nature damage and attacks with nature based abilities.",
        sections = {
          --Spell(37961), -- Corruption
          Spell(45573, {desc = "Coats a random enemy in a slick coat of sludge, reducing damage and healing done by that target by 50% and dealing 500 Nature damage every 3 seconds for 24 seconds."}), -- Vile Sludge (38246 old?)
          --Spell(38219), -- Mark of Corruption (10%)
          --Spell(38220), -- Mark of Corruption (25%)
          --Spell(38221), -- Mark of Corruption (50%)
          --Spell(38222), -- Mark of Corruption (100%)
          --Spell(38230), -- Mark of Corruption (250%)
          Spell(40583, {desc = "Each 15 to 30 seconds, Hydross applies a raid wide debuff on all enemy targets that increases Nature damage taken by 10/25/50/100/250/500%, each application increases the damage increased."}), -- Mark of Corruption (500%)
        },
      }),
      Spell(36459, {so = true, icon = "Interface\\Icons\\Spell_Frost_SummonWaterElemental_2", name = "Summon Elementals", desc = "After each form change, four elementals are summoned to serve. If he enters Water Form then Water Elementals will spawn, otherwise Poison Elementals.\n\nJust like Hydross, these spawns will attack and be immune to the same school of magic as themselves.", flag1 = IMPORTANT}, 1), -- Summon Water Elemental
    },
    adds = {
      {
        name = "Hydross the Unstable (Poison Form)",
        creature = 21932,
        display = 20609,
      },
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
      Spell(37478), -- Geyser
      Spell(37138), -- Water Bolt
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
      Spell(27680), -- Berserk
      Spell(37675), -- Chaos Blast
      Spell(37749), -- Consuming Madness
      Spell(37676), -- Insidious Whisper
      Spell(37640), -- Whirlwind
      Spell(37641), -- Whirlwind
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
      Spell(27680), -- Berserk
      Spell(38441), -- Cataclysmic Bolt
      Spell(38445), -- Sear Nova
      Spell(38373), -- The Beast Within
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
      Spell(37764), -- Earthquake
      Spell(37730), -- Tidal Wave
      Spell(37850), -- Watery Grave
      Spell(38028), -- Watery Grave
      Spell(38023), -- Watery Grave
      Spell(38024), -- Watery Grave
      Spell(38025), -- Watery Grave
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
      Spell(38316), -- Entangle
      Spell(38145), -- Forked Lightning
      Spell(38310), -- Multi-Shot
      Spell(38509), -- Shock Blast
      Spell(38295), -- Shoot
      Spell(38280), -- Static Charge
    },
  },
})

table.insert(db, SERPENTSHRINE_CAVERN)
