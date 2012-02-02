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

local UTGARDE_PINNACLE = CreateInstance({
  name = "Utgarde Pinnacle",
  desc = "Utgarde Keep is the first dungeon hub located on the shores of Lake Cauldros in the Howling Fjord of Northrend. Inhabited by the vrykul (led by King Ymiron), a half-giant Viking-like race bent on proving their strength to the Lich King, they are raising the most worthy of their warriors to serve him at the main base of operations. Utgarde Pinnacle is the second and highest level 5 man wing located within Utgarde Keep.",
  --texture = "UtgardePinnacle",
  area = 524,
}, {
  {
    name = "Svala Sorrowgrave",
    desc = "Svala Sorrowgrave is the first boss in Utgarde Pinnacle. She is killed and afterwards turned into a Val'kyr. She is related to the achievement The Incredible Hulk.",
    --icon = true,
    creature = 26668,
    display = 26096,
    coords = {0.476, 0.726, 2},
    loot = {{37368,H5},{37037,N5},{37369,H5},{37038,N5},{37367,H5},{37370,H5},{37040,N5},{37043,N5},},
    sections = {
      Spell(48258), -- Call Flames
      Spell(48267), -- Ritual Preparation
      Spell(48277), -- Ritual Strike
      Spell(59930), -- Ritual Strike
      Spell(48276), -- Ritual of the Sword
      Spell(59409, {fbd = H5}), -- Sinister Strike
      Spell(15667, {fbd = N5}), -- Sinister Strike
    },
  },
  {
    name = "Gortok Palehoof",
    desc = "Gortok Palehoof is the second boss in Utgarde Pinnacle. The giant magnataur will become active once the four minibosses in the preceding arena event have been defeated.",
    --icon = true,
    creature = 26687,
    display = 27419,
    coords = {0.610, 0.696, 2},
    loot = {{37373,H5},{37051,N5},{37376,H5},{37052,N5},{37371,H5},{37374,H5},{37050,N5},{37048,N5},},
    sections = {
      Spell(48260), -- Arcing Smash
      Spell(59268, {fbd = H5}), -- Impale
      Spell(48261, {fbd = N5}), -- Impale
      Spell(48256, {fbd = N5}), -- Withering Roar
      Spell(59267, {fbd = H5}), -- Withering Roar
    },
  },
  {
    name = "Skadi the Ruthless",
    desc = "Skadi the Ruthless is the third boss in Utgarde Pinnacle. The vrykul and his mount, Grauf, will fight adventurers in a gauntlet event. Players enjoy returning to solo this encounter for Reins of the Blue Proto-Drake on heroic. Skadi is also related to the achievements My Girl Loves to Skadi All the Time and Lodi Dodi We Loves the Skadi.",
    --icon = true,
    creature = 26693,
    display = 27418,
    coords = {0.688, 0.366, 2},
    loot = {{37384,H5},{44151,H5},{37379,H5},{37055,N5},{37057,N5},{37377,H5},{37053,N5},{37389,H5},{37056,N5},},
    sections = {
      Spell(59330, {fbd = H5}), -- Crush
      Spell(50234, {fbd = N5}), -- Crush
      Spell(59331, {fbd = H5}), -- Poisoned Spear
      Spell(50255, {fbd = N5}), -- Poisoned Spear
      Spell(59322, {fbd = H5}), -- Whirlwind
      Spell(50228, {fbd = N5}), -- Whirlwind
    },
  },
  {
    name = "King Ymiron",
    desc = "King Ymiron is the fourth and last boss in Utgarde Pinnacle. He is related to the achievement King's Bane.",
    --icon = true,
    creature = 26861,
    display = 28019,
    coords = {0.406, 0.534, 2},
    loot = {{37401,H5},{37065,N5},{37408,H5},{37390,H5},{37062,N5},{37397,H5},{37395,H5},{37407,H5},{37067,N5},{43102,H5},{37398,H5},41797,{37060,N5},{37409,H5},{37066,N5},{37064,N5},{37061,N5},{37058,N5},},
    sections = {
      Spell(59301, {fbd = H5, flag1 = MAGIC}), -- Bane
      Spell(48294, {flag1 = MAGIC}), -- Bane
      Spell(48292), -- Dark Slash
      Spell(59300, {fbd = H5, flag1 = DISEASE}), -- Fetid Rot
      Spell(48291, {flag1 = DISEASE}), -- Fetid Rot
      Spell(51750), -- Screams of the Dead
      Spell(48529, {fbd = N5}), -- Spirit Burst
      Spell(59305, {fbd = H5}), -- Spirit Burst
      Spell(59304, {fbd = H5}), -- Spirit Strike
      Spell(48423, {fbd = N5}), -- Spirit Strike
    },
  },
  {
    name = "King Ymiron",
    desc = "King Ymiron is the fourth and last boss in Utgarde Pinnacle. He is related to the achievement King's Bane.",
    --icon = true,
    creature = 26861,
    display = 28019,
    coords = {0.406, 0.534, 2},
    loot = {{37401,H5},{37065,N5},{37408,H5},{37390,H5},{37062,N5},{37397,H5},{37395,H5},{37407,H5},{37067,N5},{43102,H5},{37398,H5},41797,{37060,N5},{37409,H5},{37066,N5},{37064,N5},{37061,N5},{37058,N5},},
    sections = {
      Spell(59301, {fbd = H5, flag1 = MAGIC}), -- Bane
      Spell(48294, {flag1 = MAGIC}), -- Bane
      Spell(48292), -- Dark Slash
      Spell(59300, {fbd = H5, flag1 = DISEASE}), -- Fetid Rot
      Spell(48291, {flag1 = DISEASE}), -- Fetid Rot
      Spell(51750), -- Screams of the Dead
      Spell(48529, {fbd = N5}), -- Spirit Burst
      Spell(59305, {fbd = H5}), -- Spirit Burst
      Spell(59304, {fbd = H5}), -- Spirit Strike
      Spell(48423, {fbd = N5}), -- Spirit Strike
    },
  },
})

table.insert(db, UTGARDE_PINNACLE)
