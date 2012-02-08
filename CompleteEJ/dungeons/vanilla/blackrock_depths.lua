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

local BLACKROCK_DEPTHS = CreateInstance({
  name = "黑石深渊",
  desc = "黑石深渊在黑石山的最深处，达格兰·索瑞森大帝和他的黑铁矮人统治着这里。黑石深渊是少量的黑铁矿石产地之一，熔炼它们需要的黑铁熔炉也在这里。同时这里还有制造一切黑铁装备所需要的黑铁铁砧。黑石深渊是团队副本之前最史诗的一个区域，这里有着二十多个首领和众多的任务线，是回到经典旧世真切的经历。在之后的两个资料片中，副本中的首领之间可以通过钻机快速到达，并移除了一些任务链，比如奥妮克希亚系列任务。",
  texture = "BlackrockDepths",
  area = 704,
  dflag = N5,
}, {
  {
    name = "贝尔加",
    desc = "进入黑石深渊之后,从左边的路线向前走就能遇到洛考尔.",
    --icon = true,
    creature = 9016,
    display = 12162,
    coords = {0.256, 0.529, 1},
    loot = {11807,11805,11803,11802,},
    sections = {
      Spell(13895, {so = true, flag1 = IMPORTANT}), -- Summon Spawn of Bael'Gar
      Spell(23379, {so = true, desc = "对当前敌对目标造成70~80点火焰伤害,同时每3秒再造成50点额外的火焰伤害,持续24秒,这个效果最高可以叠加3次.", flag1 = HEALER}), -- Magma Splash
    },
  },
  {
    name = "洛考尔",
    desc = "洛考尔一般出现在驯犬者和竞技场附近的地方",
    --icon = true,
    creature = 9025,
    display = 5781,
    coords = {0.560, 0.670, 1},
    loot = {22397,22234,11631,11632,},
    sections = {
      Spell(13729, {so = true, desc = "使一个敌对目标燃烧,造成24~29点火焰伤害,同时每3秒再造成4点额外的火焰伤害,持续12秒.", flag1 = MAGIC}), -- Flame Shock
      Spell(13728, {so = true, flag1 = HEALER}), -- Earth Shock
      Spell(6524, {so = true}), -- Ground Tremor
    },
  },
  {
    name = "驯犬者格雷布玛尔",
    desc = "格雷布玛尔和他的猎犬守护着竞技场.",
    --icon = true,
    creature = 9319,
    display = 9212,
    coords = {0.505, 0.630, 1},
    loot = {11629,11627,11623,11628,},
    sections = {
      Spell(13730, {so = true, desc = "使附近10码内的所有敌人伤害降低,持续20秒."}), -- Demoralizing Shout
      Spell(15615, {so = true, flag1 = HEALER}), -- Pummel
      Spell(21049, {so = true, flag1 = MAGIC}), -- Bloodlust
    },
  },
  {
    name = "审讯官格斯塔恩",
    desc = "她是黑石深渊入口区的最终BOSS,如果玩家通过随机副本的形式进入这个副本队列,击败她就可以获得随机副本的奖励.",
    --icon = true,
    creature = 9018,
    display = 8761,
    coords = {0.476, 0.923, 1},
    loot = {11626,11625,11624,22240,},
    sections = {
      Spell(14033, {so = true, flag1 = INTERRUPT}), -- Mana Burn
      Spell(14032, {so = true, desc = "格斯塔恩吟唱黑暗的咒语,对所有敌人造成每3秒6点的暗影伤害,持续15秒.", flag1 = MAGIC}), -- Shadow Word: Pain
      Spell(13704, {so = true, flag1 = MAGIC}), -- Psychic Scream
      Spell(12040, {so = true, desc = "格斯塔恩为自己施加一个黑暗魔法护盾,可以吸收200点伤害,持续30秒.", flag1 = MAGIC}), -- Shadow Shield
    },
  },
  {
    name = "裁决者格里斯通",
    desc = "玩家在法律之环的竞技场中可以通过格里斯通触发战斗,面对6位中随机的1名Boss.",
    --icon = true,
    creature = 10096,
    display = 9329,
    coords = {0.504, 0.899, 2},
    loot = {11610,11633,11634,11635,11662,11665,11675,11677,11678,11679,11685,11686,11702,11703,11722,11726,11728,11729,11730,11731,11824,22257,22266,22270,22271,},
    sections = {
      Stage({
        stype = CREATURE,
        creature = 9031,
        display = 3004,
        name = "阿努希尔 ",
        sections = {
          Spell(13787, {desc = "保护施法者,使其护甲值提高210点,暗影抗性提高3点,生命回复速度提高,持续30分钟.", flag1 = MAGIC}), -- Demon Armor
          Spell(8994, {desc = "放逐敌对目标，使其完全无法行动，但也不会受到任何伤害，最多持续5秒。在同一时间内只能放逐一个目标.", flag1 = MAGIC}), -- Banish
          Spell(15471), -- Enveloping Web
          Spell(15470, {flag1 = CURSE}), -- Curse of Tongues
          Spell(12493, {desc = "降低一名敌人造成的物理伤害，持续20秒.", flag1 = CURSE}), -- Curse of Weakness
          Spell(15472, {desc = "向目标射出一支暗影箭，对其造成199~232点暗影伤害."}), -- Shadow Bolt
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9029,
        display = 523,
        name = "剜眼者",
        sections = {
          Spell(7121, {desc = "反魔法的护罩包围施法者，使其对魔法免疫，持续6秒.", flag1 = DPS}), -- Anti-Magic Shield
          Spell(15245, {desc = "向附近的敌人射出多支暗影箭，对它们造成99~116点暗影伤害."}), -- Shadow Bolt Volley
          Spell(14331, {desc = "每3秒对敌人造成18点物理伤害，持续15秒,这个效果最多可以叠加3次.", flag1 = TANK}), -- Vicious Rend
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9027,
        display = 8760,
        name = "修行者高罗什",
        sections = {
          Spell(16856, {flag1 = MAGIC}), -- Bloodlust
          Spell(21049, {flag1 = HEALER}), -- Mortal Strike
          Spell(13736, {desc = "像旋风一般挥舞手中的武器，造成普通伤害再加上300点的额外伤害，持续2秒."}), -- Whirlwind (triggers 15589)
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9028,
        display = 7873,
        name = "格里兹尔",
        sections = {
          Spell(40504, {flag1 = TANK}), -- Cleave
          Spell(6524), -- Ground Tremor
          Spell(8269, {desc = "攻击速度提高60%,持续2分钟.", flag1 = HEALER}), -- Frenzy
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9032,
        display = 8271,
        name = "爬行者赫杜姆",
        sections = {
          Spell(15475, {flag1 = POISON}), -- Baneful Poison
          Spell(3609, {flag1 = POISON}), -- Paralyzing Poison
          Spell(15474), -- Web Explosion
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9030,
        display = 11538,
        name = "破坏者奥科索尔",
        sections = {
          Spell(15254, {desc = "向目标射出一支魔法箭，对其造成99~116点奥术伤害."}), -- Arcane Bolt
          Spell(15453, {desc = "制造一次以施法者为中心的魔法爆炸，对附近30码的敌人造成124~145点奥术伤害."}), -- Arcane Explosion
          Spell(13323, {desc = "将敌人变成绵羊，使其在周围到处闲逛，最多持续6秒。在这个过程中，绵羊无法攻击或施法，但会以极快的速度恢复生命值，任何伤害都会让绵羊恢复正常状态", flag1 = MAGIC}), -- Polymorph
          Spell(13747, {flag1 = MAGIC}), -- Slow
        },
      }),
    },
  },
  {
    name = "控火师罗格雷恩",
    desc = "这家伙似乎是个火爆的牛头人萨满祭司..",
    --icon = true,
    creature = 9024,
    display = 8762,
    coords = {0.544, 0.960, 2},
    loot = {11747,11748,11750,11749,},
    sections = {
      Spell(15041, {so = true, desc = "罗格雷恩为自己施加一个烈焰结界，持续1分钟，可吸收120点火焰伤害.", flag1 = MAGIC}), -- Fire Ward
      Spell(15616, {so = true, desc = "立刻用火焰燃烧目标，造成49~58点火焰伤害,并继续对其每3秒造成一次额外的9点火焰伤害，持续12秒.", flag1 = MAGIC}), -- Flame Shock
      Spell(15095, {so = true, desc = "烧灼目标，造成66~77点火焰伤害."}), -- Molten Blast
      --Spell(15038), -- Scorching Totem
      Stage({
        so = true,
        stype = CREATURE,
        creature = 9637,
        display = 4589,
        name = "灼烧图腾",
        desc = "在施法者身边召唤一个灼烧图腾，每2秒攻击一个附近的敌人,造成33~38点火焰伤害。持续35秒.", -- 15037
      }),
    },
  },
  {
    name = "典狱官斯迪尔基斯",
    desc = "玩家可以在黑色避难所中找到典狱官斯迪尔基斯和他的宠物维雷克.",
    --icon = true,
    creature = 9041,
    display = 9089,
    coords = {0.596, 0.657, 2},
    loot = {11782,11783,11784,22241,},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 9041,
        display = 9089,
        name = "典狱官斯迪尔基斯",
        sections = {
          Spell(12544, {desc = "一层寒冰包裹施法者，持续30分钟。这层厚重的寒冰能提高护甲值，并且使近战攻击者的移动速度降低30%，攻击间隔增加20%,持续5秒", flag1 = MAGIC}), -- Frost Armor (triggers 6136)
          Spell(15044, {desc = "斯迪尔基斯为自己施展冰霜结界，持续1分钟，可吸收120点冰霜伤害", flag1 = MAGIC}), -- Frost Ward
          Spell(12674, {desc = "对附近的敌人造成87~101点冰霜伤害并将其冻结在原地，冻结效果最多可持续8秒.", flag1 = MAGIC}), -- Frost Nova
          Spell(12675, {desc = "对敌人造成149~174点冰霜伤害，并使其移动速度降低50%，持续4秒.", flag1 = MAGIC}), -- Frostbolt
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 9042,
        display = 9019,
        name = "维雷克",
        sections = {
          Spell(15042, {desc = "使目标在受到物理攻击时所承受的伤害提高，持续20秒.", flag1 = CURSE}), -- Curse of Blood
          Spell(8599, {desc = "维雷克进入激怒状态,物理伤害提高10%,攻击速度提高30%, 持续2分钟.", flag1 = ENRAGE}), -- Enrage
        },
      }),
    },
  },
  {
    name = "弗诺斯·达克维尔<首席建筑师>",
    desc = "弗诺斯·达克维尔是黑铁矮人的首席设计师,是一个比较有难度的Boss,如果玩家等级较低的情况下去挑战他的话也许会遇到不小的困难",
    --icon = true,
    creature = 9056,
    display = 8704,
    coords = {0.633, 0.210, 1},
    loot = {22223,11841,11842,11839,},
    sections = {
      Spell(8258, {desc = "护甲值提高20点,持续4分钟."}), -- Devotion Aura
      Spell(15346, {so = true, desc = "弗诺斯·达克维尔施展清算圣印,持续30秒.击中敌人时,弗诺斯·达克维尔会回复8点生命值.", flag1 = MAGIC}), -- Seal of Reckoning
      Spell(15493, {so = true, desc = "召唤圣光的力量治疗目标,为其恢复185~215点生命值.", flag1 = INTERRUPT}), -- Holy Light
      Spell(11978, {so = true, flag1 = HEALER}), -- Kick
      Spell(13953, {so = true}), -- Holy Strike
    },
  },
  {
    name = "伊森迪奥斯",
    desc = "玩家可以在黑铁砧附近找到这个火元素领主",
    --icon = true,
    creature = 9017,
    display = 1204,
    coords = {0.565, 0.309, 1},
    loot = {11765,11767,11766,11764,19268,},
    sections = {
      Spell(26977, {so = true, desc = "降低45码范围内所有敌人100点的火焰抗性,持续30秒.这个效果最多可以叠加3次.", flag1 = CURSE}), -- Curse of the Elemental Lord
      Spell(14099, {so = true, flag1 = TANK}), -- Mighty Blow
      Spell(13900, {so = true, desc = "对指定区域中的所有敌人造成510点~690点火焰伤害."}), -- Fiery Burst
      Spell(13899, {so = true}), -- Fire Storm
    },
  },
  {
    name = "安格弗将军",
    desc = "安格弗将军镇守着暗炉之锁.",
    --icon = true,
    creature = 9033,
    display = 8756,
    coords = {0.364, 0.829, 2},
    loot = {11820,11817,11810,11816,11821,},
    sections = {
      Spell(15572, {flag1 = HEALER}), -- Sunder Armor
      Spell(17687, {desc = "使施法者下三次攻击速度提高30%，持续15秒."}), -- Flurry
      Spell(15061, {desc = "激怒,物理伤害能力提高1点,攻击速度提高30%,持续5秒."}), -- Enrage
      Stage({
        so = true,
        stype = CREATURE,
        creature = 8894,
        display = 8752,
        name = "铁怒医师",
        desc = "安格弗将军的矮人随从.",
        flag1 = IMPORTANT,
        sections = {
          Spell(15587, {desc = "对目标造成49~58点暗影伤害."}), -- Mind Blast
          Spell(15585, {desc = "召唤神圣魔法的能量治疗附近30码的队友,为其恢复217~252点生命值.", flag1 = INTERRUPT}), -- Prayer of Healing
          Spell(15586, {desc = "使用神圣的力量治疗盟友,为其恢复249~290点生命值.", flag1 = INTERRUPT}), -- Heal
          Spell(13864, {flag1 = MAGIC}), -- Power Word: Fortitude
        },
      })
    },
  },
  {
    name = "傀儡统帅阿格曼奇",
    desc = "在黑铁矮人制造机械傀儡的房间里,玩家可以找到傀儡统帅阿格曼奇,以及,它的两名傀儡保镖.",
    --icon = true,
    creature = 8983,
    display = 8759,
    coords = {0.364, 0.649, 2},
    loot = {11823,11669,11822,11819,},
    sections = {
      Spell(15507, {so = true, desc = "3颗闪电球环绕着施法者，有50%的几率对近战或远程攻击者造成自然伤害。每次闪电之盾发动反击都会消耗一颗闪电球。因此，闪电之盾最多可维持10分钟，或者在反击3次后消失.", flag1 = MAGIC}), -- Lightning Shield
      Spell(15305, {so = true, desc = "向敌人射出一支闪电箭，这支闪电箭会在击中目标后继续攻击它周围最近的敌人，最多可攻击5个目标，每次击中都会造成更高的自然伤害."}), -- Chain Lightning
      Spell(15605, {desc = "立即向目标射出一支闪电箭，对其造成自然伤害."}), -- Shock
      Stage({
        so = true,
        stype = CREATURE,
        creature = 8906,
        display = 8177,
        name = "狂怒傀儡",
        sections = {
          Spell(17687, {desc = "使施法者下三次攻击速度提高30%，持续15秒."}), -- Flurry
          Spell(12795, {desc = "激怒,物理伤害能力提高1点,攻击速度提高30%,持续2分钟."}), -- Frenzy
        },
      }),
    },
  },
  {
    name = "霍尔雷·黑须",
    desc = "摧毁黑铁酒吧储藏室中的啤酒酒桶,霍尔雷·黑须会带着他的4个警卫冲进储藏室,并且开始攻击玩家",
    --icon = true,
    creature = 9537,
    display = 8658,
    coords = {0.477, 0.589, 2},
    loot = {22275,18044,18043,11735,},
    sections = {
      Spell(9573, {so = true, desc = "对施法者前方锥形范围内的敌人造成10点火焰伤害."}), -- Flame Breath
      Spell(14872, {so = true}), -- Drunken Rage
      Stage({
        so = true,
        stype = CREATURE,
        creature = 9541,
        display = 8661,
        name = "黑须的亲信",
        sections = {
          Spell(15581, {so = true, desc = "对目标造成普通武器伤害外加一定的伤害加成."}), -- Sinister Strike
          Spell(15583, {so = true, desc = "每2秒对敌人造成6点物理伤害，持续10秒."}), -- Rupture
        },
      }),
    },
  },
  {
    name = "雷布里·斯库比格特",
    desc = "赏金猎人,最大的爱好是喝酒.",
    --icon = true,
    creature = 9543,
    display = 8667,
    coords = {0.492, 0.670, 2},
    loot = {11742,11612,},
    sections = {
      Spell(12540, {so = true, flag1 = TANK}), -- Gouge
      Spell(9080, {so = true}), -- Hamstring
      Stage({
        so = true,
        stype = CREATURE,
        creature = 10043,
        display = 9233,
        name = "雷布里·斯库比格特",
        sections = {
          Spell(13298, {desc = "每3秒对敌人造成9点自然伤害,持续15秒.", flag1 = POISON}), -- Poison
          Spell(15581, {desc = "对目标造成普通武器伤害外加一定的伤害加成."}), -- Sinister Strike
          Spell(15692), -- Eviscerate
        },
      }),
    },
  },
  {
    name = "普拉格",
    desc = "黑铁酒吧的老板,如果玩家想通过黑铁酒吧,可以杀死普拉格获取钥匙,或者...让一个盗贼去偷钥匙.",
    --icon = true,
    creature = 9499,
    display = 8652,
    coords = {0.505, 0.589, 2},
    loot = {12793,12791,},
    sections = {
      Spell(13787, {desc = "保护施法者,护甲值提高210点,暗影抗性提高3点,生命回复速度提高持续30分钟.", flag1 = MAGIC}), -- Demon Armor
      Spell(8994, {desc = "放逐敌对目标，使其完全无法行动，但也不会受到任何伤害，最多持续5秒。在同一时间内只能放逐一个目标s.", flag1 = MAGIC}), -- Banish
      Spell(12742, {desc = "灼烧敌人造成66~77点火焰伤害，并对其每3秒造成一次额外9点火焰伤害，持续15秒.", flag1 = MAGIC}), -- Immolate
      Spell(13338, {flag1 = CURSE}), -- Curse of Tongues
      Spell(12739, {desc = "向目标射出一支暗影箭，对其造成99~116点暗影伤害."}), -- Shadow Bolt
    },
  },
  {
    name = "法拉克斯",
    desc = "法拉克斯守护着黑铁酒吧的后门,在攻击他之前处于友好状态.",
    --icon = true,
    creature = 9502,
    display = 8177,
    coords = {0.525, 0.643, 2},
    loot = {11745,11744,22212,},
    sections = {
      Spell(15588, {so = true, desc = "对附近的敌人造成71~79点自然伤害，使其攻击间隔延长33%，移动速度降低40%，持续6秒.", flag1 = MAGIC}), -- Thunderclap
      Spell(14099, {so = true, desc = "对一名敌人造成普通伤害及额外的25点伤害，并将其击退."}), -- Mighty Blow
      Spell(15285, {so = true, desc = "对附近20码内的敌人造成49~58点火焰伤害."}), -- Fireball Volley
    },
  },
  {
    name = "弗莱拉斯大使",
    desc = "弗莱拉斯大使是萨弗隆先驱者的仆从,是玩家可以遇到的第一个烈焰行者.",
    --icon = true,
    creature = 9156,
    display = 8329,
    coords = {0.538, 0.487, 2},
    loot = {11812,11809,11814,11832,11808,},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 9178,
        display = 4607,
        name = "燃灵术",
        desc = "战斗开始后,一群小型的火元素会从四周向弗莱拉斯大使聚拢,并且增加他的力量.",
        sections = {
          --Spell(13489), -- Burning Spirit
          Spell(14744, {so = true, desc = "使施法者用物理攻击对敌人造成的伤害提高5%,持续3分钟,这个效果最多可以叠加50次.", flag1 = IMPORTANT}), -- Burning Spirit
        },
      }),
    },
  },
  {
    name = "七贤",
    desc = "玩家需要击败7名黑铁矮人的贤者才可以获取七贤之箱中的宝藏.",
    --icon = true,
    creature = 9039,
    display = 8687,
    coords = {0.536, 0.244, 2},
    loot = {11922,11926,11925,11929,11921,11927,11923,11920,},
    sections = {
      Stage({
        stype = CREATURE,
        creature = 9035,
        display = 8686,
        name = "安格雷尔(防战)",
        sections = {
          Spell(15061, {desc = "激怒,物理伤害能力提高1点,攻击速度提高30%,持续5秒."}), -- Enrage
          Spell(11971, {flag1 = HEALER}), -- Sunder Armor
          Spell(15580, {desc = "对敌人造成额外的15点近战伤害."}), -- Strike
          Spell(12169), -- Shield Block
          Spell(15062), -- Shield Wall
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9039,
        display = 8687,
        name = "杜姆雷尔(术士)",
        sections = {
          Spell(15092, {desc = "召唤虚空行者爪牙来协助杜姆雷尔进行战斗,这个虚空行者爪牙没有特殊的能力."}), -- Summon Voidwalkers
          Spell(13787, {desc = "保护施法者,护甲值提高210点,暗影抗性提高3点,生命回复速度提高持续30分钟..", flag1 = MAGIC}), -- Demon Armor
          Spell(8994, {desc = "放逐敌对目标，使其完全无法行动，但也不会受到任何伤害，最多持续5秒。在同一时间内只能放逐一个目标.", flag1 = MAGIC}), -- Banish
          Spell(12493, {desc = "降低一名敌人造成的物理伤害，持续20秒.", flag1 = CURSE}), -- Curse of Weakness
          Spell(12742, {desc = "灼烧敌人造成66~77点火焰伤害，并对其每3秒造成一次额外9点火焰伤害，持续15秒.", flag1 = MAGIC}), -- Immolate
          Spell(15245, {desc = "向附近的目标射出暗影箭，对其造成99~116点暗影伤害."}), -- Shadow Bolt Volley
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9040,
        display = 8688,
        name = "多普雷尔 (盗贼)",
        sections = {
          Spell(15087), -- Evasion
          Spell(12540, {flag1 = TANK}), -- Gouge
          Spell(15581, {desc = "对目标造成普通武器伤害外加一定的伤害加成."}), -- Sinister Strike
          Spell(15583, {desc = "每2秒对敌人造成6点物理伤害，持续10秒."}), -- Rupture
          Spell(15582, {desc = "对目标造成普通伤害附加额外30点伤害，会从目标背后发动."}), -- Backstab
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9037,
        display = 8689,
        name = "格鲁雷尔 (武器战)",
        sections = {
          Spell(13847, {desc = "格鲁雷尔免疫恐惧效果,所有攻击都造成爆击,护甲值降低35%,持续15秒.", flag1 = IMPORTANT}), -- Recklessness
          Spell(40504, {flag1 = TANK}), -- Cleave
          Spell(13737, {flag1 = HEALER}), -- Mortal Strike
          Spell(9080), -- Hamstring
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9034,
        display = 8690,
        name = "黑特雷尔",
        sections = {
          Spell(12040, {desc = "使施法者被一层由暗影魔法编织而成的护盾所包围,该护盾持续30秒,可以吸收200点伤害.", flag1 = MAGIC}), -- Shadow Shield
          Spell(15232, {desc = "向目标射出一支暗影箭，对其造成149~174点暗影伤害."}), -- Shadow Bolt
          Spell(17687, {desc = "使施法者下三次攻击速度提高30%，持续15秒."}), -- Flurry
          Spell(15580, {desc = "对敌人造成额外的近战伤害."}), -- Strike
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9038,
        display = 8691,
        name = "西斯雷尔 (冰法)",
        sections = {
          Spell(12544, {desc = "一层寒冰包裹施法者，持续30分钟。这层厚重的寒冰能提高护甲值，并且使近战攻击者的移动速度降低，攻击间隔增加.", flag1 = MAGIC}), -- Frost Armor (triggers 6136)
          Spell(15244, {desc = "对施法者面前一个锥形区域内的敌人造成冰霜伤害，并降低他们的移动速度，持续8秒.", flag1 = TANK}), -- Cone of Cold
          Spell(15044, {desc = "护盾围绕施法者，持续1分钟，可吸收固定量的冰霜伤害.", flag1 = MAGIC}), -- Frost Ward
          Spell(12674, {desc = "对附近的敌人造成冰霜伤害并将其冻结在原地，冻结效果最多可持续8秒.", flag1 = MAGIC}), -- Frost Nova
          Spell(12675, {desc = "对敌人造成冰霜伤害，并使其移动速度降低，持续4秒.", flag1 = MAGIC}), -- Frostbolt
          Spell(8364, {desc = "召唤持续8秒的暴风雪，对指定区域内的所有敌人每2秒造成一次冰霜伤害."}), -- Blizzard
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9036,
        display = 8692,
        name = "瓦勒雷尔 (牧师)",
        sections = {
          Spell(15587, {desc = "对目标造成49~58点暗影伤害Inflicts 49 to 58 Shadow damage to an enemy."}), -- Mind Blast
          Spell(15586, {desc = "使用神圣的力量治疗盟友,为其恢复249~290点生命值.", flag1 = INTERRUPT}), -- Heal
          Spell(15585, {desc = "召唤神圣魔法的能量治疗附近所有的队友,为其恢复217~252点生命值.", flag1 = INTERRUPT}), -- Prayer of Healing
          Spell(11974, {desc = "为盟友加上魔法护盾,可吸收137点伤害，持续30秒.", flag1 = MAGIC}), -- Power Word: Shield
        },
      }),
    },
  },
  {
    name = "玛格姆斯",
    desc = "如果要挑战玛格姆斯,玩家需要击杀暗炉持火者并且夺取暗炉火炬,点燃大厅里面的两座火盆来打开大门.",
    --icon = true,
    creature = 9938,
    display = 12162,
    coords = {0.802, 0.116, 2},
    loot = {11935,22400,22208,11746,22395,},
    sections = {
      Spell(15668, {so = true, desc = "对指定区域中的所有敌人造成133~154点火焰伤害."}), -- Fiery Burst
      Spell(15593, {so = true, desc = "对附近的敌人造成物理伤害,将其击退并且昏迷4秒."}), -- War Stomp
    },
  },
  {
    name = "达格兰·索瑞森大帝",
    desc = ".达格兰·索瑞森大帝是黑铁氏族的皇帝,现在是炎魔拉格纳罗斯的手下/",
    --icon = true,
    creature = 9019,
    display = 8807,
    coords = {0.916, 0.116, 2},
    loot = {11684,11815,11924,11928,11930,11931,11932,11933,11934,12553,12554,12556,12557,22204,22207,},
    sections = {
      Stage({
        so = true,
        name = "达格兰·索瑞森大帝",
        sections = {
          Spell(15636, {flag1 = IMPORTANT}), -- Avatar of Flame
          Spell(17492, {desc = "对敌人造成49~58点火焰伤害,并且使其昏迷5秒."}), -- Hand of Thaurissan
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 8929,
        display = 8705,
        name = "铁炉堡公主茉艾拉·铜须<铁炉堡公主>", -- "High Priestess of Thaurissan" does no longer appear since the quests were removed and the lore broke with Cataclysm, good job!
        sections = {
          Spell(15587, {desc = "对目标造成49~58点暗影伤害."}), -- Mind Blast
          Spell(15537, {desc = "向目标射出一支暗影箭，对其造成124~145点暗影伤害."}), -- Shadow Bolt
          Spell(15654, {desc = "黑暗的咒语，每3秒对敌人造成9点暗影伤害，持续15秒.", flag1 = MAGIC}), -- Shadow Word: Pain
          Spell(8362, {desc = "为一名盟友每3秒治疗恢复一次生命值，持续15秒.", flag1 = MAGIC}), -- Renew
          Spell(15586, {desc = "使用神圣的力量治疗盟友,为其恢复249~290点生命值.", flag1 = INTERRUPT}), -- Heal
        },
      }),
    },
  },
})

table.insert(db, BLACKROCK_DEPTHS)
