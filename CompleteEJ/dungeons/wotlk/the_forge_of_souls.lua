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

local THE_FORGE_OF_SOULS = CreateInstance({
  name = "灵魂洪炉",
  desc = "灵魂洪炉 是冰冠要塞副本群中的第一个5人副本,玩家在完成灵魂烘炉的剧情之后可以传送到萨隆矿坑.",
  --texture = "TheForgeofSouls",
  area = 601,
}, {
  {
    name = "布隆亚姆",
    desc = "布隆亚姆, 原型来自灵魂乐教父詹姆斯布朗,是灵魂洪炉中的第一个首领。与成就<灵魂之能>相关。",
    --icon = true,
    creature = 36497,
    display = 30226,
    coords = {0.433, 0.499, 1},
    loot = {{50196,H5},49783,{50193,H5},49784,49785,{50197,H5},50317,49786,49787,49788,50316,{50194,H5},{50191,H5},{50169,H5},},
    sections = {
      Spell(68839), -- Corrupt Soul
      Spell(68950), -- Fear
      Spell(68793, {fbd = N5}), -- Magic's Bane
      Spell(69050, {fbd = H5}), -- Magic's Bane
      Spell(70043), -- Shadow Bolt
      Spell(68921, {fbd = N5}), -- Soulstorm
      Spell(69049, {fbd = H5}), -- Soulstorm
      Spell(68872), -- Soulstorm
      Spell(68988), -- Teleport
    },
  },
  {
    name = "灵魂吞噬者",
    desc = "灵魂吞噬者是灵魂洪炉中的第二个首领. 与成就<三面之灵>相关。",
    --icon = true,
    creature = 36502,
    display = 30148,
    coords = {0.436, 0.124, 1},
    loot = {{49796,N5},{50211,H5},{50210,H5},{50203,H5},{50206,H5},{50208,H5},{49797,N5},{50214,H5},{50212,H5},{49791,N5},{50209,H5},{50207,H5},{43102,H5},{50198,H5},{50213,H5},{49794,N5},{49792,N5},{49799,N5},{50215,H5},{49800,N5},{49789,N5},{49798,N5},{49793,N5},{49795,N5},{49790,N5},},
    sections = {
      Spell(69051), -- Mirrored Soul
      Spell(68982, {fbd = N5, flag1 = MAGIC}), -- Phantom Blast
      Spell(70322, {fbd = H5, flag1 = MAGIC}), -- Phantom Blast
      Spell(68939), -- Unleashed Souls
      Spell(68912), -- Wailing Souls
      Spell(68899), -- Wailing Souls
      Spell(68820), -- Well of Souls
    },
  },
})

table.insert(db, THE_FORGE_OF_SOULS)
