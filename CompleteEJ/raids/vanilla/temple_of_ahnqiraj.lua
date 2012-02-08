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

local TEMPLE_OF_AHNQIRAJ = CreateInstance({
  name = "安其拉神殿",
  desc = "安其拉是古老虫族其拉帝国沉睡的地方,在WOW1。9版本中玩家通过进行一系列的捐助任务和精英任务开启甲虫之门,从而进入副本安其拉神庙和安其拉废墟.这两个副本中的废墟（20人副本）会掉落与塞纳里奥议会声望相关的任务物品以换取相应的装备,而神庙则掉落俗称t2.5的套装.在60级阶段是非常热门的两个大型团队副本.而在壮观的开门任务中，玩家不仅能欣赏到青铜龙族与其拉虫群之间的宿命争斗,而且带领大家开启甲虫之门的那名首领还能获得珍贵的甲虫坐骑.安其拉也是魔兽世界历史上第一个引入声望物品兑换套装系统的副本.",
  texture = "TempleofAhnQiraj",
  area = 766,
  dflag = N10,
}, {
  {
    name = "预言者斯克拉姆",
    desc = "预言者斯克拉姆是上古之神克苏恩预言的始作俑者.",
    --icon = true,
    creature = 15263,
    display = 15345,
    coords = {0.459, 0.518, 2},
    loot = {21703,21699,21702,20731,21708,22222,21704,20734,21814,20736,},
    sections = {
      Spell(26194, {desc = "以震撼性的力量攻击目标,对其造成149~174点自然伤害,并使其在2秒内不能施法.\n预言者会持续不断的每秒施展这个法术,直到他的本体遭受到近战攻击的伤害.", flag1 = TANK, flag2 = IMPORTANT}), -- Earth Shock
      Spell(26192, {desc = "制造一次以施法者为中心的魔法爆炸，对附近30码内的敌人造成187~217点奥术伤害.", flag1 = MAGIC, flag2 = INTERRUPT}), -- Arcane Explosion
      Spell(785, {desc = "被预言者斯克拉姆的力量所控制.受到控制时,目标的所有法术皆变为瞬发,造成的伤害提高300%,所有抗性提高50,并且移动速度提高40%,持续20秒.", flag1 = IMPORTANT}), -- True Fulfillment
      Spell(747, {name = "召唤幻象", desc = "预言者斯克拉姆在血量降至75%,50%,25%的时候会召唤出两个血量同等的幻象,玩家应该优先击杀掉幻象,避免更多的玩家的心智被预言者控制."}, 1), -- Summon Images
      Spell(4801, {desc = "预言者与他的幻象互相交换位置."}), -- Teleport (8195, 20449, duplicates?)
      --Spell(3730), -- Initialize Image
      --Spell(20477), -- Summon Player
    },
  },
  {
    name = "其拉虫群三巨头(吉祥三宝)",
    desc = "克里勋爵、亚尔基公主、维姆三名其拉异种虫被称为安其拉的吉祥三宝.",
    --icon = true,
    creature = 15511,
    display = 15656,
    coords = {0.284, 0.497, 1},
    loot = {20727,21603,21232,21695,21681,21692,20731,21694,20736,},
    sections = {
      Stage({
        stype = CREATURE,
        creature = 15511,
        display = 15656,
        name = "克里勋爵",
        sections = {
          Spell(25812, {desc = "对目标造成450~750点自然伤害,并且每2秒造成额外的150点自然伤害,持续16秒.这个效果可以叠加20层.", flag1 = POISON}), -- Toxic Volley
          Spell(40504), -- Cleave
          Spell(3391), -- Thrash
          Spell(26590, {so = true, desc = "死亡的毒云笼罩着克里勋爵,对邻近的敌人造成每秒2000点自然伤害,持续2分钟,同时被毒云影响的玩家移动速度降低40%,持续9秒.", flag1 = DEADLY}), -- Summon Poison Cloud
          --Spell(20477), -- Summon Player
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 15543,
        display = 15657,
        name = "亚尔基公主",
        sections = {
          Spell(25807, {desc = "为一名盟友恢复69375~80625点生命值.", flag1 = INTERRUPT, flag2 = IMPORTANT}), -- Great Heal
          Spell(26580, {desc = "使45码内的敌人感到恐惧并逃跑,持续最多8秒.", flag1 = MAGIC}), -- Fear
          Spell(3242), -- Ravage
          --Spell(20477), -- Summon Player
          Spell(26590, {so = true, name = "虫群", desc = "亚尔基公主被杀死后会召唤出大批小形异种虫的虫群."}, 1),
          --Spell(26662), -- Berserk
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 15544,
        display = 15658,
        name = "维姆",
        sections = {
          Spell(26561, {desc = "对敌人发起冲锋,将其击退并造成普通伤害外加300点伤害", flag1 = IMPORTANT}), -- Berserker Charge
          --Spell(18670), -- Knock Away
          Spell(19128, {desc = "对目标及其身边的敌人造成伤害,并使其昏迷2秒.最多可影响5个目标."}), -- Knockdown
          Spell(26590, {so = true, name = "激怒", desc = "维姆被杀死后,克里勋爵和亚尔基公主的攻击速度提高150%,物理伤害提高100%.", flag1 = IMPORTANT}, 1),
          --Spell(20477), -- Summon Player
          --Spell(25790), -- Vengeance
        },
      }),
      Spell(26662, {so = true, desc = "如果战斗时间超过15分钟,所有BOSS的攻击和移动速度提高150%,对敌人造成的所有伤害提高500%.并且免疫嘲讽."}), -- Berserk
    },
    adds = {
      {
        name = "亚尔基公主",
        creature = 15543,
        display = 15657,
      },
      {
        name = "维姆",
        creature = 15544,
        display = 15658,
      },
    },
  },
  {
    name = "战争守卫沙尔图拉",
    desc = "战争守卫沙尔图拉率领着三名皇家守卫镇守着安其拉神殿的中央入口.",
    --icon = true,
    creature = 15516,
    display = 15583,
    coords = {0.444, 0.338, 1},
    loot = {21237,21648,21675,21672,20731,21667,76402,21668,20734,21673,20727,},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 15984,
        display = 15465,
        name = "沙尔图拉皇家守卫",
        sections = {
          Spell(26027, {desc = "将10码内的所有敌人击退,并且忽略他们.", flag1 = IMPORTANT}), -- Knockback
          Spell(26038, {desc = "像旋风一般挥舞手中的武器,对附近的敌人造成每秒普通伤害再加上1080~1320点伤害,持续8秒."}), -- Whirlwind (triggers 26686 each second)
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 15516,
        display = 15583,
        name = "战争守卫沙尔图拉",
        sections = {
          Spell(25174, {desc = "对目标和其附近的盟友造成普通武器伤害再加上30点额外伤害,最多可影响3个目标.同时使其护甲降低240点,持续30秒.", flag1 = TANK}), -- Sundering Cleave
          Spell(26083, {desc = "像旋风一般挥舞手中的武器,对附近的敌人造成每秒普通伤害再加上680~920点伤害,持续15秒."}), -- Whirlwind (triggers 26084 each second)
          Spell(8269, {desc = "当战争守卫沙尔图拉生命值降至20%以下时,攻击速度提高60%."}), -- Frenzy
        },
      }),
      Spell(26662, {so = true, desc = "当战斗时间超过10分钟之后,沙尔图拉进入狂暴状态,攻击速度提高150%,所有伤害提高500%."}), -- Berserk
    },
    adds = {
      {
        name = "沙尔图拉皇家守卫",
        creature = 15984,
        display = 15465,
      },
    },
  },
  {
    name = "顽强的范克瑞斯",
    desc = "顽强的范克瑞斯是安其拉废墟1号BOSS库林纳克斯的兄长.",
    --icon = true,
    creature = 15510,
    display = 15743,
    coords = {0.621, 0.228, 1},
    loot = {76402,21664,21663,20727,22402,21650,21627,21232,21639,20730,},
    sections = {
      Spell(518, {so = true, desc = "在范克瑞斯所在的房间中,范克瑞斯的爪牙会在随机地点刷新并且加入战斗.", flag1 = DEADLY, sections = {
        Stage({
          stype = CREATURE,
          creature = 15630,
          display = 15582,
          name = "范克瑞斯的爪牙",
          flag1 = DEADLY,
          sections = {
            Spell(26662, {so = true, desc = "玩家有20秒的时间来击杀刷新的范克瑞斯的爪牙,超过20秒之后,范克瑞斯的爪牙会进入狂暴状态,移动速度和攻击速度提高150%,伤害提高500%,并且免疫嘲讽.", flag1 = DEADLY}), -- Berserk
          },
        }),
      }}), -- Summon Worm (25831, 25832, all the 3 locations got their own spell)
      Spell(720, {so = true, desc = "顽强的范克瑞斯的巢穴将目标拖至附近异种巢虫的路径中,并将其纠缠8秒.", flag1 = IMPORTANT, sections = {
        Stage({
          stype = CREATURE,
          creature = 15962,
          display = 15362,
          name = "维克尼雏虫",
          desc = "对靠近的非坦克玩家造成900点伤害,对坦克玩家造成的伤害降低.",
        }),
      }}), -- Entangle (731, 1121, all the 3 tunnels got their own spell)
      Spell(25646, {so = true, desc = "对目标进行惩戒打击,使其受到的治疗法术效果降低10%.", flag1 = TANK}), -- Mortal Wound
    },
    adds = {
      {
        name = "范克瑞斯的爪牙",
        creature = 15630,
        display = 15582,
      },
      {
        name = "维克尼雏虫",
        creature = 15962,
        display = 15362,
      },
    },
  },
  {
    name = "维希度斯",
    desc = "维希度斯是一个可被跳过的BOSS,如果你想要击杀这个BOSS需要非常高的自然抗性装做支持.当你们在和这个BOSS进行战斗时将要灭团了的时候,可以逃出它的房间来重置这个BOSS.",
    --icon = true,
    creature = 15299,
    display = 15686,
    coords = {0.721, 0.181, 1},
    loot = {20734,21232,21623,20932,21625,76402,22399,20727,},
    sections = {
      Stage({
        name = "冰冷的三个阶段",
        desc = "要击败维希度斯需要长时间对它造成冰霜伤害,伤害的大小不是关键,关键在于对它攻击的次数.",
        sections = {
          Stage({
            so = true,
            name = "维希度斯变慢了!",
            desc = "移动速度和攻击速度降低15%,要达到这个阶段需要对维希度斯进行100次冰霜攻击.",
          }),
          Stage({
            so = true,
            name = "维希度斯快被冰住了!",
            desc = "移动速度和攻击速度降低30%,要达到这个阶段需要对维希度斯进行150次冰霜攻击.",
          }),
          Stage({
            so = true,
            name = "维希度斯被冻住了!",
            desc = "移动和攻击都停止了,要达到这个阶段需要对维希度斯进行200次冰霜攻击.至此为止,冰冷的三个阶段暂时结束,进入肉搏的三个阶段.",
          }),
        },
      }),
      Stage({
        name = "肉搏的三个阶段",
        desc = "一旦维希度斯被冻结成冰块,那么玩家就需要对它进行肉搏攻击解冻,然后再次进入冰冷的三个阶段.",
        sections = {
          Stage({
            so = true,
            name = "维希度斯开始解冻了!",
            desc = "继续物理攻击.",
          }),
          Stage({
            so = true,
            name = "维希度斯准备溶解了!",
            desc = "继续物理攻击.",
          }),
          Stage({
            so = true,
            name = "维希度斯炸成碎片了!",
            desc = "维希度斯分裂成20个维希度斯水滴,从四周向中间聚拢,并且重新合并成维希度斯的本体,然后再次进入冰冷的三个阶段.",
          }),
          Stage({
            stype = CREATURE,
            creature = 15667,
            display = 12349,
            name = "维希度斯水滴",
            desc = "水滴从四周缓慢的向着中间聚拢,准备重新合体成维希度斯的本体.",
          }),
        },
      }),
      Spell(25993, {so = true, desc = "向施法者前方的15码内所有目标喷溅毒液,对其造成1050~1350点自然伤害.", flag1 = IMPORTANT}), -- Poison Shock
      Spell(25991, {so = true, desc = "向敌人射出毒箭,对其造成1313~1687点自然伤害,并每2秒造成一次额外的413~587点自然伤害,持续10秒,这个效果可以叠加99层.", flag1 = POISON}), -- Poison Bolt Volley
      Stage({
        so = true,
        stype = ABILITY,
        icon = "Interface\\Icons\\INV_Misc_Slime_01",
        name = "Toxin Clouds",
        desc = "每隔30~40秒维希度斯随机向一名玩家释放一团毒云,受到毒云影响的所有玩家每两秒受到1500点自然伤害,并且移动速度降低40%.",
        flag1 = DEADLY,
      }),
      --Spell(26608), -- Despawn Globs
      --Spell(20477), -- Summon Player
    },
    adds = {
      {
        name = "维希度斯水滴",
        creature = 15667,
        display = 12349,
      },
    },
  },
  {
    name = "哈霍兰公主",
    desc = "哈霍兰公主是一头异种蜂,与她作战需要全团配置非常高的自然抗性.",
    --icon = true,
    creature = 15509,
    display = 15739,
    coords = {0.436, 0.505, 1},
    loot = {20731,21232,21617,20932,21620,20727,21616,20734,},
    sections = {
      Spell(26050, {desc = "令目标每2秒受到一次219~281点自然伤害,持续30秒,这个效果可以叠加99层.", flag1 = TANK}), -- Acid Spit
      Spell(26053, {desc = "向目标以及在目标半径15码范围内的所有敌人吐出剧毒毒液,对其造成750点自然伤害并使其沉默8秒.", flag1 = IMPORTANT}), -- Noxious Poison
      Spell(26180, {desc = "钉刺目标,使其沉睡12秒.任何伤害都会取消沉睡效果.", flag1 = POISON}), -- Wyvern Sting
      Spell(26051, {so = true, desc = "攻击间隔缩短150%,持续8秒,同时每4秒对所有玩家造成1500~2500点自然伤害.", flag1 = ENRAGE}), -- Enrage
      Spell(26068, {so = true, desc = "当哈霍兰公主生命值降至30%之后,攻击速度提高200%,每2秒对所有玩家造成1500~2500点自然伤害.", flag1 = DEADLY}), -- Berserk
    },
  },
  {
    name = "双子皇帝",
    desc = "双子皇帝维克尼拉斯大帝和维克洛尔大帝,被称为剑皇和魔皇的其拉帝国的领袖.",
    --icon = true,
    creature = 15276,
    display = 15778,
    coords = {0.605, 0.698, 1},
    loot = {20726,20735,21232,21597,21598,21602,21604,21606,21609,76402,},
    sections = {
      Stage({
        so = true,
        name = "双子皇帝共有的能力",
        sections = {
          Spell(7393, {so = true, desc = "双子皇帝在相距60码以内的时候会产生链接治疗效果,每秒为双子皇帝恢复30000点生命值.", flag1 = IMPORTANT}), -- Heal Brother
          Spell(800, {so = true, desc = "每隔30~40秒,双子皇帝会互相交换位置,在这之后第一个攻击双子皇帝的玩家会吸引所有的仇恨,这样的战斗机制意味着需要安排好坦克链以便在换边之后快速的吸引BOSS的仇恨.", flag1 = IMPORTANT, flag2 = TANK}), -- Twin Teleport
          --Spell(20477), -- Summon Player
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 15276,
        display = 15778,
        name = "维克洛尔大帝",
        desc = "魔皇,免疫任何物理攻击r.",
        sections = {
          Spell(26006, {desc = "向目标射出一支暗影箭，对其造成3600~4400点暗影伤害."}), -- Shadow Bolt
          Spell(26607, {desc = "破碎的冰块从天而降,每2秒对目标造成1388~1612点冰霜伤害,持续10秒.同时受到暴风雪影响的玩家移动速度降低30%.", flag1 = IMPORTANT}), -- Blizzard
          Spell(568, {flag1 = TANK}), -- Arcane Burst
          Spell(804, {desc = "将能量注入一只30码内的圣甲虫体内,使其在3秒后爆炸,对15码范围内的所有敌人造成2813~3187点火焰伤害.", flag1 = IMPORTANT}), -- Explode Bug
          Spell(27897, {desc = "战斗时间超过15分钟之后维克洛尔大帝将进入狂暴状态,每4秒施放一次奥术爆炸,对所有敌人造成2480~2900点奥术伤害.", flag1 = DEADLY}), -- Frenzy
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 15275,
        display = 15761,
        name = "维克尼拉斯大帝",
        desc = "剑皇,免疫除了神圣法术之外的任何法术伤害.",
        sections = {
          Spell(26007, {desc = "对目标造成普通的武器伤害外加950~1050点物理伤害,并将其击飞.", flag1 = TANK}), -- Uppercut
          Spell(26613, {flag1 = HEALER}), -- Unbalancing Strike
          Spell(802, {desc = "使25码范围内的一只圣甲虫生命值提高300%,伤害提高1800%,体型增大400%.", flag1 = IMPORTANT}), -- Mutate Bug
          Spell(27680, {desc = "战斗时间超过15分钟之后,维克尼拉斯大帝将进入狂暴状态,移动速度提高150%,所有伤害提高500%.", flag1 = DEADLY}), -- Berserk
        },
      }),
    },
    adds = {
      {
        name = "维克尼拉斯大帝",
        creature = 15275,
        display = 15761,
      },
    },
  },
  {
    name = "奥罗",
    desc = "克苏恩亲手创造的流沙蠕虫奥罗,是一个传奇的存在.坚不可摧的外壳和灵巧的移动能力,奥罗是把守着古神克苏恩的最后一道关卡",
    --icon = true,
    creature = 15517,
    display = 15509,
    coords = {0.304, 0.819, 1},
    loot = {20731,21232,23558,20931,23570,20728,21610,20730,},
    sections = {
      Stage({
        so = true,
        name = "第一阶段",
        sections = {
          Stage({
            stype = ABILITY,
            icon = "Interface\\Icons\\Spell_Nature_Earthquake",
            name = "潜入地面",
            desc = "奥罗钻到地下,无法被攻击,同时它还会不停的对地面上的玩家喷射流沙,如果近战范围内长时间没有目标,奥罗也会钻到地下.",
            flag1 = IMPORTANT,
            sections = {
              Spell(26058, {so = true, name = "沙尘地震", icon = "Interface\\Icons\\INV_Misc_Dust_02", desc = "奥罗在地下钻动,对8码内地表的玩家造成675~825点自然伤害,一共将释放5次.", flag1 = IMPORTANT}, 1), -- Summon Ouro Mounds
              Spell(26100, {so = true, desc = "当奥罗重新钻出地面,使地表的目标脚下的大地破裂,造成2250~2750点伤害并将其击退,同时召唤出大量的奥罗甲虫.", flag1 = IMPORTANT}), -- Ground Rupture
              Stage({
                so = true,
                stype = CREATURE,
                creature = 15718,
                display = 11108,
                name = "奥罗甲虫",
                desc = "伴随着奥罗钻出地面,奥罗甲虫将随机注视一个目标,持续攻击他造成30~400点伤害,45秒后奥罗甲虫消失.",
              }),
            },
          }), -- Submerge
          Spell(26103, {desc = "对30码范围内所有敌人造成2625~3375点伤害并将其击退.", flag1 = TANK}), -- Sweep
          Spell(26102), -- Sand Blast
        },
      }),
      Stage({
        so = true,
        name = "第二阶段",
        desc = "当奥罗生命值降至20%,第二阶段开始.",
        sections = {
          Spell(26615, {so = true, desc = "奥罗进入狂乱状态,攻击速度提高150%.", flag1 = DEADLY}), -- Berserk
          Spell(26616, {so = true, icon = "Interface\\Icons\\INV_Stone_10", desc = "在这个阶段,如果奥罗的近战范围内没有目标,它将随机对一名玩家投掷巨大的石块,造成6000点伤害.", flag1 = DEADLY}, 1), -- Boulder
        },
      }),
    },
    adds = {
      {
        name = "奥罗甲虫",
        creature = 15718,
        display = 11108,
      },
    },
  },
  {
    name = "克苏恩",
    desc = "5大远古邪神之一,他在希利苏斯的一场战役中被击败,克苏恩一度被认为已经被消灭了,但是他现在作为其拉虫人的幕后主使再度出现.流沙之战中,巨龙们封印了甲虫之墙,他被困在了废弃的安其拉神庙之下,在那里几千年来他施展着他的能力控制着其拉虫人,逐渐控制了整个希利苏斯.",
    --icon = true,
    creature = 15589,
    display = 15556,
    coords = {0.570, 0.630, 3},
    loot = {21585,22731,20929,20933,22732,21134,21586,21126,},
    sections = {
      Stage({
        so = true,
        name = "第一阶段",
        desc = "这个阶段将持续到克苏恩之眼被摧毁.",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 15589,
            display = 15556,
            name = "克苏恩之眼",
            sections = {
              Spell(32950, {so = true, flag1 = IMPORTANT}), -- Eye Beam
              Spell(26029, {so = true, desc = "随机选择一个敌对目标,对其射出一道黑暗眼线,克苏恩之眼顺时针或者逆时针旋转180度,被眼线扫射到的玩家立刻死亡.", flag1 = DEADLY}), -- Dark Glare
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15726,
            display = 15788,
            name = "眼球触须",
            desc = "每45秒在克苏恩周围刷新一条眼球触须,对站在刷新点上的敌对目标造成1350~1650点伤害并将其击飞.",
            sections = {
              Spell(26143, {so = true, desc = "对敌对目标每秒造成750点暗影伤害,持续10秒,使其移动速度降低到普通速度的30%.", flag1 = IMPORTANT}), -- Mind Flay
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15726,
            display = 15788,
            name = "利爪触须",
            desc = "随机刷新一条利爪触须,对站在刷新点上的敌对目标造成1350~1650点伤害并将其击飞.",
            sections = {
              Spell(26141, {so = true, desc = "对敌人造成武器伤害再加上463~537点额外伤害,并使其移动速度降低70%,持续10秒.", flag1 = IMPORTANT}), -- Hamstring
            },
          }),
        },
      }),
      Stage({
        so = true,
        name = "第二阶段",
        desc = "第二阶段克苏恩的本体将会出现,直到克苏恩被杀死.",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 15727,
            display = 15787,
            name = "克苏恩",
            desc = "每隔10秒,克苏恩将会把一名玩家拉进它的体内.",
            sections = {
              Stage({
                so = true,
                stype = CREATURE,
                creature = 15802,
                display = 15793,
                name = "巨钩触须",
                desc = "克苏恩体内的巨钩触须被破坏后,克苏恩将虚弱45秒.",
                flag1 = IMPORTANT,
              }),
              Spell(26476, {so = true, desc = "在克苏恩的体内的玩家将每5秒受到150点伤害,这个效果可以叠加99次.", flag1 = DEADLY}), -- Digestive Acid
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15726,
            display = 15788,
            name = "眼球触须",
            desc = "每45秒在克苏恩周围刷新一条眼球触须,对站在刷新点上的敌对目标造成1350~1650点伤害并将其击飞.",
            sections = {
              Spell(26143, {so = true, desc = "对敌对目标每秒造成750点暗影伤害,持续10秒,使其移动速度降低到普通速度的30%.", flag1 = IMPORTANT}), -- Mind Flay
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15334,
            display = 15948,
            name = "巨眼触须",
            desc = "每隔1分钟,克苏恩将召唤一条巨眼触须,对玩家造成2250~2750点伤害,并将其击飞.",
            sections = {
              Spell(26134, {so = true, flag1 = IMPORTANT}), -- Eye Beam
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15728,
            display = 15790,
            name = "巨爪触须",
            desc = "每隔1分钟,克苏恩将会召唤一条巨爪触须,对玩家造成2250~2750点伤害,并将其击飞,如果巨爪触须近战范围内没有敌人,它会随机束缚附近的一名玩家,抽取他们的生命值并且为自己恢复生命值.",
            sections = {
              Spell(26211, {so = true, desc = "对一个敌对目标造成普通武器伤害附加657~843点额外伤害,目标移动速度降至70%,持续10秒."}), -- Hamstring
              Spell(6524, {so = true, desc = "使附近20码范围内的敌对目标昏迷2秒."}), -- Ground Tremor
              Spell(3391, {flag1 = HEALER}), -- Thrash
            },
          }),
        },
      }),
    },
    adds = {
      {
        name = "克苏恩",
        creature = 15727,
        display = 15787,
      },
    },
  },
})

table.insert(db, TEMPLE_OF_AHNQIRAJ)
