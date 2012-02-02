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

local THE_RUBY_SANCTUM = CreateInstance({
  name = "红玉圣殿",
  desc = "红玉圣殿,也可称为晶红圣殿,作为抵御暮光议会的一部分,该副本聚集着大量红龙军团的部队.该副本的入口位于龙眠神殿的下方",
  --texture = "TheRubySanctum",
  area = 609,
}, {
  {
    name = "战争之子巴尔萨鲁斯",
    desc = "战争之子巴尔萨鲁斯是海里昂的得力助手之一",
    --icon = true,
    creature = 39751,
    display = 31761,
    --coords = {x, y, level},
    loot = {},
    sections = {
      Spell(75125), -- Blade Tempest
      Spell(40504), -- Cleave
      Spell(74502), -- Enervating Brand
      Spell(74509), -- Repelling Wave
    },
  },
  {
    name = "扎里斯利安将军",
    desc = "扎里斯利安将军是海里昂的得力助手之一",
    --icon = true,
    creature = 39746,
    display = 32179,
    --coords = {x, y, level},
    loot = {},
    sections = {
      Spell(74367), -- Cleave Armor
      Spell(74384), -- Intimidating Roar
    },
  },
  {
    name = "萨维安娜·怒焰",
    desc = "萨维安娜·怒焰是海里昂的得力助手之一",
    --icon = true,
    creature = 39747,
    display = 31577,
    --coords = {x, y, level},
    loot = {{37794,N10},{37771,H25},},
    sections = {
      Spell(74456), -- Conflagration
      Spell(74452), -- Conflagration
      Spell(78722), -- Enrage
      Spell(74453), -- Flame Beacon
      Spell(74404, {fbd = N25}), -- Flame Breath
      Spell(74404, {fbd = H25}), -- Flame Breath
      Spell(74403), -- Flame Breath
    },
  },
  {
    name = "海里昂",
    desc = "海里昂是一条暮光巨龙,死亡之翼信赖的指挥官之一.他和战争之子巴尔萨鲁斯,萨维安娜·怒焰,以及扎里斯利安将军一同来到红玉圣殿,窃取红龙女王的龙蛋",
    --icon = true,
    creature = 39863,
    display = 31952,
    coords = {0.493, 0.539, 1},
    loot = {{53125,N25},{53490,N25},{54561,H10},{54562,H10},{53132,N25},{54583,H25},{54559,H10},{53121,N10},{54560,H10},{54563,H10},{54588,H25},{54557,H10},{54590,H25},{53127,N25},{54586,H25},{53487,N25},{54591,H25},{54584,H25},{54582,H25},{53134,N25},{54580,H25},{54577,H25},{54581,H25},{53488,N25},{54578,H25},{53129,N25},{54589,H25},{54567,H10},{53133,N25},{54556,H10},{53111,N10},{54569,N25},{53118,N10},{54572,N25},{54571,N25},{53489,N25},{53486,N25},{53117,N10},{54564,H10},{53119,N10},{54576,H25},{54565,H10},{54558,H10},{53115,N10},{53116,N10},{53113,N10},{53103,N10},{53114,N10},{54566,H10},{54573,N25},{53112,N10},{53110,N10},{53126,N25},},
    sections = {
      Spell(26662), -- Berserk
      Spell(74524), -- Cleave
      Spell(74827), -- Corporeality
      Spell(74835), -- Corporeality
      Spell(74832), -- Corporeality
      Spell(74829), -- Corporeality
      Spell(74834), -- Corporeality
      Spell(74826), -- Corporeality
      Spell(74830, {fbd = H10}), -- Corporeality
      Spell(74830, {fbd = H25}), -- Corporeality
      Spell(74836), -- Corporeality
      Spell(74828), -- Corporeality
      Spell(74833), -- Corporeality
      Spell(74562, {flag1 = MAGIC}), -- Fiery Combustion
      Spell(74528, {fbd = H25}), -- Flame Breath
      Spell(74525, {fbd = N10}), -- Flame Breath
      Spell(74526, {fbd = N25}), -- Flame Breath
      Spell(74527, {fbd = H10}), -- Flame Breath
      Spell(74531), -- Tail Lash
    },
  },
})

table.insert(db, THE_RUBY_SANCTUM)
