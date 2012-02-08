local _, db = ...
local db, CreateInstance, Stage, Spell = db[2], db.CreateInstance, db.Stage, db.Spell

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

local SUNWELL_PLATEAU = CreateInstance({
  name = "太阳之井高地",
  desc = "太阳之井高地是《魔兽世界》燃烧的远征中的25人顶级副本,太阳之井的新主人凯尔萨斯·逐日者依靠太阳之井的力量,召唤出了基尔加丹.玩家需要直接面对基尔加丹扭曲的化身.太阳之井能量的化身－安薇娜则被关在魔法屏障里.他们正在抽取她的能量以维持这个召唤仪式",
  --texture = "SunwellPlateau",
  area = 789,
}, {
  {
    name = "卡雷苟斯",
    desc = "卡雷苟斯是蓝龙军团的一名成员，作为少数在死亡之翼的毁灭中幸存下来的龙蛋中诞生的新一代巨龙，他强大、睿智，并且很快能够独当一面。在太阳之井被凯尔萨斯炸毁以后，心忧太阳之井能量下落的玛里苟斯派遣卡雷苟斯来到奎尔萨拉斯，任务是调查不久前被天灾毁灭的太阳之井的残余能量",
    --icon = true,
    creature = 24850,
    display = 23345,
    coords = {0.316, 0.506, 1},
    loot = {},
    sections = {
      Spell(45018, {fbd = N10}), -- Arcane Buffet
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(44806, {fbd = N10}), -- Crazed Rage
      Spell(44799, {fbd = N10, flag1 = MAGIC}), -- Frost Breath
      Spell(45122, {fbd = N10}), -- Tail Lash
      Spell(45002, {fbd = N10}), -- Wild Magic
      Spell(44978, {fbd = N10}), -- Wild Magic
      Spell(45006, {fbd = N10}), -- Wild Magic
      Spell(45001, {fbd = N10}), -- Wild Magic
      Spell(45004, {fbd = N10}), -- Wild Magic
      Spell(45010, {fbd = N10}), -- Wild Magic
    },
  },
  {
    name = "腐蚀者萨索瓦尔",
    desc = "萨索瓦尔是一名恐惧魔王,被燃烧军团派遣去腐蚀卡雷苟斯的内心.玩家在面对太阳井1号BOSS时,将会在恶魔领域的位面中与这名恐惧魔王交手,击败他即可让卡雷苟斯重获自由.",
    --icon = true,
    creature = 24892,
    display = 26628,
    --coords = {x, y, level},
    loot = {},
    sections = {
      Spell(45029, {fbd = N10}), -- Corrupting Strike
      Spell(44806, {fbd = N10}), -- Crazed Rage
      Spell(45032, {fbd = N10, flag1 = CURSE}), -- Curse of Boundless Agony
      Spell(45031, {fbd = N10}), -- Shadow Bolt Volley
    },
  },
  {
    name = "布鲁塔布斯",
    desc = "布鲁塔布斯是一名强大的深渊领主,盘踞在太阳井高地的死亡之痕处.他杀死了蓝龙玛蒂苟萨并且将她变成了菲米丝.",
    --icon = true,
    creature = 24882,
    display = 22711,
    coords = {0.642, 0.868, 1},
    loot = {34854,34176,34855,34179,34180,32228,},
    sections = {
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(45141, {fbd = N10}), -- Burn
      Spell(45150, {fbd = N10}), -- Meteor Slash
      Spell(45185, {fbd = N10}), -- Stomp
    },
  },
  {
    name = "菲米丝",
    desc = "布鲁塔布斯的深渊恶魔之力腐蚀了玛蒂苟萨,她死后的尸体变成了菲米丝.如果玩家想要通过死亡之痕,那么就要击败菲米丝,让玛蒂苟萨的灵魂得到超度",
    --icon = true,
    creature = 25038,
    display = 22838,
    coords = {0.618, 0.900, 1},
    loot = {34186,34856,34857,34664,34352,},
    sections = {
      Spell(19983, {fbd = N10}), -- Cleave
      Spell(45866, {fbd = N10}), -- Corrosion
      Spell(45717, {fbd = N10}), -- Fog of Corruption
      Spell(45855, {fbd = N10, flag1 = MAGIC}), -- Gas Nova
      Spell(47002, {fbd = N10}), -- Noxious Fumes
    },
  },
  {
    name = "高阶术士奥蕾塞丝",
    desc = "艾瑞达双子是基尔加丹的两位女性副官，高阶术士奥蕾塞丝和萨洛拉丝女王.高阶术士奥蕾塞丝，艾瑞达恶魔，双子姐妹中的火焰施法者.",
    --icon = true,
    creature = 25166,
    display = 23334,
    coords = {0.650, 0.330, 1},
    loot = {34857,34198,35290,34664,34193,34852,34196,32228,34209,34192,34195,34854,34199,34858,34194,34855,34203,32230,},
    sections = {
      Spell(45235, {fbd = N10}), -- Blaze
      Spell(45342, {fbd = N10}), -- Conflagration
      Spell(45333, {fbd = N10}), -- Conflagration
      Spell(45366, {fbd = N10}), -- Empower
      Spell(45232, {fbd = N10}), -- Fireblast
      Spell(46771, {fbd = N10}), -- Flame Sear
      Spell(45230, {fbd = N10, flag1 = MAGIC}), -- Pyrogenics
      Spell(45329, {fbd = N10}), -- Shadow Nova
    },
  },
  {
    name = "萨洛拉丝女王",
    desc = "艾瑞达双子是基尔加丹的两位女性副官，高阶术士奥蕾塞丝和萨洛拉丝女王.萨洛拉丝女王，艾瑞达恶魔，双子姐妹中的暗影施法者.",
    --icon = true,
    creature = 25165,
    display = 23177,
    coords = {0.644, 0.322, 1},
    loot = {34855,34198,35292,34664,34189,34857,34197,32249,34208,34204,34192,34858,34205,34856,34209,34853,34193,32228,},
    sections = {
      Spell(45342, {fbd = N10}), -- Conflagration
      Spell(45256, {fbd = N10}), -- Confounding Blow
      Spell(45366, {fbd = N10}), -- Empower
      Spell(45232, {fbd = N10}), -- Fireblast
      Spell(45248, {fbd = N10}), -- Shadow Blades
      Spell(45329, {fbd = N10}), -- Shadow Nova
      Spell(45332, {fbd = N10}), -- Shadow Nova
    },
  },
  {
    name = "穆鲁",
    desc = "穆鲁曾经是一名高贵的纳鲁,在被凯尔萨斯劫持到太阳之井并且圣光力量极度虚弱的情况下，被基尔加丹的力量腐蚀，堕落为黑暗纳鲁，并由于是纯能量体，还转化成为了可怕的熵魔.",
    --icon = true,
    creature = 25741,
    display = 23404,
    --coords = {x, y, level},
    loot = {},
    sections = {
      Spell(45996, {fbd = N10}), -- Darkness
      Spell(46177, {fbd = N10}), -- Open All Portals
    },
  },
  {
    name = "欺诈者基尔加丹",
    desc = "基尔加丹来自恶魔种族艾瑞达，与阿克蒙德一起是最先加入燃烧军团的两位恶魔勇士。他俩听命于恶魔之王萨格拉斯，率领燃烧军团与泰坦世界为敌.当伊利丹盘踞于黑暗神殿时，他手下的一名悍将——凯尔萨斯，因为渴望比变节者更强大的力量，而选择了他以前的主人——基尔加丹作为他新的主人。凯尔萨斯率领着一支号称“拂晓之刃”的血精灵部队重新恢复了血精灵曾经依赖的东西——太阳之井，企图以此来召唤他新的主人——欺诈者基尔加丹来到艾泽拉斯，重现千年前的灾难和自己期盼已久,奎尔萨拉斯的荣耀。",
    --icon = true,
    creature = 25315,
    display = 23200,
    --coords = {x, y, level},
    loot = {34664,34247,34340,34329,34336,32231,34332,34337,34345,34242,34243,32228,34333,32249,},
    sections = {
      Spell(46605, {fbd = N10}), -- Darkness of a Thousand Souls
      Spell(46707, {fbd = N10}), -- Destroy All Drakes
      Spell(45641, {fbd = N10}), -- Fire Bloom
      Spell(45737, {fbd = N10}), -- Flame Dart
      Spell(45741, {fbd = N10}), -- Flame Dart
      Spell(45740, {fbd = N10}), -- Flame Dart
      Spell(45664, {fbd = N10}), -- Legion Lightning
      Spell(46680, {fbd = N10}), -- Shadow Spike
      Spell(46589, {fbd = N10}), -- Shadow Spike
      Spell(45892, {fbd = N10}), -- Sinister Reflection
      Spell(45442, {fbd = N10}), -- Soul Flay
    },
  },
})

table.insert(db, SUNWELL_PLATEAU)
