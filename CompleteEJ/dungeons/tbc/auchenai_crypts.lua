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

local AUCHENAI_CRYPTS = CreateInstance({
  name = "奥金尼地穴",
  desc = "奥金顿是前德莱尼圣地,在外域泰罗卡森林的白骨荒野中心.这是一个神圣的地方,直到被暗影议会接管,他们召唤了一个和时间一样古老,极其强大的恶魔,并摧毁了一半的泰罗卡森林.不同的阵营现在在这个神奇的地方争夺权力:吸收了法力陵墓中奥术能量的虚空幽客,在奥金尼地下的燃烧军团灵魂,在赛塞泰克大厅的鸦人狂热者,以及统治了整个暗影迷宫的暗影议会.",
  --texture = "AuchenaiCrypts",
  area = 722,
}, {
  {
    name = "死亡看守者辛瑞克",
    desc = "死亡看守者辛瑞克是奥金尼地穴的第一个BOSS.",
    --icon = true,
    creature = 18371,
    display = 18916,
    coords = {0.462, 0.644, 2},
    loot = {{27409,N5},{27408,N5},{25964,N5},{27493,H5},{27866,H5},{27410,N5},{27846,H5},{26055,N5},{27865,H5},{30586,H5},{27845,H5},{27847,H5},{30588,H5},{30587,H5},},
    sections = {
      Spell(32265), -- Attract Magic
      Spell(39382, {fbd = H5}), -- Carnivorous Bite
      Spell(36383, {fbd = N5}), -- Carnivorous Bite
      Spell(32264), -- Inhibit Magic
    },
  },
  {
    name = "主教玛拉达尔",
    desc = "主教玛拉达尔, 是奥金尼地穴的最终BOSS.",
    --icon = true,
    creature = 18373,
    display = 17715,
    coords = {0.738, 0.500, 2},
    loot = {{27413,N5},{29257,H5},{27414,N5},{27411,N5},{29354,H5},{27416,N5},{27412,N5},{27523,H5},{23572,H5},{27415,N5},{27871,H5},{29244,H5},{27869,H5},{27870,H5},{30588,H5},{27867,H5},{27872,H5},{30586,H5},{30587,H5},},
    sections = {
      Spell(88735, {fbd = H5}), -- Ribbon of Souls
      Spell(32422, {fbd = N5}), -- Ribbon of Souls
      Spell(32421), -- Soul Scream
      Spell(32346), -- Stolen Soul
      Spell(32424), -- Summon Avatar
    },
  },
})

table.insert(db, AUCHENAI_CRYPTS)
