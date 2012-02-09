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

local MANA_TOMBS = CreateInstance({
  name = "法力陵墓",
  desc = "法力陵墓是整个奥金顿副本群中级别最低,难度最低的副本.节点亲王沙法尔是这里的主人,那么这里自然遍布着他的那些虚灵随从.这里对应星界财团的声望.",
  --texture = "ManaTombs",
  area = 732,
}, {
  {
    name = "潘德莫努斯",
    desc = "潘德莫努斯是一个虚灵,他是法力陵墓中的第一个boss.",
    --icon = true,
    creature = 18341,
    display = 19338,
    coords = {0.474, 0.294, 1},
    loot = {{28166,N5},{25940,N5},{25941,N5},{27816,H5},{25942,N5},{27817,H5},{25939,N5},{27814,H5},{25943,N5},{27815,H5},{30583,H5},{27818,H5},{27813,H5},{30584,H5},{30585,H5},},
    sections = {
      Spell(32358, {fbd = N5}), -- Dark Shell
      Spell(38759, {fbd = H5}), -- Dark Shell
      Spell(55095, {flag1 = DISEASE}), -- Frost Fever
      Spell(31589, {fbd = N5, flag1 = MAGIC}), -- Slow
      Spell(38760, {fbd = H5}), -- Void Blast
      Spell(32325, {fbd = N5}), -- Void Blast
    },
  },
  {
    name = "塔瓦洛克",
    desc = "塔瓦洛克是法力陵墓中的第二个boss.",
    --icon = true,
    creature = 18343,
    display = 19332,
    coords = {0.598, 0.736, 1},
    loot = {{25945,N5},{25952,N5},{25950,N5},{27825,H5},{25946,N5},{27824,H5},{25947,N5},{27823,H5},{25944,N5},{27821,H5},{30585,H5},{27822,H5},{27826,H5},{30583,H5},{30584,H5},},
    sections = {
      Spell(38761, {fbd = H5}), -- Arcing Smash
      Spell(8374, {fbd = N5}), -- Arcing Smash
      Spell(32361), -- Crystal Prison
      Spell(33919), -- Earthquake
    },
  },
  {
    name = "节点亲王沙法尔",
    desc = "节点亲王沙法尔是法力陵墓中的最终boss. 他领导了反对联盟的虚空幽灵.",
    --icon = true,
    creature = 18344,
    display = 19780,
    coords = {0.324, 0.518, 1},
    loot = {{25955,N5},{29240,H5},{25956,N5},{30535,H5},{25957,N5},{29352,H5},{27843,H5},{25962,N5},{25954,N5},{27835,H5},{27827,H5},{25953,N5},{23572,H5},{27831,H5},{27840,H5},{27828,H5},{32082,H5},{30585,H5},{27798,H5},{27842,H5},{27829,H5},{27844,H5},{27837,H5},{30583,H5},{28400,H5},{30584,H5},},
    sections = {
      Spell(34605), -- Blink
      Spell(32363, {fbd = N5}), -- Fireball
      Spell(88734, {fbd = H5}), -- Fireball
      Spell(32365, {flag1 = MAGIC}), -- Frost Nova
      Spell(32364, {fbd = N5, flag1 = MAGIC}), -- Frostbolt
      Spell(88733, {fbd = H5, flag1 = MAGIC}), -- Frostbolt
    },
  },
  {
    name = "Yor",
    --desc = "",
    --icon = true,
    creature = 22930,
    display = 14173,
    --coords = {x, y, level},
    loot = {},
    sections = {
    },
  },
})

table.insert(db, MANA_TOMBS)
