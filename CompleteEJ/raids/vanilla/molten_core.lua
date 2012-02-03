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

local MOLTEN_CORE = CreateInstance({
  name = "熔火之心",
  desc = "熔火之心是暴雪《魔兽世界》中的第一个真正意义上的团队(40人)副本,位于东部王国黑石山内的黑石深渊深处.这里是受黑石矮人召唤的元素领主炎魔拉格纳罗斯的巢穴.在熔火之心内玩家需要面对十名强大的BOSS.",
  texture = "MoltenCore",
  area = 696,
  dflag = N10,
}, {
  {
    name = "鲁西弗隆",
    desc = "鲁西弗隆和他的两名烈焰行者护卫,看守着拉格纳罗斯的熔岩犬宠物玛格曼达.",
    --icon = true,
    creature = 12118,
    display = 13031,
    coords = {0.658, 0.380, 1},
    loot = {17077,18875,17109,16805,16829,19145,19147,19146,},
    sections = {
      Stage({
        so = true,
        name = "鲁西弗隆",
        sections = {
          Spell(19702, {flag1 = MAGIC}), -- Impending Doom
          Spell(19703, {flag1 = CURSE}), -- Lucifron's Curse
          Spell(19460, {desc = "使用暗影魔法攻击敌人,对其造成24~29点暗影伤害."}), -- Shadow Shock
        },
      }),
      Stage({
        so = true,
        name = "烈焰行者护卫",
        sections = {
          Spell(20605, {desc = "对目标和它身边最近的敌人造成你的武器伤害,最多可影响3个目标."}), -- Cleave
          Spell(20604, {desc = "控制一个人形生物,持续15秒.", flag1 = MAGIC}), -- Dominate Mind
        },
      }),
    },
    adds = {
      {
        name = "烈焰行者护卫",
        creature = 12119,
        display = 12030,
      },
    },
  },
  {
    name = "玛格曼达",
    desc = "玛格曼达是火焰之王拉格纳罗斯最宠爱的宠物,烈焰行者鲁西弗隆保护着它.据说当拉格纳罗斯被囚禁在元素位面时,曾以被俘获的敌人的尸体喂食这头巨兽.玛格曼达由此成为火焰之王忠诚的仆从",
    --icon = true,
    creature = 11982,
    display = 10193,
    coords = {0.691, 0.241, 1},
    loot = {21371,16822,18829,17069,19142,17073,18292,16835,16796,16843,18822,16847,18820,19144,18259,18824,18257,},
    sections = {
      Stage({
        so = true,
        name = "熔岩猎犬",
        sections = {
          Spell(19771, {desc = "在30秒内对一个敌人造成1500点物理伤害,最多可以叠加10次,造成最高15000点伤害."}),
          Stage({
            name = "复生",
            icon = "Interface\\Icons\\Spell_Holy_Resurrection",
            desc = "如果所有的熔岩犬没有在第一只被杀死之后的10秒内全部杀死,那么死去的熔岩犬将会复活,生命值全满.",
            flag1 = IMPORTANT,
          }),
        },
      }),
      Stage({
        so = true,
        name = "玛格曼达",
        sections = {
          Spell(19451, {desc = "攻击速度提高150%,持续8秒.", flag1 = ENRAGE}), -- Enrage
          Spell(19411, {desc = "向敌人投掷熔岩炸弹，在8秒内对其造成3200点火焰伤害.", flag1 = IMPORTANT}), -- Lava Bomb (#20474 too, duplicate or not?)
          Spell(19450, {desc = "向目标喷射火焰伤害,造成93~107点火焰伤害,每3秒对其造成一次额外的75点火焰伤害."}), -- Magma Spit
          Spell(19408, {desc = "恐吓附近的敌人,使它们惊慌地逃跑,持续8秒.", flag1 = MAGIC}), -- Panic
          --Spell(20477), -- Summon Player
        },
      }),
    },
  },
  {
    name = "基赫纳斯",
    desc = "基赫纳斯和他的烈焰守卫在摆脱了索瑞恩之后无意中被召唤到了炎魔拉格纳罗斯的元素位面.与其他火元素领主不同,他们是由血肉组成的元素生物 \n 除了他的两个忠诚的卫士之外,他不信任任何效劳与他的人.",
    --icon = true,
    creature = 12259,
    display = 13030,
    coords = {0.335, 0.489, 1},
    loot = {16860,16812,19145,16839,19147,18879,18878,},
    sections = {
      Stage({
        so = true,
        name = "烈焰守卫",
        sections = {
          Spell(20229), -- Blast Wave
          Spell(20623), -- Fire Blast
          Spell(20420), -- Fireball
          Spell(21095, {desc = "当烈焰守卫离开基赫纳斯45码以上时,将免疫所有伤害,并且自身的伤害提升200%.", flag1 = IMPORTANT}), -- Separation Anxiety
        },
      }),
      Stage({
        so = true,
        name = "基赫纳斯",
        sections = {
          Spell(19716, {flag1 = CURSE}), -- Gehennas' Curse
          Spell(19717), -- Rain of Fire
          Spell(19728), -- Shadow Bolt (#19729 is a duplicate?)
        },
      }),
    },
    adds = {
      {
        name = "烈焰守卫",
        creature = 11664,
        display = 12002,
      },
    },
  },
  {
    name = "加尔",
    desc = "加尔原本是风王子桑德兰的手下,后背叛了风王子成为了拉格纳罗斯的仆从,拉格纳罗斯在摧毁桑德兰之后将桑德兰的元素护符 逐风者的禁锢之颅 分成了两个部分,分别交给了加尔和迦顿男爵保管.",
    --icon = true,
    creature = 12057,
    display = 12110,
    coords = {0.309, 0.698, 1},
    loot = {18292,16813,19136,17071,18820,16808,18264,16854,18832,16866,18822,17066,18564,19142,21371,18824,18252,},
    sections = {
      Stage({
        so = true,
        name = "火誓者",
        sections = {
          Spell(19497, {desc = "对附近15码内的敌人造成1850~2150点火焰伤害,并将其击退.", flag1 = IMPORTANT}), -- Eruption
          Spell(15732, {desc = "灼烧敌人造成37~43点火焰伤害,并对其每3秒造成一次额外火焰伤害,持续15秒.", flag1 = MAGIC}), -- Immolate
          Spell(23492, {desc = "当火誓者离开加尔45码以上,将免疫所有伤害,并且自身伤害提高300%.", flag1 = IMPORTANT}), -- Separation Anxiety
          Spell(19516, {desc = "每杀死一只火誓者,加尔的攻击速度就提高9%.当8只火誓者全部被杀死之后,加尔的攻击速度提高72%.", flag1 = IMPORTANT}), -- Frenzy
        },
      }),
      Stage({
        so = true,
        name = "加尔",
        sections = {
          Spell(19492, {desc = "驱散附近45码的敌人身上的魔法,移除1个有益法术效果."}), -- Antimagic Pulse
          Spell(19496, {flag1 = MAGIC}), -- Magma Shackles
          --Spell(20477), -- Summon Player
        },
      }),
    },
    adds = {
      {
        name = "火誓者",
        creature = 12099,
        display = 5781,
      },
    },
  },
  {
    name = "沙斯拉尔",
    desc = "沙斯拉尔是拉格纳罗斯手下的烈焰元素中最深不可测的一名仆从,加尔和迦顿男爵一直以来互存敌意,而沙斯拉尔则一直在其中调停.他调停的目的是为了获悉逐风者的禁锢之颅中的秘密,并且汲取其中的能量.",
    --icon = true,
    creature = 12264,
    display = 13032,
    coords = {0.553, 0.852, 1},
    loot = {16852,16803,17077,16811,18879,19147,19145,},
    sections = {
      Spell(19712), -- Arcane Explosion
      Spell(19715), -- Counterspell
      Spell(23138, {desc = "立即传送到一名敌人身边."}), -- Gate of Shazzrah
      Spell(19714, {flag1 = MAGIC}), -- Magic Grounding
      Spell(19713, {flag1 = CURSE}), -- Shazzrah's Curse
    },
  },
  {
    name = "迦顿男爵",
    desc = "迦顿男爵曾经是拉格纳罗斯手下的第一将领,在与泰坦的战役中被击败后撤退.拉格纳罗斯不满于他的失败,剥去了他指挥官的权利,并且将这个职务交给了一名烈焰使者.迦顿男爵非常愤怒,被一个不是火元素的生物取代了他的位置,这是自上古以来对他而言最大的侮辱.为了重新夺回他在拉格纳罗斯心中的地位和信任,他策划了击杀逐风者桑德兰的计划.",
    --icon = true,
    creature = 12056,
    display = 12129,
    coords = {0.517, 0.758, 1},
    loot = {19136,16856,18291,16836,18257,18861,16797,18822,18820,18824,18264,18829,18265,},
    sections = {
      Spell(20478, {desc = "随机对20码范围内的所有敌人释放末日决战,造成持续的火焰伤害,伤害值会随着时间的推移越来越高.", flag1 = IMPORTANT}), -- Armageddon
      Spell(19659, {flag1 = MAGIC}), -- Ignite Mana
      Spell(19695, {desc = "地狱的烈焰环绕施法者,周期性地对附近的敌人造成火焰伤害,持续8秒.在这段时间里,施法者不能移动或使用任何技能."}), -- Inferno
      Spell(20475, {desc = "向敌人投掷炸弹,8秒后爆炸,对目标和它周围的盟友造成3200点火焰伤害.", flag1 = IMPORTANT}), -- Living Bomb
      --Spell(20477), -- Summon Player
    },
  },
  {
    name = "Sulfuron Harbinger",
    desc = "Among the most favored of the flamewakers, Sulfuron Harbinger is the terrifying herald of Ragnaros himself. From the infernal depths of the Molten Core, the Harbinger commands Ambassador Flamelash and the other lesser flamewakers in the outside world.  Sulfuron Harbinger answers only to Executus and guards the rune of Koro, one of several runes that empower the Firelord's servants.  Sulfuron Harbinger keeps Shazzrah in particular under close watch, believing that Shazzrah seeks to betray Ragnaros. Flanked by four of the Firelord's most fervid priests, the Harbinger prepares for the day when the elemental lord of fire claims the world of Azeroth for his own.",
    --icon = true,
    creature = 12098,
    display = 13030,
    coords = {0.826, 0.832, 1},
    loot = {17074,16816,19146,18879,18861,18870,17077,},
    sections = {
      Stage({
        so = true,
        name = "Flamewaker Priest",
        sections = {
          Spell(19775, {desc = "Uses dark magic to heal an ally for 27750 to 32250 damage. This ability has 60 yards range and will be cast on any ally that is low on health.", flag1 = INTERRUPT}), -- Dark Mending
          Spell(19777), -- Dark Strike
          Spell(20294, {flag1 = MAGIC}), -- Immolate
          Spell(19776, {desc = "Utters a word of darkness, inflicting 4 Shadow damage to an enemy every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Shadow Word: Pain
        },
      }),
      Stage({
        so = true,
        name = "Sulfuron Harbinger",
        sections = {
          Spell(19778), -- Demoralizing Shout
          Spell(19781, {desc = "Tosses a spear of flame, inflicting 850 to 1150 Fire damage to an enemy, as well as scorching any other enemies in the vicinity of the target, within 10 yards.", flag1 = IMPORTANT}), -- Flame Spear
          Spell(19780, {flag1 = HEALER}), -- Hand of Ragnaros
          Spell(19779), -- Inspire
          Spell(19785), -- Throw
        },
      }),
    },
    adds = {
      {
        name = "Flamewaker Priest",
        creature = 11662,
        display = 12030,
      },
    },
  },
  {
    name = "Golemagg the Incinerator",
    desc = "The most feared soldiers of Ragnaros's elemental forces are the molten giants, and among them Golemagg the Incinerator is unrivaled for his sheer brutality and savage efficiency. So absolute is the molten behemoth's power that he has cowed two core ragers - offspring of the colossal beast Magmadar - which he now uses as pets.  For this affront, he has earned Magmadar's eternal and unwavering ire, although the fearsome creature has yet to act on his savage impulses.",
    --icon = true,
    creature = 11988,
    display = 11986,
    coords = {0.686, 0.586, 1},
    loot = {18292,16809,18821,16820,19136,16815,18291,16798,17011,16845,18822,16833,18861,18824,18264,18820,18257,},
    sections = {
      Stage({
        so = true,
        name = "Core Rager",
        sections = {
          Spell(19820), -- Mangle 
          Stage({
            name = "Death Insurance",
            icon = "Interface\\Icons\\Spell_Holy_Resurrection",
            desc = "If the Core Rager health drops below 50% they will refuse to die and heal to full health.",
            flag1 = IMPORTANT,
          }),
          Stage({
            name = "Evade",
            icon = "Interface\\Icons\\Ability_Rogue_Smoke",
            desc = "If separated too far from Golemagg, will Evade the Core Ragers and Golemagg and reset the encounter.",
            flag1 = IMPORTANT,
          }),
        },
      }),
      Stage({
        so = true,
        name = "Golemagg the Incinerator",
        sections = {
          Spell(19798, {desc = "Inflicts 1388 to 1612 damage to enemies within 18 yards."}), -- Earthquake
          Spell(13880, {desc = "Splashes the target with Magma, melting its armor, dealing 93 to 107 Fire damage and additional 50 Fire damage every 3 seconds for 30 sec. This can stack up to 50 times."}), -- Magma Splash
          Spell(20228), -- Pyroblast
          --Spell(20477), -- Summon Player
        },
      }),
    },
    adds = {
      {
        name = "Core Rager",
        creature = 11672,
        display = 11997,
      },
    },
  },
  {
    name = "Majordomo Executus",
    desc = "Executus comes with four Flamewaker Healers and four Flamewaker Elite guards making this a total of a nine enemy encounter. Executus will \"submit\" and the fight is won when all the adds are dead.  He then appears in Ragnaros' chamber and will summon the Firelord to begin the encounter.",
    --icon = true,
    creature = 12018,
    display = 12029,
    coords = {0.845, 0.659, 1},
    loot = {19139,18812,18809,18810,18808,},
    sections = {
      Stage({
        so = true,
        name = "Flamewaker Healer and Elite",
        sections = {
          Stage({
            name = "Flamewaker Healer",
            sections = {
              Spell(21077), -- Shadow Bolt
              Spell(20603, {desc = "Instantly lashes enemies within 20 yards with dark magic, inflicting 740 to 860 Shadow damage."}), -- Shadow Shock
            },
          }),
          Stage({
            name = "Flamewaker Elite",
            sections = {
              Spell(20229), -- Blast Wave
              Spell(20623), -- Fire Blast
              Spell(20420), -- Fireball
            },
          }),
          Spell(21095, {desc = "When separated further than 45 yards of Majordomo Executus, will become immune to all damage and increase damage done by 200%.", flag1 = IMPORTANT}), -- Separation Anxiety
        },
      }),
      Stage({
        so = true,
        name = "Majordomo Executus",
        sections = {
          Spell(20620, {desc = "Surrounds the caster with a shield woven of Shadow magic. The shield lasts 5 minutes, absorbs up to 30000 Physical or magical damage, and inflicts 250 damage to melee attackers. Heals the caster to full health periodically."}), -- Aegis of Ragnaros
          Spell(21075, {desc = "Shields the target and inflicts 100 Arcane damage to each melee strike received."}), -- Damage Shield
          Spell(20619), -- Magic Reflection
          --Spell(19774), -- Summon Ragnaros
          Spell(20534), -- Teleport (#20618 duplicate?)
        },
      }),
    },
    adds = {
      {
        name = "Flamewaker Healer",
        creature = 11663,
        display = 13029,
      },
      {
        name = "Flamewaker Elite",
        creature = 11664,
        display = 12002,
      },
    },
  },
  {
    name = "Ragnaros",
    desc = "Ragnaros the Firelord was an incredibly powerful Elemental Lord and master of all fire elementals. He ruled for more than three hundred years over his minions from deep inside the fiery core of Blackrock Mountain. After being banished back to the Firelands, he aligned himself with Deathwing and his fellow Elemental Lord, Al'Akir, in the effort to purge all life from Azeroth.  To help bring about the end of days, Ragnaros laid siege to the World Tree Nordrassil on Mount Hyjal, unleashing his most powerful minions. Despite the incredible destructive forces at his disposal, the mortal champions of Azeroth were able to lay siege to the Firelord's domain, where they bested all of the challenges he laid before them, and eventually destroyed him within his own fortress.",
    --icon = true,
    creature = 11502,
    display = 11121,
    coords = {0.558, 0.542, 1},
    loot = {13040,13113,18814,13072,16962,13015,16954,17063,17106,17104,16901,13075,19137,13000,18816,13091,18817,17082,13008,13077,13144,13067,13007,13120,13123,13053,13125,13036,13130,13047,13009,13003,9402,13001,},
    sections = {
      Stage({
        so = true,
        name = "Phase 1: Ragnaros",
        desc = "You have 3 minutes before the next phase starts.",
        sections = {
          --Spell(19773), -- Elemental Fire (used on Majordomo Executus)
          Spell(20564, {flag1 = HEALER}), -- Elemental Fire
          Spell(20565, {desc = "Inflicts 6000 Fire damage to an random enemy. Only used when there is no one in melee range of Ragnaros.", flag1 = TANK}), -- Magma Blast
          Spell(20566), -- Wrath of Ragnaros
        },
      }),
      Stage({
        so = true,
        name = "Phase 2: Son of Flame",
        desc = "You have 90 seconds to defeat all the Sons of Flame before Ragnaros rises back up. Note that he will rise instantly after the sons are defeated, regardless of the timer.\n\nPhase 1 is repeated after this phase ends.",
      }),
    },
    adds = {
      {
        name = "Son of Flame",
        creature = 12143,
        display = 5488,
      },
    },
  },
})

table.insert(db, MOLTEN_CORE)
