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

local SUNKEN_TEMPLE = CreateInstance({
  name = "Sunken Temple",
  desc = "The Temple of Atal'Hakkar, the Sunken Temple, is a shrine erected by the Atal'ai trolls to the Blood God Hakkar the Soulflayer. It is located in the Swamp of Sorrows.",
  --texture = "SunkenTemple",
  area = 687,
  dflag = N5,
}, {
  {
    name = "Jammal'an the Prophet",
    --desc = "",
    --icon = true,
    creature = 5710,
    display = 6708,
    --coords = {x, y, level},
    loot = {10807,10808,10806,},
    sections = {
      Spell(8376), -- Earthgrab Totem
      Spell(12468), -- Flamestrike
      Spell(12492), -- Healing Wave
      Spell(12480, {flag1 = CURSE}), -- Hex of Jammal'an
    },
  },
  {
    name = "Avatar of Hakkar",
    --desc = "",
    --icon = true,
    creature = 8443,
    display = 8053,
    --coords = {x, y, level},
    loot = {},
    sections = {
    },
  },
  {
    name = "Shade of Eranikus",
    --desc = "",
    --icon = true,
    creature = 5709,
    display = 7806,
    coords = {0.672, 0.874, 1},
    loot = {10829,10833,10837,10828,10835,10836,10847,},
    sections = {
      Spell(12891), -- Acid Breath
      Spell(12890, {flag1 = MAGIC}), -- Deep Slumber
      Spell(3391), -- Thrash
      Spell(11876), -- War Stomp
    },
  },
})

table.insert(db, SUNKEN_TEMPLE)
