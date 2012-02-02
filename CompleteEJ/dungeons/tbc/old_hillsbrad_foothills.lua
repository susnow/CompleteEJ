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

local OLD_HILLSBRAD_FOOTHILLS = CreateInstance({
  name = "Old Hillsbrad Foothills",
  --desc = "",
  --texture = "OldHillsbradFoothills",
  area = 734,
}, {
  {
    name = "Lieutenant Drake",
    desc = "Lieutenant Drake is the first boss inside of Caverns of Time: Old Hillsbrad Foothills. He appears after you've put bombs in all of the barrels inside the internment lodges inside Durnholde Keep.",
    --icon = true,
    creature = 17848,
    display = 17386,
    coords = {0.752, 0.658, 1},
    loot = {{27436,N5},{27423,N5},{27418,N5},{28215,H5},{28213,H5},{27417,N5},{28214,H5},{27420,N5},{28210,H5},{30591,H5},{28211,H5},{28212,H5},{30590,H5},{30589,H5},},
    sections = {
      Spell(33792), -- Exploding Shot
      Spell(29544), -- Frightening Shout
      Spell(33789), -- Frightening Shout
      Spell(9080), -- Hamstring
      Spell(31911), -- Mortal Strike
      Spell(31910), -- Whirlwind
      Spell(31909), -- Whirlwind
    },
  },
  {
    name = "Captain Skarloc",
    desc = "Captain Skarloc is the second boss of Caverns of Time: Old Hillsbrad Foothills. He appears when you've escorted Thrall through the front gate of Durnholde Keep. He drops Recipe: Ironshield Potion, a rare recipe.",
    --icon = true,
    creature = 17862,
    display = 17387,
    coords = {0.693, 0.691, 1},
    loot = {{27427,N5},{27430,N5},{27426,N5},{28218,H5},{28221,H5},{27424,N5},{28217,H5},{27428,N5},{28216,H5},{30591,H5},{28219,H5},{28220,H5},{30590,H5},{30589,H5},},
    sections = {
      Spell(29380), -- Cleanse
      Spell(38385, {fbd = H5}), -- Consecration
      Spell(8258), -- Devotion Aura
      Spell(13005, {flag1 = MAGIC}), -- Hammer of Justice
      Spell(29427), -- Holy Light
      Spell(31904), -- Holy Shield
    },
  },
  {
    name = "Epoch Hunter",
    desc = "Epoch Hunter is a drake boss of the Infinite Dragonflight that attacks the young Thrall and his rescuers inside the Caverns of Time: Old Hillsbrad Foothills. The Epoch Hunter appears after you have escorted Thrall to Tarren Mill and found Taretha inside the inn.",
    --icon = true,
    creature = 18096,
    display = 19135,
    coords = {0.506, 0.318, 1},
    loot = {{27431,N5},24173,{27440,N5},{28223,H5},{27432,N5},{29246,H5},{30534,H5},{27433,N5},{28225,H5},{23572,H5},{29250,H5},{30536,H5},{27904,H5},{28224,H5},{28401,H5},{27434,N5},{28226,H5},{28191,H5},{28233,H5},{27911,H5},{30591,H5},{28227,H5},{28344,H5},{30590,H5},{30589,H5},{28222,H5},},
    sections = {
      Spell(31916), -- Impending Death
      Spell(33834, {flag1 = MAGIC}), -- Magic Disruption Aura
      Spell(31914), -- Sand Breath
      Spell(31475), -- Wing Buffet
    },
  },
})

table.insert(db, OLD_HILLSBRAD_FOOTHILLS)
