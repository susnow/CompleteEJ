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

local RAGEFIRE_CHASM = CreateInstance({
  name = "怒焰裂谷",
  desc = "怒焰裂谷的地理位置十分特殊,位于奥格瑞玛城中.副本入口在奥格瑞玛主城的暗影区,从该区一扇泛光的大门进入即可.怒炎裂谷由一系列火山洞穴组成,一个忠于影子议会的邪教正藏身在裂谷深处,怒炎裂谷里散发出了黑暗力量足以毁灭兽人已经取得的一切.",
  texture = "RagefireChasm",
  area = 680,
  dflag = N5,
}, {
  {
    name = "奥格弗林特",
    desc = "奥格弗林特和他的穴居人镇守在怒焰裂谷的入口附近,驱赶走任何企图接近怒焰裂谷深处的探险者.",
    --icon = true,
    creature = 11517,
    display = 32731,
    coords = {0.696, 0.649, 1},
    loot = {68194,},
    sections = {
      Spell(40505, {so = true}), -- Cleave
    },
  },
  {
    name = "饥饿者塔拉加曼",
    desc = "被认为是怒焰裂谷的领导者,擅长使用恶魔的力量引诱和腐蚀奥格瑞玛的平民",
    --icon = true,
    creature = 11520,
    display = 14152,
    coords = {0.408, 0.578, 1},
    loot = {14148,14149,14145,},
    sections = {
      Spell(11970, {so = true, desc = "对附近的敌人造成33~38点火焰伤害."}), -- Fire Nova
      Spell(18072, {so = true}), -- Uppercut
    },
  },
  {
    name = "祈求者耶戈什",
    desc = "耶戈什,一直在追求术士暗影魔法和恶魔的力量,他试图策划出能引起萨尔注意的危险计划,比如说召唤出一些可怕的恶魔之类的.",
    --icon = true,
    creature = 11518,
    display = 11429,
    coords = {0.343, 0.816, 1},
    loot = {14150,14147,14151,},
    sections = {
      Spell(11980, {so = true, desc = "降低一名敌人造成的物理伤害，持续15秒.", flag1 = CURSE}), -- Curse of Weakness
      Spell(20800, {so = true, desc = "灼烧敌人，并对其每3秒造成一次额外火焰伤害，持续15秒.", flag1 = MAGIC}), -- Immolate
    },
  },
  {
    name = "巴扎兰",
    desc = "燃刃信徒的领导者.",
    --icon = true,
    creature = 11519,
    display = 2007,
    coords = {0.419, 0.863, 1},
    loot = {68195,},
    sections = {
      Spell(744, {so = true, desc = "每3秒对目标造成一次自然伤害，持续15秒.", flag1 = POISON}), -- Poison
      Spell(14873, {so = true}), -- Sinister Strike
    },
  },
})

table.insert(db, RAGEFIRE_CHASM)
