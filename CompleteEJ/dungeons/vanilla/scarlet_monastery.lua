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

local SCARLET_MONASTERY = CreateInstance({
  name = "血色修道院",
  desc = "血色修道院位于提瑞斯法林地的东北面，它的南面便是法奥之墓，圣骑士的创始人----阿隆苏斯-法奥（他是光明使者乌瑟尔的师傅，也就是阿尔萨斯的祖师傅）葬在这里。\n\n血色修道院是一座由四个区域组成的大型建筑。该修道院原本是洛丹伦王国的骄傲，宗教的朝圣之地，然而在战后成为了狂热的血色十字军在该地区的一座重要要塞。提瑞斯法的幸存者和来自远方的冒险者通常前往这里寻求庇护，每当他们经过法奥之墓时，都要在这里顶礼膜拜一番，以示对这位先辈的尊敬。\n\n血色修道院的四个部分的级别不同，墓地要求的级别最低，大教堂最高。",
  texture = "ScarletMonastery",
  area = 762,
  dflag = N5,
}, {
  {
    name = "审讯员韦沙斯",
    desc = "詹姆斯·韦沙斯在血色修道院领导着十字军的审讯工作。他享受捕获亡灵并以此为傲。韦沙斯以无情的虐待、残忍的手段和尖利的尖叫而闻名。\n\n审讯员韦沙斯已经折磨沃瑞尔·森加斯好几个星期了，他把森加斯的婚戒给了他自己的妻子，南希·韦沙斯。南希和詹姆斯的祖父生活在奥特兰特山下洛丹米尔湖东岸的一间小屋里，尽管他没有提到过。",
    --icon = true,
    creature = 3983,
    display = 2044,
    coords = {0.721, 0.596, 1},
    loot = {7683,7682,},
    sections = {
      Spell(9034, {so = true, desc = "Burns an enemy for 116 Fire damage, then inflicts additional 30 Fire damage every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Immolate
      Spell(14032, {so = true, desc = "Utters a word of darkness, inflicting 6 Shadow damage to an enemy every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Shadow Word: Pain
    },
  },
  {
    name = "永醒的艾希尔, 死灵勇士, 铁脊死灵 (稀有)",
    desc = "请留意，这三个BOSS中的一个可能会出现在墓地中的随机位置",
    --icon = true,
    creature = 6490,
    display = 5534,
    coords = {0.490, 0.625, 1},
    loot = {7686,7687,7688,7689,7690,7691,7708,7709,7731,},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 6490,
        display = 5534,
        name = "永醒的艾希尔",
        sections = {
          Spell(5137, {desc = "在15秒后对一个敌人造成22点暗影伤害。", flag1 = CURSE}), -- Call of the Grave
          Spell(9373, {flag1 = MAGIC}), -- Soul Siphon
          Spell(7399, {desc = "恐吓一个敌人，使其因恐惧而逃跑3秒。每次只能恐吓1个目标。", flag1 = MAGIC}), -- Terrify
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 6488,
        display = 5230,
        name = "死灵勇士",
        sections = {
          Spell(15496), -- Cleave
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 6489,
        display = 5231,
        name = "铁脊死灵",
        sections = {
          Spell(21007, {flag1 = CURSE}), -- Curse of Weakness
          Spell(3815, {flag1 = POISON}), -- Poison Cloud
        },
      }),
    },
  },
  {
    name = "血法师萨尔诺斯",
    desc = "尽管没有任何资料，但从名字来他生前应该是一个名血精灵法师。",
    --icon = true,
    creature = 4543,
    display = 11396,
    coords = {0.244, 0.562, 1},
    loot = {7685,7684,},
    sections = {
      Spell(12470, {so = true, desc = "对附近的敌人造成49到58点火焰伤害。"}), -- Fire Nova
      Spell(8814, {so = true, desc = "召唤一根火柱，对指定区域内的所有敌人造成93到107点火焰伤害，并对它们每3秒造成50点额外伤害，持续9秒。"}), -- Flame Spike
      Spell(23038, {so = true, desc = "灼烧敌人，造成34到60点火焰伤害，然后每3秒对其造成6点火焰伤害，持续12秒。", flag1 = MAGIC}), -- Flame Shock
      Spell(20825, {so = true, desc = "向目标射出一支暗影箭，对其造成69到81暗影伤害。"}), -- Shadow Bolt
    },
  },
  {
    name = "无头骑士 (万圣节)",
    desc = "万圣节期间，通过血色修道院墓地区的南瓜神龛可以召唤出这个精英BOSS。此外，节日期间他的影子还会屡次攻击部落和联盟的村庄。\n\n无头骑士曾经是一名白银之手骑士团的成员，但是现在他受到了诅咒。他坚信自己还活着，出现在他面前的人才是死了的人。被击败之后，他会显露出托马斯•汤姆森的形象。(即托马斯爵士).",
    --icon = true,
    creature = 23682,
    display = 22351,
    coords = {0.342, 0.625, 1},
    loot = {71328,71327,71330,71329,},
    sections = {
      Stage({
        so = true,
        name = "第一阶段",
        desc = "无头骑士进入场地后，会优先攻击使用神龛的人。",
        sections = {
          Spell(42587, {flag1 = TANK}), -- Horseman's Cleave
          Stage({
            so = true,
            stype = CREATURE,
            creature = 23775,
            display = 21908,
            name = "无头骑士的头",
            desc = "他会在1%的时候丢下他的头并免疫一切伤害，四处走动并回复慢生命。攻击他的头可以进入第二阶段",
          }),
        },
      }),
      Stage({
        name = "第二阶段",
        desc = "这个阶段会进行三次。无头骑士会丢出他的头并在迷惑的在附近走动。不同的是他会获得一个额外的技能。",
        sections = {
          Spell(42380, {so = true, desc = "使一个敌人着火，在4秒内造成总计22587点火焰伤害，并使其进入恐慌状态。在这段时间里，火焰会周期性地灼烧该目标身边的盟友，对它们造成4875到5125点伤害。", flag1 = IMPORTANT}), -- Conflagration
        },
      }),
      Stage({
        name = "第三阶段",
        desc = "再他丢出他的头三次后会进入这个阶段。他不会再使用燃烧，而是使用这个技能。",
        sections = {
          Stage({
            so = true,
            stype = CREATURE,
            creature = 23545,
            display = 21822,
            name = "南瓜魔",
            desc = "进入战斗之前南瓜魔需要数秒时间发芽生长。",
            sections = {
              Spell(42514, {so = true, desc = "让目标承受的伤害提高10%，最多叠加10次，持续15秒。", flag1 = DISEASE}), -- Squash Soul
              --Spell(42281, {so = true}), -- Sprouting
            },
          }),
        },
      }),
      --Spell(44185), -- Jack-o'-Lanterned!
    },
  },
  {
    name = "驯犬者洛克希",
    desc = "驯犬者洛克希是血色修道院的四位领导人之一，负责为十字军训练用来追踪敌人的猎犬。在洛克希的命令下，可怕的猎犬只要短短几分钟就可以把牺牲者撕成碎片。\n\n表面上看来，洛克希是猎手雷奥普德的兄弟，后者是血色十字军送往圣光之愿礼拜堂的使者，与银色黎明暂时结盟。同他对话可以获知，雷奥普德认为洛克希连自己的猎犬都照看不好，这也是他被代替洛克希送来这里的原因。",
    --icon = true,
    creature = 3974,
    display = 2040,
    coords = {0.294, 0.845, 2},
    loot = {7710,3456,7756,},
    sections = {
      Spell(77808, {so = true, desc = "提高附近友方目标的近战攻击强度2点，持续2分钟。"}), -- Battle Shout
      Spell(6742, {so = true, desc = "使一个友方玩家的攻击速度提高30%，持续30秒。", flag1 = MAGIC}), -- Bloodlust
      Stage({
        so = true, 
        stype = CREATURE,
        creature = 4304,
        display = 35353,
        name = "血色捕猎犬",
        desc = "洛克希带着4只猎犬，它们咬人很疼。",
      }),
    },
  },
  {
    name = "奥法师杜安",
    desc = "他是修道院图书馆的看守者，据传，他作为一个奥术守护者，并没有获得十字军的信任。杜安相信消灭洛丹伦的天灾的唯一手段就是奥术魔法。",
    --icon = true,
    creature = 6487,
    display = 5266,
    coords = {0.833, 0.743, 2},
    loot = {7713,7711,7712,7714,34227,},
    sections = {
      Spell(34517, {desc = "制造一次以施法者为中心的魔法爆炸，对附近的敌人造成49到58点奥术伤害。"}), -- Arcane Explosion
      Spell(13323, {desc = "将敌人变成绵羊，使其在周围到处闲逛，最多持续6秒。在这个过程中，绵羊无法攻击或施法，但会以极快的速度恢复生命值，任何伤害都会让绵羊恢复正常状态。每个法师在同一时间内只能将一个目标变成绵羊，只能对野兽、人型生物或小动物施放。", flag1 = MAGIC}), -- Polymorph
      Spell(8988, {desc = "使附近的敌人因沉默而不能施法，持续4秒。", flag1 = MAGIC, flag2 = IMPORTANT}), -- Silence
      Spell(9438, {so = true, desc = "杜安的生命值低于50的时候，周围会形成一个保护性的气泡，使其对所有攻击和法术免疫，持续8秒。但也无法进行攻击。", sections = {
        Spell(9435, {so = true, desc = "奥法师杜安体内喷发出火焰，对周围30码内所有敌人造成638到862火焰伤害。", flag1 = DEADLY}), -- Detonation
      }}), -- Arcane Bubble
    },
  },
  {
    name = "赫洛德",
    desc = "赫洛德是血色修道院的四位领导者之一。他和虔诚的莱雷恩一起在希尔斯布莱德丘陵闻名。幽暗城的瓦里玛萨斯想要杀了这两个血色十字军的领导，尽管原因不同。",
    --icon = true,
    creature = 3975,
    display = 2041,
    coords = {0.787, 0.108, 3},
    loot = {10330,7718,7719,7717,23192,},
    sections = {
      Spell(15496, {flag1 = TANK}), -- Cleave
      Spell(8260, {desc = "使施法者的移动速度提高60%，持续4秒，并使其在第一次攻击时所造成的伤害提高10点。"}), -- Rushing Charge
      Spell(8989, {so = true, desc = "像旋风一般挥舞手中的武器，攻击周围的所有敌人，每2秒对它们造成武器伤害再加上100点额外伤害，并让施放者暂时对魔法免疫，持续10秒。", flag1 = IMPORTANT}), -- Whirlwind (triggers 15578)
      Spell(8269, {so = true, desc = "使施放者的攻击速度提高60%，持续2分钟。", flag1 = HEALER}), -- Frenzy
      Stage({
        stype = CREATURE,
        creature = 6575,
        display = 2467,
        name = "血色预备兵",
        desc = "击败赫洛德之后，会有20个血色预备兵刷新在房间门口。",
      }),
    },
  },
  {
    name = "大检察官法尔班克斯",
    desc = "法尔班克斯曾经是大领主莫格莱尼最信赖的顾问，出席过在南海镇导致灰烬使者诞生的会议。\n\n法尔班克斯被大领主莫格莱尼的儿子雷诺欺骗并带到了被天灾军团布下埋伏的斯坦索姆，法尔班克斯第一个倒下了，但他没有死，被埋藏在了不死生物和尸体中间。他默默的见证了雷诺背叛他父亲的全过程：伴随着雷诺痛苦的哭声，灰烬使者插入了他父亲的心脏，并且受到了污染。之后将大领主复活成了一名死亡骑士。\n\n回到修道院之后，法尔班克斯向任何想听的人讲述这段背叛的故事。相信他的人离开了血色十字军加入银色黎明。随后法尔班克斯因他的亵渎而被其余的十字军谋杀。他的尸体藏在大教堂的密室中。\n\n从头衔上来看，他的位置被怀特迈恩继任了。",
    --icon = true,
    creature = 4542,
    display = 2605,
    coords = {0.555, 0.252, 4},
    loot = {19509,19508,19507,},
    sections = {
      Spell(15090), -- Dispel Magic
      Spell(8282, {flag1 = CURSE}), -- Curse of Blood
      Spell(22678, {desc = "使敌人因为极度的恐惧而奔逃，最多持续6秒。在同一时间内，只有1个敌人会被你的恐惧术影响。", flag1 = MAGIC}), -- Fear
      Spell(8399, {desc = "使敌人进入睡眠状态，最多持续6秒。任何对目标造成伤害的行为都会唤醒它。", flag1 = MAGIC}), -- Sleep
      Spell(11647, {desc = "立即为施法者加上魔法护盾，可吸收781点物理伤害，持续30秒。只要护盾存在，受保护者的施法就不会被物理攻击打断。"}), -- Power Word: Shield
      Spell(12039, {desc = "为他自己恢复186到217点生命值。"}), -- Heal
    },
  },
  {
    name = "大检察官怀特迈恩",
    desc = "莫格莱尼和怀特迈恩这两个BOSS会在一场BOSS战中一同与你战斗。",
    --icon = true,
    creature = 3977,
    display = 2043,
    coords = {0.489, 0.168, 4},
    loot = {7722,7721,7720,71635,},
    sections = {
      Spell(25054, {desc = "对敌人造成89到96点神圣伤害。"}), -- Holy Smite (9481 old spell or what?)
      Spell(12039, {desc = "治疗一名盟友186到217点生命值。", flag1 = INTERRUPT}), -- Heal
      Spell(22187, {desc = "立即为目标加上吸收伤害的护盾，共可吸收206点伤害，最多持续30秒。只要护盾存在，受保护者的施法就不会被伤害打断。", flag1 = MAGIC}), -- Power Word: Shield
      Spell(7645, {desc = "如果战斗时间过长，怀特迈恩会控制一个敌对人型生物，持续10秒。使其攻击间隔延长100%。", flag1 = MAGIC, flag2 = IMPORTANT}), -- Dominate Mind
      Spell(9256, {desc = "怀特迈恩生命低于50%时，会使所有敌人睡眠，持续10秒。", flag1 = IMPORTANT, sections = {
        Spell(9232, {so = true, desc = "复活莫格莱尼，回复其全部生命值。"}), -- Scarlet Resurrection
      }}), -- Deep Sleep
      Stage({
        so = true,
        stype = CREATURE,
        creature = 3976,
        display = 2042,
        name = "血色指挥官莫格莱尼",
        desc = "和前面描述的是同一场战斗，建议优先击杀怀特迈恩。",
        sections = {
          Spell(14518, {flag1 = MAGIC}), -- Crusader Strike
          Spell(77787, {flag1 = MAGIC}), -- Hammer of Justice
          Spell(63148, {desc = "使莫格莱尼免疫所有攻击和法术。攻击间隔延长100%。", flag1 = MAGIC}), -- Divine Shield
          Spell(8990, {desc = "被动的光环效果，使近战攻击者受到3点神圣伤害。"}), -- Retribution Aura
          --Spell(9257, {desc = "Used by Mograine to restore Whitemane to full health, after she resurrects him."}), -- Lay on Hands
        },
      }),
    },
  },
  {
    name = "血色指挥官莫格莱尼",
    desc = "莫格莱尼和怀特迈恩这两个BOSS会在一场BOSS战中一同与你战斗。",
    --icon = true,
    creature = 3976,
    display = 2042,
    coords = {0.489, 0.278, 4},
    loot = {7724,7726,10330,7723,},
    sections = {
      Spell(14518, {flag1 = MAGIC}), -- Crusader Strike
      Spell(77787, {flag1 = MAGIC}), -- Hammer of Justice
	  Spell(63148, {desc = "使莫格莱尼免疫所有攻击和法术。攻击间隔延长100%。", flag1 = MAGIC}), -- Divine Shield
	  Spell(8990, {desc = "被动的光环效果，使近战攻击者受到3点神圣伤害。"}), -- Retribution Aura
      --Spell(9257, {desc = "Used by Mograine to restore Whitemane to full health, after she resurrects him."}), -- Lay on Hands
      Stage({
        so = true,
        stype = CREATURE,
        creature = 3977,
        display = 2043,
        name = "大检察官怀特迈恩",
        desc = "击败莫格莱尼之后，怀特迈恩会从后面的大门中出现。建议优先击杀怀特迈恩。",
        sections = {
		  Spell(25054, {desc = "对敌人造成89到96点神圣伤害。"}), -- Holy Smite (9481 old spell or what?)
		  Spell(12039, {desc = "治疗一名盟友186到217点生命值。", flag1 = INTERRUPT}), -- Heal
		  Spell(22187, {desc = "立即为目标加上吸收伤害的护盾，共可吸收206点伤害，最多持续30秒。只要护盾存在，受保护者的施法就不会被伤害打断。", flag1 = MAGIC}), -- Power Word: Shield
		  Spell(7645, {desc = "如果战斗时间过长，怀特迈恩会控制一个敌对人型生物，持续10秒。使其攻击间隔延长100%。", flag1 = MAGIC, flag2 = IMPORTANT}), -- Dominate Mind
		  Spell(9256, {desc = "怀特迈恩生命低于50%时，会使所有敌人睡眠，持续10秒。", flag1 = IMPORTANT, sections = {
			Spell(9232, {so = true, desc = "复活莫格莱尼，回复其全部生命值。"}), -- Scarlet Resurrection
		  }}), -- Deep Sleep
        },
      }),
    },
  },
})

table.insert(db, SCARLET_MONASTERY)
