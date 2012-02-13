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

local MARAUDON = CreateInstance({
  name = "玛拉顿",
  desc = "玛拉顿被狂暴的玛拉顿半人马所保护，那是凄凉之地最神圣的地方.月神爱露恩与白鹿玛洛恩结合生下了塞纳留斯,塞纳留斯的两个儿子,一个成为了月光林地和塞纳里奥议会的新主人,另一个却和土元素公主瑟莱德丝结合,结果他们的子嗣没有继承自然的力量,反而继承了土元素狂暴的力量,并杀死了自己的父亲,这一分支被成为半人马,只留下土元素公主独子一人带着自己丈夫的尸体,停留在玛拉顿.玛拉顿被分成不同层次、区域;自从灾难过后,这里已经重新成为一个冒险家来探险的地方.",
  texture = "Maraudon",
  area = 750,
  dflag = N5,
}, {
  {
    name = "诺克赛恩",
    desc = "橙色水晶池的第一个首领.恶魔维利塔恩污染了玛拉顿的自然,并且创造了这个元素生物T.",
    --icon = true,
    creature = 13282,
    display = 11172,
    coords = {0.360, 0.097, 1},
    loot = {17745,17746,17744,},
    sections = {
      Spell(10966, {so = true}), -- Uppercut
      Spell(21687, {so = true, desc = "对45码内所有敌人造成37~43点自然伤害,并且每3秒造成额外的5点自然伤害,持续15秒.", flag1 = POISON}), -- Toxic Volley
      Spell(21707, {so = true, desc = "召唤5个召唤诺克赛恩产物."}), -- Summon Noxxion's Spawns
      Stage({
        stype = CREATURE,
        creature = 13456,
        display = 5492,
        name = "诺克赛恩产物",
        desc = "没有任何特殊能力.",
      }),
    },
  },
  {
    name = "锐刺鞭笞者",
    desc = "橙色水晶池区域最终的BOSS,一颗巨大的鞭笞者植物.",
    --icon = true,
    creature = 12258,
    display = 12389,
    coords = {0.163, 0.340, 1},
    loot = {17748,17750,17749,17751,},
    sections = {
      Spell(40504, {so = true, flag1 = TANK}), -- Cleave
      Spell(15976, {so = true, desc = "每2秒对敌人造成一次15点物理伤害，持续10秒,这个效果最多可以叠加20次."}), -- Puncture
    },
  },
  {
    name = "维利塔恩",
    desc = "紫色水晶池区域唯一的一个BOSS.萨特的首领 .",
    --icon = true,
    creature = 12236,
    display = 12334,
    coords = {0.378, 0.711, 1},
    loot = {17754,17755,17752,},
    sections = {
      Spell(16100, {so = true, desc = "射击一个敌人,造成74~87点物理伤害."}), -- Shoot
      Spell(21390, {so = true}), -- Multi-Shot
      Spell(21655, {so = true, desc = "将施法者传送到正前方20码的位置，路线上有阻挡物则会停止."}), -- Blink
      Spell(7964, {so = true, desc = "施放烟雾弹，使附近的敌人昏迷3秒.", flag1 = MAGIC}), -- Smoke Bomb
    },
  },
  {
    name = "被诅咒的塞雷布拉斯",
    desc = "半人马之子,为了调查玛拉顿的腐化情况进入玛拉顿,后被腐蚀心智.",
    --icon = true,
    creature = 12225,
    display = 12350,
    coords = {0.246, 0.139, 2},
    loot = {17739,17740,17738,},
    sections = {
      Spell(21807, {so = true, desc = "向目标射出一支闪电箭，对其造成66~77点自然伤害."}), -- Wrath
      Spell(12747, {so = true, desc = "用根须将敌人缠住，每3秒对其造成一次4点自然伤害，并使其无法移动，最多持续5秒.", flag1 = MAGIC}), -- Entangling Roots
      Spell(21793, {so = true, desc = "对45码指定区域内的敌人每两秒造成36点的自然伤害，使它们的移动速度降低70%，攻击间隔延长300%，持续8秒.", flag1 = INTERRUPT}), -- Twisted Tranquility
      Spell(21968, {so = true, desc = "召唤3个堕落自然之力为施法者作战，持续1分钟."}), -- Corrupt Forces of Nature
      Stage({
        stype = CREATURE,
        creature = 13743,
        display = 9593,
        name = "腐化的自然之力",
        desc = "没有什么特殊能力.",
      }),
    },
  },
  {
    name = "兰斯利德",
    desc = "这是玛拉顿内部圣地中的第一个boss.",
    --icon = true,
    creature = 12203,
    display = 12293,
    coords = {0.411, 0.489, 2},
    loot = {17943,17734,17736,17737,},
    sections = {
      Spell(5568, {so = true, desc = "对附近的敌人造成普通武器伤害与附加伤害."}), -- Trample
      Spell(18670, {so = true, flag1 = TANK}), -- Knock Away
      Spell(21808, {so = true, desc = "每2秒召唤一次瑟莱德丝碎片，并令一个区域内的敌人昏迷8秒."}), -- Landslide
      Stage({
        stype = CREATURE,
        creature = 11783,
        display = 12310,
        name = "瑟莱德丝碎片",
        sections = {
          Spell(13584, {so = true, desc = "攻击一名敌人，对其造成普通伤害再加上一定量的额外伤害."}), -- Strike
        },
      }),
    },
  },
  {
    name = "工匠吉兹洛克",
    desc = "这是玛拉顿内部圣地中的第二个boss.",
    --icon = true,
    creature = 13601,
    display = 7125,
    coords = {0.505, 0.526, 1},
    loot = {17718,17719,17717,},
    sections = {
      Spell(16100, {so = true, desc = "Shoots at an enemy, inflicting 74 to 87 Physical damage."}), -- Shoot
      Spell(21833, {so = true, desc = "Deals 126 to 154 Fire damage for 8 seconds to all targets in a cone in front of Gizlock. This ability is channeled and has a 10 yards range."}), -- Goblin Dragon Gun
      Spell(9143, {so = true}), -- Bomb
      Spell(29419, {so = true, desc = "Causes all enemies in a 5 yard radius to run away for 10 seconds."}), -- Flash Bomb
    },
  },
  {
    name = "洛特格里普",
    desc = "玛拉顿内部圣地的第三个boss,通常会在杀了瑟莱德丝公主后才解决他,以便节约时间.他生活在瑟莱德丝公主平台下面的水域中,是一只巨大的鳄鱼",
    --icon = true,
    creature = 13596,
    display = 13589,
    coords = {0.413, 0.816, 2},
    loot = {17730,17732,17728,},
    sections = {
      Spell(16495, {so = true}), -- Fatal Bite
      Spell(15976, {so = true, desc = "Inflicts 15 Physical damage to an enemy over 10 seconds, stacks maximum 20 times. At max stacks will deal 300 Physical damage over 10 seconds."}), -- Puncture
    },
  },
  {
    name = "瑟莱德丝公主",
    desc = "在玛拉顿的深处居住着一个邪恶的混乱生物——瑟莱德丝公主,她是一个和上古之神相关的地元素.是四大元素的土领主.又名石母 瑟拉塞恩的第三个女儿.很早以前,她和塞纳留斯的长子扎尔塔结合,他们的后代……被称为半人马.那些半人马杀掉了扎尔塔,并保留了他的遗体.",
    --icon = true,
    creature = 12201,
    display = 12292,
    coords = {0.261, 0.787, 2},
    loot = {17715,17766,17714,17713,17707,17710,17711,17780,},
    sections = {
      Spell(3391, {so = true}), -- Thrash
      Spell(21832, {so = true, icon = "Interface\\Icons\\INV_Stone_10", desc = "对敌人投掷石块,造成280~360点物理伤害,并将其击倒,持续2秒.."}, 1), -- Boulder (triggers 22592)
      Spell(21869, {so = true}), -- Repulsive Gaze
      Spell(21909, {so = true, desc = "震动20码内附近的地面,对敌人造成103-135点伤害，并将他们击退."}), -- Dust Field
    },
  },
})

table.insert(db, MARAUDON)
