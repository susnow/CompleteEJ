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

local ULDUAR = CreateInstance({
  name = "奥杜尔",
  desc = "奥杜尔是位于风暴群山的一个副本,是泰坦囚禁上古之神的监狱.由上古之神尤格萨隆以及泰坦位于艾泽拉斯的使者观察者看守",
  --texture = "Ulduar",
  area = 529,
}, {
  {
    name = "烈焰巨兽",
    desc = "烈焰巨兽是奥杜尔的守门BOSS,由发明家米米尔隆设计制造,烈焰巨兽也是他V0-L7R-0N装甲机械的一个组成部分",
    --icon = true,
    creature = 33113,
    display = 28875,
    coords = {0.492, 0.462, 1},
    loot = {{45297,N10},{45100,N10},{45100,N25},{45088,N10},{45088,N25},{45104,N10},{45104,N25},{45097,N10},{45097,N25},{45089,N10},{45089,N25},{45090,N10},{45096,N10},{45096,N25},{45114,N25},{45095,N10},{45095,N25},{45113,N25},{45099,N10},{45099,N25},{45119,N25},{45106,N25},{45086,N25},{45110,N25},{45117,N25},{45094,N10},{45115,N25},{45109,N25},{45108,N25},{45091,N10},{45091,N25},{45112,N25},{45116,N25},{45038,N25},{45118,N25},{45107,N25},{45105,N10},{45105,N25},{45132,N25},{45092,N10},{45092,N25},{45135,N25},{45134,N25},{45133,N25},{45093,N10},{45093,N25},{45136,N25},{45111,N25},{46348,N25},{45300,N10},{45293,N10},{45296,N10},{45283,N10},{45288,N10},{45289,N10},{45287,N10},{45285,N10},{45295,N10},{45284,N10},{45291,N10},{45282,N10},{45292,N10},{45087,N10},{45087,N25},{45286,N10},},
    sections = {
      Spell(62376, {fbd = N10}), -- Battering Ram
      Spell(62376, {fbd = N25}), -- Battering Ram
      Spell(62396, {fbd = N10}), -- Flame Vents
      Spell(62396, {fbd = N25}), -- Flame Vents
      Spell(62400, {fbd = N10}), -- Missile Barrage
      Spell(62400, {fbd = N25}), -- Missile Barrage
      Spell(63618, {fbd = N10}), -- Overload
      Spell(63618, {fbd = N25}), -- Overload
      Spell(62374, {fbd = N10}), -- Pursued
      Spell(62374, {fbd = N25}), -- Pursued
      Spell(62475, {fbd = N10}), -- Systems Shutdown
      Spell(62475, {fbd = N25}), -- Systems Shutdown
    },
  },
  {
    name = "掌炉者伊格尼斯",
    desc = "掌炉者伊格尼斯,现在隶属上古之神尤格萨隆的靡下.这位熔岩巨人召唤出钢铁巨人军队,为尤格萨隆企图毁灭艾泽拉斯的计划服务",
    --icon = true,
    creature = 33118,
    display = 29185,
    coords = {0.368, 0.264, 1},
    loot = {{45309,N10},{45170,N25},{45162,N25},{45314,N10},{45158,N25},{45312,N10},{45165,N25},{45187,N25},{45167,N25},{45166,N25},{45316,N10},{45171,N25},{45157,N25},{45186,N25},{45161,N25},{45310,N10},{45087,N25},{45168,N25},{45038,N25},{45317,N10},{45164,N25},{45321,N10},{46348,N25},{45311,N10},{45318,N10},{45313,N10},{45185,N25},{45169,N25},},
    sections = {
      Spell(62488, {fbd = N10}), -- Activate Construct
      Spell(62488, {fbd = N25}), -- Activate Construct
      Spell(63472, {fbd = N25}), -- Flame Jets
      Spell(62680, {fbd = N10}), -- Flame Jets
      Spell(62546, {fbd = N10}), -- Scorch
      Spell(63474, {fbd = N25}), -- Scorch
    },
  },
  {
    name = "锋鳞",
    desc = "作为曾经是元龙的生物,在被洛肯抓获后被改造成邪恶的作战武器.同时洛肯还命令掌炉者伊格尼斯为锋鳞铸造了萨隆邪铁护甲,使锋鳞具备了更致命的作战能力",
    --icon = true,
    creature = 33186,
    display = 28787,
    coords = {0.532, 0.264, 1},
    loot = {{45304,N10},{45303,N10},{45308,N10},{45307,N10},{45301,N10},{45142,N25},{45298,N10},{45302,N10},{45140,N25},{45148,N25},{45306,N10},{45147,N25},{45510,N25},{45305,N10},{45141,N25},{45144,N25},{45150,N25},{45299,N10},{45151,N25},{45139,N25},{45149,N25},{45143,N25},{45087,N25},{45137,N25},{45138,N25},{45146,N25},{45038,N25},},
    sections = {
      Spell(47008, {fbd = N10}), -- Berserk
      Spell(47008, {fbd = N25}), -- Berserk
      Spell(63236, {fbd = N10}), -- Devouring Flame
      Spell(63236, {fbd = N25}), -- Devouring Flame
      Spell(63815, {fbd = N25}), -- Fireball
      Spell(62796, {fbd = N10}), -- Fireball
      Spell(62796, {fbd = N25}), -- Fireball
      Spell(64021, {fbd = N25}), -- Flame Breath
      Spell(63317, {fbd = N10}), -- Flame Breath
      Spell(64771, {fbd = N10}), -- Fuse Armor
      Spell(64771, {fbd = N25}), -- Fuse Armor
      Spell(101163, {fbd = N10}), -- General Trigger 221 to Self
      Spell(62666, {fbd = N10}), -- Wing Buffet
      Spell(62666, {fbd = N25}), -- Wing Buffet
    },
  },
  {
    name = "XT-002拆解者",
    desc = "这个位于奥杜尔废料场区域的巨大机器人是由发明家米米尔隆设计并制造的.由于XT-002认定自己是发明家的儿子,所以它有的时候的表现会像一个小孩子(发脾气)",
    --icon = true,
    creature = 33293,
    display = 28611,
    coords = {0.484, 0.134, 1},
    loot = {{45686,N10},{45867,N10},{45868,N10},{45676,N10},{45871,N10},{45870,N10},{45869,N10},{45680,N10},{45250,N25},{45675,N10},{45256,N25},{45249,N25},{45258,N25},{45251,N25},{45247,N25},{45254,N25},{45253,N25},{45260,N25},{45682,N10},{45257,N25},{45087,N25},{45685,N10},{45246,N25},{45259,N25},{45038,N25},{45255,N25},{45677,N10},{45252,N25},{45248,N25},{45679,N10},{45445,N25},{45444,N25},{45443,N25},{45687,N10},{45446,N25},{45694,N10},{45442,N25},},
    sections = {
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(26662, {fbd = N25}), -- Berserk
      Spell(64234, {fbd = N25}), -- Gravity Bomb
      Spell(63024, {fbd = N10}), -- Gravity Bomb
      Spell(64193, {fbd = N25}), -- Heartbreak
      Spell(65737, {fbd = N10}), -- Heartbreak
      Spell(65121, {fbd = N25}), -- Searing Light
      Spell(63018, {fbd = N10}), -- Searing Light
      Spell(62776, {fbd = N10}), -- Tympanic Tantrum
      Spell(62776, {fbd = N25}), -- Tympanic Tantrum
      Spell(62775, {fbd = N10}), -- Tympanic Tantrum
      Spell(62775, {fbd = N25}), -- Tympanic Tantrum
    },
  },
  {
    name = "唤雷者布隆迪尔",
    desc = "钢铁议会是由三个统领钢铁军队的首领组成的,分别代表不同的种族.他们分别是符文大师莫尔基姆,唤雷者布隆迪尔,以及断钢者",
    --icon = true,
    creature = 32857,
    display = 28324,
    coords = {0.166, 0.562, 1},
    loot = {{45418,N10},{45329,N10},{45423,N10},{45324,N10},{45332,N10},{45238,N25},{45333,N10},{45378,N10},{45232,N25},{45330,N10},{45228,N25},{45237,N25},{45322,N10},{45236,N25},{45193,N25},{45234,N25},{45087,N25},{45226,N25},{45331,N10},{45225,N25},{45038,N25},{45235,N25},{45239,N25},{45227,N25},{45224,N25},{45240,N25},{45233,N25},{46348,N25},},
    sections = {
      Spell(61879, {fbd = N10}), -- Chain Lightning
      Spell(61879, {fbd = N25}), -- Chain Lightning
      Spell(63479, {fbd = N25}), -- Chain Lightning
      Spell(63486, {fbd = N25}), -- Lightning Tendrils
      Spell(61887, {fbd = N10}), -- Lightning Tendrils
      Spell(61915, {fbd = N10}), -- Lightning Whirl
      Spell(61915, {fbd = N25}), -- Lightning Whirl
      Spell(63483, {fbd = N25}), -- Lightning Whirl
      Spell(63481, {fbd = N25}), -- Overload
      Spell(61878, {fbd = N10}), -- Overload
      Spell(61878, {fbd = N25}), -- Overload
      Spell(61869, {fbd = N10}), -- Overload
      Spell(61869, {fbd = N25}), -- Overload
      Spell(64187, {fbd = N10}), -- Stormshield
      Spell(64187, {fbd = N25}), -- Stormshield
      Spell(61920, {fbd = N10}), -- Supercharge
      Spell(61920, {fbd = N25}), -- Supercharge
    },
  },
  {
    name = "科隆加恩",
    desc = "科隆加恩是被洛肯征用的一个巨人首领,位于破碎通道的入口.这个巨人使用巨大的双手作为武器,可以轻松的粉碎任何试图进入中心圣地的入侵者",
    --icon = true,
    creature = 32930,
    display = 28638,
    coords = {0.370, 0.116, 1},
    loot = {{45701,N10},{45703,N10},{45704,N10},{45698,N10},{45695,N10},{45270,N25},{45696,N10},{45702,N10},{45700,N10},{45264,N25},{45269,N25},{45699,N10},{45272,N25},{45087,N25},{45262,N25},{45271,N25},{45263,N25},{45697,N10},{45261,N25},{45275,N25},{45273,N25},{45267,N25},{45265,N25},{45274,N25},{45268,N25},{45266,N25},{45038,N25},},
    sections = {
      Spell(62055, {fbd = N10}), -- Brittle Skin
      Spell(62055, {fbd = N25}), -- Brittle Skin
      Spell(64006, {fbd = N25}), -- One-Armed Overhead Smash
      Spell(63573, {fbd = N10}), -- One-Armed Overhead Smash
      Spell(63356, {fbd = N10}), -- Overhead Smash
      Spell(64003, {fbd = N25}), -- Overhead Smash
      Spell(62030, {fbd = N10}), -- Petrifying Breath
      Spell(62030, {fbd = N25}), -- Petrifying Breath
      Spell(63980, {fbd = N25}), -- Petrifying Breath
      Spell(62166, {fbd = N10}), -- Stone Grip
      Spell(63981, {fbd = N25}), -- Stone Grip
      Spell(64005, {fbd = N25}), -- Stone Shout
      Spell(63716, {fbd = N10}), -- Stone Shout
    },
  },
  {
    name = "欧尔莉亚",
    desc = "欧尔莉亚带领着她的凶猛的小猫在奥杜尔圆环的通道上巡逻.在久远的岁月里,上古之神的邪恶力量已经完全摧毁了她的心智.",
    --icon = true,
    creature = 33515,
    display = 28651,
    coords = {0.552, 0.718, 2},
    loot = {{45709,N10},{45712,N10},{45708,N10},{45832,N10},{45713,N10},{45319,N25},{45864,N10},{45325,N25},{45434,N25},{45087,N25},{45711,N10},{45865,N10},{45439,N25},{45436,N25},{45438,N25},{45315,N25},{45334,N25},{45707,N10},{45437,N25},{45440,N25},{45866,N10},{45326,N25},{45320,N25},{45038,N25},{45435,N25},{45327,N25},{45441,N25},{46027,N25},},
    sections = {
      Spell(47008, {fbd = N10}), -- Berserk
      Spell(47008, {fbd = N25}), -- Berserk
      Spell(64396, {fbd = N10}), -- Guardian Swarm
      Spell(64396, {fbd = N25}), -- Guardian Swarm
      Spell(64389, {fbd = N10}), -- Sentinel Blast
      Spell(64678, {fbd = N25}), -- Sentinel Blast
      Spell(64392, {fbd = N10}), -- Sentinel Blast
      Spell(64679, {fbd = N25}), -- Sentinel Blast
      Spell(64422, {fbd = N10}), -- Sonic Screech
      Spell(64688, {fbd = N25}), -- Sonic Screech
      Spell(64386, {fbd = N10, flag1 = MAGIC}), -- Terrifying Screech
      Spell(64386, {fbd = N25, flag1 = MAGIC}), -- Terrifying Screech
    },
  },
  {
    name = "芙蕾雅",
    desc = "带领亮叶长者,铁树长者,石皮长者的芙蕾雅前身是万物的保护神.虽然目前她的温室中依然到处存在着生命的迹象,但是现在她也屈服于上古之神的意志",
    --icon = true,
    creature = 32906,
    display = 28777,
    coords = {0.526, 0.256, 2},
    loot = {{45481,N25},{45487,N25},{45098,N10},{45098,N25},{45486,N25},{45099,N10},{45099,N25},{45613,N25},{45485,N25},{45102,N10},{45102,N25},{45100,N10},{45100,N25},{45092,N10},{45092,N25},{45488,N25},{45104,N10},{45104,N25},{45484,N25},{45095,N10},{45095,N25},{45038,N25},{45091,N10},{45091,N25},{45094,N10},{45094,N25},{45088,N10},{45088,N25},{45096,N10},{45096,N25},{45479,N25},{45090,N10},{45090,N25},{45482,N25},{45089,N10},{45654,N25},{45103,N10},{45483,N25},{45097,N10},{45097,N25},{45653,N25},{45093,N10},{45093,N25},{45105,N10},{45655,N25},{45480,N25},{45101,N10},{45101,N25},{45947,N10},{45087,N10},{45087,N25},{45946,N10},{45294,N10},{45945,N10},{45943,N10},{45940,N10},{46110,N10},{46110,N25},{45941,N10},{45935,N10},{45936,N10},{45645,N10},{45644,N10},{45646,N10},{45934,N10},},
    sections = {
      Spell(62519, {fbd = N10}), -- Attuned to Nature
      Spell(62519, {fbd = N25}), -- Attuned to Nature
      Spell(47008, {fbd = N10}), -- Berserk
      Spell(47008, {fbd = N25}), -- Berserk
      Spell(62437, {fbd = N10}), -- Ground Tremor
      Spell(62859, {fbd = N25}), -- Ground Tremor
      Spell(62678, {fbd = N10}), -- Summon Allies of Nature
      Spell(62678, {fbd = N25}), -- Summon Allies of Nature
      Spell(62623, {fbd = N10}), -- Sunbeam
      Spell(62872, {fbd = N25}), -- Sunbeam
      Spell(62892, {fbd = N25}), -- Touch of Eonar
      Spell(62528, {fbd = N10}), -- Touch of Eonar
    },
  },
  {
    name = "霍迪尔",
    desc = "霍迪尔是居住在风暴群山的冰霜巨人.具有能够召唤寒风的力量,尤格萨隆控制了他的意志使霍迪尔为尤格萨隆服务",
    --icon = true,
    creature = 32845,
    display = 28743,
    coords = {0.666, 0.630, 2},
    loot = {{45651,N10},{45454,N25},{45453,N25},{45652,N10},{45450,N25},{45650,N10},{45872,N10},{45451,N25},{45464,N10},{45038,N25},{45873,N10},{45874,N10},{45458,N10},{45633,N25},{45634,N25},{45452,N25},{45087,N25},{45632,N25},},
    sections = {
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(26662, {fbd = N25}), -- Berserk
      Spell(62038, {fbd = N10}), -- Biting Cold
      Spell(62038, {fbd = N25}), -- Biting Cold
      Spell(61968, {fbd = N10}), -- Flash Freeze
      Spell(61968, {fbd = N25}), -- Flash Freeze
      Spell(62469, {fbd = N10, flag1 = MAGIC}), -- Freeze
      Spell(62469, {fbd = N25, flag1 = MAGIC}), -- Freeze
      Spell(63512, {fbd = N25}), -- Frozen Blows
      Spell(62478, {fbd = N10}), -- Frozen Blows
    },
  },
  {
    name = "米米尔隆",
    desc = "驾驶着巨兽MK II VX- 001空中指挥单位的米米尔隆是一个伟大的发明家.米米尔隆一直以来是艾泽拉斯最顶尖的机械发明者,不过在受到洛肯的巫蛊之后,他开始只制造战争兵器了",
    --icon = true,
    creature = 33350,
    display = 28578,
    coords = {0.436, 0.400, 4},
    loot = {{45649,N10},{45491,N25},{45974,N10},{45976,N10},{45038,N25},{45647,N10},{45989,N10},{45663,N25},{45973,N10},{45990,N10},{45972,N10},{45490,N25},{45993,N10},{45988,N10},{45620,N25},{45648,N10},{45982,N10},{45494,N25},{45495,N25},{45096,N25},{45497,N25},{45975,N10},{45641,N25},{45087,N25},{45493,N25},{45489,N25},{45496,N25},{45642,N25},{45492,N25},{45643,N25},},
    sections = {
      Spell(63341, {fbd = N10}), -- Jet Pack
      Spell(63341, {fbd = N25}), -- Jet Pack
    },
  },
  {
    name = "托里姆",
    desc = "多年来托里姆一直以为是冰霜巨人杀害了他心爱的妻子西弗.他却始料未及这一切的幕后主谋是他的弟弟洛肯.洛肯在托里姆知道真相之后将他软禁在奥杜尔了",
    --icon = true,
    creature = 32865,
    display = 28977,
    coords = {0.684, 0.484, 2},
    loot = {{45659,N10},{45927,N10},{45570,N25},{45660,N10},{45469,N25},{45472,N25},{45038,N25},{45933,N10},{45470,N25},{45895,N10},{45929,N10},{45473,N25},{45894,N10},{45928,N10},{45892,N10},{45661,N10},{45930,N10},{45893,N10},{45474,N25},{45471,N25},{45931,N10},{45639,N25},{45087,N25},{45467,N25},{45463,N25},{45466,N25},{45638,N25},{45468,N25},{45640,N25},},
    sections = {
      Spell(62555, {fbd = N10}), -- Berserk
      Spell(62560, {fbd = N10}), -- Berserk
      Spell(64390, {fbd = N10}), -- Chain Lightning
      Spell(62131, {fbd = N25}), -- Chain Lightning
      Spell(62016, {fbd = N10}), -- Charge Orb
      Spell(62016, {fbd = N25}), -- Charge Orb
      Spell(62279, {fbd = N10}), -- Lightning Charge
      Spell(62279, {fbd = N25}), -- Lightning Charge
      Spell(62466, {fbd = N10}), -- Lightning Charge
      Spell(62466, {fbd = N25}), -- Lightning Charge
      Spell(62276, {fbd = N10}), -- Sheath of Lightning
      Spell(62276, {fbd = N25}), -- Sheath of Lightning
      Spell(64767, {fbd = N10}), -- Stormhammer
      Spell(64767, {fbd = N25}), -- Stormhammer
      Spell(62042, {fbd = N10}), -- Stormhammer
      Spell(62042, {fbd = N25}), -- Stormhammer
      Spell(62391, {fbd = N10}), -- Summon Lightning Orb
      Spell(62391, {fbd = N25}), -- Summon Lightning Orb
      Spell(62130, {fbd = N10}), -- Unbalancing Strike
      Spell(62130, {fbd = N25}), -- Unbalancing Strike
    },
  },
  {
    name = "维扎克斯将军",
    desc = "这是一群潜伏在奥杜尔深处的被称为无面者的生物.维扎克斯将军作为无面者最强大的指挥官之一,把守着关押尤格萨隆监狱的扭曲通道",
    --icon = true,
    creature = 33271,
    display = 28548,
    coords = {0.552, 0.604, 3},
    loot = {{45038,N25},{45519,N25},{45517,N25},{45504,N25},{45996,N10},{46348,N25},{45516,N25},{45520,N25},{46027,N25},{45518,N25},{45087,N25},{45511,N25},{46014,N10},{45507,N25},{46013,N10},{46034,N10},{45498,N25},{46032,N10},{45514,N25},{46033,N10},{45508,N25},{45502,N25},{45145,N25},{46035,N10},{46036,N10},{46009,N10},{45515,N25},{45513,N25},{45509,N25},{46008,N10},{45512,N25},{46012,N10},{45997,N10},{45505,N25},{46011,N10},{46010,N10},{45501,N25},{46015,N10},{45503,N25},},
    sections = {
      Spell(62692, {fbd = N10}), -- Aura of Despair
      Spell(62692, {fbd = N25}), -- Aura of Despair
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(26662, {fbd = N25}), -- Berserk
      Spell(68415, {fbd = N10}), -- Corrupted Rage
      Spell(68415, {fbd = N25}), -- Corrupted Rage
      Spell(64646, {fbd = N10}), -- Corrupted Wisdom
      Spell(64646, {fbd = N25}), -- Corrupted Wisdom
      Spell(63276, {fbd = N10}), -- Mark of the Faceless
      Spell(63276, {fbd = N25}), -- Mark of the Faceless
      Spell(63364, {fbd = N10}), -- Saronite Barrier
      Spell(63364, {fbd = N25}), -- Saronite Barrier
      Spell(62661, {fbd = N10}), -- Searing Flames
      Spell(62661, {fbd = N25}), -- Searing Flames
      Spell(62660, {fbd = N10}), -- Shadow Crash
      Spell(62660, {fbd = N25}), -- Shadow Crash
      Spell(63277, {fbd = N10}), -- Shadow Crash
      Spell(63277, {fbd = N25}), -- Shadow Crash
      Spell(62662, {fbd = N10}), -- Surge of Darkness
      Spell(62662, {fbd = N25}), -- Surge of Darkness
    },
  },
  {
    name = "尤格萨隆",
    desc = "很久之前,泰坦为了拯救艾泽拉斯将具有毁灭力量的上古之神尤格萨隆囚禁在奥杜尔的深处.但是经过许多年之后,这个邪恶的生物已经腐蚀了泰坦警卫的心智,并且重新获得了自由",
    --icon = true,
    creature = 33288,
    display = 28817,
    coords = {0.540, 0.670, 5},
    loot = {{46027,N25},{46312,N10},{45087,N10},{45087,N25},{45091,N10},{45091,N25},{45635,N10},{46348,N25},{45522,N25},{45093,N10},{45093,N25},{45693,N25},{45092,N10},{45092,N25},{45534,N25},{45530,N25},{45097,N10},{45097,N25},{45535,N25},{45098,N10},{45098,N25},{45523,N25},{46022,N10},{45656,N25},{45532,N25},{45524,N25},{46031,N10},{46028,N10},{45038,N25},{45637,N10},{46016,N10},{46019,N10},{46024,N10},{46068,N10},{45658,N25},{45657,N25},{45527,N25},{46021,N10},{45636,N10},{46096,N10},{46030,N10},{46018,N10},{46025,N10},{46095,N10},{45533,N25},{45536,N25},{45095,N10},{45531,N25},{45102,N10},{45088,N10},{45094,N10},{45537,N25},{46067,N10},{45525,N25},{45100,N10},{45521,N25},{46097,N10},{45529,N25},{45101,N10},},
    sections = {
      Spell(64189, {fbd = N25}), -- Deafening Roar
      Spell(64166, {fbd = N10}), -- Extinguish All Life
      Spell(64166, {fbd = N25}), -- Extinguish All Life
      Spell(64163, {fbd = N10}), -- Lunatic Gaze
      Spell(64163, {fbd = N25}), -- Lunatic Gaze
      Spell(64465, {fbd = N10}), -- Shadow Beacon
      Spell(64465, {fbd = N25}), -- Shadow Beacon
      Spell(63894, {fbd = N10}), -- Shadowy Barrier
      Spell(63894, {fbd = N25}), -- Shadowy Barrier
    },
  },
  {
    name = "观察者奥尔加隆",
    desc = "由于洛肯的死亡,导致泰坦失去了艾泽拉斯首要监护人.而观察者奥尔加隆则被派往艾泽拉斯查询情况,'如果有必要,则发送回复代码阿尔法,重组整个艾泽拉斯'",
    --icon = true,
    creature = 32871,
    display = 28641,
    coords = {0.792, 0.460, 1},
    loot = {{46053,N25},{46047,N10},{46052,N10},{46051,N10},{46048,N10},{46045,N10},{46041,N10},{46040,N10},{46042,N10},{45612,N25},{46039,N10},{46050,N10},{46044,N10},{46046,N10},{45594,N25},{45599,N25},{46037,N10},{45611,N25},{46043,N10},{45665,N25},{45615,N25},{46038,N10},{45038,N25},{46049,N10},{45610,N25},{45616,N25},{45570,N25},{45607,N25},{45620,N25},{45609,N25},{45617,N25},{45619,N25},{45613,N25},{45587,N25},{45105,N25},},
    sections = {
      Spell(64487, {fbd = N10}), -- Ascend to the Heavens
      Spell(64487, {fbd = N25}), -- Ascend to the Heavens
      Spell(47008, {fbd = N10}), -- Berserk
      Spell(47008, {fbd = N25}), -- Berserk
      Spell(64443, {fbd = N10}), -- Big Bang
      Spell(64584, {fbd = N25}), -- Big Bang
      Spell(64598, {fbd = N25}), -- Cosmic Smash
      Spell(62301, {fbd = N10}), -- Cosmic Smash
      Spell(64412, {fbd = N10}), -- Phase Punch
      Spell(64412, {fbd = N25}), -- Phase Punch
      Spell(64395, {fbd = N10}), -- Quantum Strike
      Spell(64592, {fbd = N25}), -- Quantum Strike
    },
  },
  -- {
    -- name = "Yogg-Saron",
    -- desc = "Long ago the titans imprisoned Yogg-Saron deep within Ulduar to save Azeroth from the Old God's destructive power. But after years of plotting, Yogg-Saron has succeeded in corrupting its guards and now the monstrous creature is finally breaking free.",
    icon = true,
    -- creature = 33288,
    -- display = 28817,
    -- coords = {0.540, 0.670, 5},
    -- loot = {{46027,N25},{46312,N10},{45087,N10},{45087,N25},{45091,N10},{45091,N25},{45635,N10},{46348,N25},{45522,N25},{45093,N10},{45093,N25},{45693,N25},{45092,N10},{45092,N25},{45534,N25},{45530,N25},{45097,N10},{45097,N25},{45535,N25},{45098,N10},{45098,N25},{45523,N25},{46022,N10},{45656,N25},{45532,N25},{45524,N25},{46031,N10},{46028,N10},{45038,N25},{45637,N10},{46016,N10},{46019,N10},{46024,N10},{46068,N10},{45658,N25},{45657,N25},{45527,N25},{46021,N10},{45636,N10},{46096,N10},{46030,N10},{46018,N10},{46025,N10},{46095,N10},{45533,N25},{45536,N25},{45095,N10},{45531,N25},{45102,N10},{45088,N10},{45094,N10},{45537,N25},{46067,N10},{45525,N25},{45100,N10},{45521,N25},{46097,N10},{45529,N25},{45101,N10},},
    -- sections = {
      -- Spell(64189, {fbd = N25}), -- Deafening Roar
      -- Spell(64166, {fbd = N10}), -- Extinguish All Life
      -- Spell(64166, {fbd = N25}), -- Extinguish All Life
      -- Spell(64163, {fbd = N10}), -- Lunatic Gaze
      -- Spell(64163, {fbd = N25}), -- Lunatic Gaze
      -- Spell(64465, {fbd = N10}), -- Shadow Beacon
      -- Spell(64465, {fbd = N25}), -- Shadow Beacon
      -- Spell(63894, {fbd = N10}), -- Shadowy Barrier
      -- Spell(63894, {fbd = N25}), -- Shadowy Barrier
    -- },
  -- },
})

table.insert(db, ULDUAR)
