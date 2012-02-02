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

local BLACKWING_LAIR = CreateInstance({
  name = "黑翼之巢",
  desc = "奈法利安镇守的黑翼之巢是位于黑石山的一个经典旧世团队副本,是暴雪历史上第一个以巨龙为主题的团队副本",
  texture = "BlackwingLair",
  area = 755,
  dflag = N10,
}, {
  {
    name = "狂野的拉佐格尔",
    desc = "狂野的拉佐格尔的战斗是一场非常特别的战斗,玩家需要通过控制宝珠控制拉佐格尔摧毁他房间里的龙蛋!在这个期间周围还会源源不断的涌现出小怪,如果在摧毁所有龙蛋之前将拉佐格尔杀死,那么所有在场的人都会丧生.因为这个独特的机制,玩家很难进行SOLO,或许,带上你的朋友会让战斗变得更加简单一点?",
    --icon = true,
    creature = 12435,
    display = 10115,
    coords = {0.418, 0.604, 1},
    loot = {16943,16959,16934,19337,19370,16918,16904,},
    sections = {
      Stage({
        so = true,
        name = "第一阶段: 黑翼控制者",
        desc = "在激活了战斗之后,你有47秒的时间去消灭黑翼控制者和黑翼卫士,直到下一波黑翼控制者和黑翼卫士刷新.这个阶段将在房间内所有的龙蛋被拉佐格尔摧毁后结束.",
        sections = {
          Stage({
            --stype = CREATURE,
            --creature = 54299, -- borrowing this npc
            --display = 4891,
            icon = "Interface\\Icons\\INV_Misc_Orb_05",
            name = "控制宝珠",
            desc = "一旦使用龙类控制宝珠,玩家将控制拉佐格尔,并且可以使用他的技能来摧毁房间内的龙蛋.\N\n 请注意保护好使用龙类控制宝珠的队友,一旦他受到攻击将会缩短控制拉佐格尔的持续时间.而每次使用龙类控制宝珠都会获得一个60秒冷却的Debuff,在拥有这个Debuff的期间,你将不能再次使用龙类控制宝珠",
            flag1 = IMPORTANT,
            sections = { -- same order as actionbar: buttons 4-7
              Spell(19873), -- Destroy Egg
              Spell(19872), -- Calm Dragonkin
              Spell(19632), -- Cleave
              Spell(22425, {desc = "对45码内的所有敌人造成113点至154点的火焰伤害."}), -- Fireball Volley
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 12557,
            display = 14296,
            name = "黑翼控制者",
            sections = {
              Spell(22273, {desc = "向敌人发射法术飞弹,造成66点至77点奥术伤害."}), -- Arcane Missiles
              Spell(14515, {desc = "控制一个人形生物,持续15秒.", flag1 = MAGIC}), -- Dominate Mind
              Spell(22274, {flag1 = MAGIC}), -- Greater Polymorph
              Spell(13747, {flag1 = MAGIC}), -- Slow
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 14456,
            display = 12024,
            name = "黑翼卫士",
            sections = {
              Spell(15284), -- Cleave
              Spell(23967), -- Dragonbane
              Spell(15580, {desc = "一次普通的攻击,对敌人造成15点近战伤害."}), -- Strike
            },
          }),
        },
      }),
      Stage({
        name = "第二阶段: 增援",
        desc = "从房间的四个角落中源源不断的涌出兽人和龙人的援军.场面上最多同时可存在40个兽人和12个龙人,他们在被杀死之后会继续刷新.这个阶段会持续到房间内所有的龙蛋被摧毁,然后第三阶段开始",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 12416,
            display = 12024,
            name = "黑翼军团士兵",
            sections = {
              Spell(15284), -- Cleave
              Spell(23967), -- Dragonbane
              Spell(15580, {desc = "一次普通的攻击,对敌人造成15点近战伤害."}), -- Strike
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 12420,
            display = 11979,
            name = "黑翼缚法者",
            sections = {
              Spell(22271, {desc = "制造一次以施法者为中心的魔法爆炸，对半径10码范围内的所有目标造成74~87点奥术伤害"}), -- Arcane Explosion
              Spell(17290, {desc = "发射一枚火球，造成199~232点火焰伤害."}), -- Fireball
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 12422,
            display = 2554,
            name = "死爪龙人",
            sections = {
              Spell(15284), -- Cleave
              Spell(23967), -- Dragonbane
              Spell(15580, {desc = "一次普通的攻击,对敌人造成15点近战伤害."}), -- Strike
            },
          }),
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 12435,
        display = 10115,
        name = "第三阶段: 疯狂的拉佐格尔",
        desc = "一旦所有的龙蛋被摧毁,场面上的龙人和兽人将逃离拉佐格尔的房间.",
        sections = {
          --Spell(19872), -- Calm Dragonkin
          Spell(19632), -- Cleave
          Spell(23023, {flag1 = TANK}), -- Conflagration
          --Spell(19873), -- Destroy Egg
          --Spell(23024), -- Fireball
          Spell(22425, {desc = "对45码内所有的敌人造成113~154点的火焰伤害."}), -- Fireball Volley
          --Spell(25104), -- Summon Player
          Spell(24375), -- War Stomp
          --Spell(23040), -- Warming Flames
        },
      }),
    },
    adds = {
      --{
      --  name = "Orb of Domination",
      --  creature = 54299, -- borrowing this npc
      --  display = 4891,
      --},
      {
        name = "黑翼控制者",
        creature = 12557,
        display = 14296,
      },
      {
        name = "黑翼军团士兵",
        creature = 14456, -- 12416
        display = 12024,
      },
      {
        name = "黑翼缚法者",
        creature = 12420,
        display = 11979,
      },
      {
        name = "死爪龙人",
        creature = 12422,
        display = 2554,
      },
    },
  },
  {
    name = "堕落的瓦拉斯塔兹",
    desc = "瓦拉斯塔兹是一头红龙.初始是对玩家友好状态,但是在剧情对话结束后会变成敌人,",
    --icon = true,
    creature = 13020,
    display = 13992,
    coords = {0.337, 0.288, 1},
    loot = {16925,16944,19340,16910,16933,16952,19372,},
    sections = {
      Spell(55740, {desc = "在战斗开始之前,瓦拉斯塔兹会为每个玩家施加一个'红龙精华'的Debuff,可为玩家每秒恢复500法力,50能量,20怒气或者20符文值."}), -- Essence of the Red
      Spell(23462, {desc = "瓦拉斯塔兹会定期释放一次火焰新星,对每个玩家造成555~645点火焰伤害.", flag1 = HEALER}), -- Fire Nova
      Spell(18173, {desc = "随机对一名玩家释放,持续20秒.在持续时间内,该玩家所造成的伤害提高100%,所有法术变为瞬发,每秒扣除5%的生命值,同时还对周围的玩家每秒造成4376~5624点溅射伤害.持续效果结束之后,该玩家死亡,不损失装备耐久.", flag1 = DEADLY}), -- Burning Adrenaline
      Spell(19983), -- Cleave
      Spell(23461), -- Flame Breath
      Spell(15847, {flag1 = DPS}), -- Tail Sweep
      --Spell(23620), -- Burning Adrenaline
      --Spell(23513), -- Essence of the Red
      --Spell(20279), -- Summon Player
    },
  },
  {
    name = "勒什雷尔",
    desc = "勒什雷尔的战斗是一场非常有意思的战斗,在正式进入BOSS的战斗之前,你需要通过被雏龙环绕的陷阱房,当玩家进入勒什雷尔的视野之后,BOSS战正式开始.",
    --icon = true,
    creature = 12017,
    display = 14308,
    coords = {0.504, 0.620, 3},
    loot = {16906,16949,16898,16957,19342,16941,19374,},
    sections = {
      Stage({
        so = true,
        name = "陷阱房",
        desc = "如果要直面勒什雷尔,你需要通过遍布镇压装置的陷阱房,镇压装置可以被盗贼的开锁暂时解除.当镇压装置影响到玩家的时候,玩家的移动速度,攻击速度以及施法速度降低80%",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 14024, -- 14025, 14023, 14022
            display = 9994, -- 14720, 694, 956
            name = "腐化的雏龙",
            desc = "攻击力不高,但是会聚堆出现.",
            sections = {
              Spell(6603, {desc = "自动攻击目标的敌人."}),
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 12468,
            display = 12892,
            name = "死爪龙人队长",
            sections = {
              Spell(22275, {desc = "召唤一根火柱，对攻击范围内的所有敌人造成199~232点火焰伤害，并在8秒内造成额外的2点火焰伤害."}), -- Flamestrike
              Spell(22442), -- Growing Flames
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 12458,
            display = 11967,
            name = "黑翼工头",
            sections = {
              Spell(22458, {flag1 = IMPORTANT}), -- Healing Circle
              Spell(17289, {desc = "使用暗影魔法攻击附近的敌人，造成74~87点暗影伤害."}), -- Shadow Shock
            },
          }),
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 12017,
        display = 14308,
        name = "勒什雷尔",
        sections = {
          Spell(23331, {desc = "施法者放出一道火焰冲击波，20码内所有的敌人都会受到2625~3375点火焰伤害，同时降低移动速度，持续8秒."}), -- Blast Wave
          Spell(15284), -- Cleave
          Spell(18670, {flag1 = TANK}), -- Knock Away
          Spell(24573, {flag1 = TANK}), -- Mortal Strike
        },
      }),
    },
    adds = {
      {
        name = "腐化的雏龙",
        creature = 14024, -- 14025, 14023, 14022
        display = 9994, -- 14720, 694, 956
      },
      {
        name = "死爪龙人队长",
        creature = 12468,
        display = 12892,
      },
      {
        name = "黑翼工头",
        creature = 12458,
        display = 11967,
      },
    },
  },
  {
    name = "费尔默",
    desc = "费尔默是黑翼之巢第四个BOSS,他与这个副本中另外两个BOSS共享掉落列表.这三个BOSS有概率会掉落T2手套.以前坦克必须装备奥妮克希亚鳞片披风来避免被暗影烈焰秒杀,而在如今改版之后,已经不再是必须品了",
    --icon = true,
    creature = 11983,
    display = 6377,
    coords = {0.462, 0.429, 3},
    loot = {16928,19344,19401,19398,19394,19399,16956,16964,19395,16913,19397,},
    sections = {
      Spell(23341, {desc = "对敌人造成139~161点火焰伤害，并使其在受到火焰系攻击时承受的伤害提高150点，持续20秒.", flag1 = IMPORTANT}), -- Flame Buffet
      Spell(22539, {flag1 = TANK}), -- Shadow Flame
      --Spell(20279), -- Summon Player
      Spell(3391), -- Thrash
      Spell(23339, {flag1 = TANK}), -- Wing Buffet
    },
  },
  {
    name = "埃博诺克",
    desc = "埃博诺克是黑翼之巢第五个BOSS,他与这个副本中另外两个BOSS共享掉落列表.这三个BOSS有概率会掉落T2手套.以前坦克必须装备奥妮克希亚鳞片披风来避免被暗影烈焰秒杀,而在如今改版之后,已经不再是必须品了.",
    --icon = true,
    creature = 14601,
    display = 6377,
    coords = {0.348, 0.215, 3},
    loot = {16948,19345,19403,16899,19405,16956,16913,19396,16940,19397,},
    sections = {
      Spell(23340, {desc = "目标受到近战伤害时为埃博诺克恢复25000点生命值.", flag1 = TANK}), -- Shadow of Ebonroc
      Spell(22539, {flag1 = TANK}), -- Shadow Flame
      --Spell(20279), -- Summon Player
      Spell(3391), -- Thrash
      Spell(23339, {flag1 = TANK}), -- Wing Buffet
    },
  },
  {
    name = "弗莱格尔",
    desc = "弗莱格尔是黑翼之巢第六个BOSS,他与这个副本中另外两个BOSS共享掉落列表.这三个BOSS有概率会掉落T2手套.以前坦克必须装备奥妮克希亚鳞片披风来避免被暗影烈焰秒杀,而在如今改版之后,已经不再是必须品了.",
    --icon = true,
    creature = 11981,
    display = 6377,
    coords = {0.355, 0.377, 4},
    loot = {16899,19432,19430,19394,19357,16956,16964,16940,16907,19395,},
    sections = {
      Spell(23342, {desc = "Decreases the time between your attacks by 150% for 10 seconds.  Also deals 555 to 645 Fire damage to the raid each 2 seconds.", flag1 = ENRAGE}), -- Enrage
      Spell(22539, {flag1 = TANK}), -- Shadow Flame
      --Spell(20279), -- Summon Player
      Spell(3391), -- Thrash
      Spell(23339, {flag1 = TANK}), -- Wing Buffet
    },
  },
  {
    name = "克洛玛古斯",
    desc = "克洛玛古斯是黑翼之巢中唯一一个非龙类BOSS.它最具有特色的是它的多彩护甲.顾名思义,多彩护甲不同的颜色分别代表了不同的龙血之痛的能力.在与克洛玛古斯战斗时,它会随机使用不同颜色的护甲---对应着不同的易伤和抗性,以及不同的龙血之痛的能力.在一定的时间之后,它还会再一次变换自己的护甲颜色.",
    --icon = true,
    creature = 14020,
    display = 14367,
    coords = {0.398, 0.724, 4},
    loot = {19390,16924,16917,16953,19349,16945,16902,19385,19392,19389,19347,},
    sections = {
      Stage({
        so = true,
        name = "龙血之痛",
        desc = "克洛玛古斯将会对玩家随机释放龙血之痛.",
        sections = {
          Spell(23174, {so = true, desc = "一旦一名玩家同时拥有了5个龙血之痛的Debuff,他将变成一个多彩龙人并且开始攻击玩家,具有顺劈攻击,近战伤害提升600%,魔法抗性提高500点,持续5分钟.", flag1 = IMPORTANT}), -- Chromatic Mutation
          Spell(23154, {flag1 = CURSE}), -- Brood Affliction: Black
          Spell(23153, {desc = "每秒燃烧50点法力值,施法速度降低50%,移动速度降低30%.", flag1 = MAGIC}), -- Brood Affliction: Blue
          Spell(23170, {desc = "随机使玩家昏迷4秒.可被沙漏解除,黑翼之巢中的小怪有概率掉落沙漏这个物品.", flag1 = IMPORTANT}), -- Brood Affliction: Bronze
          Spell(23169, {flag1 = POISON}), -- Brood Affliction: Green
          Spell(23155, {flag1 = DISEASE}), -- Brood Affliction: Red
        },
      }),
      Stage({
        name = "吐息",
        desc = "克洛玛古斯将在5种吐息中随机使用一种,除非战斗开始,否则你将不知道它下一次将使用哪一个吐息.",
        sections = {
          Spell(23314, {desc = "每3秒造成875~1125点伤害,护甲值降低3939点,持续15秒."}), -- Corrosive Acid (#23313 duplicate?)
          Spell(23189), -- Frost Burn (#23187 old?)
          Spell(23316), -- Ignite Flesh (#23315 old?)
          Spell(23309), -- Incinerate (#23308 old?)
          Spell(23312, {desc = "被冻结在时光流中,生命值降低50%,持续8秒.", flag1 = HEALER}), -- Time Lapse (#23310 old?)
        },
      }),
      Spell(23128, {desc = "克洛玛古斯进入狂暴状态, 攻击速度提高150%,持续8秒.", flag1 = ENRAGE}), -- Enrage
      Spell(23537, {desc = "当生命值降到20%以下后, 克洛玛古斯进入狂乱状态, 攻击速度提高50%,对玩家造成的物理伤害提高219~281点.", flag1 = HEALER}), -- Frenzy
    },
  },
  {
    name = "奈法利安",
    desc = "黑龙奈法利安是死亡之翼的长子.他的人类形态是领主维克多·奈法里奥斯,黑石之王.奈法利安统领着黑石氏族及多个食人魔氏族,他在黑石塔顶端的巢穴中进行统治.奈法利安精通通用语,达纳苏斯语,矮人语,地精语,侏儒语,低级通用语,兽人语,萨拉斯语和赞达拉语.",
    --icon = true,
    creature = 11583,
    display = 11380,
    coords = {0.704, 0.727, 4},
    loot = {13146,13123,16942,7976,16950,13120,19380,6622,19378,19003,16897,13116,19382,2564,19377,13015,19375,13002,16931,4696,16963,13125,16929,13070,16955,13072,16947,13073,19363,13003,19356,13000,19364,13036,13008,13053,13107,5266,13126,13096,13130,1973,},
    sections = {
      Stage({
        so = true,
        name = "第一阶段: 多彩龙兽",
        desc = "当玩家击杀42只多彩龙兽之后,进入下一阶段.",
        sections = {
          Stage({
            so = true,
            stype = CREATURE,
            creature = 10162,
            display = 9472,
            name = "黑石领主奈法利安",
            desc = "你无法攻击他, 但是他会在第一阶段使用人形态对你们进行攻击. 他会随机闪现到任意一个地方并且随机攻击一名玩家.",
            sections = {
              Spell(22667, {desc = "使用死亡之翼的狡诈来魅惑目标,使其所造成的伤害提高300%,并开始攻击奈法利安的敌人，持续15秒.", flag1 = IMPORTANT}), -- Shadow Command
              Spell(22666, {desc = "使一个目标沉默,在6秒内不能施法.", flag1 = MAGIC}), -- Silence
              Spell(22678, {desc = "使一个目标因为极度的恐惧而奔逃,最多持续6秒.", flag1 = MAGIC}), -- Fear
              Spell(22665, {desc = "向30码内的所有敌人射出暗影箭,对它们造成133~154点暗影伤害."}), -- Shadow Bolt Volley
              Spell(22677, {desc = "向一个目标射出暗影箭,造成1020~1380点暗影伤害."}), -- Shadow Bolt
              --Spell(22663), -- Nefarian's Barrier
              --Spell(22664), -- Shadowblink
              --Spell(22681), -- Shadowblink
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 14265,
            display = 14885,
            name = "多彩龙兽",
            sections = {
              Spell(22560, {so = true}),
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 14265,
            display = 14885,
            name = "黑色龙兽",
            sections = {
              Spell(22560, {so = true}),
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 14261,
            display = 14886,
            name = "蓝色龙兽",
            sections = {
              Spell(22559, {so = true}),
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 14263,
            display = 14887,
            name = "青铜龙兽",
            sections = {
              Spell(22642, {so = true}),
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 14262,
            display = 14888,
            name = "绿色龙兽",
            sections = {
              Spell(22561, {so = true}),
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 14264,
            display = 14889,
            name = "红色龙兽",
            sections = {
              Spell(22558, {so = true}),
            },
          }),
        },
      }),
      Stage({
        name = "第二阶段: 奈法利安",
        desc = "当奈法利安的生命值低于20%时,将会使用第三阶段的技能,但是第二阶段会一直持续到奈法利安被击败为止.",
        sections = {
          Stage({
            icon = "Interface\\Icons\\INV_Misc_Questionmark",
            name = "职业点名",
            desc = "每隔25-30秒, 奈法利安会对某个职业进行点名, 该职业的所有玩家会受到这次职业点名的特殊影响.",
            sections = {
              Stage({
                --Spell(23398), -- Involuntary Transformation
                icon = "Interface\\Icons\\Ability_Druid_Maul",
                name = "德鲁伊(自然变形)",
                desc = "强制使德鲁伊玩家进入猎豹形态,持续30秒.",
              }),
              Stage({
                --Spell(51399), -- Death Grip
                --Spell(49560), -- Death Grip
                icon = "Interface\\Icons\\Spell_DeathKnight_ClassIcon",
                name = "死亡骑士(死亡之握)",
                desc = "奈法利安将会随机对一名玩家释放死亡之握.",
              }),
              Stage({
                icon = "Interface\\Icons\\INV_Weapon_Bow_07",
                name = "猎人(远程武器损坏)",
                desc = "猎人装备的远程武器的耐久度将变为0点.",
              }),
              Stage({
                --Spell(23410), -- Wild Magic
                icon = "Interface\\Icons\\INV_Staff_13",
                name = "法师(狂野魔法)",
                desc = "将周围随机的玩家变形成为一些奇怪的小动物,持续30秒.",
              }),
              Stage({
                --Spell(23401), -- Corrupted Healing
                icon = "Interface\\Icons\\Inv_Staff_30",
                name = "牧师(堕落治疗)",
                desc = "使牧师对目标的直接治疗法术转而造成持续法术伤害.",
              }),
              Stage({
                --Spell(23418), -- Siphon Blessing
                icon = "Interface\\Icons\\Ability_Thunderbolt",
                name = "圣骑士(虹吸祝福)",
                desc = "奈法利安强制圣骑士玩家对其施加保护祝福.",
              }),
              Stage({
                --Spell(23414), -- Paralyze
                icon = "Interface\\Icons\\INV_ThrowingKnife_04",
                name = "盗贼(麻痹)",
                desc = "将盗贼玩家随机传送到一个地点并且被固定在原地无法移动,持续30秒.",
              }),
              Stage({
                icon = "Interface\\Icons\\Spell_Nature_Bloodlust",
                name = "萨满祭司(崩坏图腾)",
                desc = "萨满祭司将使用比他们自身力量更强大的崩坏图腾,但是作用于奈法利安",
              }),
              Stage({
                --Spell(23397), -- Berserk
                icon = "Interface\\Icons\\INV_Sword_27",
                name = "战士(狂暴)",
                desc = "强制使战士进入狂暴姿态,持续30秒,受到的伤害提高30%",
              }),
              Stage({
                --Spell(23427), -- Summon Infernals
                icon = "Interface\\Icons\\Spell_Nature_Drowsy",
                name = "术士(召唤地狱火)",
                desc = "两个巨大的地狱火恶魔从天而降,地狱火恶魔会不断释放地狱烈焰,对5码范围内的玩家每3秒造成14~17点火焰伤害,并且使他们晕眩2秒.",
              }),
            },
          }),
          Spell(22686), -- Bellowing Roar
          Spell(19983), -- Cleave
          Spell(22539, {flag1 = TANK}), -- Shadow Flame
          --Spell(20279), -- Summon Player
          Spell(23364, {flag1 = DPS}), -- Tail Lash
          Spell(22687, {flag1 = CURSE}), -- Veil of Shadow
        },
      }),
      Stage({
        name = "第三阶段: 白骨魔像",
        desc = "当奈法利安的生命值降低至20%以后,他将使用堕落的力量使之前被击杀的42只龙兽全部复活成白骨魔像,玩家需要使用AOE技能来击杀这42只白骨魔像.",
        sections = {
          Spell(8355, {so = true}), -- Exploit Weakness
        },
      }),
    },
    adds = {
      {
        name = "黑石领主奈法利安",
        creature = 10162,
        display = 9472,
      },
      {
        name = "多彩龙兽",
        creature = 14265,
        display = 14885,
      },
      {
        name = "白骨魔像",
        creature = 14605,
        display = 12073,
      },
    },
  },
})

table.insert(db, BLACKWING_LAIR)
