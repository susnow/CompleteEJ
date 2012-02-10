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

local WAILING_CAVERNS = CreateInstance({
  name = "哀嚎洞穴",
  desc = "这个被命名为“哀嚎洞穴”的自然洞穴群里布满了蒸汽裂隙，每当喷发时都会发出长长的哀嚎声。纳拉雷克斯相信他可以利用洞穴中的地下喷泉将贫瘠之地恢复成一片沃土——但这么做需要从传说中的翡翠梦境里吸取能量。但当德鲁伊建立起与翡翠梦境的联系时，他看到却是一片噩梦般的景象。很快哀嚎洞穴就变了——这里的水变得肮脏，曾经温顺的动物也变成了凶恶的肉食动物。据说纳拉雷克斯仍然待在这个迷宫中心的某处，被困在翡翠梦境的边缘之外。连他曾经的助手都被他们主人的噩梦变成了邪恶的尖牙德鲁伊。",
  texture = "WailingCaverns",
  area = 749,
  dflag = N5,
}, {
  {
    name = "安娜科德拉",
    desc = "她可能在三个地点出现。\n\n安娜科德拉是哀嚎洞穴中毒牙之王之一。她曾经是纳拉雷克斯的门徒之一，但在纳拉雷克斯被困在翡翠梦境之后，噩梦是她发生了变化。",
    --icon = true,
    creature = 3671,
    display = 4313,
    coords = {0.307, 0.432, 1},
    loot = {5404,10412,6446,},
    sections = {
      Spell(20295, {desc = "用闪电攻击目标，对其造成49到58点自然伤害。"}), -- Lightning Bolt
      Spell(8148, {desc = "对近战攻击者造成20点自然伤害。"}), -- Thorns Aura
      Spell(8040, {desc = "使敌人进入睡眠状态，最多持续6秒。任何对目标有敌意的行为都会唤醒它。同一时间内只能有一个目标被催眠。", flag1 = MAGIC}), -- Druid's Slumber
      Spell(23381, {desc = "使用自然的力量治疗盟友，回复152到177点生命值。"}), -- Healing Touch
    },
  },
  {
    name = "克雷什",
    desc = "奇怪的是，哀嚎洞穴的海龟别没有受到纳克雷拉斯的噩梦的影响。这只古老的海龟完全不在意身边的邪恶，在洞内正常的生活。",
    --icon = true,
    creature = 3653,
    display = 5126,
    coords = {0.243, 0.455, 1},
    loot = {6447,13245,},
    sections = {
      Stage({
        so = true,
        name = "攻击",
        desc = "没有特殊技能",
      }),
    },
  },
  {
    name = "皮萨斯",
    desc = "一个老练的战士，曾经是纳克雷拉斯的私人护卫。而现在堕落的皮萨斯使用自己丰富的战斗技巧帮助尖牙德鲁伊们。",
    --icon = true,
    creature = 3670,
    display = 4214,
    coords = {0.189, 0.400, 1},
    loot = {6472,6473,},
    sections = {
      Spell(20805, {desc = "用闪电攻击目标，对其造成60到70点自然伤害。"}), -- Lightning Bolt
      Spell(8147, {desc = "对附近的敌人造成71到79点自然伤害，使其攻击间隔延长40%并且移动速度降低40%，持续6秒。", flag1 = MAGIC}), -- Thunderclap
      Spell(8040, {desc = "使敌人进入睡眠状态，最多持续6秒。任何对目标有敌意的行为都会唤醒它。同一时间内只能有一个目标被催眠。", flag1 = MAGIC}), -- Druid's Slumber
      Spell(11431, {desc = "使用自然的力量治疗盟友，回复108到125点生命值。"}), -- Healing Touch
    },
  },
  {
    name = "考布莱恩",
    desc = "毒牙之王之一。他右手的爪子，环绕周围的蟒蛇，和更大的体格使得他和其他的尖牙德鲁伊截然不同。",
    --icon = true,
    creature = 3669,
    display = 4213,
    coords = {0.160, 0.568, 1},
    loot = {6465,10410,6460,},
    sections = {
      Spell(20805, {desc = "用闪电攻击目标，对其造成60到70点自然伤害。"}), -- Lightning Bolt
      Spell(744, {desc = "每3秒对目标造成4点自然伤害，持续15秒。最多叠加5次。", flag1 = POISON}), -- Poison
      Spell(8040, {desc = "使敌人进入睡眠状态，最多持续6秒。任何对目标有敌意的行为都会唤醒它。同一时间内只能有一个目标被催眠。", flag1 = MAGIC}), -- Druid's Slumber
      Spell(23381, {desc = "使用自然的力量治疗盟友，回复152到177点生命值。"}), -- Healing Touch
      Spell(7965, {name = "毒蛇形态", desc = "变成一条毒蛇，持续5分钟。攻击伤害提高50点，但攻击间隔延长30%。"}, 1), -- Cobrahn Serpent Form
    },
  },
  {
    name = "斯卡姆",
    desc = "斯卡姆一只从被从贫瘠之地广阔平原抓来的巨大雷霆蜥蜴，很快它就成为了皮萨斯最爱的宠物。在受纳克雷拉斯的噩梦而加强之后，斯卡姆是一只凶恶的猛兽，绝不应该被轻视。",
    --icon = true,
    creature = 3674,
    display = 4203,
    coords = {0.620, 0.743, 1},
    loot = {6448,6449,},
    sections = {
      Spell(6254, {so = true}), -- Chained Bolt
    },
  },
  {
    name = "变异精灵龙 (稀有)",
    desc = "连精灵龙都没能逃过纳克雷拉斯的噩梦的侵蚀。据说这只精灵龙和雷霆蜥蜴斯卡姆都是皮萨斯的宠物。\n\n作为稀有怪物，它并不会一直存在于副本中。碰到它的概率大概有5%到10%。它是一个单独的怪物，会出现在朝向瑟芬迪斯的那一侧。",
    --icon = true,
    creature = 5912,
    display = 1267,
    coords = {0.725, 0.743, 1},
    loot = {6632,5243,},
    sections = {
      Stage({
        so = true,
        name = "攻击",
        desc = "没有特殊技能",
      }),
    },
  },
  {
    name = "瑟芬迪斯",
    desc = "他曾经是一名强大而富有威望的德鲁伊，但是现在他被纳克雷拉斯的噩梦侵蚀，是尖牙德鲁伊的领导者。",
    --icon = true,
    creature = 3673,
    display = 4215,
    coords = {0.616, 0.536, 1},
    loot = {10411,6469,5970,6459,},
    sections = {
      Spell(12167, {desc = "用闪电攻击目标，对其造成74到84点自然伤害。"}), -- Lightning Bolt
      Spell(8040, {desc = "使敌人进入睡眠状态，最多持续6秒。任何对目标有敌意的行为都会唤醒它。同一时间内只能有一个目标被催眠。", flag1 = MAGIC}), -- Druid's Slumber
      Spell(23381, {desc = "使用自然的力量治疗盟友，回复152到177点生命值。"}), -- Healing Touch
    },
  },
  {
    name = "永生者沃尔丹",
    desc = "很久以前哀嚎洞穴还是枝繁叶茂百花盛开的时候，巨大的元素生物永生者沃尔丹是这个洞穴的守护者。受到纳克雷拉斯的噩梦腐蚀之后，曾经温和的巨人现在异常凶暴。他会碾碎一切靠近他洞穴的生物。",
    --icon = true,
    creature = 5775,
    display = 4256,
    coords = {0.552, 0.466, 1},
    loot = {6630,6629,6631,},
    sections = {
      Spell(8142, {so = true, desc = "对附近的敌人造成150到250点物理伤害，将它们击倒并使其无法移动，持续5秒。", flag1 = MAGIC}), -- Grasping Vines
    },
  },
  {
    name = "吞噬者穆坦努斯",
    desc = "任何试图将纳克雷拉斯从噩梦中唤醒的尝试发生时，穆坦努斯就会出现并阻止他们。\n穆坦努斯的外形是一个巨大的白色鱼人。\n\n穆坦努斯是哀嚎洞穴的最后一个BOSS，你需要回到洞穴门口来召唤他。在两波小怪之后穆坦努斯就会出现。他打人很疼，如果你们被他打了个措手不及，他很可能会团灭你们。所以请确保在他出现前你们已回复充分。穆坦努斯有时会使用一个叫做纳拉雷克斯的梦魇的强大的催眠法术。",
    --icon = true,
    creature = 3654,
    display = 4088,
    coords = {0.343, 0.139, 1},
    loot = {6627,6463,6461,},
    sections = {
      Spell(8150, {desc = "对20码内的敌人造成94~106点自然伤害，并使它们昏迷2.5秒。", flag1 = MAGIC}), -- Thundercrack
      Spell(7967, {desc = "使敌人进入睡眠状态，最多持续8秒。任何对目标有敌意的行为都会唤醒它。同一时间内只能有一个目标被催眠。", flag1 = MAGIC}), -- Naralex's Nightmare
      Spell(7399, {desc = "恐吓一个敌人，使其因恐惧而逃跑3秒。", flag1 = MAGIC}), -- Terrify
    },
  },
})

table.insert(db, WAILING_CAVERNS)
