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

local RUINS_OF_AHNQIRAJ = CreateInstance({
  name = "安其拉废墟",
  desc = "在流沙之战最后几个小时里，四巨龙军团和暗夜精灵的联军将战场逼至其拉帝国的最中心，希利苏斯的异种虫群退败至最终堡垒安其拉城。但在安其拉之门内，等待着的却是大规模的其拉异种虫，数量是卡利姆多联军所无法想象的。经过漫长的战役，卡利姆多联军仍然无法击败其拉帝王以及他的异种虫群，只能以一个强大的魔法结界将它们困禁在内，而安其拉城也因为战火而成了一个被诅咒的废墟。经过了数千年，其拉的侵略心却没有因为结界而消退。新一代的异种虫群从巢穴中慢慢的破茧而出，安其拉废墟又再度充满了其拉异种虫。这股威胁一定要被消灭，否则艾泽拉斯将可能会被这股恐怖的新世代其拉势力给毁灭",
  texture = "RuinsofAhnQiraj",
  area = 717,
  dflag = N10,
}, {
  {
    name = "库林纳克斯",
    desc = "库林纳克斯是一条巨大的沙虫,是安其拉废墟的看门BOSS.他的反潜视野很大,可以在很远的地方就发现潜行的目标.",
    --icon = true,
    creature = 15348,
    display = 15742,
    coords = {0.560, 0.353, 0},
    loot = {20885,20884,21500,20888,21503,76401,},
    sections = {
      Spell(26527, {desc = "当库林纳克斯的血量降到30%以下时进入狂乱状态.攻击速度提高75%,对敌人造成的物理伤害提高250点,持续2分钟"}), -- Frenzy
      Spell(25646, {desc = "对目标进行惩戒打击,使其受到的治疗法术效果降低10%,持续15秒.", flag1 = TANK}), -- Mortal Wound
      --Spell(20477), -- Summon Player
      --Spell(26446), -- Summon Player
      Spell(3391), -- Thrash
      Spell(25814, {desc = "对施法者面前一个锥形区域中10码范围内的所有的敌人造成普通武器伤害再加上500点额外伤害.", flag1 = DPS}), -- Wide Slash
    },
  },
  {
    name = "拉贾克斯将军",
    desc = "拉贾克斯将军是其拉虫群中一名强大的指挥官.在流沙战争中,他率领虫群击败了范达尔鹿盔的暗夜部队,并且亲手杀死了范达尔的儿子瓦尔斯坦.",
    --icon = true,
    creature = 15341,
    display = 15376,
    coords = {0.583, 0.495, 0},
    loot = {20885,20888,21495,20884,21497,76401,},
    sections = {
      Stage({
        so = true,
        name = "拉贾克斯将军",
        desc = "安多洛夫中将和4名卡多雷精英将会和玩家一起协同作战,与NPC对话即可开始与拉贾克斯将军的战斗. ",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 15471,
            display = 15688,
            name = "安多洛夫中将",
            sections = {
              Spell(25516, {so = true, desc = "使周围的友方单位每3秒回复200点生命值,攻击速度提高10% ,施法速度提高11%. 持续30秒."}), -- Aura of Command
              Spell(25515, {desc = "使目标因昏迷而无法移动或攻击,持续5秒"}), -- Bash
              Spell(22591, {desc = "对敌人造成额外的20点近战伤害."}), -- Strike
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15473,
            display = 15689,
            name = "卡多雷精英",
            sections = {
              Spell(26350), -- Cleave
              Spell(16856), -- Mortal Strike
            },
          }),
        },
      }),
      Stage({
        so = true,
        name = "虫群卫士",
        desc = "在与拉贾克斯将军交战之前,你需要首先击败他手下的7名其拉虫群卫士将领.",
        sections = {
          Stage({
            name = "其拉战士",
            sections = {
              Stage({
                so = true,
                name = "共有的技能",
                sections = {
                  Spell(40504), -- Cleave
                  Spell(24317), -- Sunder Armor
                },
              }),
              Stage({
                stype = CREATURE,
                creature = 15391,
                display = 15738,
                name = "奎兹上尉",
                sections = {
                  Spell(19134, {so = true, desc = "向附近15码内的敌人发出怒吼，使它们因恐惧而逃跑，持续6秒.", flag1 = IMPORTANT}), -- Frightening Shout
                },
              }),
              Stage({
                stype = CREATURE,
                creature = 15392,
                display = 15738,
                name = "图比德上尉",
                sections = {
                  Spell(25471, {so = true, desc = "随机对一个敌对目标释放死亡的印记,所有攻击者将转火攻击被标记的目标.", flag1 = IMPORTANT}), -- Attack Order
                },
              }),
              Stage({
                stype = CREATURE,
                creature = 15389,
                display = 15738,
                name = "德雷恩上尉",
                sections = {
                  Spell(26550, {so = true, flag1 = IMPORTANT}), --  Lightning Cloud
                },
              }),
              Stage({
                stype = CREATURE,
                creature = 15390,
                display = 15738,
                name = "库雷姆上尉",
                sections = {
                  Spell(25425, {so = true, desc = "对附近20码内的敌人造成1313~1687点自然伤害,使他们昏迷2秒,并且使他们的攻击速度和移动速度降低,持续5秒.", flag1 = IMPORTANT}), -- Shockwave
                },
              }),
              Stage({
                stype = CREATURE,
                creature = 15386,
                display = 15738,
                name = "耶吉斯少校",
                sections = {
                  Spell(25282, {so = true, desc = "使施法者免疫魔法，持续6秒.", flag1 = IMPORTANT}), -- Shield of Rajaxx
                },
              }),
              Stage({
                stype = CREATURE,
                creature = 15388,
                display = 15738,
                name = "帕库少校",
                sections = {
                  Spell(25322, {so = true, desc = "对施法者面前15码的一个锥形区域中的敌人造成普通武器伤害再加上1750~2250点额外伤害,并将它们击退.", flag1 = IMPORTANT}), -- Sweeping Slam
                },
              }),
              Stage({
                stype = CREATURE,
                creature = 15385,
                display = 15738,
                name = "泽兰上校",
                sections = {
                  Spell(25462, {so = true, desc = "泽兰上校的体型增大50%,物理伤害提高438~562点.", flag1 = IMPORTANT}), -- Enlarge
                },
              }),
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15344,
            display = 15354,
            name = "虫群守卫钉刺者",
            sections = {
              Spell(40504), -- Cleave
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15387,
            display = 15437,
            name = "其拉战士",
            sections = {
              Spell(8599, {desc = "激怒,物理伤害提高10%,攻击速度提高30%."}), -- Enrage
              Spell(15588, {desc = "对附近10码的敌人造成71~79点自然伤害,使其攻击间隔延长33%,移动速度降低40%,持续6秒."}), -- Thunderclap
              Spell(10966), -- Uppercut
            },
          }),
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 15341,
        display = 15376,
        name = "拉贾克斯将军",
        sections = {
          Spell(6713), -- Disarm
          Spell(8269), -- Frenzy
          --Spell(20477), -- Summon Player
          Spell(25599, {so = true, desc = "对玩家造成玩家生命值50%的自然伤害并将其击退.", flag1 = IMPORTANT}), -- Thundercrash
        },
      }),
    },
    adds = {
      {
        name = "安多洛夫中将",
        creature = 15471,
        display = 15688,
      },
      {
        name = "卡雷多精英",
        creature = 15473,
        display = 15689,
      },
      {
        name = "其拉角斗士",
        creature = 15391,
        display = 15738,
      },
      {
        name = "虫群守卫钉刺者",
        creature = 15344,
        display = 15354,
      },
      {
        name = "其拉战士",
        creature = 15387,
        display = 15437,
      },
    },
  },
  {
    name = "莫阿姆",
    desc = "莫阿姆是克苏恩的靡下双子皇帝利用黑曜石雕像改造出来的战斗兵器,维克洛尔大帝为这尊雕像注入了黑暗的魔法,把它命名为莫阿姆.在创造了莫阿姆之后,维克洛尔大帝欣喜的发现这尊雕像在黑暗魔法的改进下居然有了自我生命形态的意识,并且比起其他的黑曜石雕像来说具有了更多强大的能力.",
    --icon = true,
    creature = 15340,
    display = 15392,
    coords = {0.330, 0.364, 0},
    loot = {21479,20890,21468,21471,21455,21477,21475,21467,21473,21472,},
    sections = {
      Spell(27526, {desc = "从附近的敌人身上吸取法力,为莫阿姆恢复法力值.", flag1 = IMPORTANT}), -- Mana Drain
      Spell(25672, {desc = "一旦莫阿姆法力值达到100%,他将对45码范围内的所有玩家释放奥术爆发,造成3063~3937点奥术伤害并将敌人击飞.", flag1 = IMPORTANT}), -- Arcane Eruption
      Spell(15550, {desc = "对附近10码内的所有敌人造成物理伤害."}), -- Trample
      --Spell(25685), -- Energize
    },
  },
  {
    name = "吞咽者布鲁",
    desc = "吞咽者布鲁是守护虫群虫卵的异种虫群女王.",
    --icon = true,
    creature = 15370,
    display = 15654,
    coords = {0.699, 0.617, 0},
    loot = {20884,21488,21487,21491,20890,20885,76401,},
    sections = {
      Stage({
        so = true,
        name = "第一阶段:虫卵",
        desc = "布鲁强制攻击一个目标敌人,直到该目标死亡或者有人打破了一枚虫卵",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 15370,
            display = 15654,
            name = "吞咽者布鲁",
            sections = {
              Spell(1557, {so = true, desc = "战斗中,布鲁在受到伤害时会逐渐增加她的移动速度,使她更难被风筝."}), -- Full Speed
              Spell(96, {so = true, desc = "下一次近战攻击将使目标流血,对该目标每2秒造成1248点伤害,持续10秒.这个效果可以无限叠加."}), -- Dismember
            },
          }),
          Stage({
            --so = true,
            stype = CREATURE,
            creature = 15514,
            display = 15512,
            name = "布鲁的卵",
            flag1 = IMPORTANT,
            sections = {
              Spell(19593, {so = true, desc = "虫卵被打破时将爆炸,令附近所有敌人受到伤害.同时布鲁身边25码范围内的玩家可以对布鲁造成更高的伤害."}),
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15521,
            display = 11095,
            name = "扎拉雏虫",
            desc = "当布鲁的卵被打破之后,将会刷新一只扎拉雏虫.",
          }),
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 15370,
        display = 15655,
        name = "第二阶段:吞咽者布鲁",
        sections = {
          Spell(20512, {desc = "每2秒对周围的敌人造成70点自然伤害,可以叠加20次.", flag1 = IMPORTANT}), -- Creeping Plague
          Spell(25640, {desc = "使友方目标身上环绕着荆棘，对任何使用近战手段击中被保护者的敌人造成40点自然伤害."}), -- Thorns
        },
      }),
    },
    adds = {
      {
        name = "布鲁的卵",
        creature = 15514,
        display = 15512,
      },
      {
        name = "扎拉雏虫",
        creature = 15521,
        display = 11095,
      },
    },
  },
  {
    name = "狩猎者阿亚米斯",
    desc = "佐拉虫群的指挥官,一只巨大的黄蜂",
    --icon = true,
    creature = 15369,
    display = 15431,
    coords = {0.616, 0.905, 0},
    loot = {20884,21484,21466,21480,20886,20889,76401,},
    sections = {
      Stage({
        so = true,
        name = "共有技能",
        sections = {
          Spell(25749, {so = true, desc = "对阿亚米斯前方锥形区域的所有单位造成875~1125点自然伤害.这个技能有30秒的冷却时间."}), -- Stinger Spray
        },
      }),
      Stage({
        so = true,
        name = "第一阶段:空中阶段",
        sections = {
          Stage({
            stype = CREATURE,
            name = "狩猎者阿亚米斯",
            creature = 15369,
            display = 15431,
            sections = {
              Spell(25748, {so = true, desc = "钉刺一个敌人,对其每10秒造成25点自然伤害,可以叠加100层.", flag1 = IMPORTANT}), -- Poison Stinger
              Spell(25725, {so = true, desc = "使目标昏迷并将其传送到阿亚米斯祭坛上,祭坛下将刷新一只扎拉幼虫.", flag1 = IMPORTANT}), -- Paralyze
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15555,
            display = 15554,
            name = "扎拉幼虫",
            desc = "扎拉幼虫刷新出现在祭坛下方,会以极快的速度向祭坛上的玩家移动,如果幼虫接触到祭坛上的玩家,玩家死亡,并且幼虫进化为佐拉黄蜂",
            flag1 = IMPORTANT,
            sections = {
              Stage({
                so = true,
                stype = CREATURE,
                creature = 15934,
                display = 14522,
                name = "佐拉黄蜂",
                desc = "佐拉黄蜂非常难以被击杀,并且可以对玩家造成巨大的伤害.",
              }),
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15546,
            display = 482,
            name = "佐拉蜂群",
            desc = "在空中阶段时,阿亚米斯还会召唤20只左右的佐拉蜂群来攻击玩家.",
          }),
        },
      }),
      Stage({
        so = true,
        name = "第二阶段:地面阶段",
        desc = "这个阶段将在阿亚米斯生命值降至70%之后开始.",
        sections = {
          Spell(25852), -- Lash
          Spell(3391), -- Thrash
        },
      }),
    },
    adds = {
      {
        name = "扎拉幼虫",
        creature = 15555,
        display = 15554,
      },
      {
        name = "佐拉黄蜂",
        creature = 15934,
        display = 14522,
      },
      {
        name = "佐拉蜂群",
        creature = 15546,
        display = 482,
      },
    },
  },
  {
    name = "无疤者奥斯里安",
    desc = "奥斯里安是在流沙之战中击败青铜龙族的阿努比斯.维克尼拉斯大帝为了表彰他的功绩,授予了奥斯里安坚不可摧的防御能力.无疤者的称号就是代表他刀枪不入的意思",
    --icon = true,
    creature = 15339,
    display = 15432,
    coords = {0.433, 0.696, 0},
    loot = {21458,21220,20886,20884,21463,21454,21461,21459,21453,76401,},
    sections = {
      Spell(25176, {desc = "奥斯里安体型增大25%,伤害提高300%,可以通过点开奥斯里安附近的奥斯里安水晶来暂时解除这个效果.", flag1 = IMPORTANT}), -- Strength of Ossirian
      Spell(25189, {desc = "一阵旋风包围着敌人,最多持续10秒.如果目标受到伤害,则该效果消失.", flag1 = IMPORTANT}), -- Enveloping Winds
      Spell(25195, {desc = "强迫45码内的所有敌人使用恶魔语,使他们的施法时间延长75%,持续15秒", flag1 = CURSE}), -- Curse of Tongues
      --Spell(20477), -- Summon Player
      Spell(25188, {desc = "击飞奥斯里安周围20码内的所有敌人,并且对他们造成2188~2812点物理伤害."}), -- War Stomp
    },
  },
})

table.insert(db, RUINS_OF_AHNQIRAJ)
