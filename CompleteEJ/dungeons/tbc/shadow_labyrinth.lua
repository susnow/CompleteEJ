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

local SHADOW_LABYRINTH = CreateInstance({
  name = "暗影迷宫",
  desc = "暗影迷宫是奥金顿副本群最高级的一个分支,邪兽人占领了这里,而让人意想不到的是,在副本的尽头,他们竟然把与拉格纳罗斯同等身份的元素之神摩摩尔软禁了…….",
  --texture = "ShadowLabyrinth",
  area = 724,
}, {
  {
    name = "赫尔默大使",
    desc = "赫尔默大使是暗影迷宫的第一个boss.",
    --icon = true,
    creature = 18731,
    display = 18821,
    coords = {0.218, 0.394, 1},
    loot = {{30559,H5},27889,27884,27885,27886,{30563,H5},27887,27888,{30560,H5},},
    sections = {
      Spell(30231), -- Banish
      Spell(33551), -- Corrosive Acid
      Spell(33547, {flag1 = MAGIC}), -- Fear
    },
  },
  {
    name = "煽动者布莱卡特",
    desc = "煽动者布莱卡特是暗影迷宫的第二个boss.",
    --icon = true,
    creature = 18667,
    display = 18058,
    coords = {0.266, 0.686, 1},
    loot = {{30560,H5},27893,27890,27892,27468,{30563,H5},28134,27891,25728,{30559,H5},},
    sections = {
      Spell(33709), -- Charge
      Spell(33676), -- Incite Chaos
      Spell(33707), -- War Stomp
    },
  },
  {
    name = "沃匹尔大师",
    desc = "沃匹尔大师是暗影迷宫的第三个boss.",
    --icon = true,
    creature = 18732,
    display = 18535,
    coords = {0.532, 0.558, 1},
    loot = {27775,{30559,H5},27898,27900,{30563,H5},27897,27901,{30560,H5},},
    sections = {
      Spell(38791, {fbd = H5, flag1 = MAGIC}), -- Banish
      Spell(33563), -- Draw Shadows
      Spell(33617, {fbd = N5}), -- Rain of Fire
      Spell(39363, {fbd = H5}), -- Rain of Fire
      Spell(33841), -- Shadow Bolt Volley
    },
  },
  {
    name = "摩摩尔",
    desc = "摩摩尔是暗影迷宫的最终boss. 鲜血法典揭示了他的历史.",
    --icon = true,
    creature = 18708,
    display = 18839,
    coords = {0.812, 0.392, 1},
    loot = {28232,24309,27778,27908,27905,27913,27803,{29357,H5},{30560,H5},27912,{30563,H5},27902,27903,{29353,H5},{30559,H5},27909,28230,27910,{30532,H5},{23572,H5},{29261,H5},},
    sections = {
      Spell(33689, {fbd = N5}), -- Magnetic Pull
      Spell(38794, {fbd = H5}), -- Murmur's Touch
      Spell(33711, {fbd = N5}), -- Murmur's Touch
      Spell(33657), -- Resonance
      Spell(33666, {fbd = N5}), -- Sonic Boom
      Spell(38795, {fbd = H5}), -- Sonic Boom
      Spell(38796, {fbd = H5}), -- Sonic Boom
      Spell(33923, {fbd = N5}), -- Sonic Boom
      Spell(38797, {fbd = H5, flag1 = MAGIC}), -- Sonic Shock
      Spell(39365, {fbd = H5}), -- Thundering Storm
    },
  },
})

table.insert(db, SHADOW_LABYRINTH)
