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

local THE_BOTANICA = CreateInstance({
  name = "生态船",
  desc = "生态船位于风暴要塞.生态船原先是纳鲁游历各个世界的植物收藏馆，现在他被凯尔萨斯王子所占据，指挥官萨拉妮丝在那里奉凯尔萨斯王子之名研究着来自于其他大陆的各种奇怪植物.",
  --texture = "TheBotanica",
  area = 729,
}, {
  {
    name = "指挥官萨瑞尼斯",
    desc = "指挥官萨瑞尼斯是生态船中的第一个boss.",
    --icon = true,
    creature = 17976,
    display = 18929,
    coords = {0.456, 0.208, 1},
    loot = {28296,{30574,H5},28306,28304,{30572,H5},28301,28311,{30573,H5},},
    sections = {
      Spell(34799), -- Arcane Devastation
      Spell(34794, {flag1 = MAGIC}), -- Arcane Resonance
    },
  },
  {
    name = "大植物学家费瑞卫恩",
    desc = "大植物学家费瑞卫恩是生态船中的第二个boss.",
    --icon = true,
    creature = 17975,
    display = 19045,
    coords = {0.250, 0.244, 1},
    loot = {28316,{30574,H5},28315,28317,{30572,H5},28318,28321,23617,{30573,H5},},
    sections = {
      Spell(34762), -- Plant Blue Seedling
      Spell(34761), -- Plant Green Seedling
      Spell(34763), -- Plant Red Seedling
      Spell(34759), -- Plant White Seedling
      Spell(34557), -- Summon Frayer Protector
      Spell(34550), -- Tranquility
      Spell(34551), -- Tree Form
    },
  },
  {
    name = "看管者索恩格林",
    desc = "看管者索恩格林是生态船中的第三个boss.",
    --icon = true,
    creature = 17978,
    display = 14416,
    coords = {0.076, 0.478, 1},
    loot = {28324,{30574,H5},28327,28323,{30572,H5},28322,28325,24310,{30573,H5},},
    sections = {
      Spell(34670), -- Enrage
      Spell(39131, {fbd = H5}), -- Hellfire
      Spell(34659, {fbd = N5}), -- Hellfire
      Spell(34661), -- Sacrifice
    },
  },
  {
    name = "拉伊",
    desc = "拉伊是生态船中的第四个boss.",
    --icon = true,
    creature = 17980,
    display = 13109,
    coords = {0.330, 0.884, 1},
    loot = {27739,{30574,H5},28328,28339,{30572,H5},28338,28340,{30573,H5},},
    sections = {
      Spell(34697, {flag1 = DISEASE}), -- Allergic Reaction
      Spell(3391), -- Thrash
    },
  },
  {
    name = "扭曲分裂者",
    desc = "扭曲分裂者是生态船中的最终boss.",
    --icon = true,
    creature = 17977,
    display = 19438,
    coords = {0.340, 0.378, 1},
    loot = {28342,28343,{30574,H5},28228,28347,28350,{30572,H5},28345,{30573,H5},{29359,H5},28371,28370,28229,28348,28349,28367,{32072,H5},24311,{23572,H5},{29262,H5},28341,{29258,H5},},
    sections = {
      Spell(39133, {fbd = H5}), -- Arcane Volley
      Spell(36705, {fbd = N5}), -- Arcane Volley
      Spell(34716), -- Stomp
    },
  },
})

table.insert(db, THE_BOTANICA)
