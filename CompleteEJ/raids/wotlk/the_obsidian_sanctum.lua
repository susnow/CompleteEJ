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

local THE_OBSIDIAN_SANCTUM = CreateInstance({
  name = "黑曜石圣殿",
  --desc = "",
  --texture = "TheObsidianSanctum",
  area = 531,
}, {
  {
    name = "特尼伯隆",
    desc = "特尼伯隆(暮光大军),是萨塔里奥在黑曜石圣殿的中尉.尽管她对萨塔里奥极度不满,但却仍然服从他的命令",
    --icon = true,
    creature = 30452,
    display = 27082,
    --coords = {x, y, level},
    loot = {},
    sections = {
      Spell(58793, {fbd = N10}), -- Hatch Eggs
      Spell(58793, {fbd = N25}), -- Hatch Eggs
      Spell(58542, {fbd = N10}), -- Hatch Eggs
      Spell(59189, {fbd = N25}), -- Hatch Eggs
      Spell(61248, {fbd = N10}), -- Power of Tenebron
      Spell(61248, {fbd = N25}), -- Power of Tenebron
      Spell(59126, {fbd = N25}), -- Shadow Breath
      Spell(57570, {fbd = N10}), -- Shadow Breath
      Spell(57570, {fbd = N25}), -- Shadow Breath
      Spell(57579, {fbd = N10}), -- Shadow Fissure
      Spell(57579, {fbd = N25}), -- Shadow Fissure
      Spell(59127, {fbd = N25}), -- Shadow Fissure
      Spell(60639, {fbd = N10}), -- Twilight Revenge
      Spell(60639, {fbd = N25}), -- Twilight Revenge
    },
  },
  {
    name = "沙德隆",
    desc = "沙德隆(暮光之赐),是黑曜石圣殿的少尉,服从于萨塔里奥的命令",
    --icon = true,
    creature = 30451,
    display = 27421,
    --coords = {x, y, level},
    loot = {},
    sections = {
      Spell(58105, {fbd = N10}), -- Power of Shadron
      Spell(58105, {fbd = N25}), -- Power of Shadron
      Spell(57570, {fbd = N10}), -- Shadow Breath
      Spell(59126, {fbd = N25}), -- Shadow Breath
      Spell(59127, {fbd = N25}), -- Shadow Fissure
      Spell(57579, {fbd = N10}), -- Shadow Fissure
      Spell(60639, {fbd = N10}), -- Twilight Revenge
      Spell(60639, {fbd = N25}), -- Twilight Revenge
    },
  },
  {
    name = "维斯帕隆",
    desc = "维斯帕隆(暮光洪流),是黑曜石圣殿的第三名中尉,服从于萨塔里奥的命令",
    --icon = true,
    creature = 30449,
    display = 27039,
    --coords = {x, y, level},
    loot = {},
    sections = {
      Spell(61251, {fbd = N10}), -- Power of Vesperon
      Spell(61251, {fbd = N25}), -- Power of Vesperon
      Spell(59126, {fbd = N25}), -- Shadow Breath
      Spell(57570, {fbd = N10}), -- Shadow Breath
      Spell(59127, {fbd = N25}), -- Shadow Fissure
      Spell(57579, {fbd = N10}), -- Shadow Fissure
      Spell(60639, {fbd = N10}), -- Twilight Revenge
      Spell(60639, {fbd = N25}), -- Twilight Revenge
    },
  },
  {
    name = "萨塔里奥",
    desc = "萨塔里奥是黑龙军团的成员,职责是在看守在黑曜石圣殿孵化的黑龙蛋.黑曜石圣殿同时也是黑龙军团的密谋会晤场所",
    --icon = true,
    creature = 28860,
    display = 27035,
    coords = {0.516, 0.480, 1},
    loot = {{40455,N25},{40428,N10},{43995,N10},{43994,N10},{40429,N10},{44007,N25},{40446,N25},{43993,N10},{43998,N10},{40437,N25},{44005,N25},{43989,N10},{43988,N10},{40431,N25},{40432,N25},{40613,N10},{40430,N10},{43986,N10},{40427,N10},{40615,N10},{40614,N10},{43347,N10},{40426,N10},{43996,N10},{43992,N10},{40451,N25},{43991,N10},{44008,N25},{44006,N25},{40433,N25},{40438,N25},{44011,N25},{43990,N10},{40453,N25},{43345,N10},{43345,N25},{44004,N25},{44000,N25},{44002,N25},{40439,N25},{44003,N25},{43954,N25},{40628,N25},{40629,N25},{40630,N25},{43346,N25},},
    sections = {
      Spell(61632, {fbd = N10}), -- Berserk
      Spell(61632, {fbd = N25}), -- Berserk
      Spell(56909, {fbd = N10}), -- Cleave
      Spell(56909, {fbd = N25}), -- Cleave
      Spell(58956, {fbd = N25}), -- Flame Breath
      Spell(56908, {fbd = N10}), -- Flame Breath
      Spell(57557, {fbd = N10}), -- Pyrobuffet
      Spell(57557, {fbd = N25}), -- Pyrobuffet
      Spell(56910, {fbd = N10}), -- Tail Lash
      Spell(58957, {fbd = N25}), -- Tail Lash
      Spell(61254, {fbd = N10}), -- Will of Sartharion
      Spell(61254, {fbd = N25}), -- Will of Sartharion
    },
  },
})

table.insert(db, THE_OBSIDIAN_SANCTUM)
