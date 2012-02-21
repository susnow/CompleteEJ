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

local THE_CULLING_OF_STRATHOLME = CreateInstance({
  name = "净化斯坦索姆",
  desc = "阴魂不散的永恒龙族依然没有放弃他们毁灭时间轴的企图，这次他们在另外一个改变世界的重大事件：斯坦索姆之战中找到了新的时空起点，改变这个事件的结果，可能会导致整个大陆的历史崩溃：没有巫妖王，没有寒冰王座下的决斗，你我也不会在诺森德相遇……时光守护者当然不会让永恒龙族的阴谋得逞，他们征召新的勇士去帮助克罗米阻止时间轴被改写，阿尔萨斯王子走上歧路的那一刻，你终于有机会亲眼见证.",
  --texture = "TheCullingofStratholme",
  area = 521,
}, {
  {
    name = "肉钩",
    desc = "肉钩 缝补憎恶,净化斯坦索姆中的第一个首领，他在5波小怪被击败后出现。",
    --icon = true,
    creature = 26529,
    display = 26579,
    coords = {0.524, 0.622, 2},
    loot = {{37678,H5},{37079,N5},{37675,H5},{37082,N5},{37679,H5},{37680,H5},{37081,N5},{37083,N5},},
    sections = {
      Spell(52696, {fbd = N5}), -- Constricting Chains
      Spell(58823, {fbd = H5}), -- Constricting Chains
      Spell(52666, {fbd = N5}), -- Disease Expulsion
      Spell(58824, {fbd = H5}), -- Disease Expulsion
      Spell(58841, {fbd = H5}), -- Frenzy
    },
  },
  {
    name = "塑血者沙尔拉姆",
    desc = "塑血者沙尔拉姆, 天灾通灵师, 净化斯坦索姆中的第二个首领。他在十波小怪被击败后出现。",
    --icon = true,
    creature = 26530,
    display = 26581,
    coords = {0.602, 0.442, 2},
    loot = {{37681,H5},{37084,N5},{37683,H5},{37095,N5},{37682,H5},{37684,H5},{37086,N5},{37088,N5},},
    sections = {
      Spell(58845, {fbd = H5, flag1 = CURSE}), -- Curse of Twisted Flesh
      Spell(52480, {fbd = N5}), -- Explode Ghoul
      Spell(58825, {fbd = H5}), -- Explode Ghoul
      Spell(57725, {fbd = N5}), -- Shadow Bolt
      Spell(58827, {fbd = H5}), -- Shadow Bolt
      Spell(52712), -- Steal Flesh
      Spell(52711), -- Steal Flesh
      Spell(52708), -- Steal Flesh
      Spell(52451), -- Summon Ghouls
    },
  },
  {
    name = "时光领主埃博克",
    desc = "时光领主埃博克是净化斯坦索姆中的第三个首领。永恒龙族安插在这根时间轴上的使者.",
    --icon = true,
    creature = 26532,
    display = 26580,
    coords = {0.660, 0.268, 2},
    loot = {{37685,H5},{37099,N5},{37686,H5},{37106,N5},{37688,H5},{37687,H5},{37105,N5},{37096,N5},},
    sections = {
      Spell(52772, {flag1 = CURSE}), -- Curse of Exertion
      Spell(58848, {fbd = H5}), -- Time Stop
      Spell(52766), -- Time Warp
      Spell(52771, {fbd = N5}), -- Wounding Strike
      Spell(58830, {fbd = H5}), -- Wounding Strike
    },
  },
  {
    name = "玛尔加尼斯",
    desc = "恐惧魔王玛尔加尼斯是净化斯坦索姆中的最后首领, 是诱引阿尔萨斯走上歧途的主谋.",
    --icon = true,
    creature = 26533,
    display = 26582,
    --coords = {x, y, level},
    loot = {},
    sections = {
      Spell(52720, {fbd = N5}), -- Carrion Swarm
      Spell(58852, {fbd = H5}), -- Carrion Swarm
      Spell(52722, {fbd = N5}), -- Mind Blast
      Spell(58850, {fbd = H5}), -- Mind Blast
      Spell(58849, {fbd = H5}), -- Sleep
      Spell(52721, {fbd = N5, flag1 = MAGIC}), -- Sleep
      Spell(52723, {flag1 = MAGIC}), -- Vampiric Touch
    },
  },
  {
    name = "永恒腐蚀者",
    --desc = "",
    --icon = true,
    creature = 32273,
    display = 19326,
    coords = {0.510, 0.420, 2},
    loot = {{43951,H5},},
    sections = {
      Spell(60588, {fbd = H5}), -- Corrupting Blight
      Spell(60590, {fbd = H5}), -- Void Strike
    },
  },
})

table.insert(db, THE_CULLING_OF_STRATHOLME)
