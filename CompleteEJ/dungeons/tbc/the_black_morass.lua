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

local THE_BLACK_MORASS = CreateInstance({
  name = "黑色沼泽",
  desc = "黑色沼泽是赤脊山脉东面的一片巨大沼泽地.它是第一次大战前兽人占领的第一片土地,在第二次大战后艾泽拉斯的保卫者在这片土地上耗费了很多年来清理兽人余孽.麦迪文的黑暗之门的废墟也在这里.",
  --texture = "TheBlackMorass",
  area = 733,
}, {
  {
    name = "时空领主德亚",
    desc = "时空领主德亚是时光之穴:黑色沼泽的第一个boss. 第六波怪结束后他会出现.",
    --icon = true,
    creature = 17879,
    display = 20513,
    coords = {0.438, 0.612, 1},
    loot = {{30558,H5},27993,27988,27995,27996,{30556,H5},27994,27987,{30555,H5},},
    sections = {
      Spell(31457, {fbd = N5}), -- Arcane Blast
      Spell(38538, {fbd = H5}), -- Arcane Blast
      Spell(38539, {fbd = H5}), -- Arcane Discharge
      Spell(31472, {fbd = N5}), -- Arcane Discharge
      Spell(38540, {fbd = H5}), -- Attraction
      Spell(31550), -- Banish Dragon Helper
      Spell(31467, {flag1 = MAGIC}), -- Time Lapse
    },
  },
  {
    name = "坦普卢斯",
    desc = "坦普卢斯是时光之穴:黑色沼泽的第二个boss,在十二波小怪结束后出现.",
    --icon = true,
    creature = 17880,
    display = 19066,
    coords = {0.500, 0.540, 1},
    loot = {{30556,H5},28034,28033,28185,28186,{30558,H5},28187,28184,{30555,H5},},
    sections = {
      Spell(31550), -- Banish Dragon Helper
      Spell(55095, {fbd = H5, flag1 = DISEASE}), -- Frost Fever
      Spell(31458, {flag1 = MAGIC}), -- Hasten
      Spell(31464), -- Mortal Wound
      Spell(31589, {fbd = H5, flag1 = MAGIC}), -- Slow
      Spell(38592, {fbd = H5}), -- Spell Reflection
      Spell(38593, {fbd = H5}), -- Wing Buffet
      Spell(31475, {fbd = N5}), -- Wing Buffet
    },
  },
  {
    name = "埃欧努斯",
    desc = "埃欧努斯是时光之穴:黑色沼泽的最终boss.",
    --icon = true,
    creature = 17881,
    display = 20510,
    coords = {0.448, 0.626, 1},
    loot = {{30555,H5},27509,27839,28206,28192,28190,{30558,H5},28194,28193,{30556,H5},28189,{29356,H5},28188,28207,27873,27977,{23572,H5},{30531,H5},{29253,H5},{29247,H5},},
    sections = {
      Spell(31550), -- Banish Dragon Helper
      Spell(40504), -- Cleave
      Spell(37853), -- Corrupt Medivh
      Spell(37605), -- Enrage
      Spell(39049, {fbd = H5}), -- Sand Breath
      Spell(31473, {fbd = N5}), -- Sand Breath
      Spell(31422), -- Time Stop
    },
  },
})

table.insert(db, THE_BLACK_MORASS)
