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

local ONYXIAS_LAIR = CreateInstance({
  name = "奥妮克希亚的巢穴",
  desc = "奥妮克希亚的巢穴是位于尘泥沼泽南部的一个小型洞穴.是奥妮克希亚的栖息地和孵化龙蛋的场所.在3.0.2之前,该副本需要携带龙火护符才能进入,在3.0.2之后移除了这个限制.在3.2.2之后,奥妮克希亚的巢穴被调整为80级团队副本",
  --texture = "OnyxiasLair",
  area = 718,
}, {
  {
    name = "奥妮克希亚",
    desc = "奥妮克希亚是盘踞在奥妮克希亚的巢穴中的一条雌性黑龙",
    --icon = true,
    creature = 10184,
    display = 8570,
    coords = {0.676, 0.410, 1},
    loot = {{49475,N25},{49489,N25},{49474,N25},{49321,N10},{49470,N25},{49318,N10},{49315,N10},{49319,N10},{49297,N10},{49332,N10},{49320,N10},{49317,N10},{49316,N10},{49309,N10},{49322,N10},{49333,N10},{49296,N10},{49306,N10},{49298,N10},{49464,N25},{49304,N10},{49305,N10},{49302,N10},{49303,N10},{49307,N10},{49437,N10},{49324,N10},{49493,N25},{49310,N10},{49330,N10},{49326,N10},{49299,N10},{49329,N10},{49327,N10},{49328,N10},{49501,N25},{49308,N10},{49331,N10},{49490,N25},{49463,N10},{49499,N25},{49323,N10},{49472,N25},{49491,N25},{49492,N25},{49500,N25},{49476,N25},{49468,N25},{49496,N25},{49465,N25},{49471,N25},{49325,N10},{49294,N10},{49294,N25},{49469,N25},{49466,N25},{49479,N25},{49478,N25},{49480,N25},{49483,N25},{49467,N25},{49477,N25},{49495,N25},{49482,N25},{49481,N25},{49494,N25},{49643,N10},{49643,N25},{49484,N25},{49498,N25},{49644,N10},{49644,N25},{49295,N10},{49295,N25},},
    sections = {
      Spell(18431, {fbd = N10}), -- Bellowing Roar
      Spell(18431, {fbd = N25}), -- Bellowing Roar
      Spell(18617, {fbd = N10}), -- Breath
      Spell(18617, {fbd = N25}), -- Breath
      Spell(18351, {fbd = N10}), -- Breath
      Spell(18351, {fbd = N25}), -- Breath
      Spell(18576, {fbd = N10}), -- Breath
      Spell(18576, {fbd = N25}), -- Breath
      Spell(17086, {fbd = N10}), -- Breath
      Spell(17086, {fbd = N25}), -- Breath
      Spell(18564, {fbd = N10}), -- Breath
      Spell(18564, {fbd = N25}), -- Breath
      Spell(18584, {fbd = N10}), -- Breath
      Spell(18584, {fbd = N25}), -- Breath
      Spell(18596, {fbd = N10}), -- Breath
      Spell(18596, {fbd = N25}), -- Breath
      Spell(21131, {fbd = N10}), -- Breath
      Spell(21131, {fbd = N25}), -- Breath
      Spell(18609, {fbd = N10}), -- Breath
      Spell(18609, {fbd = N25}), -- Breath
      Spell(68868, {fbd = N10}), -- Cleave
      Spell(68868, {fbd = N25}), -- Cleave
      Spell(18392, {fbd = N10}), -- Fireball
      Spell(68926, {fbd = N25}), -- Fireball
      Spell(18435, {fbd = N10}), -- Flame Breath
      Spell(68970, {fbd = N25}), -- Flame Breath
      Spell(22199, {fbd = N10}), -- Heated Ground
      Spell(22199, {fbd = N25}), -- Heated Ground
      Spell(22192, {fbd = N25}), -- Heated Ground
      Spell(22194, {fbd = N25}), -- Heated Ground
      Spell(22193, {fbd = N25}), -- Heated Ground
      Spell(22202, {fbd = N10}), -- Heated Ground
      Spell(22202, {fbd = N25}), -- Heated Ground
      Spell(22201, {fbd = N10}), -- Heated Ground
      Spell(22201, {fbd = N25}), -- Heated Ground
      Spell(22200, {fbd = N10}), -- Heated Ground
      Spell(22200, {fbd = N25}), -- Heated Ground
      Spell(22191, {fbd = N10}), -- Heated Ground
      Spell(22191, {fbd = N25}), -- Heated Ground
      Spell(68867, {fbd = N10}), -- Tail Sweep
      Spell(69286, {fbd = N25}), -- Tail Sweep
      Spell(69293, {fbd = N25}), -- Wing Buffet
      Spell(18500, {fbd = N10}), -- Wing Buffet
    },
  },
  -- {
    -- name = "Onyxia",
    -- desc = "Onyxia is the current broodmother of the Black Dragonflight on Azeroth and resides within Onyxia's Lair.",
    --icon = true,
    -- creature = 10184,
    -- display = 8570,
    -- coords = {0.676, 0.410, 1},
    -- loot = {{49475,N25},{49489,N25},{49474,N25},{49321,N10},{49470,N25},{49318,N10},{49315,N10},{49319,N10},{49297,N10},{49332,N10},{49320,N10},{49317,N10},{49316,N10},{49309,N10},{49322,N10},{49333,N10},{49296,N10},{49306,N10},{49298,N10},{49464,N25},{49304,N10},{49305,N10},{49302,N10},{49303,N10},{49307,N10},{49437,N10},{49324,N10},{49493,N25},{49310,N10},{49330,N10},{49326,N10},{49299,N10},{49329,N10},{49327,N10},{49328,N10},{49501,N25},{49308,N10},{49331,N10},{49490,N25},{49463,N10},{49499,N25},{49323,N10},{49472,N25},{49491,N25},{49492,N25},{49500,N25},{49476,N25},{49468,N25},{49496,N25},{49465,N25},{49471,N25},{49325,N10},{49294,N10},{49294,N25},{49469,N25},{49466,N25},{49479,N25},{49478,N25},{49480,N25},{49483,N25},{49467,N25},{49477,N25},{49495,N25},{49482,N25},{49481,N25},{49494,N25},{49643,N10},{49643,N25},{49484,N25},{49498,N25},{49644,N10},{49644,N25},{49295,N10},{49295,N25},},
    -- sections = {
      -- Spell(18431, {fbd = N10}), -- Bellowing Roar
      -- Spell(18431, {fbd = N25}), -- Bellowing Roar
      -- Spell(18617, {fbd = N10}), -- Breath
      -- Spell(18617, {fbd = N25}), -- Breath
      -- Spell(18351, {fbd = N10}), -- Breath
      -- Spell(18351, {fbd = N25}), -- Breath
      -- Spell(18576, {fbd = N10}), -- Breath
      -- Spell(18576, {fbd = N25}), -- Breath
      -- Spell(17086, {fbd = N10}), -- Breath
      -- Spell(17086, {fbd = N25}), -- Breath
      -- Spell(18564, {fbd = N10}), -- Breath
      -- Spell(18564, {fbd = N25}), -- Breath
      -- Spell(18584, {fbd = N10}), -- Breath
      -- Spell(18584, {fbd = N25}), -- Breath
      -- Spell(18596, {fbd = N10}), -- Breath
      -- Spell(18596, {fbd = N25}), -- Breath
      -- Spell(21131, {fbd = N10}), -- Breath
      -- Spell(21131, {fbd = N25}), -- Breath
      -- Spell(18609, {fbd = N10}), -- Breath
      -- Spell(18609, {fbd = N25}), -- Breath
      -- Spell(68868, {fbd = N10}), -- Cleave
      -- Spell(68868, {fbd = N25}), -- Cleave
      -- Spell(18392, {fbd = N10}), -- Fireball
      -- Spell(68926, {fbd = N25}), -- Fireball
      -- Spell(18435, {fbd = N10}), -- Flame Breath
      -- Spell(68970, {fbd = N25}), -- Flame Breath
      -- Spell(22199, {fbd = N10}), -- Heated Ground
      -- Spell(22199, {fbd = N25}), -- Heated Ground
      -- Spell(22192, {fbd = N25}), -- Heated Ground
      -- Spell(22194, {fbd = N25}), -- Heated Ground
      -- Spell(22193, {fbd = N25}), -- Heated Ground
      -- Spell(22202, {fbd = N10}), -- Heated Ground
      -- Spell(22202, {fbd = N25}), -- Heated Ground
      -- Spell(22201, {fbd = N10}), -- Heated Ground
      -- Spell(22201, {fbd = N25}), -- Heated Ground
      -- Spell(22200, {fbd = N10}), -- Heated Ground
      -- Spell(22200, {fbd = N25}), -- Heated Ground
      -- Spell(22191, {fbd = N10}), -- Heated Ground
      -- Spell(22191, {fbd = N25}), -- Heated Ground
      -- Spell(68867, {fbd = N10}), -- Tail Sweep
      -- Spell(69286, {fbd = N25}), -- Tail Sweep
      -- Spell(69293, {fbd = N25}), -- Wing Buffet
      -- Spell(18500, {fbd = N10}), -- Wing Buffet
    -- },
  -- },
  -- {
    -- name = "Lady Katrana Prestor",
    --desc = "",
    --icon = true,
    -- creature = 1749,
    -- display = Array,
    --coords = {x, y, level},
    -- loot = {},
    -- sections = {
    -- },
  -- },
})

table.insert(db, ONYXIAS_LAIR)
