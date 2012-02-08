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

local KARAZHAN = CreateInstance({
  name = "卡拉赞",
  desc = "卡拉赞曾被艾泽拉斯最强的人拥有，即提瑞斯法守护者麦迪文。自从麦迪文死后，一股死亡气息弥漫在卡拉赞与其周围的土地上。那里的厅堂与长廊中，他召唤出了无数并不属于这个世界的存在，研究着旁人视为禁断的课题。然而，无论是勇敢之人还是愚昧之人都义无反顾的去卡拉赞冒险，去揭开其中不可告人的秘密，找寻强大的宝物。现在就建立一个10人的团队，踏上去卡拉赞的征程吧。",
  texture = "Karazhan",
  area = 799,
  dflag = N10,
}, {
  {
    name = "仆人区",
    desc = "曾经的地下室已经不复存在，现在那里是三名随机BOSS。",
    --icon = true,
    creature = 16179,
    display = 15938,
    coords = {0.596, 0.288, 1},
    loot = {30675,30676,30677,30678,30680,30681,30682,30683,30684,30685,30686,30687,},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 16179,
        display = 15938,
        name = "潜伏者希亚奇斯",
        sections = {
          Spell(29901, {desc = "造成普通伤害，然后附带一个持续30秒每2秒500自然伤害的DEBUFF。每一层减少1000护甲，每7跳涨一层，最高可达到每2秒3500自然伤害，减少7000护甲。", flag1 = POISON}), -- Acidic Fang
          Spell(29896, {desc = "击晕一名敌人10秒。", flag1 = MAGIC}), -- Hyakiss' Web
          Spell(22766, {desc = "潜伏者希亚奇斯进入潜行状态，试着在阴暗的角落找到它。"}), -- Sneak
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 16181,
        display = 16054,
        name = "蹂躏者洛卡德",
        sections = {
          Spell(29906), -- Ravage
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 16180,
        display = 16053,
        name = "滑翔者沙德基斯",
        sections = {
          Spell(29903, {desc = "对45码内的目标造成普通伤害，并击晕目标2秒。"}), -- Dive
          Spell(29904, {desc = "对20码内所有敌人造成 2188—2812 普通伤害，并打断沉默5秒。", flag1 = MAGIC}), -- Sonic Burst
          Spell(29905, {desc = "近战范围群体击退，冲锋最远队员造成 1050—1350 伤害。", flag1 = TANK}), -- Wing Buffet
        },
      }),
    },
    adds = {
      {
        name = "蹂躏者洛卡德",
        creature = 16181,
        display = 16054,
      },
      {
        name = "滑翔者沙德基斯",
        creature = 16180,
        display = 16053,
      },
    },
  },
  {
    name = "猎手阿图门",
    desc = "猎手阿图门是午夜的拥有者。如果他的马处于危险之中，阿图门会立刻冲上来保卫并杀死进攻者。作为卡拉赞中最简单的BOSS，他是对玩家装备水平的一个检验。阿图门是可跳过的BOSS。不过，莫罗斯和贞节圣女要比阿图门强很多。",
    --icon = true,
    creature = 16152,
    display = 16040,
    coords = {0.454, 0.824, 1},
    loot = {23809,28453,28454,28477,28502,28503,28504,28505,28506,28507,28508,28509,28510,30480,},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 16151,
        display = 19640,
        name = "第一阶段： 午夜",
        desc = "只有你攻击午夜，午夜才会攻击你。",
        sections = {
          Spell(29711, {desc = "Knocks down the current enemy target for 3 seconds."}), -- Knockdown
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 15550,
        display = 16416,
        name = "第二阶段： 猎手阿图门",
        desc = "当午夜剩余95%血量时，猎手阿图门加入战斗。",
        sections = {
          Spell(29833, {desc = "缴械10码内一名敌人，持续10秒。", flag1 = CURSE}), -- Intangible Presence
          Spell(29832, {desc = "暗影顺劈，对身前目标造成3000-3500的暗影伤害，可最多对3人造成伤害。", flag1 = TANK}), -- Shadow Cleave
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 16152,
        display = 16040,
        name = "第三阶段： 阿图门和午夜",
        desc = "到阿图门或午夜到达25%血量，阿图门就会骑在午夜上面。",
        sections = {
          Spell(29847, {desc = "随机对一远程目标进行冲锋并造成4500左右伤害（对布衣）附带击倒效果。", flag1 = IMPORTANT}), -- Charge
          Spell(29833, {desc = "缴械10码内一名敌人，持续10秒。", flag1 = CURSE}), -- Intangible Presence
          Spell(29711, {desc = "击倒附近敌人3秒。"}), -- Knockdown
          Spell(29832, {desc = "暗影顺劈，对身前目标造成3000-3500的暗影伤害，可最多对3人造成伤害。", flag1 = TANK}), -- Shadow Cleave
        },
      }),
    },
    adds = {
      {
        name = "猎手阿图门",
        creature = 15550,
        display = 16416,
      },
      {
        name = "午夜",
        creature = 16151,
        display = 19640,
      },
    },
  },
  {
    name = "莫罗斯",
    desc = "莫罗斯是卡拉赞的管家，他拥有四名特殊的随从在卡拉赞的宴会厅。这是卡拉赞的第二场BOSS战，只有击败了他才能去卡拉赞的歌剧院。",
    --icon = true,
    creature = 15687,
    display = 16540,
    coords = {0.270, 0.636, 3},
    loot = {28565,28566,28569,28525,28545,28528,},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 15687,
        display = 16540,
        name = "莫罗斯",
        sections = {
          Spell(34694, {desc = "致盲目标10秒，受到任何伤害就会解除此状态。", flag1 = POISON}), -- Blind
          Spell(29425, {desc = "凿击，对一名敌人造成950-1050伤害，并晕6秒。"}), -- Gouge
          Spell(37023, {desc = "当莫罗斯的血量低于30%时将进入激怒状态,在此状态下，他的伤害与攻击速度将大幅提高。", flag1 = IMPORTANT}), -- Frenzy
          Spell(29448, {so = true, desc = "莫罗斯消失12秒，并消除所有DEBUFF。", flag1 = IMPORTANT, sections = {
            Spell(37066, {desc = "消失结束后，对一名玩家进行锁喉，每3秒造成1075伤害，持续5分钟。", flag1 = HEALER}), -- Garrote
          }}), -- Vanish
        },
      }),
      Stage({
        so = true,
        name = "随从",
        desc = "莫罗斯将会从6名随从随机中选取4名进行战斗。",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 19875,
            display = 19327,
            name = "朵洛希女爵",
            sections = {
              Spell(29405, {desc = "法力燃烧，每次燃烧一名敌人950-1050的蓝，并造成475-525伤害。", flag1 = INTERRUPT}), -- Mana Burn
              Spell(29570, {desc = "精神鞭笞，每秒造成875暗影伤害持续3秒，移动速度减少50%。"}), -- Mind Flay
              Spell(29406, {desc = "提高20%暗影伤害，降低20%肉搏伤害。"}), -- Shadowform
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 19874,
            display = 16637,
            name = "洛夫男爵",
            sections = {
              Spell(13005, {desc = "击晕一名敌人5秒。", flag1 = MAGIC}), -- Hammer of Justice
              Spell(29386, {desc = "审判，造成1425-1575神圣伤害。"}), -- Judgement of Command
              Spell(29385, {desc = "自身BUFF，有几率造成额外7%的伤害，持续30秒。", flag1 = MAGIC}), -- Seal of Command
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 19872,
            display = 16640,
            name = "凯特林娜女士",
            sections = {
              Spell(29564, {desc = "治疗一名友方11250-13750血量。", flag1 = INTERRUPT}), -- Greater Heal
              Spell(15090, {desc = "驱散友方身上的减益魔法或敌方身上的增益魔法。"}), -- Dispel Magic
              Spell(29563, {desc = "神圣之火，对敌人造成837-1063火焰伤害，并额外附带一个每2秒950火焰伤害持续8秒的DEBUFF。", flag1 = MAGIC}), -- Holy Fire
              Spell(29408, {desc = "给友方套盾，吸收2500伤害，持续30秒。", flag1 = MAGIC}), -- Power Word: Shield
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 17007,
            display = 16639,
            name = "柯伊拉女士",
            sections = {
              Spell(29381, {flag1 = MAGIC}), -- Greater Blessing of Might
              Spell(29382, {desc = "保护施法者免受控制，减少攻击者的攻击速度，持续10秒。", flag1 = MAGIC}), -- Divine Shield
              Spell(29380, {desc = "驱散队友身上的减益魔法或清除毒药。"}), -- Cleanse
              Spell(29383, {desc = "治疗一名友方7400-8600血量。", flag1 = INTERRUPT}), -- Holy Light
              Spell(29562, {desc = "治疗一名友方4625-5375血量。", flag1 = INTERRUPT}), -- Holy Light
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 19876,
            display = 19328,
            name = "罗宾公爵",
            sections = {
              Spell(29572, {flag1 = HEALER}), -- Mortal Strike
              Spell(9080, {desc = "对敌人造成20%武器伤害，并减缓移动速度50%持续5秒。"}), -- Hamstring
              Spell(29573, {desc = "攻击8码内所有敌人，并额外造成600伤害。"}), -- Whirlwind (procs 15589)
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 19873,
            display = 16638,
            name = "克利斯平公爵",
            sections = {
              Spell(8379, {flag1 = IMPORTANT}), -- Disarm
              Spell(29567, {desc = "一个强力的攻击，提高肉搏438-562伤害。"}), -- Heroic Strike
              Spell(11972, {desc = "造成10%武器伤害，并打断施法。"}), -- Shield Bash
              Spell(29390, {desc = "盾墙，减少受到伤害75%持续15秒。"}), -- Shield Wall
            },
          }),
        },
      }),
    },
  },
  {
    name = "贞节圣女",
    desc = "贞节圣女是位于卡拉赞会客室一侧泰坦观测室的BOSS，讽刺的是，作为贞节圣女，被安排在了一个充满夜之女郎的房间之后。发生这样事情的原因和把她送到这里的人是谁都还不清楚。圣女是一个可选boss，可以跳过她去击杀其他的boss。",
    --icon = true,
    creature = 16457,
    display = 16198,
    coords = {0.836, 0.500, 4},
    loot = {28516,28520,28511,28512,28522,},
    sections = {
      Spell(29512, {so = true, desc = "神圣奉献，在其身边12码半径内不断施放，对范围内玩家每三秒造成240-360神圣伤害，并伴有1秒沉默效果。", flag1 = IMPORTANT}), -- Holy Ground
      Spell(32445, {so = true, desc = "类似ZUG蛇BOSS的技能，对第一目标造成2000神圣伤害，若10码内有其他成员，则发生跳跃对其造成2900伤害，第三次跳跃伤害3800，第四次5400，依此类推。瞬发，冷却时间20秒。", flag1 = IMPORTANT}), -- Holy Wrath
      Spell(29522, {desc = "对某一地方目标施放神圣之火，造成3238-3762火焰伤害，附带魔法效果，每两秒1750火焰伤害持续12秒。", flag1 = MAGIC}), -- Holy Fire
      Spell(29511, {desc = "忏悔所有玩家，昏迷10秒。"}), -- Repentance
    },
  },
  {
    name = "歌剧",
    desc = "在剧院中，与一名NPC对话即可触发战斗。从三个歌剧中随机选取一个：绿野仙踪、小红帽和罗密欧与朱丽叶。",
    --icon = true,
    creature = 16812,
    display = 16616,
    coords = {0.179, 0.348, 4},
    loot = {28572,28573,28578,28579,28581,28582,28583,28584,28585,28586,28587,28588,28589,28590,28591,28592,28593,28594,},
    sections = {
      Stage({
        stype = CREATURE,
        creature = 17521,
        display = 17053,
        name = "大灰狼",
        desc = "与老奶奶对话，她会给你讲这个故事。",
        sections = {
          Spell(30756, {so = true, desc = "将某一玩家变成小红帽，被变形的玩家护甲为0，移动速度增加50%。在此期间内大灰狼只会攻击被变成小红帽的玩家，持续20秒。", flag1 = IMPORTANT}), -- Little Red Riding Hood
          Spell(30752, {desc = "恐惧10码内的玩家3秒。", flag1 = MAGIC}), -- Terrifying Howl
          Spell(30761, {desc = "使所有玩家昏迷4秒。"}), -- Wide Swipe
        },
      }),
      Stage({
        name = "罗密欧与朱丽叶",
        desc = "两个年轻人机缘巧合之下相见，然后陷入爱河，但是他们的家庭不允许这样，两人为了在一起，不怕任何艰难险阻。",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 17534,
            display = 17068,
            name = "第一阶段： 朱丽叶",
            sections = {
              Spell(30890), -- Blinding Passion
              Spell(30887, {flag1 = MAGIC}), -- Devotion
              Spell(30878, {desc = "治疗友方46250-53750血量。", flag1 = INTERRUPT}), -- Eternal Affection
              Spell(30889, {desc = "击晕目标6秒。"}), -- Powerful Attraction
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 17533,
            display = 17067,
            name = "第二阶段： 罗密欧",
            sections = {
              Spell(30841, {flag1 = MAGIC}), -- Daring
              Spell(30822, {desc = "造成武器伤害并对目标施放一个减少10%属性的DEBUFF，可叠8层，持续1分钟。", flag1 = POISON}), -- Poisoned Thrust
              Spell(30815, {desc = "背刺10码内的某个敌人，造成1900-2100物理伤害。", flag1 = DPS}), -- Backward Lunge
              Spell(30817), -- Deadly Swathe
            },
          }),
          Stage({
            name = "第三阶段： 罗密欧与朱丽叶",
            desc = "你需要同时面对罗密欧与朱丽叶，并且他们有了新技能。",
            sections = {
              Spell(30951, {so = true, desc = "他们必须在10秒内同时死亡，不然就会复活。", flag1 = IMPORTANT}), -- Undying Love
            },
          }),
        },
      }),
      Stage({
        name = "绿野仙踪",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 17535,
            display = 17069,
            name = "桃乐丝",
            sections = {
              Spell(31014, {desc = "召唤他的小狗，随机攻击可沉默目标。"}), -- Summon Tito
              Spell(31013, {desc = "恐惧附近的3名玩家2秒。"}), -- Frightened Scream
              Spell(31012), -- Water Bolt
              Stage({
                so = true,
                stype = ABILITY,
                icon = "Interface\\Icons\\INV_Misc_QuestionMark",
                name = "Attention Disorder",
                desc = "不能被打断或嘲讽，随机攻击。",
                flag1 = IMPORTANT,
              }),
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 17548,
            display = 17079,
            name = "蒂托",
            sections = {
              Spell(31015), -- Annoying Yipping
              Stage({
                so = true,
                stype = ABILITY,
                icon = "Interface\\Icons\\Spell_Misc_EmotionAngry",
                name = "Anguished Mourning",
                desc = "如果在桃乐丝活着的时候杀了蒂托，桃乐丝就会狂暴。",
                flag1 = IMPORTANT,
              }),
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 17546,
            display = 18261,
            name = "老虎",
            sections = {
              Spell(31041, {flag1 = HEALER}), -- Mangle
              Spell(31042, {flag1 = HEALER}), -- Shred Armor
              Stage({
                so = true,
                stype = ABILITY,
                icon = "Interface\\Icons\\Spell_Misc_EmotionAfraid",
                name = "胆小鬼",
                desc = "非常容易被恐惧。",
                flag1 = IMPORTANT,
              }),
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 17543,
            display = 17076,
            name = "稻草人",
            sections = {
              Spell(31046), -- Brain Bash
              Spell(31069, {desc = "使目标失去控制，沉默4秒并失去713-787蓝。"}), -- Brain Wipe
              Spell(31075, {so = true, name = "怕火", desc = "受到火系伤害会进入困惑状态6秒。", flag1 = IMPORTANT}, 1), -- Burning Straw
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 17547,
            display = 17187,
            name = "铁皮人",
            sections = {
              Spell(31043, {so = true, desc = "顺劈对前方敌人造成普攻+500的物理伤害。"}), -- Cleave
              Spell(31086, {so = true, desc = "存活时间越长，它越虚弱，每层减少10%移动速度，最多8层。", flag1 = IMPORTANT}), -- Rust
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 18168,
            display = 17550,
            name = "老巫婆",
            desc = "其他小boss被击败后出场。",
            sections = {
              Spell(32337, {so = true, desc = "制造一个旋风，造成2775-3225自然法术伤害。"}), -- Chain Lightning
              Stage({
                so = true,
                stype = ABILITY,
                icon = "Interface\\Icons\\Spell_Nature_Cyclone",
                name = "老巫婆",
                desc = "把敌人吹到风中，并受到跌落伤害。",
                flag1 = IMPORTANT,
              }),
            },
          }),
        },
      }),
    },
  },
  {
    name = "馆长",
    desc = "馆长是神秘的看门BOSS。他是不可跳过的，所以想打后面的BOSS必须搞定这货。",
    --icon = true,
    creature = 15691,
    display = 16958,
    coords = {0.494, 0.367, 9},
    loot = {28621,29758,29757,28631,28647,},
    sections = {
      Stage({
        so = true,
        stype = ABILITY,
        icon = "Interface\\Icons\\Spell_Arcane_Arcane04",
        name = "召唤闪电球",
        desc = "每10秒召唤一个闪电球，血量约为12000。它会施放闪电链，对目标造成675-825奥术伤害，若目标10码内有其他友方单位则会发生折射造成等量伤害，召唤每个闪电球小号10%的魔法。",
        sections = {
          Spell(30235, {so = true}), -- Arcing Sear
        },
      }),
      Spell(30403, {so = true}), -- Arcane Infusion
      Spell(30254, {so = true, desc = "当馆长空蓝时，他会进入唤醒状态，每秒5%，20秒回满。这个阶段，馆长所受伤害提高200%。", flag1 = IMPORTANT}), -- Evocation
    },
  },
  {
    name = "特雷斯坦·邪蹄",
    desc = "特雷斯坦·邪蹄是个可选BOSS，在图书馆暗门后的密室中。这场战斗首先将会先打他的喽啰基尔瑞克，并且在接下来的时间召唤更多的小喽啰。",
    --icon = true,
    creature = 15688,
    display = 11343,
    coords = {0.525, 0.696, 11},
    loot = {22561,28652,28653,28659,28656,28658,},
    sections = {
      Spell(30171, {so = true, desc = "在房间内部的两侧造出两个传送门，非精英小鬼将不断刷新。", sections = {
        Stage({
          stype = CREATURE,
          creature = 17267,
          display = 16944,
          name = "小鬼",
          sections = {
            Spell(30050, {so = true, desc = "瞄准敌人并造成181-209火焰伤害。"}), -- Firebolt
          },
        }),
      }}), -- Fiendish Portal (30179 is a duplicate?)
      Spell(30066, {name = "召唤基尔瑞克", desc = "当他被杀死后45秒，他会被再次召唤。", flag1 = IMPORTANT, sections = {
        Spell(30065, {so = true, desc = ".当他被杀后，邪蹄会带上一个DEBUFF，所承受的伤害提高25%直到基尔瑞克再次被召唤出来。", flag1 = IMPORTANT}), -- Broken Pact
        Spell(30053, {so = true, flag1 = IMPORTANT}), -- Amplify Flames
      }}, 1), -- Summon Imp (Kil'Rek)
      Spell(30115, {so = true, desc = "邪蹄会定期将一随机玩家传送到房间中央的绿圈里，该玩家将被一层恶魔锁链束缚住，处于昏迷状态并每秒受到1500左右的暗影伤害，同时治疗BOSS，除非摧毁了恶魔锁链。", flag1 = DEADLY}), -- Sacrifice
      Spell(30055, {desc = "火焰印记，对目标造成3188-4312暗影伤害。"}), -- Shadow Bolt
    },
    adds = {
      {
        name = "基尔瑞克",
        creature = 17229,
        display = 20364,
      },
    },
  },
  {
    name = "埃兰之影",
    desc = "埃兰之影是卡拉赞的一名BOSS。他是麦迪文的父亲，体内力量被唤醒后，在一场守护战中死亡。",
    --icon = true,
    creature = 16524,
    display = 16621,
    coords = {0.717, 0.262, 10},
    loot = {22560,28666,28726,28672,28663,28728,28670,},
    sections = {
      Stage({
        so = true,
        name = "基本技能",
        desc = "贯穿整场战斗的技能。",
        sections = {
          Spell(29954, {desc = "3秒施法，3500-4400冰霜伤害，附带持续4秒的65%减速效果。", flag1 = MAGIC, flag2 = INTERRUPT}), -- Frostbolt
          Spell(29953, {desc = "3秒施法，3910-5290火焰伤害。", flag1 = INTERRUPT}), -- Fireball
          Spell(29956, {desc = "通道法术，每秒造成1500点奥术伤害,持续5秒。"}), -- Arcane Missiles
          Spell(29991, {desc = "冻住目标使其10秒内无法移动，无伤害，可驱散，可通过一切解除定身的技能与物品解除。", flag1 = MAGIC}), -- Chains of Ice
          Spell(29961, {desc = "作用范围为埃兰的10码距离内，发动非常频繁，但仅是打断当前施法，不造成持续沉默。", flag1 = IMPORTANT}), -- Counterspell
        },
      }),
      Stage({
        so = true,
        name = "特殊技能",
        desc = "每30-35秒发动一次，一般来说不会连续两次施放同一技能，无法通过任何方式阻止其发动。",
        sections = {
          Stage({
            stype = ABILITY,
            icon = "Interface\\Icons\\Spell_Shadow_AnimateDead",
            name = "死亡之地Area of Death",
            desc = "埃兰将以特定顺序施放三个技能，如果全中，那必死无疑。",
            flag1 = DEADLY,
            sections = {
              Spell(29979, {so = true, desc = "将所有人传送至房间正中。"}), -- Massive Magnetic Pull
              Spell(30035, {so = true, desc = "群体减速60%持续10秒。", flag1 = MAGIC}), -- Mass Slow
              Spell(29973, {so = true, desc = "对30码内目标，施放强力奥爆术，造成9000-11000奥术伤害。\n\n只有到达房间的边缘处才可规避伤害。", flag1 = DEADLY}),
            },
          }),
          Spell(29946, {desc = "火焰之环，随机作用于三个人，周围5-8码的人不要试图移动，不然会引发爆发，造成3000-4000火焰伤害。", flag1 = DEADLY}), -- Flame Wreath (30004 duplicate?)
          Spell(29969, {desc = "每秒1700伤害并减速，作用范围几乎占据半个场地，并会缓慢的饶场移动360度左右。", flag1 = IMPORTANT}), -- Summon Blizzard
        },
      }),
      Stage({
        so = true,
        name = "40%血量时： 召唤水元素",
        desc = "埃兰在房间的四个方向召唤4个水元素，水元素持续90秒。",
        sections = {
          Stage({
            so = true,
            stype = CREATURE,
            creature = 17167,
            display = 5450,
            name = "水元素", -- Summon Water Elementals (37051, 37052, 37053, 29962)
            sections = {
              Spell(37054, {desc = "水箭，造成1000-2000冰霜伤害。"}), -- Water Bolt
            },
          }),
        },
      }),
      Stage({
        so = true,
        name = "20%蓝时：变羊，喝水和冲击波",
        desc = "埃兰将把全体玩家变羊，并坐下喝水，10秒后冲击波，造成6800火焰伤害。",
        sections = {
          Spell(29963, {desc = "将所有玩家变羊10秒。", flag1 = MAGIC}), -- Mass Polymorph
          Spell(29975, {desc = "喝水回蓝。"}), -- Conjure Water
          Spell(29978, {name = "冲击波=", desc = "对所有玩家造成6800火焰伤害。"}, 1), -- Pyroblast
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 18254,
        display = 17644,
        name = "埃兰之影",
        desc = "12分钟内没有击杀埃兰，埃兰会狂暴并秒杀全团。",
        flag1 = DEADLY,
      }),
      --Spell(29977, {flag1 = MAGIC}), -- Combustion (mobs can't crit with spells, it's hardcoded into the game, so why have this?)
      --Spell(39177), -- Fire Mode Water Break Blocker
      --Spell(29976, {flag1 = MAGIC}), -- Presence of Mind
      --Spell(29990, {flag1 = MAGIC}), -- Slow
    },
    adds = {
      {
        name = "水元素",
        creature = 17167,
        display = 5450,
      },
    },
  },
  {
    name = "虚空幽龙",
    desc = "天文台的虚空幽龙是一名强大的虚空龙。作为塔内唯一的一条龙，它会用超脱世界之力的力量来战胜任何接近它的生物。这个BOSS是可选择BOSS。",
    --icon = true,
    creature = 15689,
    display = 15363,
    coords = {0.361, 0.419, 13},
    loot = {28734,28732,28733,28740,28744,},
    sections = {
      Stage({
        so = true,
        name = "第一阶段： 光线",
        desc = "每条光线提供一种特殊能力赋予被击中的生物。默认情况下，所有光线射向虚空幽龙，但玩家可以通过阻挡光线来获得相应的能力。\n\n在第一个光线阶段，你阻挡了一种颜色，那么下一个光线阶段，你就会有一个DEBUFF，因此，你必须去阻挡其他颜色。然后再回到第一阶段，如此循环。举个例子，作为T你可以先阻挡红色，再绿色，再红色，如此循环。",
        sections = {
          Spell(30466, {icon = "Interface\\Icons\\INV_Misc_QirajiCrystal_02", name = "坚毅红光", desc = "\"坦克光线\"，阻挡此光线将会获得下列能力。", sections = {
            Stage({
              so = true,
              name = "虚空幽龙",
              desc = "每层减少1%的所受伤害。",
            }),
            Stage({
              so = true,
              name = "玩家",
              desc = "虚空幽龙将会攻击你。\n每层减少1%所受伤害。\n最多血量增加，第一层31000，后面每层减少1000血量上限。\n每次叠加层数将会自动回满血量。",
            }),
          }}, 1), -- Nether Portal - Perseverence
          Spell(30467, {icon = "Interface\\Icons\\INV_Misc_QirajiCrystal_03", name = "宁静绿光", desc = "\"治疗光线\"，阻挡此光线将会获得下列能力。", sections = {
            Stage({
              so = true,
              name = "虚空幽龙",
              desc = "每层治疗4000血量，叠加。第一层4000，然后8000，12000……",
            }),
            Stage({
              so = true,
              name = "玩家",
              desc = "每层提升5％治疗效果。\n减少技能消耗1％（包括法力,怒气以及能量的损耗）。\n减少法力值上限200点。\每次叠加层数将会自动回满魔法值。",
            }),
          }}, 1), -- Nether Portal - Serenity
          Spell(30468, {icon = "Interface\\Icons\\INV_Misc_QirajiCrystal_04", name = "支配蓝光", desc = "=\"输出光线\"，阻挡此光线就会获得下列能力。", sections = {
            Stage({
              so = true,
              name = "虚空幽龙",
              desc = "每层增加技能伤害1%。",
            }),
            Stage({
              so = true,
              name = "玩家",
              desc = "每层增加5%伤害。\n每层降低1%治疗效果。\n每层提高法术所受伤害8%。",
            }),
          }}, 1), -- Nether Portal - Dominance
          Spell(38549, {so = true, desc = "光线被激活时，提高虚空幽龙伤害200%。"}), -- Empowerment
          Spell(37063, {desc = "随机选择一目标，在其脚下施放一圈持续15秒的虚空地带，任何在其范围内的人都将受到每2秒1000暗影伤害。", flag1 = DEADLY}), -- Void Zone
        },
      }),
      Stage({
        so = true,
        name = "第二阶段： 放逐阶段",
        desc = "虚空幽龙将会被放逐30秒，而且这个阶段虚空幽龙只会施法。",
        sections = {
          Spell(38523, {so = true, desc = "随机选择一个目标,朝其方向进行锥型范围喷吐,对该范围内玩家造成4100 - 4800伤害并击退30码。", flag1 = IMPORTANT}), -- Netherbreath
        },
      }),
      Spell(30522, {so = true, desc = "覆盖全场的光环效果，每5秒对每个人造成1200点暗影伤害。"}), -- Nether Burn
      Spell(38688, {so = true, desc = "战斗9分钟后，虚空幽龙狂暴，提高500%伤害，这会导致灭团。", flag1 = DEADLY}), -- Nether Infusion
    },
  },
  {
    name = "千王之厅",
    desc = "如果你想去搞玛克扎尔王子，那么必须搞定这个BOSS。在这场BOSS战中，你将会与麦迪文的回声对弈。\n\n这棋局设计的并不严格，与真正的国际象棋有些差距。国王是棋局中最强大的存在，玩家可以通过控制棋子击杀对面国王来获得胜利。与NPC交谈可开启战斗。",
    --icon = true,
    creature = 16816,
    display = 18720,
    coords = {0.360, 0.620, 14},
    loot = {28745,28746,28747,28748,28749,28750,28751,28752,28753,28754,28755,28756,},
    sections = {
      Stage({
        so = true,
        name = "棋子",
        desc = "每个棋子有4个技能，快捷键1-4。1为面朝方向，2为移动棋子，3和4为特殊的攻击技能。",
        sections = {
          Stage({
            name = "国王 (莱恩国王/黑手酋长： 圣骑士/兽人战士)",
            sections = {
              Stage({so = true, name = "横扫", desc = "对前方三个单位造成4000伤害。"}),
              Stage({so = true, name = "怒吼", desc = "提升所有临近位置的友方目标50%伤害，持续10秒。该技能不对国王本身产生效果。"}),
            },
          }),
          Stage({
            name = "皇后 (人类法师/兽人术士： 强大的魔法师)",
            sections = {
              Stage({so = true, name = "元素魔法", desc = "对任意单体目标造成4000伤害。"}),
              Stage({so = true, name = "范围魔法", desc = "对任意一个目标及其周围临近棋子造成6000伤害。"}),
            },
          }),
          Stage({
            name = "主教 (人类牧师/兽人先知： 治疗)",
            sections = {
              Stage({so = true, name = "单体治疗", desc = "治疗一名有房单位12000血量。"}),
              Stage({so = true, name = "伤害法术", desc = "对正面三格内的所有目标造成2000点伤害。"}),
            },
          }),
          Stage({
            name = "骑士 (战马/战狼： 肉搏单位II)",
            sections = {
              Stage({so = true, name = "普通技能", desc = "对正面目标造成3000伤害。"}),
              Stage({so = true, name = "嚎叫", desc = "减少临近的所有目标50%的伤害，持续10秒。"}),
            },
          }),
          Stage({
            name = "城堡 (水元素/恶魔守卫： 群伤单位)",
            sections = {
              Stage({so = true, name = "普攻技能", desc = "对邻近的任意一目标造成3000伤害。"}),
              Stage({so = true, name = "防御技能", desc = "减少自身50%所受到的伤害，持续5秒。"}),
            },
          }),
          Stage({
            name = "兵卒 (人类步兵/兽人步兵： 肉搏单位I)",
            sections = {
              Stage({so = true, name = "英勇打击", desc = "对正面目标造成1000伤害。"}),
              Stage({so = true, name = "盾", desc = "吸收500点物理伤害，持续5秒。"}),
            },
          }),
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 16816,
        display = 18720,
        name = "麦迪文的回声",
        desc = "在这场战斗中，麦迪文会发出下列三种指令。",
        sections = {
          Stage({
            stype = ABILITY,
            icon = "Interface\\Icons\\Spell_Holy_Heal",
            name = "治疗",
            desc = "回满3-4个麦迪文的棋子的血量。",
          }),
          Stage({
            stype = ABILITY,
            icon = "Interface\\Icons\\Spell_Shadow_DeathPact",
            name = "狂暴",
            desc = "使3-4个麦迪文的棋子狂暴。",
          }),
          Stage({
            stype = ABILITY,
            icon = "Interface\\Icons\\INV_Elemental_Primal_Fire",
            name = "伤害",
            desc = "随机攻击玩家的棋子，使其受到火焰灼烧，如果不立刻移动，将会死亡。",
          }),
        },
      }),
    },
  },
  {
    name = "夜之魇",
    desc = "夜之魇是卡拉赞中的召唤BOSS。他是由麦迪文转化蓝龙而来的骨龙。尽管玛克扎尔王子被作为卡拉赞的最终BOSS，但很多玩家认为夜之魇才应该是最终BOSS，因为早期版本它技能复杂，击杀难度略大。想要召唤夜之魇必须完成一系列的任务。",
    --icon = true,
    creature = 17225,
    display = 18062,
    coords = {0.471, 0.918, 6},
    loot = {28611,28608,28604,28609,28599,28603,},
    sections = {
      Stage({
        so = true,
        name = "第一阶段： 地面阶段",
        desc = "当BOSS血量到达75%，50%，25%的时候，夜之魇会进入第二阶段。",
        sections = {
          Spell(36922, {desc = "恐惧35码内所有玩家4秒。"}), -- Bellowing Roar
          Spell(30129, {desc = "对某个随机目标所处半径10码的范围区域施加灼烧,对站于该区域内的目标造成每3秒2000-3000伤害。", flag1 = MAGIC, flag2 = DEADLY}), -- Charred Earth
          Spell(30131, {desc = "顺劈，可由两个目标分担。", flag1 = TANK}), -- Cleave
          Spell(25653, {desc = "对站于其尾部的玩家造成450点火焰伤害附带击倒。"}), -- Tail Sweep
          Spell(30130, {desc = "减少随机目标的治疗与攻击技能40％距离，持续40秒。", flag1 = MAGIC}), -- Distracting Ash
          Spell(30210, {desc = "施放吐息对身前圆锥范围内的人造成3700到4300的火焰伤害，并附带每3秒1688到1912的DOT伤害，持续15秒。", flag1 = IMPORTANT}), -- Smoldering Breath
        },
      }),
      Stage({
        so = true,
        name = "第二阶段： 空中阶段",
        desc = "当夜之魇施放完两个特殊技能后，转入第一阶段。",
        sections = {
          Spell(37098, {so = true, desc = "召唤骷髅，对目标造成880-1020物理伤害。", sections = {
            Stage({
              stype = CREATURE,
              creature = 17261,
              display = 16156,
              name = "骷髅",
              desc = "必须在夜之魇落地之前处理掉。",
            }),
          }}), -- Rain of Bones (triggers 37091)
          Spell(30128, {desc = "对上天后的仇恨最高目标施放，每秒造成1850-2150的物理伤害并附加一个火系DOT，每3秒造成500点火焰伤害持续18秒。", flag1 = MAGIC}), -- Smoking Blast (37057 duplicate? triggers 30127)
          Spell(30282, {so = true, desc = "如果有任何人在夜之魇的攻击范围之外，他将施放火焰弹对全场所有人造成每秒3000-3500的伤害。", flag1 = DEADLY}), -- Fireball Barrage
        },
      }),
    },
    adds = {
      {
        name = "骷髅",
        creature = 17261,
        display = 16156,
      },
    },
  },
  {
    name = "玛克扎尔王子",
    desc = "我们只知道玛克扎尔王子是艾瑞达人属于燃烧军团，其他的一无所知。没人知道他是什么时候，怎么来到卡拉赞的，也不知道的他的目的何在。他来的时候似乎紫罗兰的代表尤其是柯安娜还在卡拉赞。他来了不久，卡拉赞就被封闭了。",
    --icon = true,
    creature = 15690,
    display = 19274,
    coords = {0.515, 0.317, 17},
    loot = {29760,29761,28773,28770,28764,28762,28766,},
    sections = {
      Stage({
        so = true,
        name = "贯穿全场的技能",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 17646,
            display = 18036,
            name = "召唤地狱火",
            desc = "他会在7个位置中的一个召唤一个地狱火，第一二阶段45秒召唤一次，第三阶段15秒召唤一次。",
            flag1 = DEADLY,
            sections = {
              Spell(30859, {so = true, desc = "地狱火会施放地狱烈焰对20码内的玩家造成875-1125火焰伤害，持续180秒。", flag1 = DEADLY}), -- Hellfire
            },
          }),
          Spell(30852, {desc = "施放暗影新星，对30码内的目标造成3000点的暗影伤害并造成击退效果。", flag1 = IMPORTANT}), -- Shadow Nova
        },
      }),
      Stage({
        so = true,
        name = "第一阶段",
        desc = "玛克扎尔王子在血量达到60%时进入第二阶段。",
        sections = {
          Spell(30843, {so = true, desc = "对非坦克任意个5个队伍成员施放，使他们的最大生命为1，治疗效果和生命恢复为0，持续9秒。结束后满血。", flag1 = IMPORTANT}), -- Enfeeble
          Spell(30854, {desc = "对坦克施放暗言术痛，每三秒造成1500暗影伤害，持续18秒。", flag1 = MAGIC}), -- Shadow Word: Pain
          
        },
      }),
      Stage({
        so = true,
        name = "第二阶段",
        desc = "玛克扎尔王子在血量达到30%时进入第三阶段。",
        sections = {
          Spell(30843, {desc = "对非坦克任意个5个队伍成员施放，使他们的最大生命为1，治疗效果和生命恢复为0，持续9秒。结束后满血。", flag1 = IMPORTANT}), -- Enfeeble
          Spell(23547, {desc = "玛克扎尔王子拥有龙类的招架惩罚机制。", flag1 = TANK}), -- Parry
          Spell(30901, {desc = "每层减少目标1000护甲，可堆叠5层，持续20秒。", flag1 = HEALER}), -- Sunder Armor
          Spell(3391, {so = true, desc = "类似风怒2连，瞬间打2下。", flag1 = DEADLY}), -- Thrash
        },
      }),
      Stage({
        so = true,
        name = "第三阶段",
        sections = {
          Spell(39095, {desc = "提高所有伤害100%。Increases all damage taken by 100%."}), -- Amplify Damage
          Spell(30898, {desc = "对随机目标施放暗言术痛，每三秒造成1500暗影伤害，持续18秒。", flag1 = MAGIC}), -- Shadow Word: Pain (random)
          Stage({
            name = "飞斧",
            desc = "玛克扎尔王子频繁向随机目标掷出飞斧，造成伤害并会不断叠加。一开始是400伤害，最高堆叠到1000伤害。",
            flag1 = HEALER,
          }),
        },
      }),
    },
    adds = {
      {
        name = "地狱火",
        creature = 17646,
        display = 18036,
      },
    },
  },
})

table.insert(db, KARAZHAN)
