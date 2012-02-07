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

local THE_STOCKADE = CreateInstance({
  name = "The Stockade",
  desc = "暴风城监狱是一座守卫严密的监狱，位于暴风城的运河下。暴风城监狱由典狱官塞尔沃特管理，关押着各种暴徒、叛乱份子、杀人犯和许多世界上最危险的罪犯。最近，一场由囚犯发起的暴乱使暴风城监狱陷入了混乱。守卫被赶出监狱，罪犯在监狱里随意走动。典狱官塞尔沃特设法逃出了关押。现在，他正在招募勇敢的冒险者进入监狱，刺杀这次叛乱的头目：狡猾的重刑犯巴基尔·斯瑞德。\n\n典狱官塞尔沃特设法保护了自己，现在他正在募集一些冒险者去镇压暴动。他认为相对那些被煽动的新囚犯而言，真正的威胁只有'霍格'和他的河爪豺狼人。",
  texture = "TheStockade",
  area = 690,
  dflag = N5,
}, {
  {
    name = "藍道夫·摩洛克",
    desc = "藍道夫·摩洛克是监狱中暴乱的人类罪犯的领导者。它位于监狱中的主要通道，是地下城的第一个BOSS。",
    --icon = true,
    creature = 46383,
    display = 35068,
    coords = {0.500, 0.215, 1},
    loot = {63346,63345,},
    sections = {
      Spell(86729, {so = true}), -- Sweep
      Spell(86726, {so = true}), -- Wildly Stabbing
      Spell(55964, {so = true, desc = "间歇性的从视野中消失2.5秒，并带来一些惊喜。"}), -- Vanish
    },
  },
  {
    name = "灼热勋爵",
    desc = "灼热勋爵是监狱地震后产生的火元素的领导者。他是监狱中的第二个BOSS，你可以在右侧的通道中找到他。",
    --icon = true,
    creature = 46264,
    display = 1204,
    coords = {0.783, 0.458, 1},
    loot = {5967,},
    sections = {
      Spell(12466, {so = true, desc = "对一个敌人造成99到116点火焰伤害。"}), -- Fireball
      Spell(86636, {so = true}), -- Rain of Fire
      Spell(86633, {so = true, flag1 = MAGIC}), -- Overheat
    },
  },
  {
    name = "霍格",
    desc = "豺狼人之王霍格终于被暴风城的勇敢冒险者捕获了。他激怒了其他的豺狼人囚犯，并威胁到了暴风城的和平，是监狱中最危险的犯人。",
    --icon = true,
    creature = 46254,
    display = 501,
    coords = {0.218, 0.265, 1},
    loot = {1959,},
    sections = {
      Spell(86604, {so = true}), -- Vicious Slice
      Spell(86620, {so = true}), -- Maddening Call
      Spell(86736, {so = true, desc = "生命低于45%后，霍格会狂暴，攻击速度提高30%，攻击速度提高10%。", flag1 = HEALER}), -- Enrage
    },
  },
})

table.insert(db, THE_STOCKADE)
