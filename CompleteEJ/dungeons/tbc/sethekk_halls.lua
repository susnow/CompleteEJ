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

local SETHEKK_HALLS = CreateInstance({
  name = "塞泰克大厅",
  desc = "塞泰克大厅是魔兽世界奥金顿副本群的一个分支.这里的势力主要是一群邪恶的鸦人,而且要注意的是,德鲁伊的史诗飞行形态任务最终一步就是在这里召唤乌鸦之神的.这里对应贫民窟的声望.",
  --texture = "SethekkHalls",
  area = 723,
}, {
  {
    name = "黑暗编织者塞斯",
    desc = "黑暗编织者塞斯塞泰克大厅中的第一个boss.",
    --icon = true,
    creature = 18472,
    display = 20599,
    coords = {0.486, 0.670, 1},
    loot = {{30552,H5},27917,27914,27919,27918,{30553,H5},27915,27916,24160,{30554,H5},},
    sections = {
      Spell(33534, {fbd = N5, flag1 = MAGIC}), -- Arcane Shock
      Spell(38135, {fbd = H5, flag1 = MAGIC}), -- Arcane Shock
      Spell(15305, {fbd = H5}), -- Chain Lightning
      Spell(15659, {fbd = N5}), -- Chain Lightning
      Spell(15616, {fbd = H5, flag1 = MAGIC}), -- Flame Shock
      Spell(15039, {fbd = N5, flag1 = MAGIC}), -- Flame Shock
      Spell(21401, {fbd = H5, flag1 = MAGIC}), -- Frost Shock
      Spell(12548, {fbd = N5, flag1 = MAGIC}), -- Frost Shock
      Spell(38136, {fbd = H5, flag1 = MAGIC}), -- Shadow Shock
      Spell(33620, {fbd = N5, flag1 = MAGIC}), -- Shadow Shock
    },
  },
  {
    name = "利爪之王艾吉斯",
    desc = "利爪之王艾吉斯是塞斯塞泰克大厅中的最终boss.",
    --icon = true,
    creature = 18473,
    display = 18636,
    coords = {0.324, 0.290, 2},
    loot = {{30554,H5},{29355,H5},27936,27776,27948,{30552,H5},27925,27875,{30553,H5},27981,27946,27985,27980,27838,{23572,H5},27986,{32073,H5},{29249,H5},{29259,H5},},
    sections = {
      Spell(9438), -- Arcane Bubble
      Spell(40425, {fbd = H5, flag1 = MAGIC}), -- Arcane Explosion
      Spell(38197, {fbd = N5, flag1 = MAGIC}), -- Arcane Explosion
      Spell(40424, {fbd = H5}), -- Arcane Volley
      Spell(35059, {fbd = N5}), -- Arcane Volley
      Spell(38194), -- Blink
      Spell(38151, {flag1 = MAGIC}), -- Mana Shield
      Spell(43309, {fbd = H5, flag1 = MAGIC}), -- Polymorph
      Spell(38245, {fbd = N5, flag1 = MAGIC}), -- Polymorph
      Spell(35032, {fbd = H5, flag1 = MAGIC}), -- Slow
    },
  },
  {
    name = "安苏",
    desc = "安苏只有在英雄难度下的塞斯塞泰克大厅才能被召唤. 过去他只能被德鲁伊召唤, 但是现在任何人都可以召唤出他. 安苏会有小几率掉落乌鸦之神的缰绳.",
    --icon = true,
    creature = 23035,
    display = 21492,
    coords = {0.324, 0.576, 2},
    loot = {{30552,H5},{32781,H5},{30554,H5},{32769,H5},{32778,H5},{32780,H5},{30553,H5},{32779,H5},{32768,H5},},
    sections = {
      Spell(40321, {fbd = H5, flag1 = MAGIC}), -- Cyclone of Feathers
      Spell(40199, {fbd = H5}), -- Flesh Rip
      Spell(40184, {fbd = H5}), -- Paralyzing Screech
      Spell(40303, {fbd = H5, flag1 = CURSE}), -- Spell Bomb
    },
  },
})

table.insert(db, SETHEKK_HALLS)
