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

local THE_VIOLET_HOLD = CreateInstance({
  name = "The Violet Hold",
  desc = "Beneath the floating city of Dalaran is the 5 man dungeon The Violet Hold. Kirin Tor prison guards are fending off invaders of the blue dragonflight who, under orders from Malygos, are using magical portals to enter the hold.",
  --texture = "TheVioletHold",
  area = 536,
}, {
  {
    name = "Erekem",
    --desc = "",
    --icon = true,
    creature = 29315,
    display = 27488,
    coords = {0.286, 0.620, 1},
    loot = {{43363,N5},{43407,H5},{43375,N5},{43406,H5},{43405,H5},},
    sections = {
      Spell(54516, {flag1 = MAGIC}), -- Bloodlust
      Spell(59463, {fbd = H5}), -- Break Bonds
      Spell(54481, {fbd = N5}), -- Chain Heal
      Spell(59473, {fbd = H5}), -- Chain Heal
      Spell(59471, {fbd = H5, flag1 = MAGIC}), -- Earth Shield
      Spell(54479, {fbd = N5, flag1 = MAGIC}), -- Earth Shield
      Spell(54511), -- Earth Shock
      Spell(53044), -- Lightning Bolt
      Spell(32910), -- Windfury
    },
  },
  {
    name = "Moragg",
    --desc = "",
    --icon = true,
    creature = 29316,
    display = 20590,
    coords = {0.660, 0.544, 1},
    loot = {{43387,N5},{43408,H5},{43382,N5},{43409,H5},{43410,H5},},
    sections = {
      Spell(54527), -- Corrosive Saliva
      Spell(54396), -- Optic Link
      Spell(59525, {fbd = H5}), -- Ray of Pain
      Spell(54417), -- Ray of Suffering
    },
  },
  {
    name = "Ichoron",
    --desc = "",
    --icon = true,
    creature = 29313,
    display = 27487,
    coords = {0.504, 0.482, 1},
    loot = {{35647,N5},{43401,H5},{35643,N5},{37862,H5},{37869,H5},},
    sections = {
      Spell(59820), -- Drained
      Spell(59522, {fbd = H5}), -- Frenzy
      Spell(54312, {fbd = N5}), -- Frenzy
      Spell(54306), -- Protective Bubble
      Spell(59520, {fbd = H5}), -- Water Blast
      Spell(54237, {fbd = N5}), -- Water Blast
      Spell(54241, {fbd = N5}), -- Water Bolt Volley
      Spell(59521, {fbd = H5}), -- Water Bolt Volley
    },
  },
  {
    name = "Xevozz",
    --desc = "",
    --icon = true,
    creature = 29266,
    display = 27486,
    coords = {0.330, 0.496, 1},
    loot = {{35642,N5},{37867,H5},{35644,N5},{37861,H5},{37868,H5},},
    sections = {
      Spell(59483, {fbd = H5}), -- Arcane Barrage Volley
      Spell(54202, {fbd = N5}), -- Arcane Barrage Volley
      Spell(59485, {fbd = H5, flag1 = MAGIC}), -- Arcane Buffet
      Spell(54226, {fbd = N5, flag1 = MAGIC}), -- Arcane Buffet
      Spell(54137), -- Summon Ethereal Sphere
      Spell(61339, {fbd = H5}), -- Summon Ethereal Sphere
      Spell(61337, {fbd = H5}), -- Summon Ethereal Sphere
      Spell(61338, {fbd = H5}), -- Summon Ethereal Sphere
      Spell(54138), -- Summon Ethereal Sphere
      Spell(54102), -- Summon Ethereal Sphere
    },
  },
  {
    name = "Lavanthor",
    --desc = "",
    --icon = true,
    creature = 29312,
    display = 10193,
    coords = {0.602, 0.690, 1},
    loot = {{35645,N5},{37870,H5},{35646,N5},{37872,H5},{37871,H5},},
    sections = {
      Spell(59466, {fbd = H5}), -- Cauterizing Flames
      Spell(54235, {fbd = N5}), -- Firebolt
      Spell(59468, {fbd = H5}), -- Firebolt
      Spell(54282, {fbd = N5}), -- Flame Breath
      Spell(59469, {fbd = H5}), -- Flame Breath
      Spell(54251, {fbd = N5, flag1 = MAGIC}), -- Lava Burn
      Spell(59470, {fbd = H5, flag1 = MAGIC}), -- Lava Burn
      Spell(54249, {fbd = H5}), -- Lava Burn
      Spell(59594, {fbd = N5}), -- Lava Burn
    },
  },
  {
    name = "Zuramat the Obliterator",
    --desc = "",
    --icon = true,
    creature = 29314,
    display = 27855,
    coords = {0.268, 0.324, 1},
    loot = {{43353,N5},{43402,H5},{43358,N5},{43403,H5},{43404,H5},},
    sections = {
      Spell(54525, {fbd = N5, flag1 = MAGIC}), -- Shroud of Darkness
      Spell(54524, {fbd = N5, flag1 = MAGIC}), -- Shroud of Darkness
      Spell(59746, {fbd = H5, flag1 = MAGIC}), -- Shroud of Darkness
      Spell(59745, {fbd = H5, flag1 = MAGIC}), -- Shroud of Darkness
      Spell(54369), -- Summon Void Sentry
      Spell(54361, {fbd = N5}), -- Void Shift
      Spell(59743, {fbd = H5}), -- Void Shift
    },
  },
  {
    name = "Cyanigosa",
    --desc = "",
    --icon = true,
    creature = 31134,
    display = 27508,
    coords = {0.456, 0.618, 1},
    loot = {{35650,N5},{35649,N5},{37876,H5},{35651,N5},{37874,H5},{43102,H5},{37886,H5},{37883,H5},{37875,H5},{37873,H5},{43500,H5},{37884,H5},},
    sections = {
      Spell(58694), -- Arcane Vacuum
      Spell(59369, {fbd = H5}), -- Blizzard
      Spell(58693, {fbd = N5}), -- Blizzard
      Spell(59374, {fbd = H5, flag1 = MAGIC}), -- Mana Destruction
      Spell(59283, {fbd = H5}), -- Tail Sweep
      Spell(58690, {fbd = N5}), -- Tail Sweep
      Spell(59281, {fbd = H5, flag1 = MAGIC}), -- Uncontrollable Energy
      Spell(58688, {fbd = N5, flag1 = MAGIC}), -- Uncontrollable Energy
    },
  },
})

table.insert(db, THE_VIOLET_HOLD)
