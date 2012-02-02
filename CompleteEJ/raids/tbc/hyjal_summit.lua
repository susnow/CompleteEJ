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

local HYJAL_SUMMIT = CreateInstance({
  name = "Hyjal Summit",
  desc = "Hyjal is the site of Nordrassil, the first World Tree. It's brought back through the Caverns of Time so that players can relive the major event of Warcraft history. The battle of Mount Hyjal takes place at the denouement of Warcraft III: Reign of Chaos, the seventh chapter of the Night Elf campaign, Twilight of the Gods. Archimonde advances the mountain just as he will in the raid instance, along with his lieutenants, Kaz'rogal the Doom Lord, Azgalor the Pit Lord, Rage Winterchill the Lich, and Anetheron the Dreadlord. Kaz'rogal is not present in the Warcraft III campaign mission.",
  --texture = "HyjalSummit",
  area = 775,
}, {
  {
    name = "Rage Winterchill",
    desc = "Rage Winterchill was a Lich employed by the Burning Legion during the Battle of Mount Hyjal. He is the first boss of Hyjal Summit.",
    --icon = true,
    creature = 17767,
    display = 17444,
    coords = {0.078, 0.694, 1},
    loot = {32297,30863,30873,30871,30870,30862,32295,30865,32307,},
    sections = {
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(31257, {fbd = N10, flag1 = MAGIC}), -- Chilled
      Spell(31258, {fbd = N10}), -- Death & Decay
      Spell(31256, {fbd = N10}), -- Frost Armor
      Spell(31250, {fbd = N10, flag1 = MAGIC}), -- Frost Nova
      Spell(31249, {fbd = N10}), -- Icebolt
    },
  },
  {
    name = "Anetheron",
    desc = "Anetheron, a powerful dreadlord, is the second boss of Hyjal Summit.",
    --icon = true,
    creature = 17808,
    display = 21069,
    coords = {0.006, 0.740, 1},
    loot = {32298,30886,30880,30882,30888,30874,32297,30884,32289,},
    sections = {
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(31306, {fbd = N10}), -- Carrion Swarm
      Spell(31299, {fbd = N10}), -- Inferno
      Spell(31298, {fbd = N10}), -- Sleep
      Spell(38196, {fbd = N10}), -- Vampiric Aura
    },
  },
  {
    name = "Kaz'rogal",
    desc = "Kaz'rogal, a doomguard, is the third boss of Hyjal Summit.",
    --icon = true,
    creature = 17888,
    display = 17886,
    --coords = {x, y, level},
    loot = {32298,30918,30892,30894,30916,30917,32285,30895,32289,},
    sections = {
      Spell(31477, {fbd = N10}), -- Cripple
      Spell(31436, {fbd = N10}), -- Malevolent Cleave
      Spell(31447, {fbd = N10}), -- Mark of Kaz'rogal
      Spell(31480, {fbd = N10}), -- War Stomp
    },
  },
  {
    name = "Azgalor",
    desc = "Azgalor was once the lieutenant to the mighty demon-king Mannoroth. He is the fourth boss in Hyjal Summit.",
    --icon = true,
    creature = 17842,
    display = 18526,
    coords = {0.428, 0.360, 1},
    loot = {32295,30901,31092,31093,30900,32285,30897,32297,},
    sections = {
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(31345, {fbd = N10}), -- Cleave
      Spell(31347, {fbd = N10}), -- Doom
      Spell(31344, {fbd = N10}), -- Howl of Azgalor
      Spell(31340, {fbd = N10}), -- Rain of Fire
    },
  },
  {
    name = "Archimonde",
    desc = "Archimonde the Defiler was the left hand of the fallen titan, Sargeras. He is the fifth and final boss in Hyjal Summit.",
    --icon = true,
    creature = 17968,
    display = 20939,
    --coords = {x, y, level},
    loot = {30905,31097,31096,30910,32295,30907,30906,30911,32285,30904,32307,},
    sections = {
      Spell(32014, {fbd = N10}), -- Air Burst
      Spell(31970, {fbd = N10, flag1 = MAGIC}), -- Fear
      Spell(39369, {fbd = N10}), -- Finger of Death
      Spell(31984, {fbd = N10}), -- Finger of Death
      Spell(32111, {fbd = N10}), -- Finger of Death
      Spell(31972, {fbd = N10, flag1 = CURSE}), -- Grip of the Legion
      Spell(35354, {fbd = N10}), -- Hand of Death
      Spell(32054, {fbd = N10}), -- Soul Charge
      Spell(32057, {fbd = N10}), -- Soul Charge
      Spell(32053, {fbd = N10}), -- Soul Charge
    },
  },
})

table.insert(db, HYJAL_SUMMIT)
