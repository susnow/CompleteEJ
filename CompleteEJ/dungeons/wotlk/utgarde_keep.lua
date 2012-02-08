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

local UTGARDE_KEEP = CreateInstance({
  name = "乌特加德城堡",
  desc = "乌特加德城堡是魔兽世界资料片——巫妖王之怒的新副本。座落在环境优美的嚎风峡湾，是很多玩家刚刚踏上诺森德的土地就接触到的副本之一.",
  texture = "UtgardeKeep",
  area = 523,
}, {
  {
    name = "凯雷塞斯王子(萨莱因)",
    desc = "凯雷塞斯王子,萨莱茵帝国的王子",
    --icon = true,
    creature = 23953,
    display = 25338,
    coords = {0.287, 0.628, 1},
    loot = {{35570,N5},{35571,N5},{37178,H5},{35572,N5},{37179,H5},{37177,H5},{37180,H5},},
    sections = {
      Spell(43667, {so = true, desc = "向敌人施放黑暗的魔法箭，造成2975~4025点暗影伤害.", fbd = N5}), -- Shadow Bolt Normal
      Spell(59389, {so = true, desc = "向附近的敌人发射黑暗的魔法箭，对其造成5950~8050点暗影伤害.", fbd = H5}), -- Shadow Bolt Heroic
      Spell(48400, {so = true, desc = "将目标困在寒冰障壁中,每1秒受到400点冰霜伤害.", flag1 = IMPORTANT, fbd = N5}), -- Frost Tomb Normal
      Spell(48400, {so = true, desc = "将目标困在寒冰障壁中,每1秒受到400点冰霜伤害,在不打破冰块的情况下击败英雄模式的凯雷塞斯王子将获得一个成就奖励.", flag1 = IMPORTANT, fbd = H5}), -- Frost Tomb Normal (but with a tip for Heroic achievement)
      Stage({
        so = true,
      	stype = CREATURE,
      	creature = 23970,
      	display = 27651,
      	name = "维库骷髅",
        desc = "Summons four skeletons, they resurrect after a short while.",
      	sections = {
      		Spell(42702, {desc = "Decrepifies the target, reducing Strength by 100 and slowing movement by 30% for 10 seconds.", flag1 = DISEASE, fbd = N5}), -- Decrepify Normal
      		Spell(59397, {desc = "Decrepifies the target, reducing Strength by 200 and slowing movement by 30% for 10 seconds.", flag1 = DISEASE, fbd = H5}), -- Decrepify Heroic
      		Spell(59386, {desc = "Encases Prince Keleseth in bone armor, absorbing 7400 to 8600 damage for 1 minute. While the armor holds, spellcasting cannot be interrupted by Physical attacks.", flag1 = DPS, fbd = H5}), -- Bone Armor Heroic
      	}
      }),
    },
  },
  {
    name = "建筑师斯卡瓦尔德",
    desc = "建筑师卡瓦尔德和控制者达尔隆镇守着前往乌特加德城堡顶层的通道.",
    --icon = true,
    creature = 24200,
    display = 22194,
    coords = {0.582, 0.615, 2},
    loot = {{35574,N5},{35575,N5},{37181,H5},{35573,N5},{37182,H5},{37183,H5},{37184,H5},},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 24200,
        display = 22194,
        name = "建筑师斯卡瓦尔德",
        sections = {
          Spell(43651), -- Charge
          Spell(48583), -- Stone Strike
          Spell(48193, {flag1 = ENRAGE, fbd = H5}), -- Enrage
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 24201,
        display = 26349,
        name = "控制者达尔隆",
        sections = {
          Spell(43650, {desc = "使目标衰弱，近战攻击、施法速度、移动速度及远程攻击速度降低50%。 每2秒造成750点暗影伤害，持续8秒."}), -- Debilitate
          Spell(43649, {fbd = N5}), -- Shadow Bolt
          Spell(59575, {fbd = H5}), -- Shadow Bolt
          --Spell(52611, {fbd = H5}), -- Summon Skeletons
          Stage({
            stype = CREATURE,
            creature = 28878,
            display = 5231,
            name = "骷髅爪牙",
            desc = "召唤两只骷髅爪牙加入战斗.",
            fbd = H5,
          }),
        },
      }),
    },
    adds = {
      {
        name = "控制者达尔隆",
        creature = 24201,
        display = 26349,
      },
    },
  },
  {
    name = "劫掠者因格瓦尔",
    desc = "维库人,乌特加德城堡的最终BOSS.",
    --icon = true,
    creature = 23954,
    display = 21953,
    coords = {0.724, 0.380, 3},
    loot = {{35578,N5},{35577,N5},{37188,H5},{35576,N5},{37190,H5},{37194,H5},{37191,H5},{43102,H5},{37192,H5},{37186,H5},{37189,H5},{37193,H5},{41793,H5},},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 23954,
        display = 21953,
        name = "第一阶段:维库人",
        sections = {
          Spell(42724), -- Cleave
          Spell(42669, {fbd = N5}), -- Smash
          Spell(59706, {fbd = H5}), -- Smash
          Spell(59708, {fbd = H5}), -- Staggering Roar
          Spell(42708, {fbd = N5}), -- Staggering Roar
          Spell(42705, {fbd = N5}), -- Enrage
          Spell(59707, {fbd = H5}), -- Enrage
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 23980,
        display = 26351,
        name = "第二阶段:瓦古尔",
        desc = "瓦格雷出现将死去的因格瓦尔复活成了一名瓦古尔.",
        sections = {
          Spell(42723), -- Dark Smash
          Spell(42729, {fbd = N5}), -- Dreadful Roar
          Spell(59734, {fbd = H5}), -- Dreadful Roar
          Spell(42730, {fbd = N5, flag1 = CURSE}), -- Woe Strike
          Spell(59735, {fbd = H5, flag1 = CURSE}), -- Woe Strike
          Spell(42751, {icon = "Interface\\Icons\\INV_Axe_17", desc = "向一名随机目标投掷暗影利斧。暗影利斧击中目标后会在原地旋转10秒，并对附近的所有敌人每秒造成1750~2250点伤害.", fbd = N5}, 1), -- Shadow Axe
          Spell(59720, {icon = "Interface\\Icons\\INV_Axe_17", desc = "向一名随机目标投掷暗影利斧。暗影利斧击中目标后会在原地旋转10秒，并对附近的所有敌人每秒造成3500~4500点伤害.", fbd = H5}, 1), -- Shadow Axe
        },
      }),
    },
  },
})

table.insert(db, UTGARDE_KEEP)
