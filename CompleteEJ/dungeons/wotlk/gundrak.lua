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

local GUNDRAK = CreateInstance({
  name = "古达克",
  desc = "古达克 is the capital of the Ice Trolls. Located in Zul'Drak, the instance contains two entrances which all lead into a main circle. The Drakkari tribe rule Zul'Drak from here, constantly battling the mighty forces of the Scourge.",
  --texture = "Gundrak",
  area = 530,
}, {
  {
    name = "斯拉德兰",
    desc = "斯拉德兰, 西莱图斯的高阶先知, 是古达克的第一个BOSS. 与成就<蛇。为什么是蛇？>相关",
    --icon = true,
    creature = 29304,
    display = 27422,
    --coords = {x, y, level},
    loot = {{35585,N5},{35583,N5},{37627,H5},{35584,N5},{37629,H5},{37628,H5},{37626,H5},},
    sections = {
      Spell(59842, {fbd = H5}), -- Poison Nova
      Spell(55081, {fbd = N5, flag1 = POISON}), -- Poison Nova
      Spell(48287, {fbd = N5}), -- Powerful Bite
      Spell(59840, {fbd = H5}), -- Powerful Bite
      Spell(59839, {fbd = H5}), -- Venom Bolt
      Spell(54970, {fbd = N5}), -- Venom Bolt
    },
  },
  {
    name = "莫拉比",
    desc = "莫拉比是古达克的第三个BOSS, 他是犸托斯的高阶先知。home to the Northrend trolls. 与成就<干掉莫拉比>相关",
    --icon = true,
    creature = 29305,
    display = 27059,
    --coords = {x, y, level},
    loot = {{35589,N5},{35587,N5},{37633,H5},{35588,N5},{37632,H5},{37631,H5},{37630,H5},},
    sections = {
      Spell(55102, {fbd = N5}), -- Determined Gore
      Spell(59444, {fbd = H5}), -- Determined Gore
      Spell(55104), -- Determined Stab
      Spell(55142), -- Ground Tremor
      Spell(55163), -- Mojo Frenzy
      Spell(55100), -- Numbing Roar
      Spell(55106), -- Numbing Shout
      Spell(55101), -- Quake
      Spell(55098), -- Transformation
    },
  },
  {
    name = "迦尔达拉",
    desc = "迦尔达拉, an ice troll that transforms into a spirit rhino, 是古达克的最后BOSS。与成就<有爱共享>相关。",
    --icon = true,
    creature = 29306,
    display = 27061,
    --coords = {x, y, level},
    loot = {{43305,N5},{43309,N5},{37642,H5},{43306,N5},{37645,H5},{43102,H5},{37639,H5},{37638,H5},{37643,H5},{37641,H5},{37640,H5},{37644,H5},},
    sections = {
      Spell(59828, {fbd = H5}), -- Enrage
      Spell(55285, {fbd = N5}), -- Enrage
      Spell(54956, {fbd = N5}), -- Impaling Charge
      Spell(59827, {fbd = H5}), -- Impaling Charge
      Spell(55276), -- Puncture
      Spell(59826, {fbd = H5}), -- Puncture
      Spell(55218), -- Stampede
      Spell(55292, {fbd = N5}), -- Stomp
      Spell(59829, {fbd = H5}), -- Stomp
      Spell(59825, {fbd = H5}), -- Whirling Slash
      Spell(55250), -- Whirling Slash
      Spell(59824, {fbd = H5}), -- Whirling Slash
      Spell(55249), -- Whirling Slash
    },
  },
  {
    name = "凶残的伊克",
    desc = "凶残的伊克, a gorloc,是古达克中的一个可选BOSS,只在英雄难度下出现。与成就<什么味道？>相关。",
    --icon = true,
    creature = 29932,
    display = 26644,
    coords = {0.252, 0.688, 1},
    loot = {{43312,H5},{43311,H5},{43310,H5},{43313,H5},},
    sections = {
      Spell(55816, {fbd = H5}), -- Eck Berserk
      Spell(55813, {fbd = H5}), -- Eck Bite
      Spell(55814, {fbd = H5}), -- Eck Spit
      Spell(55815, {fbd = H5}), -- Eck Spring
      Spell(55837, {fbd = H5}), -- Eck Spring
    },
  },
})

table.insert(db, GUNDRAK)
