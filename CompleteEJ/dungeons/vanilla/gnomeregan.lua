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

local GNOMEREGAN = CreateInstance({
  name = "诺莫瑞根",
  desc = "位于丹莫罗的科技奇迹城市诺莫瑞根世代以来都是侏儒的主城。最近，一群邪恶的变异石腭怪侵入了包括侏儒主城在内的多处丹莫罗地区。为了干掉入侵的石腭怪，大工匠梅卡托克命令打开城市中的紧急辐射水箱，作殊死一搏。侏儒在等待那些石腭怪死亡或者逃跑的同时也在寻找躲避辐射的方法。不幸的是，虽然石腭怪在经过辐射之后感染了毒性——但是它们的攻击没有停止，也没有丝毫的减弱。那些没有被辐射杀死的侏儒被迫逃离，他们在附近的矮人城市铁炉堡找到了安身之处。大工匠梅卡托克组建了一个智囊团来商议重新夺回他们挚爱的城市的计划。传说大工匠梅卡托克曾经最信任的顾问，麦克尼尔·瑟玛普拉格背叛了他的人民并纵容了这次入侵的发生。现在，他的心智，麦克尼尔·瑟玛普拉格还留在诺莫瑞根中——他在继续筹划着自己黑暗的计划并成为这座城市新的科技领主。",--\n\nHorde players can gain access by using the teleport machine in the west parts of Grom'gol Base Camp in Stranglethorn.未翻。传送器在格罗姆高吗？求证实
  texture = "Gnomeregan",
  area = 691,
  dflag = N5,
}, {
  {
    name = "格鲁比斯",
    desc = "格鲁比斯是诺莫瑞根中的石腭怪首领，带着他的蜥蜴宠物咀嚼者一起作战。格鲁比斯和咀嚼者将在爆破专家艾米•短线事件快结束时出现。",
    --icon = true,
    creature = 7361,
    display = 6533,
    coords = {0.775, 0.667, 1},
    loot = {9445,},
    sections = {
      Stage({
        so = true,
        name = "小怪",
        desc = "在你面对BOSS前，艾米将关闭那两个隧道以阻止石腭怪由此飘出去。当她安置炸药时，你必须迎击石腭怪群的攻击。",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 6207,
            display = 764,
            name = "洞窟伏击者",
            desc = "没有特殊技能。",
          }),
          Stage({
            stype = CREATURE,
            creature = 6206,
            display = 830,
            name = "洞窟穴居者",
            sections = {
              Spell(87081, {so = true}), -- Strike打击
            },
          }),
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7361,
        display = 6533,
        name = "格鲁比斯",
        desc = "他和咀嚼者将从最后的隧道出来。他们都没有什么特殊的战技。",
        sections = {
          Stage({
            so = true,
            stype = CREATURE,
            creature = 6215,
            display = 4906,
            name = "咀嚼者",
            desc = "没有特殊技能。",
          }),
        },
      }),
    },
    adds = {
      {
        name = "爆破专家艾米•短线",
        creature = 7998,
        display = 7138,
      },
    },
  },
  {
    name = "粘性辐射尘",
    desc = "由于在诺莫瑞根中的辐射，一部分城市被辐射软泥怪占领了。粘性辐射尘由这些东西积聚而成，并形成了自己的意识，以及战术。",
    --icon = true,
    creature = 7079,
    display = 36529,
    coords = {0.757, 0.463, 2},
    loot = {9452,9453,9454,},
    sections = {
      Spell(21687, {so = true, desc = "对45码内的敌人造成37到43自然伤害，并在之后的15秒内每3秒造成5点伤害。", flag1 = POISON}), -- Toxic Volley毒性箭雨
    },
  },
  {
    name = "电刑器6000型",
    desc = "电刑器6000型一个在诺莫瑞根中的蜘蛛坦克机器人。这个机器人由其中一个疯狂的侏儒中尉占领，他直到现在还拥护麦克尼尔•瑟玛普拉格的领导。",
    --icon = true,
    creature = 6235,
    display = 36558,
    coords = {0.242, 0.680, 2},
    loot = {9447,9446,9448,},
    sections = {
      Spell(11082, {so = true, desc = "对施法者面前一个锥形区域中的所有敌人造成自然伤害。", flag1 = TANK}), -- Megavolt百万伏特
      Spell(11085, {so = true}), desc = "向敌人射出一支闪电箭，这支闪电箭会在击中目标后继续攻击它周围最近的敌人，对每个目标造成138~156点自然伤害，最多可攻击3个目标。", -- Chain Bolt闪电链
      Spell(11084, {so = true}), desc = "立即向目标射出一支闪电箭，对其造成261~277点伤害。", -- Shock震击
    },
  },
  {
    name = "群体打击者9-60",
    desc = "群体打击者9-60是诺莫瑞根中的侏儒机器，在工程实验室上层北部。",
    --icon = true,
    creature = 6229,
    display = 36560,
    coords = {0.431, 0.879, 3},
    loot = {9449,9450,},
    sections = {
      Spell(8374, {so = true, desc = "对施法者面前一个锥形区域内的所有敌人造成伤害。", flag1 = TANK}), -- Arcing Smash圆弧斩
      Spell(10887, {so = true, desc = "击打身旁的敌人，对其造成普通伤害再加上10点伤害，并使其在4秒内不能施放法术。", flag1 = IMPORTANT}), -- Crowd Pummel群体打击
      Spell(5568, {so = true, desc = "对附近的敌人造成普通武器伤害与附加伤害。"}), -- Trample践踏
    },
  },
  {
    name = "黑铁大使(稀有)",
    desc = "这位大使曾经经营着叛国贼西科•瑟玛普拉格与邪恶的黑铁部族的关系，并受达格兰•索瑞森大帝所差遣。它有时会在北部通道，也就是快到麦克尼尔•瑟玛普拉格的位置出没。",
    --icon = true,
    creature = 6228,
    display = 6669,
    coords = {0.353, 0.638, 4},
    loot = {9456,9455,9457,},
    sections = {
      Stage({ --Spell(10870), -- Summon Burning Servant召唤燃烧仆从
        so = true,
        stype = CREATURE,
        creature = 7738,
        display = 2172,
        name = "燃烧仆从",
        desc = "召唤1个燃烧仆从为施法者作战，持续4分钟。\n\n这里要注意的是燃烧仆从还会周期性的召唤灰烬来协助boss，每次召唤3个。",
        flag1 = IMPORTANT,
        sections = {
          Stage({ --Spell(10869), -- Summon Embers
            stype = CREATURE,
            creature = 7266,
            display = 6537,
            name = "灰烬",
            desc = "没有特殊技能。",
          }),
        },
      }),
      Spell(184, {so = true, desc = "为盟友施加火焰之盾，每3秒对其周围的所有敌人造成15点火焰伤害，持续1分钟。"}), -- Fire Shield火焰之盾
      Spell(9053, {so = true, desc = "对敌人造成49到58点火焰伤害。"}), -- Fireball火球术
    },
  },
  {
    name = "麦克尼尔·瑟玛普拉格",
    desc = "西科•瑟玛普拉格曾是一位骄傲并远瞻的侏儒工匠，他曾励志将诺莫瑞根建成一个强大的国家。他对力量贪婪的欲望以及对那些他认为通过欺骗剥夺了他应有地位的人的复仇之心将他变成了诺莫瑞根最大的叛国贼。",
    --icon = true,
    creature = 7800,
    display = 36563,
    coords = {0.312, 0.296, 4},
    loot = {9458,9461,9459,9492,},
    sections = {
      Stage({
        so = true,
        name = "打开舱门",
        desc = "（？）舱门中的一个。此事件周期发生，并且如果你战斗时间过长，你可能会对炸弹力不从心。幸运的是，这些舱门通过在边上的红色按钮关闭。每个炸弹生成器会刷出4个会自己走到房间正中的炸弹。",
        flag1 = IMPORTANT,
        sections = {
          Stage({
            stype = CREATURE,
            creature = 7915,
            display = 6977,
            name = "步行炸弹",
            desc = "如果他们到达了房间中心或者在一个玩家的近战范围内时间过长便自行引爆，作用范围内产生大量伤害。如果是远程击杀，他们不会引爆。",
            sections = {
              Spell(11504, {so = true, name = "爆炸", desc = "对10码内的所有敌人造成200到300点伤害。", flag1 = IMPORTANT}, 1), -- Walking Bomb Effect步行炸弹效果
            },
          }),
        },
      }),
      Spell(74720, {so = true, desc = "囚禁一名敌人，造成110%武器伤害，并使其迷惑2秒。"}), -- Pound囚禁
      Spell(93655, {so = true, desc = "对一个敌人造成21~28点火焰伤害，并将其击退。"}), -- Steam Blast蒸汽冲击
      Spell(52778, {so = true, desc = "对一个敌人造成180点自然伤害，持续5秒。"}), -- Welding Beam焊接
    },
  },
})

table.insert(db, GNOMEREGAN)
