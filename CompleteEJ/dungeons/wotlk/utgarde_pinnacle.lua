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

local UTGARDE_PINNACLE = CreateInstance({
  name = "乌特加德之巅",
  desc = "乌特加德之巅是嚎风峡湾区域的副本之一，位于乌特加德城堡附近，是由巫妖王的手下维库人所掌控的区域，这是一个80级的副本，除了一般的维库人战士之外，维库人之王伊米隆国王也在这个副本的深处.",
  --texture = "UtgardePinnacle",
  area = 524,
}, {
  {
    name = "席瓦拉·索格蕾",
    desc = "席瓦拉·索格蕾在死后被巫妖王复活成为了一名瓦格雷.",
    --icon = true,
    creature = 26668,
    display = 26096,
    coords = {0.476, 0.726, 2},
    loot = {{37368,H5},{37037,N5},{37369,H5},{37038,N5},{37367,H5},{37370,H5},{37040,N5},{37043,N5},},
    sections = {
      Spell(48258), -- Call Flames
      Spell(48267), -- Ritual Preparation
      Spell(48277), -- Ritual Strike
      Spell(59930), -- Ritual Strike
      Spell(48276), -- Ritual of the Sword
      Spell(59409, {fbd = H5}), -- Sinister Strike
      Spell(15667, {fbd = N5}), -- Sinister Strike
    },
  },
  {
    name = "戈托克·苍蹄",
    desc = "巨型猛犸兽,要挑战戈托克·苍蹄你需要激活并击败它之前的4个守护巨兽",
    --icon = true,
    creature = 26687,
    display = 27419,
    coords = {0.610, 0.696, 2},
    loot = {{37373,H5},{37051,N5},{37376,H5},{37052,N5},{37371,H5},{37374,H5},{37050,N5},{37048,N5},},
    sections = {
      Spell(48260), -- Arcing Smash
      Spell(59268, {fbd = H5}), -- Impale
      Spell(48261, {fbd = N5}), -- Impale
      Spell(48256, {fbd = N5}), -- Withering Roar
      Spell(59267, {fbd = H5}), -- Withering Roar
    },
  },
  {
    name = "残忍的斯卡迪",
    desc = "玩家需要杀死场面上刷新的维库人来获取鱼叉,并且使用鱼叉发射器将斯卡迪从坐骑上射下来并且开始这场战斗,斯卡迪除了掉落蓝龙坐骑之外,还和许多成就相关.",
    --icon = true,
    creature = 26693,
    display = 27418,
    coords = {0.688, 0.366, 2},
    loot = {{37384,H5},{44151,H5},{37379,H5},{37055,N5},{37057,N5},{37377,H5},{37053,N5},{37389,H5},{37056,N5},},
    sections = {
      Spell(59330, {fbd = H5}), -- Crush
      Spell(50234, {fbd = N5}), -- Crush
      Spell(59331, {fbd = H5}), -- Poisoned Spear
      Spell(50255, {fbd = N5}), -- Poisoned Spear
      Spell(59322, {fbd = H5}), -- Whirlwind
      Spell(50228, {fbd = N5}), -- Whirlwind
    },
  },
  {
    name = "伊米尔隆国王",
    desc = "伊米尔隆国王,维库人之王,同时也是乌特加德之巅的最后守关Boss.",
    --icon = true,
    creature = 26861,
    display = 28019,
    coords = {0.406, 0.534, 2},
    loot = {{37401,H5},{37065,N5},{37408,H5},{37390,H5},{37062,N5},{37397,H5},{37395,H5},{37407,H5},{37067,N5},{43102,H5},{37398,H5},41797,{37060,N5},{37409,H5},{37066,N5},{37064,N5},{37061,N5},{37058,N5},},
    sections = {
      Spell(59301, {fbd = H5, flag1 = MAGIC}), -- Bane
      Spell(48294, {flag1 = MAGIC}), -- Bane
      Spell(48292), -- Dark Slash
      Spell(59300, {fbd = H5, flag1 = DISEASE}), -- Fetid Rot
      Spell(48291, {flag1 = DISEASE}), -- Fetid Rot
      Spell(51750), -- Screams of the Dead
      Spell(48529, {fbd = N5}), -- Spirit Burst
      Spell(59305, {fbd = H5}), -- Spirit Burst
      Spell(59304, {fbd = H5}), -- Spirit Strike
      Spell(48423, {fbd = N5}), -- Spirit Strike
    },
  },
  -- {
    -- name = "King Ymiron",
    -- desc = "King Ymiron is the fourth and last boss in Utgarde Pinnacle. He is related to the achievement King's Bane.",
    --icon = true,
    -- creature = 26861,
    -- display = 28019,
    -- coords = {0.406, 0.534, 2},
    -- loot = {{37401,H5},{37065,N5},{37408,H5},{37390,H5},{37062,N5},{37397,H5},{37395,H5},{37407,H5},{37067,N5},{43102,H5},{37398,H5},41797,{37060,N5},{37409,H5},{37066,N5},{37064,N5},{37061,N5},{37058,N5},},
    -- sections = {
      -- Spell(59301, {fbd = H5, flag1 = MAGIC}), -- Bane
      -- Spell(48294, {flag1 = MAGIC}), -- Bane
      -- Spell(48292), -- Dark Slash
      -- Spell(59300, {fbd = H5, flag1 = DISEASE}), -- Fetid Rot
      -- Spell(48291, {flag1 = DISEASE}), -- Fetid Rot
      -- Spell(51750), -- Screams of the Dead
      -- Spell(48529, {fbd = N5}), -- Spirit Burst
      -- Spell(59305, {fbd = H5}), -- Spirit Burst
      -- Spell(59304, {fbd = H5}), -- Spirit Strike
      -- Spell(48423, {fbd = N5}), -- Spirit Strike
    -- },
  -- },
})

table.insert(db, UTGARDE_PINNACLE)
