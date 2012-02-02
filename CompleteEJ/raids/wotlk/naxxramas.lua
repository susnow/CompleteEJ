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

local NAXXRAMAS = CreateInstance({
  name = "纳克萨玛斯",
  desc = "纳克萨玛斯是位于龙骨荒野上方的一座浮空堡垒.由巫妖王手下具备最高荣誉的首领,巫妖克尔苏加德把守.该副本目前被设计为10人和25人两个难度级别.你需要击败蜘蛛区,瘟疫区,军事区和构造区所有的守关BOSS才能够进入克尔苏加德所在的最终区域",
  --texture = "Naxxramas",
  area = 535,
}, {
  {
    name = "阿努布雷坎",
    desc = "阿努布雷坎(地穴领主)是蜘蛛区的第一个BOSS,借助于天灾军团重新复活的阿努巴拉克最忠实的指挥官之一",
    --icon = true,
    creature = 15956,
    display = 15931,
    --coords = {x, y, level},
    loot = {{39189,N10},{39190,N10},{39146,N10},{39191,N10},{39141,N10},{39703,N25},{39140,N10},{39139,N10},{39193,N10},{39701,N25},{39716,N25},{39192,N10},{39714,N25},{39718,N25},{39712,N25},{39720,N25},{39702,N25},{39706,N25},{39188,N10},{40069,N25},{40074,N25},{39717,N25},{40064,N25},{39721,N25},{40080,N25},{39704,N25},{39719,N25},{40065,N25},{40108,N25},{39722,N25},{40071,N25},{40075,N25},{40107,N25},},
    sections = {
      Spell(56090, {fbd = N25}), -- Impale
      Spell(28783, {fbd = N10}), -- Impale
      Spell(28786, {fbd = N10}), -- Locust Swarm
      Spell(54021, {fbd = N25}), -- Locust Swarm
      Spell(54022, {fbd = N25}), -- Locust Swarm
      Spell(28785, {fbd = N10}), -- Locust Swarm
    },
  },
  {
    name = "黑女巫法琳娜",
    desc = "黑女巫法琳娜是蜘蛛区第二个BOSS,负责为天灾军团制作毒药武器",
    --icon = true,
    creature = 15953,
    display = 15940,
    coords = {0.448, 0.360, 2},
    loot = {{39216,N10},{39198,N10},{39196,N10},{39197,N10},{39200,N10},{39724,N25},{39217,N10},{39215,N10},{39199,N10},{39735,N25},{39726,N25},{39195,N10},{39756,N25},{39757,N25},{39733,N25},{39727,N25},{39729,N25},{39723,N25},{39194,N10},{40074,N25},{39731,N25},{40065,N25},{39728,N25},{40075,N25},{39725,N25},{40064,N25},{39730,N25},{40108,N25},{39734,N25},{40069,N25},{39732,N25},{40080,N25},{40071,N25},{40107,N25},},
    sections = {
      Spell(54100, {fbd = N25}), -- Frenzy
      Spell(28798, {fbd = N10}), -- Frenzy
      Spell(54098, {fbd = N25, flag1 = POISON}), -- Poison Bolt Volley
      Spell(28796, {fbd = N10, flag1 = POISON}), -- Poison Bolt Volley
      Spell(28794, {fbd = N10}), -- Rain of Fire
      Spell(54099, {fbd = N25}), -- Rain of Fire
    },
  },
  {
    name = "迈克斯纳",
    desc = "迈克斯纳是蜘蛛区的守关BOSS,为天灾军团抚育蜘蛛军队",
    --icon = true,
    creature = 15952,
    display = 15928,
    coords = {0.696, 0.160, 2},
    loot = {{39225,N10},{39226,N10},{39232,N10},{39231,N10},{39228,N10},{39766,N25},{39230,N10},{39233,N10},{39229,N10},{39758,N25},{39764,N25},{39221,N10},{39768,N25},{40060,N25},{39759,N25},{40062,N25},{39762,N25},{40063,N25},{39224,N10},{40250,N25},{39767,N25},{40253,N25},{39763,N25},{40254,N25},{40061,N25},{40252,N25},{39761,N25},{40256,N25},{39765,N25},{40255,N25},{39760,N25},{40257,N25},{40251,N25},{40258,N25},},
    sections = {
      Spell(54123, {fbd = N10}), -- Frenzy
      Spell(54124, {fbd = N25}), -- Frenzy
      Spell(28776, {fbd = N25, flag1 = POISON}), -- Necrotic Poison
      Spell(54121, {fbd = N10, flag1 = POISON}), -- Necrotic Poison
      Spell(54121, {fbd = N25, flag1 = POISON}), -- Necrotic Poison
      Spell(28741, {fbd = N10}), -- Poison Shock
      Spell(28741, {fbd = N25}), -- Poison Shock
      Spell(54122, {fbd = N25}), -- Poison Shock
      Spell(54125, {fbd = N25}), -- Web Spray
      Spell(29484, {fbd = N10}), -- Web Spray
    },
  },
  {
    name = "瘟疫使者诺斯",
    desc = "瘟疫使者诺斯是瘟疫区的第一名BOSS,他使用瘟疫,将活人的灵魂转化为天灾的部队.",
    --icon = true,
    creature = 15954,
    display = 16590,
    coords = {0.350, 0.566, 4},
    loot = {{39244,N10},{39243,N10},{39235,N10},{39240,N10},{39234,N10},{40198,N25},{39237,N10},{39236,N10},{39239,N10},{40184,N25},{40185,N25},{39242,N10},{40602,N25},{40193,N25},{40192,N25},{40197,N25},{40186,N25},{40188,N25},{39241,N10},{40074,N25},{40187,N25},{40065,N25},{40191,N25},{40108,N25},{40196,N25},{40080,N25},{40189,N25},{40075,N25},{40190,N25},{40107,N25},{40200,N25},{40064,N25},{40071,N25},{40069,N25},},
    sections = {
      Spell(29209, {fbd = N25}), -- Blink
      Spell(29210, {fbd = N25}), -- Blink
      Spell(29208, {fbd = N25}), -- Blink
      Spell(29211, {fbd = N25}), -- Blink
      Spell(54814, {fbd = N25, flag1 = MAGIC}), -- Cripple
      Spell(29212, {fbd = N10, flag1 = MAGIC}), -- Cripple
      Spell(29212, {fbd = N25, flag1 = MAGIC}), -- Cripple
      Spell(54835, {fbd = N25, flag1 = CURSE}), -- Curse of the Plaguebringer
      Spell(29213, {fbd = N10, flag1 = CURSE}), -- Curse of the Plaguebringer
      Spell(29214, {fbd = N10}), -- Wrath of the Plaguebringer
      Spell(54836, {fbd = N25}), -- Wrath of the Plaguebringer
    },
  },
  {
    name = "肮脏的希尔盖",
    desc = "肮脏的希尔盖是瘟疫区的第二个BOSS,他计划将艾泽拉斯的土地全部转变成提炼瘟疫的瘟疫大锅.",
    --icon = true,
    creature = 15936,
    display = 16309,
    coords = {0.510, 0.424, 4},
    loot = {{39248,N10},{39250,N10},{39249,N10},{39252,N10},{39254,N10},{40208,N25},{39246,N10},{39255,N10},{39251,N10},{40233,N25},{40201,N25},{39245,N10},{40236,N25},{40209,N25},{40203,N25},{40234,N25},{40237,N25},{40238,N25},{39247,N10},{40250,N25},{40204,N25},{40256,N25},{40207,N25},{40257,N25},{40210,N25},{40258,N25},{40205,N25},{40253,N25},{40235,N25},{40255,N25},{40206,N25},{40252,N25},{40254,N25},{40251,N25},},
    sections = {
      Spell(55011, {fbd = N25, flag1 = DISEASE}), -- Decrepit Fever
      Spell(29998, {fbd = N10, flag1 = DISEASE}), -- Decrepit Fever
      Spell(29310, {fbd = N10}), -- Spell Disruption
      Spell(29310, {fbd = N25}), -- Spell Disruption
    },
  },
  {
    name = "洛欧塞布",
    desc = "洛欧塞布是瘟疫区的最后守关BOSS,是艾泽拉斯沼泽巨兽与天灾瘟疫的产品.它携带的瘟疫具有遏制任何治愈法术的能力",
    --icon = true,
    creature = 16011,
    display = 16110,
    coords = {0.750, 0.284, 4},
    loot = {{40240,N25},{40624,N10},{39257,N10},{39256,N10},{39259,N10},{40245,N25},{40622,N10},{40623,N10},{40247,N25},{39260,N10},{40244,N25},{40249,N25},{40242,N25},{40239,N25},{39258,N10},{40243,N25},{40638,N25},{40241,N25},{40637,N25},{40246,N25},{40639,N25},},
    sections = {
      Spell(29865, {fbd = N10}), -- Deathbloom
      Spell(55053, {fbd = N25}), -- Deathbloom
      Spell(29204, {fbd = N10}), -- Inevitable Doom
      Spell(55052, {fbd = N25}), -- Inevitable Doom
      Spell(55593, {fbd = N10}), -- Necrotic Aura
      Spell(55593, {fbd = N25}), -- Necrotic Aura
      Spell(29234, {fbd = N10}), -- Summon Spore
      Spell(29234, {fbd = N25}), -- Summon Spore
    },
  },
  {
    name = "教官拉苏维奥斯",
    desc = "教官拉苏维奥斯是军事区的第一名BOSS,负责为天灾军团训练死亡骑士.他的攻击无比强大,只有他的弟子才能承受的住他的攻击",
    --icon = true,
    creature = 16061,
    display = 16582,
    coords = {0.422, 0.442, 3},
    loot = {{39310,N10},{39307,N10},{39296,N10},{39308,N10},{39297,N10},{40317,N25},{39306,N10},{39309,N10},{39298,N10},{40321,N25},{40319,N25},{39299,N10},{40327,N25},{40305,N25},{40316,N25},{40326,N25},{40315,N25},{40324,N25},{39311,N10},{40108,N25},{40325,N25},{40064,N25},{40320,N25},{40071,N25},{40306,N25},{40080,N25},{40318,N25},{40074,N25},{40322,N25},{40065,N25},{40323,N25},{40075,N25},{40107,N25},{40069,N25},},
    sections = {
      Spell(29107, {fbd = N25}), -- Disrupting Shout
      Spell(55543, {fbd = N10}), -- Disrupting Shout
      Spell(29125, {fbd = N10}), -- Hopeless
      Spell(29125, {fbd = N25}), -- Hopeless
      Spell(55550, {fbd = N10}), -- Jagged Knife
      Spell(55550, {fbd = N25}), -- Jagged Knife
      Spell(55470, {fbd = N10}), -- Unbalancing Strike
      Spell(55470, {fbd = N25}), -- Unbalancing Strike
    },
  },
  {
    name = "收割者戈提克",
    desc = "收割者戈提克是军事区的第二名BOSS,他使用巫术和咒语源源不断的召唤出天灾将士,为天灾军团补充军备.",
    --icon = true,
    creature = 16060,
    display = 16279,
    coords = {0.672, 0.546, 3},
    loot = {{39369,N10},{39390,N10},{39344,N10},{39389,N10},{39379,N10},{40329,N25},{39391,N10},{39392,N10},{39345,N10},{40339,N25},{40338,N25},{39386,N10},{40328,N25},{40336,N25},{40333,N25},{40340,N25},{40331,N25},{40332,N25},{39388,N10},{40254,N25},{40341,N25},{40253,N25},{40334,N25},{40251,N25},{40330,N25},{40257,N25},{40342,N25},{40252,N25},{40337,N25},{40258,N25},{40335,N25},{40255,N25},{40256,N25},{40250,N25},},
    sections = {
      Spell(28679, {fbd = N10}), -- Harvest Soul
      Spell(28679, {fbd = N25}), -- Harvest Soul
      Spell(29317, {fbd = N10}), -- Shadow Bolt
      Spell(56405, {fbd = N25}), -- Shadow Bolt
    },
  },
  {
    name = "帕奇维克",
    desc = "帕奇维克是构造区的第一名BOSS,除非你亲眼所见,否则你绝对不会相信,如此高速和强有力的攻击是出自一个巨大的憎恶之手",
    --icon = true,
    creature = 16028,
    display = 16174,
    coords = {0.538, 0.458, 1},
    loot = {{39274,N10},{39262,N10},{39271,N10},{39272,N10},{39273,N10},{40264,N25},{39267,N10},{40270,N25},{40265,N25},{39275,N10},{40271,N25},{40268,N25},{40259,N25},{40260,N25},{40262,N25},{39261,N10},{40267,N25},{40272,N25},{39270,N10},{40065,N25},{40071,N25},{40269,N25},{40108,N25},{40261,N25},{40064,N25},{40263,N25},{40266,N25},{40080,N25},{40069,N25},{40273,N25},{40107,N25},{40075,N25},{40074,N25},},
    sections = {
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(26662, {fbd = N25}), -- Berserk
      Spell(28131, {fbd = N10}), -- Frenzy
      Spell(28131, {fbd = N25}), -- Frenzy
    },
  },
  {
    name = "格罗布鲁斯",
    desc = "格罗布鲁斯,他的变异注射将会使被注射者收到辐射的影响,分离出携带剧毒的软泥怪",
    --icon = true,
    creature = 15931,
    display = 16035,
    coords = {0.614, 0.516, 1},
    loot = {{39276,N10},{39280,N10},{39278,N10},{39283,N10},{39284,N10},{40282,N25},{39282,N10},{39279,N10},{39285,N10},{40351,N25},{40283,N25},{39281,N10},{40284,N25},{40288,N25},{40278,N25},{40289,N25},{40285,N25},{40277,N25},{39277,N10},{40257,N25},{40274,N25},{40250,N25},{40275,N25},{40258,N25},{40280,N25},{40253,N25},{40279,N25},{40256,N25},{40281,N25},{40252,N25},{40287,N25},{40254,N25},{40251,N25},{40255,N25},},
    sections = {
      Spell(28280, {fbd = N10}), -- Bombard Slime
      Spell(28280, {fbd = N25}), -- Bombard Slime
      Spell(28169, {fbd = N10, flag1 = DISEASE}), -- Mutating Injection
      Spell(28169, {fbd = N25, flag1 = DISEASE}), -- Mutating Injection
      Spell(28240, {fbd = N10}), -- Poison Cloud
      Spell(28240, {fbd = N25}), -- Poison Cloud
      Spell(54364, {fbd = N25}), -- Slime Spray
      Spell(28157, {fbd = N10}), -- Slime Spray
      Spell(28137, {fbd = N10}), -- Slime Stream
      Spell(28137, {fbd = N25}), -- Slime Stream
    },
  },
  {
    name = "格拉斯",
    desc = "格拉斯是构造区第三名BOSS,纳克萨玛斯的瘟疫犬.它十分贪吃,由于活人的数量已经满足不了它的食欲了,它甚至开始食用一些低等级的亡灵僵尸",
    --icon = true,
    creature = 15932,
    display = 16064,
    coords = {0.484, 0.472, 1},
    loot = {{40635,N25},{39274,N10},{39291,N10},{39240,N10},{39231,N10},{40625,N25},{39226,N10},{40634,N25},{39248,N10},{39345,N10},{40638,N25},{39281,N10},{39199,N10},{40637,N25},{40639,N25},{39379,N10},{40627,N25},{39297,N10},{40636,N25},{40626,N25},{40623,N10},{39258,N10},{39388,N10},{40612,N10},{40624,N10},{40622,N10},{40610,N10},{40619,N10},{40620,N10},{40611,N10},{40621,N10},},
    sections = {
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(26662, {fbd = N25}), -- Berserk
      Spell(28371, {fbd = N10}), -- Enrage
      Spell(54427, {fbd = N25}), -- Enrage
      Spell(54378, {fbd = N10}), -- Mortal Wound
      Spell(54378, {fbd = N25}), -- Mortal Wound
      Spell(20477, {fbd = N10}), -- Summon Player
      Spell(20477, {fbd = N25}), -- Summon Player
    },
  },
  {
    name = "塔迪乌斯",
    desc = "塔迪乌斯是构造区的守关BOSS,这个缝补构造体是由女人和孩子的肉缝补而成的",
    --icon = true,
    creature = 15928,
    display = 16137,
    coords = {0.268, 0.148, 1},
    loot = {{39295,N10},{39294,N10},{40296,N25},{40303,N25},{40620,N10},{40298,N25},{40619,N10},{40304,N25},{39291,N10},{39293,N10},{40301,N25},{40621,N10},{40294,N25},{40299,N25},{39292,N10},{40300,N25},{40634,N25},{40302,N25},{40635,N25},{40297,N25},{40636,N25},},
    sections = {
      Spell(28299, {fbd = N10}), -- Ball Lightning
      Spell(28299, {fbd = N25}), -- Ball Lightning
      Spell(27680, {fbd = N10}), -- Berserk
      Spell(27680, {fbd = N25}), -- Berserk
      Spell(54531, {fbd = N25}), -- Chain Lightning
      Spell(28167, {fbd = N10}), -- Chain Lightning
      Spell(28089, {fbd = N10}), -- Polarity Shift
      Spell(28089, {fbd = N25}), -- Polarity Shift
    },
  },
  {
    name = "萨菲隆",
    desc = "萨菲隆是守卫在克尔苏加德之前的冰霜巨龙,她掉落的聚焦之虹是开启永恒之眼的钥匙.萨菲隆曾经是一条蓝龙,被阿尔萨斯在诺森德杀死后复活成冰霜巨龙,并且安插在纳克萨玛斯作为克尔苏加德的守卫",
    --icon = true,
    creature = 15989,
    display = 16033,
    coords = {0.564, 0.650, 6},
    loot = {{44577,N25},{39399,N10},{39415,N10},{39409,N10},{44569,N10},{39405,N10},{39403,N10},{40363,N25},{39407,N10},{39398,N10},{39401,N10},{40380,N25},{39408,N10},{40379,N25},{40375,N25},{40370,N25},{40372,N25},{40382,N25},{39404,N10},{40378,N25},{40377,N25},{40381,N25},{40369,N25},{40367,N25},{40376,N25},{40366,N25},{40373,N25},{40362,N25},{40365,N25},{40368,N25},{40374,N25},{40371,N25},},
    sections = {
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(26662, {fbd = N25}), -- Berserk
      Spell(19983, {fbd = N10}), -- Cleave
      Spell(19983, {fbd = N25}), -- Cleave
      Spell(28531, {fbd = N10}), -- Frost Aura
      Spell(55799, {fbd = N25}), -- Frost Aura
      Spell(28524, {fbd = N10}), -- Frost Breath
      Spell(28524, {fbd = N25}), -- Frost Breath
      Spell(29318, {fbd = N10}), -- Frost Breath
      Spell(29318, {fbd = N25}), -- Frost Breath
      Spell(28522, {fbd = N10}), -- Icebolt
      Spell(28522, {fbd = N25}), -- Icebolt
      Spell(28542, {fbd = N10, flag1 = CURSE}), -- Life Drain
      Spell(55665, {fbd = N25, flag1 = CURSE}), -- Life Drain
      Spell(28560, {fbd = N10}), -- Summon Blizzard
      Spell(28560, {fbd = N25}), -- Summon Blizzard
      Spell(55696, {fbd = N25}), -- Tail Sweep
      Spell(55697, {fbd = N10}), -- Tail Sweep
    },
  },
  {
    name = "克尔苏加德",
    desc = "克尔苏加德,纳克萨玛斯的最终BOSS.诅咒神教的创始人.他曾经是肯瑞托的大魔法师,因为不满肯瑞托对其研究亡灵巫术的限制,投靠与耐奥祖,现效忠于巫妖王",
    --icon = true,
    creature = 15990,
    display = 15945,
    --coords = {x, y, level},
    loot = {{40618,N10},{40633,N25},{39424,N10},{39422,N10},{39426,N10},{39421,N10},{39419,N10},{39416,N10},{40631,N25},{40617,N10},{39420,N10},{40616,N10},{40384,N25},{40395,N25},{39423,N10},{40383,N25},{39425,N10},{40400,N25},{40632,N25},{40388,N25},{39417,N10},{40405,N25},{40398,N25},{40402,N25},{40386,N25},{40403,N25},{40399,N25},{40385,N25},{40387,N25},{40396,N25},{40401,N25},},
    sections = {
      Spell(28498, {fbd = N10}), -- Berserk
      Spell(28410, {fbd = N25}), -- Chains of Kel'Thuzad
      Spell(28408, {fbd = N25}), -- Chains of Kel'Thuzad
      Spell(27819, {fbd = N10}), -- Detonate Mana
      Spell(27819, {fbd = N25}), -- Detonate Mana
      Spell(27808, {fbd = N10}), -- Frost Blast
      Spell(27808, {fbd = N25}), -- Frost Blast
      Spell(55802, {fbd = N25, flag1 = MAGIC}), -- Frostbolt
      Spell(28478, {fbd = N10, flag1 = MAGIC}), -- Frostbolt
      Spell(28479, {fbd = N10, flag1 = MAGIC}), -- Frostbolt
      Spell(55807, {fbd = N25, flag1 = MAGIC}), -- Frostbolt
      Spell(27810, {fbd = N10}), -- Shadow Fissure
      Spell(27810, {fbd = N25}), -- Shadow Fissure
    },
  },
  -- {
    -- name = "Kel'Thuzad",
    -- desc = "Archlich Kel'Thuzad is the final boss of Naxxramas. Commander Eligor Dawnbringer says about him: He serves the Lich King without question, a necromancer of great prowess in life, turned to a master of necromancy after his death. It is said he is the most loyal of the Lich King's subjects.",
    --icon = true,
    -- creature = 15990,
    -- display = 15945,
    --coords = {x, y, level},
    -- loot = {{40618,N10},{40633,N25},{39424,N10},{39422,N10},{39426,N10},{39421,N10},{39419,N10},{39416,N10},{40631,N25},{40617,N10},{39420,N10},{40616,N10},{40384,N25},{40395,N25},{39423,N10},{40383,N25},{39425,N10},{40400,N25},{40632,N25},{40388,N25},{39417,N10},{40405,N25},{40398,N25},{40402,N25},{40386,N25},{40403,N25},{40399,N25},{40385,N25},{40387,N25},{40396,N25},{40401,N25},},
    -- sections = {
      -- Spell(28498, {fbd = N10}), -- Berserk
      -- Spell(28410, {fbd = N25}), -- Chains of Kel'Thuzad
      -- Spell(28408, {fbd = N25}), -- Chains of Kel'Thuzad
      -- Spell(27819, {fbd = N10}), -- Detonate Mana
      -- Spell(27819, {fbd = N25}), -- Detonate Mana
      -- Spell(27808, {fbd = N10}), -- Frost Blast
      -- Spell(27808, {fbd = N25}), -- Frost Blast
      -- Spell(55802, {fbd = N25, flag1 = MAGIC}), -- Frostbolt
      -- Spell(28478, {fbd = N10, flag1 = MAGIC}), -- Frostbolt
      -- Spell(28479, {fbd = N10, flag1 = MAGIC}), -- Frostbolt
      -- Spell(55807, {fbd = N25, flag1 = MAGIC}), -- Frostbolt
      -- Spell(27810, {fbd = N10}), -- Shadow Fissure
      -- Spell(27810, {fbd = N25}), -- Shadow Fissure
    -- },
  -- },
})

table.insert(db, NAXXRAMAS)
