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

local BLACKROCK_SPIRE = CreateInstance({
  name = "Blackrock Spire",
  desc = "Blackrock Spire (BRS) is a dungeon at the upper part of Blackrock Mountain, inhabited by members of the Dark Horde such as orcs, forest trolls, and ogres, as well as their new allies, the Black Dragonflight, led by the son of Deathwing--Nefarian. It consists of two five-player dungeons: Lower Blackrock Spire (LBRS) and Upper Blackrock Spire (UBRS).",
  --texture = "BlackrockSpire",
  area = 721,
  dflag = N5,
}, {
  {
    name = "Highlord Omokk",
    --desc = "",
    --icon = true,
    creature = 9196,
    display = 11565,
    --coords = {x, y, level},
    loot = {13167,13169,13170,},
    sections = {
      Spell(8269), -- Frenzy
      Spell(10101), -- Knock Away
    },
  },
  {
    name = "Shadow Hunter Vosh'gajin",
    --desc = "",
    --icon = true,
    creature = 9236,
    display = 9732,
    --coords = {x, y, level},
    loot = {12626,12653,},
    sections = {
      Spell(16098, {flag1 = CURSE}), -- Curse of Blood
      Spell(16097, {flag1 = MAGIC}), -- Hex
    },
  },
  {
    name = "War Master Voone",
    --desc = "",
    --icon = true,
    creature = 9237,
    display = 28281,
    --coords = {x, y, level},
    loot = {28972,13177,},
    sections = {
      Spell(15284), -- Cleave
      Spell(16856), -- Mortal Strike
      Spell(15615), -- Pummel
      Spell(15618), -- Snap Kick
      Spell(3391), -- Thrash
      Spell(16075), -- Throw Axe
      Spell(10966), -- Uppercut
    },
  },
  {
    name = "Mother Smolderweb",
    --desc = "",
    --icon = true,
    creature = 10596,
    display = 9929,
    --coords = {x, y, level},
    loot = {13213,13183,},
    sections = {
      Spell(16104, {flag1 = MAGIC}), -- Crystallize
      Spell(16468, {flag1 = POISON}), -- Mother's Milk
      Spell(16103), -- Summon Spire Spiderling
    },
  },
  {
    name = "Urok Doomhowl",
    --desc = "",
    --icon = true,
    creature = 10584,
    display = 11583,
    --coords = {x, y, level},
    loot = {13259,22232,},
    sections = {
      Spell(16508), -- Intimidating Roar
      Spell(16509), -- Rend
      Spell(15580), -- Strike
    },
  },
  {
    name = "Quartermaster Zigris",
    --desc = "",
    --icon = true,
    creature = 9736,
    display = 9738,
    --coords = {x, y, level},
    loot = {12264,13252,},
    sections = {
      Spell(15504), -- Drink Healing Potion
      Spell(15609), -- Hooked Net
      Spell(59146), -- Shoot
      Spell(16497), -- Stun Bomb
    },
  },
  {
    name = "Gizrul the Slavener",
    --desc = "",
    --icon = true,
    creature = 10268,
    display = 9564,
    --coords = {x, y, level},
    loot = {13206,13205,},
    sections = {
      Spell(16495), -- Fatal Bite
      Spell(8269), -- Frenzy
      Spell(16128, {flag1 = DISEASE}), -- Infected Bite
    },
  },
  {
    name = "Halycon",
    --desc = "",
    --icon = true,
    creature = 10220,
    display = 9567,
    --coords = {x, y, level},
    loot = {13211,22313,},
    sections = {
      Spell(13738), -- Rend
      Spell(3391), -- Thrash
    },
  },
  {
    name = "Overlord Wyrmthalak",
    --desc = "",
    --icon = true,
    creature = 9568,
    display = 8711,
    --coords = {x, y, level},
    loot = {13163,13161,},
    sections = {
      Spell(15284), -- Cleave
      Spell(16244), -- Demoralizing Shout
      Spell(12887), -- Sweeping Slam
    },
  },
  {
    name = "Pyroguard Emberseer",
    --desc = "",
    --icon = true,
    creature = 9816,
    display = 2172,
    --coords = {x, y, level},
    loot = {12926,12929,},
    sections = {
      Spell(16079), -- Fire Nova
      Spell(16536, {flag1 = MAGIC}), -- Flame Buffet
    },
  },
  {
    name = "Warchief Rend Blackhand",
    --desc = "",
    --icon = true,
    creature = 10429,
    display = 9778,
    --coords = {x, y, level},
    loot = {12936,18102,12583,18103,12939,12587,12590,},
    sections = {
      Spell(15284), -- Cleave
      Spell(8269), -- Frenzy
      Spell(16856), -- Mortal Strike
      Spell(13736), -- Whirlwind
      Spell(15589), -- Whirlwind
    },
  },
  {
    name = "Gyth",
    --desc = "",
    --icon = true,
    creature = 10339,
    display = 9806,
    --coords = {x, y, level},
    loot = {12953,22225,12871,},
    sections = {
      Spell(16359), -- Corrosive Acid Breath
      Spell(16390), -- Flame Breath
      Spell(16350, {flag1 = MAGIC}), -- Freeze
      Spell(10101), -- Knock Away
      Spell(16328), -- Summon Rend Blackhand
    },
  },
  {
    name = "The Beast",
    --desc = "",
    --icon = true,
    creature = 10430,
    display = 10193,
    --coords = {x, y, level},
    loot = {12968,12967,12965,12969,},
    sections = {
      Spell(16636), -- Berserker Charge
      Spell(16144), -- Fire Blast
      Spell(16788), -- Fireball
      Spell(16785), -- Flamebreak
      Spell(15570, {flag1 = MAGIC}), -- Immolate
      Spell(20477), -- Summon Player
      Spell(14100), -- Terrifying Roar
    },
  },
  {
    name = "General Drakkisath",
    --desc = "",
    --icon = true,
    creature = 10363,
    display = 10115,
    --coords = {x, y, level},
    loot = {13141,15730,22253,12602,13142,12592,},
    sections = {
      Spell(15284), -- Cleave
      Spell(16805), -- Conflagration
      Spell(16419), -- Flamestrike
      Spell(6016), -- Pierce Armor
      Spell(16789), -- Rage
    },
  },
})

table.insert(db, BLACKROCK_SPIRE)
