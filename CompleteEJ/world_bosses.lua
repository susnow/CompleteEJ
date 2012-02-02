local _, db = ...
local db, CreateInstance, Stage, Spell = db[2], db.CreateInstance, db.Stage, db.Spell

local VANILLA = 1
local TBC = 2
local WOTLK = 3
local WORLD = 4

local N5, H5 = 1, 2
local N10, N25 = 1, 2
local H10, H25 = 3, 4
local RF = 5

local PHASE = 0
local CREATURE = 1
local ABILITY = 2

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

local Abyssal_Depths = CreateInstance({
  name = "Abyssal Depths World Boss",
  desc = "Located just east of blash Abyssl Depths is the starting zone for blah, here you will find Mobus, a shark world boss. ",
  --texture = "Abyssal_depths",
  area = 65145,
}, {
  {
    name = "Mobus <The Crushing Tide>",
    desc = "Mobus is a large shark.",
    --icon = true,
    creature = 50009,
    display = 31761,
    --coords = {x, y, level},
    loot = {69843,N25},
    sections = {
      Spell(61757), -- Blade Tempest
      Spell(79539), -- Cleave
      Spell(93490), -- Enervating Brand
      
    },
  },
  {
 
table.insert(db, ABYSSAL_DEPTHS)   
table.insert(db, THE_RUBY_SANCTUM)
table.insert(db, ICECROWN_CITADEL)
table.insert(db, VAULT_OF_ARCHAVON)
table.insert(db, ONYXIAS_LAIR)
table.insert(db, TRIAL_OF_THE_CRUSADER)
table.insert(db, THE_OBSIDIAN_SANCTUM)
table.insert(db, ULDUAR)
table.insert(db, NAXXRAMAS)
