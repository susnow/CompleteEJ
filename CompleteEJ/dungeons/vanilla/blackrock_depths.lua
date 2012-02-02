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

local BLACKROCK_DEPTHS = CreateInstance({
  name = "Blackrock Depths",
  desc = "The Blackrock Depths (BRD) are the deepest parts of Blackrock Mountain, ruled by the Dark Iron dwarves led by Emperor Dagran Thaurissan. Blackrock Depths is one of the few sources of Dark Iron Ore and the Black Forge required for smelting the ore is located within. It is also the location of the Black Anvil, which is required by blacksmiths for crafting any dark iron equipment. BRD is fondly remembered as the most epic of zones prior to raiding--with almost two dozen bosses and many questlines, it was truly an experience back in vanilla. In the past two expansions, areas were tweaked to make travel quicker between bosses via the addition of mole machines and questlines have been removed such as the Onyxia attunement.",
  --texture = "BlackrockDepths",
  area = 704,
  dflag = N5,
}, {
  {
    name = "Lord Roccor",
    --desc = "",
    --icon = true,
    creature = 9025,
    display = 5781,
    coords = {0.558, 0.670, 1},
    loot = {22397,22234,11631,11632,},
    sections = {
      Spell(13728), -- Earth Shock
      Spell(13729, {flag1 = MAGIC}), -- Flame Shock
      Spell(6524), -- Ground Tremor
    },
  },
  {
    name = "Bael'Gar",
    --desc = "",
    --icon = true,
    creature = 9016,
    display = 12162,
    --coords = {x, y, level},
    loot = {11807,11805,11803,11802,},
    sections = {
      Spell(23379), -- Magma Splash
      Spell(13895), -- Summon Spawn of Bael'Gar
    },
  },
  {
    name = "Houndmaster Grebmar",
    --desc = "",
    --icon = true,
    creature = 9319,
    display = 9212,
    coords = {0.512, 0.614, 1},
    loot = {11629,11627,11623,11628,},
    sections = {
      Spell(21049, {flag1 = MAGIC}), -- Bloodlust
      Spell(13730), -- Demoralizing Shout
      Spell(15615), -- Pummel
    },
  },
  {
    name = "High Interrogator Gerstahn",
    --desc = "",
    --icon = true,
    creature = 9018,
    display = 8761,
    --coords = {x, y, level},
    loot = {11626,11625,11624,22240,},
    sections = {
      Spell(14033), -- Mana Burn
      Spell(13704, {flag1 = MAGIC}), -- Psychic Scream
      Spell(12040, {flag1 = MAGIC}), -- Shadow Shield
      Spell(14032, {flag1 = MAGIC}), -- Shadow Word: Pain
    },
  },
  {
    name = "High Justice Grimstone",
    desc = "Ring of Law (Random Boss) Gorosh the Dervish Grizzle Eviscerator Ok'thor the Breaker Anub'shiah Hedrum the Creeper  High Justice Grimstone can be found within the Ring of Law in Blackrock Depths. He can be targeted, but is not a hostile enemy. Approaching the center of the ring will start an event, and the High Justice will appear and approach one of the gates and let loose a wave of random enemies. Once these have been defeated, he will go to another gate and release a random boss monster. The boss you encounter is not related to the previous enemies in any way; they are both completely random spawns.",
    --icon = true,
    creature = 10096,
    display = 9329,
    --coords = {x, y, level},
    loot = {},
    sections = {
    },
  },
  {
    name = "Pyromancer Loregrain",
    --desc = "",
    --icon = true,
    creature = 9024,
    display = 8762,
    coords = {0.546, 0.958, 2},
    loot = {11747,11748,11750,11749,},
    sections = {
      Spell(15041, {flag1 = MAGIC}), -- Fire Ward
      Spell(15616, {flag1 = MAGIC}), -- Flame Shock
      Spell(15095), -- Molten Blast
      Spell(15038), -- Scorching Totem
    },
  },
  {
    name = "General Angerforge",
    --desc = "",
    --icon = true,
    creature = 9033,
    display = 8756,
    coords = {0.366, 0.840, 2},
    loot = {11820,11817,11810,11816,11821,},
    sections = {
      Spell(15061), -- Enrage
      Spell(17687), -- Flurry
      Spell(15572), -- Sunder Armor
    },
  },
  {
    name = "Golem Lord Argelmach",
    --desc = "",
    --icon = true,
    creature = 8983,
    display = 8759,
    coords = {0.368, 0.654, 2},
    loot = {11823,11669,11822,11819,},
    sections = {
      Spell(15305), -- Chain Lightning
      Spell(15507, {flag1 = MAGIC}), -- Lightning Shield
      Spell(15605), -- Shock
    },
  },
  {
    name = "Ribbly Screwspigot",
    --desc = "",
    --icon = true,
    creature = 9543,
    display = 8667,
    coords = {0.490, 0.618, 2},
    loot = {11742,11612,},
    sections = {
      Spell(12540), -- Gouge
      Spell(9080), -- Hamstring
    },
  },
  {
    name = "Hurley Blackbreath",
    --desc = "",
    --icon = true,
    creature = 9537,
    display = 8658,
    coords = {0.478, 0.594, 2},
    loot = {22275,18044,18043,11735,},
    sections = {
      Spell(14872), -- Drunken Rage
      Spell(9573), -- Flame Breath
    },
  },
  {
    name = "Plugger Spazzring",
    --desc = "",
    --icon = true,
    creature = 9499,
    display = 8652,
    coords = {0.498, 0.612, 2},
    loot = {12793,12791,},
    sections = {
      Spell(8994, {flag1 = MAGIC}), -- Banish
      Spell(13338, {flag1 = CURSE}), -- Curse of Tongues
      Spell(13787, {flag1 = MAGIC}), -- Demon Armor
      Spell(12742, {flag1 = MAGIC}), -- Immolate
      Spell(12739), -- Shadow Bolt
    },
  },
  {
    name = "Phalanx",
    --desc = "",
    --icon = true,
    creature = 9502,
    display = 8177,
    coords = {0.526, 0.630, 2},
    loot = {11745,11744,22212,},
    sections = {
      Spell(15285), -- Fireball Volley
      Spell(14099), -- Mighty Blow
      Spell(15588, {flag1 = MAGIC}), -- Thunderclap
    },
  },
  {
    name = "Lord Incendius",
    --desc = "",
    --icon = true,
    creature = 9017,
    display = 1204,
    coords = {0.556, 0.322, 1},
    loot = {11765,11767,11766,11764,19268,},
    sections = {
      Spell(26977, {flag1 = CURSE}), -- Curse of the Elemental Lord
      Spell(13900), -- Fiery Burst
      Spell(13899), -- Fire Storm
      Spell(14099), -- Mighty Blow
    },
  },
  {
    name = "Fineous Darkvire",
    --desc = "",
    --icon = true,
    creature = 9056,
    display = 8704,
    coords = {0.646, 0.576, 2},
    loot = {22223,11841,11842,11839,},
    sections = {
      Spell(8258), -- Devotion Aura
      Spell(15493), -- Holy Light
      Spell(13953), -- Holy Strike
      Spell(11978), -- Kick
      Spell(15346, {flag1 = MAGIC}), -- Seal of Reckoning
    },
  },
  {
    name = "Warder Stilgiss",
    --desc = "",
    --icon = true,
    creature = 9041,
    display = 9089,
    coords = {0.602, 0.668, 2},
    loot = {11782,11783,11784,22241,},
    sections = {
      Spell(6136, {flag1 = MAGIC}), -- Chilled
      Spell(12544, {flag1 = MAGIC}), -- Frost Armor
      Spell(12674, {flag1 = MAGIC}), -- Frost Nova
      Spell(15044, {flag1 = MAGIC}), -- Frost Ward
      Spell(12675, {flag1 = MAGIC}), -- Frostbolt
    },
  },
  {
    name = "Ambassador Flamelash",
    --desc = "",
    --icon = true,
    creature = 9156,
    display = 8329,
    coords = {0.534, 0.494, 2},
    loot = {11812,11809,11814,11832,11808,},
    sections = {
      Spell(14744), -- Burning Spirit
    },
  },
  {
    name = "Magmus",
    --desc = "",
    --icon = true,
    creature = 9938,
    display = 12162,
    coords = {0.810, 0.118, 2},
    loot = {11935,22400,22208,11746,22395,},
    sections = {
      Spell(15668), -- Fiery Burst
      Spell(15593), -- War Stomp
    },
  },
  {
    name = "Princess Moira Bronzebeard",
    --desc = "",
    --icon = true,
    creature = 8929,
    display = 8705,
    coords = {0.932, 0.114, 2},
    loot = {12553,12557,12554,12556,},
    sections = {
      Spell(15586), -- Heal
      Spell(15587), -- Mind Blast
      Spell(8362, {flag1 = MAGIC}), -- Renew
      Spell(15537), -- Shadow Bolt
      Spell(15654, {flag1 = MAGIC}), -- Shadow Word: Pain
    },
  },
  {
    name = "Emperor Dagran Thaurissan",
    --desc = "",
    --icon = true,
    creature = 9019,
    display = 8807,
    coords = {0.934, 0.126, 2},
    loot = {11815,11934,11932,11931,22204,11924,22207,11933,11928,11930,11684,},
    sections = {
      Spell(15636), -- Avatar of Flame
      Spell(17492), -- Hand of Thaurissan
    },
  },
})

table.insert(db, BLACKROCK_DEPTHS)
