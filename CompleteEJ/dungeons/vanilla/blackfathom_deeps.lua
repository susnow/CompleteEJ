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

local BLACKFATHOM_DEEPS = CreateInstance({
  name = "黑暗深渊",
  desc = "黑暗深渊位于灰谷佐拉姆海岸的黑暗深渊曾经是一座光辉灿烂的神庙，供奉着暗夜精灵的月亮女神艾露恩。但神庙在大灾变中坍塌了，沉入了波涛汹涌的迷雾之海。神庙一直静静地在海底沉睡，直到纳迦海妖和萨特受到其力量的吸引，前来探索其中的秘密。n\n传说古代怪兽阿库麦尔现在就盘踞在神庙的废墟里。阿库麦尔是上古诸神的宠物，一直在这一地区捕食。受到阿库麦尔的吸引，一群名为暮光之锤的邪教徒也来到这里，感受上古诸神的邪恶力量。",
  texture = "BlackfathomDeeps",
  area = 688,
  dflag = N5,
}, {
  {
    name = "加摩拉",
    desc = "加摩拉居住在地下城第二个洞穴中的小岛上。他在岩块的中央漫步，其他的海龟围绕在他四周。除加摩拉之外的海龟都是中立的，他并不会因为其他的海龟受到打扰而激怒。",
    --icon = true,
    creature = 4887,
    display = 37143,
    coords = {0.330, 0.604, 1},
    loot = {6907,6908,},
    sections = {
      Spell(5568, {so = true, desc = "对附近的敌人造成172到229点伤害。"}), -- Trample践踏
    },
  },
  {
    name = "萨利维丝",
    desc = "萨利维丝是魔法领域中的一个扭曲的施法者。她是一个有难度的施法者，请做好缠斗的准备。",
    --icon = true,
    creature = 4831,
    display = 4979,
    coords = {0.113, 0.398, 1},
    loot = {888,11121,3078,},
    sections = {
      Spell(6660, {so = true, desc = "射击目标，对其造成24到29点物理伤害。"}), -- Shoot射击
      Spell(8435, {so = true, desc = "对施法者正面锥形区域内的敌人造成自然伤害。"}), -- Forked Lightning叉状闪电
      Spell(246, {so = true, desc = "使敌人的移动速度降低35%，攻击速度降低35%，持续6秒。", flag1 = MAGIC}), -- Slow减速术
    },
  },
  {
    name = "格里哈斯特",
    desc = "格里哈斯特是黑暗深渊中的一个26级精英。作为一个小BOSS，他速度很快，可以打断、并快速杀死一个施法者，造成高额伤害。双持武器的他有着令人难以置信的攻击速度。 杀死他之后可以通过一个祭坛来获得“黑暗深渊的祝福”",
    --icon = true,
    creature = 6243,
    display = 1773,
    coords = {0.544, 0.573, 1},
    loot = {6905,6906,},
    sections = {
      Spell(6533, {so = true}), -- Net
    },
  },
  {
    name = "洛古斯·杰特",
    desc = "洛古斯·杰特是一名人类高阶暮光之锤成员。部落任务[上古之神的仆从]要求你杀死他。他可能在多个位置出现，所以寻找他的话可能需要多费一点时间。",
    --icon = true,
    creature = 12902,
    display = 12822,
    coords = {0.386, 0.200, 2},
    loot = {},
    sections = {
      Spell(12550, {so = true, desc = "3颗闪电球环绕着施法者，有50%的几率对近战或远程攻击者造成自然伤害。每次闪电之盾发动反击都会消耗一颗闪电球。闪电之盾最多可维持10分钟，或者在反击3次后消失。", flag1 = MAGIC}), -- Lightning Shield闪电之盾
      Spell(12167, {so = true, desc = "用闪电攻击目标，对其造成74到87点自然伤害。"}), -- Lightning Bolt闪电箭
    },
  },
  {
    name = "阿奎尼斯男爵",
    desc = "阿奎尼斯男爵是一个黑暗深渊中的水元素，你尝试在深渊石获取[深渊之核]时可以通过部落任务[阿奎尼斯男爵]召唤他。",
    --icon = true,
    creature = 12876,
    display = 110,
    coords = {0.408, 0.722, 2},
    loot = {16782,},
    sections = {
      Spell(15531, {so = true, desc = "对附近的敌人造成99到116点冰霜伤害并将其冻结在原地，冻结效果最多可持续8秒。", flag1 = MAGIC}), -- Frost Nova冰霜新星
      Spell(15043, {so = true, desc = "对敌人造成99到116点冰霜伤害，并使其移动速度降低，持续4秒。", flag1 = MAGIC}), -- Frostbolt寒冰箭
    },
  },
  {
    name = "瑟拉吉斯",
    desc = "瑟拉吉斯是黑暗深渊中的一只巨型蛇颈龙。找到它会比打败它更难一些，你需要在Moonshrine Sanctum跳入水中，它在左边的废墟下面。战斗很简单，轰掉它就行了。",			--地名未翻
    --icon = true,
    creature = 4830,
    display = 1816,
    coords = {0.588, 0.304, 3},
    loot = {6902,6904,6901,},
    sections = {
      Stage({
        so = true,
        name = "自动攻击",
        desc = "没有特殊技能。",
      }),
    },
  },
  {
    name = "梦游者克尔里斯",
    desc = "梦游者克尔里斯是盘踞在黑暗深渊的狂热派暮光之锤成员的直接指挥官。一进入房间你就可以看到他，在受到攻击前他并不会主动攻击你。所以在与他战斗之前，你有充足的时间来清理房间中的其他暮光之锤狂热者。他会周期性的施放[催眠术]和[精神控制]，做好应对这两个法术的准备。他的主要攻击方式是暗影箭，其效果与术士的相同。任务[黑暗深渊中的邪恶]需要你取得他的脑袋。\n\n击败他之后，点亮艾萨拉女王雕像周围的四个烛台就能打开通向阿库麦尔的大门。注意。点亮每个烛台都会刷新一波敌人，做好战斗准备。",
    --icon = true,
    creature = 4832,
    display = 4939,
    coords = {0.527, 0.819, 2},
    loot = {1155,6903,},
    sections = {
      Spell(15587, {so = true, desc = "对目标造成49到58点暗影伤害。"}), -- Mind Blast心灵震爆
      Spell(8399, {so = true, desc = "使敌人进入睡眠状态，最多持续6秒。任何对目标造成伤害的行为都会唤醒它。", flag1 = MAGIC}), -- Sleep催眠术
    },
  },
  {
    name = "阿库麦尔",
    desc = "史上的深渊王子阿库麦尔曾掌管着黑暗深渊的居民，那里曾一度是个供奉着暗夜精灵月光神明爱露恩的神庙。作为上古之神的爪牙，阿库麦尔一直是佐拉姆海岸多年的祸根。由于他的存在，那些被称为目光之锤的狂热分子为了取悦他们的扭曲的主人，聚集起来，通过将无辜者喂给猛兽的方式来献祭上古邪神的仪式。",
    --icon = true,
    creature = 4829,
    display = 2837,
    coords = {0.858, 0.863, 2},
    loot = {6910,6909,6911,},
    sections = {
      Spell(3490, {so = true, desc = "使施法者的攻击速度提高75%，持续5秒，但物理伤害能力降低15点。"}), -- Frenzied Rage狂暴怒气
      Spell(3815, {so = true, desc = "每3秒对附近的敌人造成35点自然伤害，持续15秒。", flag1 = POISON}), -- Poison Cloud毒云
    },
  },
})

table.insert(db, BLACKFATHOM_DEEPS)
