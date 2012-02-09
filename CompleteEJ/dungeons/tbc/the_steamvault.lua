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

local THE_STEAMVAULT = CreateInstance({
  name = "蒸汽地窟",
  desc = "蒸汽地窟是盘牙水库地下城的第三个5人副本. 其结构本身就是一个地下水泵站, 娜迦海妖统治着这里. 瓦斯琪女士忠心的仆人督军卡利瑟里斯带着他的手下机械师斯蒂里格和水术师瑟斯比亚驻守在蒸汽地窟他们似乎在研究一种结合水和机械的法术，这种法术能带给娜迦战士无坚不摧的力量。娜迦族以此为据点不断吸取赞加沼泽的湖水,导致毒蛇湖的水位下降,引发了一系列生态问题,无数生物的生活环境遭到破坏.",
  --texture = "TheSteamvault",
  area = 727,
}, {
  {
    name = "水术师瑟丝比娅",
    desc = "水术师瑟丝比娅是盘牙水库中蒸汽地窟的第一个boss.",
    --icon = true,
    creature = 17797,
    display = 11268,
    coords = {0.542, 0.124, 1},
    loot = {27508,{30551,H5},27783,27787,{30549,H5},27789,27784,{30550,H5},},
    sections = {
      Spell(31718, {flag1 = MAGIC}), -- Enveloping Winds
      Spell(25033), -- Lightning Cloud
      Spell(31481, {flag1 = MAGIC}), -- Lung Burst
    },
  },
  {
    name = "机械师斯蒂里格",
    desc = "机械师斯蒂里格是盘牙水库中蒸汽地窟的第二个boss. 如果你想继续前进见到督军卡利瑟里斯必须要杀害他.",
    --icon = true,
    creature = 17796,
    display = 18638,
    coords = {0.324, 0.826, 1},
    loot = {27793,{30551,H5},27794,27791,{30550,H5},27790,27792,23887,{30549,H5},},
    sections = {
      Spell(35107), -- Electrified Net
      Spell(31486), -- Saw Blade
      Spell(31485), -- Super Shrink Ray
    },
  },
  {
    name = "督军卡利瑟里斯",
    desc = "督军卡利瑟里斯是盘牙水库中蒸汽地窟的第三个boss.",
    --icon = true,
    creature = 17798,
    display = 20235,
    coords = {0.806, 0.434, 1},
    loot = {{30550,H5},27805,27738,27799,27806,27737,27804,{30549,H5},27795,27475,{30551,H5},27801,{29351,H5},27510,28203,27874,24313,{29463,H5},{30543,H5},{29243,H5},{23572,H5},},
    sections = {
      Spell(55095, {flag1 = DISEASE}), -- Frost Fever
      Spell(16172), -- Head Crack
      Spell(31589, {flag1 = MAGIC}), -- Slow
      Spell(31534), -- Spell Reflection
      Spell(37081), -- Warlord's Rage
      Spell(36453), -- Warlord's Rage
    },
  },
})

table.insert(db, THE_STEAMVAULT)
