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
      Spell(27526, {desc = "Periodically mana drains nearby enemies, restoring Moam's own mana supply.", flag1 = IMPORTANT}), -- Mana Drain
      Spell(25672, {desc = "Once Moam has Mana Drained enough and reaches 100%, he will deal 3063 to 3937 Arcane damage to enemies within 45 yards and knock them high up into the air.\n\nThis can and should be avoided by draining Moam's mana in return, forcing him to never reach 100%.", flag1 = IMPORTANT}), -- Arcane Eruption
      Spell(15550, {desc = "Inflicts weapon damage to enemies within 10 yards."}), -- Trample
      --Spell(25685), -- Energize
    },
  },
  {
    name = "Buru the Gorger",
    desc = "Protector of the hive eggs and the silithid queen in the Hatchery.",
    --icon = true,
    creature = 15370,
    display = 15654,
    coords = {0.699, 0.617, 0},
    loot = {20884,21488,21487,21491,20890,20885,76401,},
    sections = {
      Stage({
        so = true,
        name = "Phase 1: Eggs",
        desc = "Buru will fixate himself upon an enemy, either until that target dies or he takes damage from one of his Eggs.",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 15370,
            display = 15654,
            name = "Buru the Gorger",
            sections = {
              Spell(1557, {so = true, desc = "During the encounter. Buru will increase his speed the more health he looses, ultimately making it harder to kite."}), -- Full Speed
              Spell(96, {so = true, desc = "Increases the damage of your next melee swing by 100 and causes the target to bleed for 1248 damage every 2 seconds for 10 seconds."}), -- Dismember
            },
          }),
          Stage({
            --so = true,
            stype = CREATURE,
            creature = 15514,
            display = 15512,
            name = "Buru Egg",
            flag1 = IMPORTANT,
            sections = {
              Spell(19593, {so = true, desc = "Upon the destruction of an Egg, the closer Buru and other players are to it, the more damage they take. The radius of impact is 25 yards."}),
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15521,
            display = 11095,
            name = "Hive'Zara Hatchling",
            desc = "When an Egg is destroyed, a Hive'Zara Hatchling spawns at its location.",
          }),
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 15370,
        display = 15655,
        name = "Phase 2: Buru the Gorger",
        sections = {
          Spell(20512, {desc = "Inflicts 70 Nature damage each 2 seconds to all enemies, stacking up to 20 and doing maximum 1400 Nature damage each 2 seconds. Lasts for 20 seconds.", flag1 = IMPORTANT}), -- Creeping Plague
          Spell(25640, {desc = "Thorns sprout from Buru, causing 40 Nature damage to melee attackers."}), -- Thorns
        },
      }),
    },
    adds = {
      {
        name = "Buru Egg",
        creature = 15514,
        display = 15512,
      },
      {
        name = "Hive'Zara Hatchling",
        creature = 15521,
        display = 11095,
      },
    },
  },
  {
    name = "Ayamiss the Hunter",
    desc = "The wasp Ayamiss hunts his prays from above and commands hundreds of minion wasps. He will lay waste to any living organism and use their carcasses to spawn more minions for him to command.",
    --icon = true,
    creature = 15369,
    display = 15431,
    coords = {0.616, 0.905, 0},
    loot = {20884,21484,21466,21480,20886,20889,76401,},
    sections = {
      Stage({
        so = true,
        name = "Common for both phases",
        sections = {
          Spell(25749, {so = true, desc = "During the entire encounter, Ayamiss will spray all enemies in a cone in front of Ayamiss for 875 to 1125 Nature damage. This ability has a 30 seconds cooldown."}), -- Stinger Spray
        },
      }),
      Stage({
        so = true,
        name = "Phase 1: Air",
        sections = {
          Stage({
            stype = CREATURE,
            name = "Ayamiss the Hunter",
            creature = 15369,
            display = 15431,
            sections = {
              Spell(25748, {so = true, desc = "Stings an enemy, inflicting 25 Nature damage every second for 10 seconds. Stacks 100 times and will tick for 2500 Nature damage every second at max stack.", flag1 = IMPORTANT}), -- Poison Stinger
              Spell(25725, {so = true, desc = "Stuns a random group member and teleports them on top of the altar. A Hive'Zara Larva will appear near the bottom and head towards that player.", flag1 = IMPORTANT}), -- Paralyze
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15555,
            display = 15554,
            name = "Hive'Zara Larva",
            desc = "The larva will walk toward the stunned player on top of the altar.\n\nWhen their fixated target is reached, it will be impregnated and give birth to a Hive'Zara Hornet.",
            flag1 = IMPORTANT,
            sections = {
              Stage({
                so = true,
                stype = CREATURE,
                creature = 15934,
                display = 14522,
                name = "Hive'Zara Hornet",
                desc = "Should be handled quickly as the Hornet deals quite a lot of damage.",
              }),
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15546,
            display = 482,
            name = "Hive'Zara Swarmer",
            desc = "During the flying phase, he will call upon Hive'Zara Swarmer to gather until 20 have been called, then swarm upon the players.",
          }),
        },
      }),
      Stage({
        so = true,
        name = "Phase 2: Ground",
        desc = "This phase starts when Ayamiss reaches 70% health.",
        sections = {
          Spell(25852), -- Lash
          Spell(3391), -- Thrash
        },
      }),
    },
    adds = {
      {
        name = "Hive'Zara Larva",
        creature = 15555,
        display = 15554,
      },
      {
        name = "Hive'Zara Hornet",
        creature = 15934,
        display = 14522,
      },
      {
        name = "Hive'Zara Swarmer",
        creature = 15546,
        display = 482,
      },
    },
  },
  {
    name = "Ossirian the Unscarred",
    desc = "The legends say that Vek'nilash secretly entrusted Ossirian with the responsibility of maintaining a watch on General Rajaxx, to ensure that the commander would never fail again.\n\nOssirian serves the Emperors to the best of his ability, despite the frustration of being eternally bound to a single location. The bones of Grakkarond have become a sacred site to the Anubisaths; a testimony to their ability to defeat even the most powerful of enemies.",
    --icon = true,
    creature = 15339,
    display = 15432,
    coords = {0.433, 0.696, 0},
    loot = {21458,21220,20886,20884,21463,21454,21461,21459,21453,76401,},
    sections = {
      Spell(25176, {desc = "Increases damage done by 300% and size by 25%.\n\nThis can be countered by activating a Ossirian Crystal while Ossirian is near it.", flag1 = IMPORTANT}), -- Strength of Ossirian
      Spell(25189, {desc = "Surrounds his targeted enemy with a cyclone for up to 10 sec. If the target takes any damage, it will break free of the imprisoning winds. Target is ignorred as long this effect lasts.", flag1 = IMPORTANT}), -- Enveloping Winds
      Spell(25195, {desc = "Forces enemies within 45 yards to speak in Demonic, reducing their casting speed by 75% for 15 seconds.", flag1 = CURSE}), -- Curse of Tongues
      --Spell(20477), -- Summon Player
      Spell(25188, {desc = "Ossirian will occasionally stomp the ground and send enemies within 20 yards flying back and taking 2188 to 2812 Physical damage."}), -- War Stomp
    },
  },
})

table.insert(db, RUINS_OF_AHNQIRAJ)
