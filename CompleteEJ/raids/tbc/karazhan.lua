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
          Spell(34694, {desc = "Blinds the target, causing it to wander confused for 10 seconds. Any damage taken will remove the effect.", flag1 = POISON}), -- Blind
          Spell(29425, {desc = "Inflicts 950 to 1050 damage to an enemy and stuns it for 6 seconds. Any damage taken will remove the effect."}), -- Gouge
          Spell(37023, {desc = "When Moroes reaches 30% health, he will Frenzy and increase his Physical damage dealt by 20% for 5 minutes.", flag1 = IMPORTANT}), -- Frenzy
          Spell(29448, {so = true, desc = "Moroes vanishes for up to 12 seconds, gaining the element of surprise.", flag1 = IMPORTANT, sections = {
            Spell(37066, {desc = "Upon becoming visible, uses Garrote on a random enemy, inflicting 1075 damage every 3 seconds for 5 minutes.", flag1 = HEALER}), -- Garrote
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
    name = "Maiden of Virtue",
    desc = "Maiden of Virtue is a titanic watcher-like boss in the Guest Chambers wing of Karazhan. She is, ironically, being the Maiden of Virtue, put behind the rooms that are full of ladies of the night. It is unclear how this happened or who sent her. The Maiden is optional; it is not necessary to kill her in order to reach other bosses.",
    --icon = true,
    creature = 16457,
    display = 16198,
    coords = {0.836, 0.500, 4},
    loot = {28516,28520,28511,28512,28522,},
    sections = {
      Spell(29512, {so = true, desc = "Constantly deals 240 to 360 Holy damage each second and prevents spellcasting for 1 second.  This aura has 12 yards range and is visually illustrated by the circle she stands on.", flag1 = IMPORTANT}), -- Holy Ground
      Spell(32445, {so = true, desc = "Sends bolts of holy power at a random enemy, the bolts jump to other nearby enemies. Initially deals 1950 to 2050 Holy damage but increases by 40% each jump.  Does not target or jump to pets.", flag1 = IMPORTANT}), -- Holy Wrath
      Spell(29522, {desc = "Consumes an enemy in flames, burning it for 3238 to 3762 Fire damage and inflicting additional 1750 Fire damage each 2 seconds for 12 seconds.", flag1 = MAGIC}), -- Holy Fire
      Spell(29511, {desc = "Puts all enemies in a state of meditation, incapacitating them for 12 seconds.  Breaks on any damage received."}), -- Repentance
    },
  },
  {
    name = "Opera Event",
    desc = "In the Opera House, Barnes can be found. When a player talks to him, he walks on the stage and announces the Opera event for this week: Red Riding Hood, Romulo & Julianne or Wizard of Oz.",
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
        name = "The Big Bad Wolf",
        desc = "Talk to Grandma and she will tell you the story.",
        sections = {
          Spell(30756, {so = true, desc = "A random enemy is turned into Little Red Riding Hood, this reduces that targets armor to 0, increases movement speed by 50%, pacifies and silences. Your only choice is to run away and survive! Lasts 20 seconds.", flag1 = IMPORTANT}), -- Little Red Riding Hood
          Spell(30752, {desc = "Causes enemies within 10 yards to flee in fear for 3 seconds.", flag1 = MAGIC}), -- Terrifying Howl
          Spell(30761, {desc = "Stuns all enemies in front for 4 seconds."}), -- Wide Swipe
        },
      }),
      Stage({
        name = "Romulo and Julianne",
        desc = "A young man and woman meet by chance and fall instantly in love. But their families are bitter enemies, and in order to be together, the two lovers must be prepared to risk everything.",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 17534,
            display = 17068,
            name = "Phase 1: Julianne",
            sections = {
              Spell(30890), -- Blinding Passion
              Spell(30887, {flag1 = MAGIC}), -- Devotion
              Spell(30878, {desc = "Heals an ally for 46250 to 53750.", flag1 = INTERRUPT}), -- Eternal Affection
              Spell(30889, {desc = "Dazzles the target, filling it with intense attraction, stunning them for 6 seconds."}), -- Powerful Attraction
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 17533,
            display = 17067,
            name = "Phase 2: Romulo",
            sections = {
              Spell(30841, {flag1 = MAGIC}), -- Daring
              Spell(30822, {desc = "Deals weapon damage and reduces the targets stats by 10% for 1 minute. This can stack max 8 times, ultimately reducing statistics by 80%.", flag1 = POISON}), -- Poisoned Thrust
              Spell(30815, {desc = "Strikes at an enemy behind the caster and within 10 yards, inflicting 1900 to 2100 Physical damage and knocking them away.", flag1 = DPS}), -- Backward Lunge
              Spell(30817), -- Deadly Swathe
            },
          }),
          Stage({
            name = "Phase 3: Romulo and Julianne",
            desc = "You will face both at the same time, but this time they share one new ability.",
            sections = {
              Spell(30951, {so = true, desc = "Revives their loved once with full health, if not also killed within 10 seconds of their death.", flag1 = IMPORTANT}), -- Undying Love
            },
          }),
        },
      }),
      Stage({
        name = "Wizard of Oz",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 17535,
            display = 17069,
            name = "Dorothee",
            sections = {
              Spell(31014, {desc = "Summons the yipping dog Tito, who will interrupt and silence casters."}), -- Summon Tito
              Spell(31013, {desc = "Lets out a scream, causing up to 3 nearby enemies to flee for 2 seconds."}), -- Frightened Scream
              Spell(31012), -- Water Bolt
              Stage({
                so = true,
                stype = ABILITY,
                icon = "Interface\\Icons\\INV_Misc_QuestionMark",
                name = "Attention Disorder",
                desc = "Cannot be interrupted or tanked, and attacks random enemies.",
                flag1 = IMPORTANT,
              }),
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 17548,
            display = 17079,
            name = "Tito",
            sections = {
              Spell(31015), -- Annoying Yipping
              Stage({
                so = true,
                stype = ABILITY,
                icon = "Interface\\Icons\\Spell_Misc_EmotionAngry",
                name = "Anguished Mourning",
                desc = "Causes Dorothee to Enrage if killed when she is still alive.",
                flag1 = IMPORTANT,
              }),
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 17546,
            display = 18261,
            name = "Roar",
            sections = {
              Spell(31041, {flag1 = HEALER}), -- Mangle
              Spell(31042, {flag1 = HEALER}), -- Shred Armor
              Stage({
                so = true,
                stype = ABILITY,
                icon = "Interface\\Icons\\Spell_Misc_EmotionAfraid",
                name = "Scaredy Cat",
                desc = "Very susceptible to fear.",
                flag1 = IMPORTANT,
              }),
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 17543,
            display = 17076,
            name = "Strawman",
            sections = {
              Spell(31046), -- Brain Bash
              Spell(31069, {desc = "The target forgets what he was going to say, becoming silenced for 4 seconds and looses 713 to 787 mana."}), -- Brain Wipe
              Spell(31075, {so = true, name = "Fire Hazard", desc = "Upon being damaged by fire, will become disoriented up to 6 seconds and run around in panic.", flag1 = IMPORTANT}, 1), -- Burning Straw
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 17547,
            display = 17187,
            name = "Tinhead",
            sections = {
              Spell(31043, {so = true, desc = "Inflicts normal plus 500 Physical damage to an enemy and its nearest allies, affecting up to 3 targets."}), -- Cleave
              Spell(31086, {so = true, desc = "The longer Tinhead fights, the more he rusts. Each application slows him by 10%, and can stack up to 8 stacks.", flag1 = IMPORTANT}), -- Rust
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 18168,
            display = 17550,
            name = "The Crone",
            desc = "Appears after all the others have been defeated.",
            sections = {
              Spell(32337, {so = true, desc = "Strikes an enemy with a lightning bolt that arcs to another nearby enemy. The spell affects up to 5 targets, inflicting greater Nature damage to each successive target. Initial damage caused is 2775 to 3225 Nature damage."}), -- Chain Lightning
              Stage({
                so = true,
                stype = ABILITY,
                icon = "Interface\\Icons\\Spell_Nature_Cyclone",
                name = "Cyclone",
                desc = "Knocks an enemy up into the air, that target takes fall damage as it lands.",
                flag1 = IMPORTANT,
              }),
            },
          }),
        },
      }),
    },
  },
  {
    name = "The Curator",
    desc = "The Curator is an Arcane Guardian boss in the Menagerie in Karazhan. It is not optional, raids wanting to kill the bosses behind it must first defeat The Curator.",
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
        name = "Summon Astral Flare",
        desc = "Summons one every 10 seconds, as long he is not Evocating. Each summon costs 10% mana.",
        sections = {
          Spell(30235, {so = true}), -- Arcing Sear
        },
      }),
      Spell(30403, {so = true}), -- Arcane Infusion
      Spell(30254, {so = true, desc = "When The Curator has spent all his mana, he will enter Evocation mode and restore 5% mana per second for 20 seconds. At the same time this increases damage taken by 200% so this is the moment to burst him down.", flag1 = IMPORTANT}), -- Evocation
    },
  },
  {
    name = "Terestian Illhoof",
    desc = "Terestian Illhoof is an optional Satyr boss located in The Repository in Karazhan's Library wing. He starts off with his minion, Kil'rek, and will summon more imps as the fight goes on.",
    --icon = true,
    creature = 15688,
    display = 11343,
    coords = {0.525, 0.696, 11},
    loot = {22561,28652,28653,28659,28656,28658,},
    sections = {
      Spell(30171, {so = true, desc = "Opens two portals into the Twisting Nether that periodically summons demonic minions.", sections = {
        Stage({
          stype = CREATURE,
          creature = 17267,
          display = 16944,
          name = "Fiendish Imp",
          sections = {
            Spell(30050, {so = true, desc = "Shoots a bolt of fire at an enemy, inflicting 181 to 209 Fire damage."}), -- Firebolt
          },
        }),
      }}), -- Fiendish Portal (30179 is a duplicate?)
      Spell(30066, {name = "Summon Kil'rek", desc = "Kil'rek will be summoned shortly after portals spawn and 45 seconds after each time he is killed.", flag1 = IMPORTANT, sections = {
        Spell(30065, {so = true, desc = "When Kil'rek dies, Terestian Illhoof will receive a debuff that increases the damage he takes by 25% that lasts until he summons Kil'rek again.", flag1 = IMPORTANT}), -- Broken Pact
        Spell(30053, {so = true, flag1 = IMPORTANT}), -- Amplify Flames
      }}, 1), -- Summon Imp (Kil'Rek)
      Spell(30115, {so = true, desc = "Sacrifices a random target to the old gods, stunning it and leeching 1500 health every second for 30 seconds or until it dies.\n\nYou can free the person by killing the chains that holds them down.", flag1 = DEADLY}), -- Sacrifice
      Spell(30055, {desc = "Hurls missiles of dark magic, inflicting 3188 to 4312 Shadow damage to his target."}), -- Shadow Bolt
    },
    adds = {
      {
        name = "Kil'rek",
        creature = 17229,
        display = 20364,
      },
    },
  },
  {
    name = "Shade of Aran",
    desc = "The Shade of Aran is a boss in the abandoned tower of Karazhan. He is the spirit of Nielas Aran, the father of Medivh, killed in a battle to contain the future Guardian when the power inside him awakened.",
    --icon = true,
    creature = 16524,
    display = 16621,
    coords = {0.717, 0.262, 10},
    loot = {22560,28666,28726,28672,28663,28728,28670,},
    sections = {
      Stage({
        so = true,
        name = "Basic abilities",
        desc = "Used troughout the entire fight, as long he isn't doing anything more important.",
        sections = {
          Spell(29954, {desc = "Inflicts 3500 to 4500 Frost damage to an enemy and reduces its movement speed by 65% for 4 seconds. Costs 2500 mana.", flag1 = MAGIC, flag2 = INTERRUPT}), -- Frostbolt
          Spell(29953, {desc = "Inflicts 3910 to 5290 Fire damage to an enemy. Costs 2500 mana.", flag1 = INTERRUPT}), -- Fireball
          Spell(29956, {desc = "Inflicts 1260 to 1540 Arcane damage to an enemy. Does not cost mana."}), -- Arcane Missiles
          Spell(29991, {desc = "Forms icy chains around random enemy, locking the target in place for 10 seconds.", flag1 = MAGIC}), -- Chains of Ice
          Spell(29961, {desc = "Counters the spellcasting of all enemies within 9 yards, preventing any spell from that school of magic from being cast for 10 seconds.", flag1 = IMPORTANT}), -- Counterspell
        },
      }),
      Stage({
        so = true,
        name = "Special abilities",
        desc = "Every 30 to 35 seconds, Aran uses one of his three special abilities. Never the same twice in a row, and they can not be interrupted.",
        sections = {
          Stage({
            stype = ABILITY,
            icon = "Interface\\Icons\\Spell_Shadow_AnimateDead",
            name = "Area of Death",
            desc = "Aran will perform three abilities in a specific order and cause instant death if not properly avoided.",
            flag1 = DEADLY,
            sections = {
              Spell(29979, {so = true, desc = "Pulls everyone to Aran, exactly on top of him."}), -- Massive Magnetic Pull
              Spell(30035, {so = true, desc = "Applies slow to everyone, slowing movement speed by 60%, casting and attacking speed by 35%. Lasts for 10 seconds.", flag1 = MAGIC}), -- Mass Slow
              Spell(29973, {so = true, desc = "Massive amounts of arcane power violently errupt and deal 9000 to 11000 Arcane damage to everyone.\n\nYou can save yourself by reaching any wall in the room.", flag1 = DEADLY}),
            },
          }),
          Spell(29946, {desc = "Forms a ring of fire around random players, if they cross this ring it will violently explode and deal 3238 to 3762 Fire damage to all allies. The ring of fire lasts for 20 seconds.", flag1 = DEADLY}), -- Flame Wreath (30004 duplicate?)
          Spell(29969, {desc = "Aran summons a Blizzard that will follow the outer edge of the room in a circle formation. Standing in it will slow you and cause heavy damage over time.", flag1 = IMPORTANT}), -- Summon Blizzard
        },
      }),
      Stage({
        so = true,
        name = "At 40% health: Summon Water Elementals",
        desc = "Aran summons four Water Elementals, one in each corner of the room. They will despawn after 90 seconds.",
        sections = {
          Stage({
            so = true,
            stype = CREATURE,
            creature = 17167,
            display = 5450,
            name = "Conjured Elemental", -- Summon Water Elementals (37051, 37052, 37053, 29962)
            sections = {
              Spell(37054, {desc = "Hurls a watery bolt at an enemy, inflicting 1000 to 2000 Frost damage."}), -- Water Bolt
            },
          }),
        },
      }),
      Stage({
        so = true,
        name = "At 20% mana: Mass Polymorph, Drink, Pyroblast",
        desc = "Aran will Mass Polymorph everyone, sit down and drink then break the polymoph with a Pyroblast Volley.",
        sections = {
          Spell(29963, {desc = "Transforms all enemies into sheep, forcing them to wander around for 10 seconds, but also making them quickly regenerating their health. Any damage will break the transofmration.", flag1 = MAGIC}), -- Mass Polymorph
          Spell(29975, {desc = "Drinks astral water and restores mana over time."}), -- Conjure Water
          Spell(29978, {name = "Pyroblast Volley", desc = "Inflicts 6800 Fire damage to all enemies."}, 1), -- Pyroblast
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 18254,
        display = 17644,
        name = "Shadows of Aran",
        desc = "This serves as the Enrage timer. After 12 minutes of fighting, these will spawn around the room and quickly wipe the group.",
        flag1 = DEADLY,
      }),
      --Spell(29977, {flag1 = MAGIC}), -- Combustion (mobs can't crit with spells, it's hardcoded into the game, so why have this?)
      --Spell(39177), -- Fire Mode Water Break Blocker
      --Spell(29976, {flag1 = MAGIC}), -- Presence of Mind
      --Spell(29990, {flag1 = MAGIC}), -- Slow
    },
    adds = {
      {
        name = "Water Elemental",
        creature = 17167,
        display = 5450,
      },
    },
  },
  {
    name = "Netherspite",
    desc = "Netherspite is an immense nether dragon found lurking in the Celestial Watch, Medivh's personal observatory. As the only dragon found inside the dark tower, he will use his otherworldly powers to vanquish any creatures that attempt to go near him. This dragon's death is not required for further progress into the tower but he does control the trash between the Shade of Aran and the Chess Event.",
    --icon = true,
    creature = 15689,
    display = 15363,
    coords = {0.361, 0.419, 13},
    loot = {28734,28732,28733,28740,28744,},
    sections = {
      Stage({
        so = true,
        name = "Phase 1: Portals",
        desc = "Each portal will provide a specific bonus to who ever is hit by the beam. By default all portal beams head for Netherspite, but players can get in their way.\n\nYou can only take a specific color for one portal phase, the next one you will still have a debuff, forcing you to pick another color. By then you are able to go back to the original color assignment. For example you as tank can do red first, green after, then red again, and repeat.",
        sections = {
          Spell(30466, {icon = "Interface\\Icons\\INV_Misc_QirajiCrystal_02", name = "Perseverence", desc = "Also known as the \"Tank beam\" and the effects of being hit by this beam are described below.", sections = {
            Stage({
              so = true,
              name = "Netherspite",
              desc = "Damage taken reduced by 1% per application.",
            }),
            Stage({
              so = true,
              name = "Players",
              desc = "Netherspite will aggro you.\nDamage taken is reduced by 1% per application.\nMaximum health is modified, first application gives 31000 health, additional applications add 1000 more health.\nReplenishes full health every application.",
            }),
          }}, 1), -- Nether Portal - Perseverence
          Spell(30467, {icon = "Interface\\Icons\\INV_Misc_QirajiCrystal_03", name = "Serenity", desc = "Also known as the \"Healer beam\" and the effects of being hit by this beam are described below.", sections = {
            Stage({
              so = true,
              name = "Netherspite",
              desc = "Heals for 4000 per application, stacking. First 4000, second 8000, 12000, and so forth.",
            }),
            Stage({
              so = true,
              name = "Players",
              desc = "Healing done is increased by 5% per application.\nSpell and ability cost reduced by 1% per application. (Not only mana, also rage and energy.)\nMaximum mana reduced by 200.\nReplenishes full mana every application.",
            }),
          }}, 1), -- Nether Portal - Serenity
          Spell(30468, {icon = "Interface\\Icons\\INV_Misc_QirajiCrystal_04", name = "Dominance", desc = "Also known as the \"Damager beam\" and the effects of being hit by this beam are described below.", sections = {
            Stage({
              so = true,
              name = "Netherspite",
              desc = "Increases spell damage by 1% each application.",
            }),
            Stage({
              so = true,
              name = "Players",
              desc = "Damage dealt is increased by 5% per application.\nHealing received reduced by 1% per application.\nDamage taken by spells is increased by 8% per application.",
            }),
          }}, 1), -- Nether Portal - Dominance
          Spell(38549, {so = true, desc = "After portal beams are activated, Netherspite will increase his damage done by 200%."}), -- Empowerment
          Spell(37063, {desc = "Netherspite will randomly spawn Void Zone below a random player, it will deal a lot of damage as long you stand on it.", flag1 = DEADLY}), -- Void Zone
        },
      }),
      Stage({
        so = true,
        name = "Phase 2: Banish Phase",
        desc = "He will become banished for 30 seconds and only cast Netherbreath until phase 1 starts again.",
        sections = {
          Spell(38523, {so = true, desc = "Targets a random enemy, turns towards them and unleashes 4163 to 4837 Arcane damage in a cone in front of him. Any allies nearby are also damaged.", flag1 = IMPORTANT}), -- Netherbreath
        },
      }),
      Spell(30522, {so = true, desc = "Netherspite will during the encounter damage everyone for 1200 Shadow damage every 5 seconds."}), -- Nether Burn
      Spell(38688, {so = true, desc = "Netherspite will enrage after 9 minutes and deal 500% more damage. This will quickly wipe the group.", flag1 = DEADLY}), -- Nether Infusion
    },
  },
  {
    name = "Chess Event",
    desc = "The Chess event in Karazhan must be solved in order to reach Prince Malchezaar. The raid plays a sort of chess match against Medivh.\n\nAlthough the analogy to chess is usable (Daemons are \"stronger\" than Footmen for example), it's not very strict. The pieces from the event behave very differently from real chess pieces, in particular player-controlled pieces autoattack enemy pieces they face, and the Kings are actually the strongest pieces in the game. In order to start the event, a player has to talk to the King piece of their own faction. The objective is to kill the enemy King without losing one's own King.",
    --icon = true,
    creature = 16816,
    display = 18720,
    coords = {0.360, 0.620, 14},
    loot = {28745,28746,28747,28748,28749,28750,28751,28752,28753,28754,28755,28756,},
    sections = {
      Stage({
        so = true,
        name = "Chess Pieces",
        desc = "Each chess piece has four abilities, they are keybound to buttons 1 through 4. First first is to change facing direction, the second is to move the piece. The third and fourth are special abilities that vary between pieces.",
        sections = {
          Stage({
            name = "King (King Llane/Warchief Blackhand: Paladin/Warrior)",
            sections = {
              Stage({so = true, name = "Sweep/Cleave", desc = "Deals 4000 damage to thee frontal adjacent enemy units."}),
              Stage({so = true, name = "Heroism/Bloodlust", desc = "Grants 50% increased damage to all allied humanoids on all 8 adjacent spaces, does not affect self."}),
            },
          }),
          Stage({
            name = "Queen (Conjurer/Warlock: Spellcaster)",
            sections = {
              Stage({so = true, name = "Elemental Blast/Fireball", desc = "Deals 4000 damage to any single chess piece."}),
              Stage({so = true, name = "Rain of Fire/Poison Cloud", desc = "Deal 6000 damage to any hostile chess piece and all adjacent hostile pieces. Cooldown 15 secs."}),
            },
          }),
          Stage({
            name = "Bishop (Cleric/Necrolyte: Healer)",
            sections = {
              Stage({so = true, name = "Healing/Shadow Mend", desc = "Heal a friendly piece for 12000."}),
              Stage({so = true, name = "Holy Lance/Shadow Spear", desc = "Deals 2000 damage to enemy units standing in a straight line of three squares in front."}),
            },
          }),
          Stage({
            name = "Knight (Charger/Wolf: Melee Damager II)",
            sections = {
              Stage({so = true, name = "Smash/Bite", desc = "3000 damage to a target one square in front."}),
              Stage({so = true, name = "Stomp/Howl", desc = "Reduces damage of all adjacent hostile chess pieces by 50%, lasts for 10 seconds."}),
            },
          }),
          Stage({
            name = "Rook (Water Elemental/Daemon: AoE Damager)",
            sections = {
              Stage({so = true, name = "Geyser/Hellfire", desc = "Deals 3000 damage to all adjacent hostile chess pieces."}),
              Stage({so = true, name = "Water Shield/Fire Shield", desc = "Reduce damage taken by 50% for 5 seconds."}),
            },
          }),
          Stage({
            name = "Pawn (Footman/Grunt: Melee Damager I)",
            sections = {
              Stage({so = true, name = "Heroic Blow/Vicious Strike", desc = "Deals 1000 damage to a target one square in front."}),
              Stage({so = true, name = "Shield Block/Weapon Deflection", desc = "Absorbs 500 damage. Lasts 5 seconds."}),
            },
          }),
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 16816,
        display = 18720,
        name = "Echo of Medivh",
        desc = "During the fight, Medivh will cheat at random by using one of the three abilities.",
        sections = {
          Stage({
            stype = ABILITY,
            icon = "Interface\\Icons\\Spell_Holy_Heal",
            name = "Healing Cheat",
            desc = "Heals three or four of Medivh's pieces to full health. This is indicated by bright light around affected pieces.",
          }),
          Stage({
            stype = ABILITY,
            icon = "Interface\\Icons\\Spell_Shadow_DeathPact",
            name = "Berserking Cheat",
            desc = "Buffs three or four of Medivh's pieces to deal more damage. This is indicated with a purple aura and that the peices have grown considerably in size.",
          }),
          Stage({
            stype = ABILITY,
            icon = "Interface\\Icons\\INV_Elemental_Primal_Fire",
            name = "Damage Cheat",
            desc = "Damages random pieces owned by the players, the pieces will die if left in the fire. This is indicated by fire under the affected pieces. I can't believe I had to explicitly write that.",
          }),
        },
      }),
    },
  },
  {
    name = "Nightbane",
    desc = "Nightbane is a summonable raid boss in Karazhan. He is a fiery skeletal dragon, transformed by Medivh from Arcanagos and formerly of the blue dragonflight. While not the ruler of Karazhan, a position apparently held by Prince Malchezaar, many consider Nightbane to be the true final boss of the tower, due to his superior difficulty in the early days of the dungeon's release.\n\nAlthough the \"Blackened Urn\" is no longer required to summon Nightbane, a raid member must have completed the quest \"Medivh's Journal\" in order to click the urn on the ground.",
    --icon = true,
    creature = 17225,
    display = 18062,
    coords = {0.471, 0.918, 6},
    loot = {28611,28608,28604,28609,28599,28603,},
    sections = {
      Stage({
        so = true,
        name = "Phase 1: Ground",
        desc = "The ground phase lasts from when he lands until his health reaches 75%, 50% or 25%, at which point phase 2 begins.",
        sections = {
          Spell(36922, {desc = "A bellowing roar terrifies all enemies within 35 yards for 4 seconds."}), -- Bellowing Roar
          Spell(30129, {desc = "Chars the ground, dealing 2188 to 2812 Fire damage every 3 seconds to anyone standing on it.", flag1 = MAGIC, flag2 = DEADLY}), -- Charred Earth
          Spell(30131, {desc = "Inflicts normal damage to an enemy and its nearest allies, affecting up to 2 targets.", flag1 = TANK}), -- Cleave
          Spell(25653, {desc = "Inflicts 450 damage on enemies in a cone behind Nightbane, knocking them back."}), -- Tail Sweep
          Spell(30130, {desc = "Distracts enemies with ash in their eyes, reducing their chance to hit with attacks, spells and abilities by 30%. Lasts for 40 seconds.", flag1 = MAGIC}), -- Distracting Ash
          Spell(30210, {desc = "Deals 3700 to 4300 Fire damage to enemies in a cone in front of Nightbane. Lasts 15 seconds.", flag1 = IMPORTANT}), -- Smoldering Breath
        },
      }),
      Stage({
        so = true,
        name = "Phase 2: Air",
        desc = "The flight phase lasts until Nightbane has finished casting his two abilities.",
        sections = {
          Spell(37098, {so = true, desc = "Bombards enemies on the terrace with bone fragments, summoning three skeletons in the process and deals 880 to 1020 Physical damage each second for 11 seconds.", sections = {
            Stage({
              stype = CREATURE,
              creature = 17261,
              display = 16156,
              name = "Restless Skeleton",
              desc = "Should be swiftly killed before Nightbane lands.",
            }),
          }}), -- Rain of Bones (triggers 37091)
          Spell(30128, {desc = "Inflicts 1850 to 2150 damage to the target and additional 3000 Fire damage over 18 seconds.", flag1 = MAGIC}), -- Smoking Blast (37057 duplicate? triggers 30127)
          Spell(30282, {so = true, desc = "Throws fireballs at any enemies farther than 40 yards away. Each Fireball deals 2550 to 3450 Fire damage per second and lasts until that target runs closer to Nightbane.", flag1 = DEADLY}), -- Fireball Barrage
        },
      }),
    },
    adds = {
      {
        name = "Restless Skeleton",
        creature = 17261,
        display = 16156,
      },
    },
  },
  {
    name = "Prince Malchezaar",
    desc = "Little is known about him, except that he is a man'ari eredar, he claims to be a prince, and that he is a member of the Burning Legion. It is unknown how or when he arrived at Karazhan or what his purpose there is. He apparently arrived while some agents of the Violet Eye were still alive inside Karazhan, notably Keanna. It was likely shortly before Karazhan was sealed, as the Violet Eye were aware of Keanna's death.",
    --icon = true,
    creature = 15690,
    display = 19274,
    coords = {0.515, 0.317, 17},
    loot = {29760,29761,28773,28770,28764,28762,28766,},
    sections = {
      Stage({
        so = true,
        name = "Common for all phases",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 17646,
            display = 18036,
            name = "Netherspite Infernal",
            desc = "Malchezaar will spawn Infernals that land randomly in the area. In phase 1 and 2 the interval is 45 seconds, while in phase 3 they spawn with an interval of 15 seconds.",
            flag1 = DEADLY,
            sections = {
              Spell(30859, {so = true, desc = "Ignites the area around the Infernal, causing 875 to 1125 Fire damage in a 20 yards radius, each second for 180 seconds.", flag1 = DEADLY}), -- Hellfire
            },
          }),
          Spell(30852, {desc = "Dark magic is unleashed at Malchezaar, causing 3000 Shadow damage and knocking back all enemies within 30 yards.", flag1 = IMPORTANT}), -- Shadow Nova
        },
      }),
      Stage({
        so = true,
        name = "Phase 1",
        desc = "This phase ends when Malchezaar reaches 60% health.",
        sections = {
          Spell(30843, {so = true, desc = "Reduces healing effects and health regeneration by 100% and reduces health to 1 health point, lasts for 9 seconds.  Upon expiration the health is restored.", flag1 = IMPORTANT}), -- Enfeeble
          Spell(30854, {desc = "Utters a word of darkness, inflicting 1500 Shadow damage to his target every 3 seconds for 18 seconds.", flag1 = MAGIC}), -- Shadow Word: Pain
          
        },
      }),
      Stage({
        so = true,
        name = "Phase 2",
        desc = "This phase ends when Malchezaar reaches 30% health.",
        sections = {
          Spell(30843, {desc = "Reduces healing effects and health regeneration by 100% and reduces health to 1 health point, lasts for 9 seconds.  Upon expiration the health is restored.", flag1 = IMPORTANT}), -- Enfeeble
          Spell(23547, {desc = "Malchezaar is given the ability to parry frontal attacks, and will upon parry hit 40% faster on his next swing.", flag1 = TANK}), -- Parry
          Spell(30901, {desc = "Reduces targets armor by 1000 per application and can stack to 5 applications. Lasts 20 seconds.", flag1 = HEALER}), -- Sunder Armor
          Spell(3391, {so = true, desc = "Gives Malchezaar a chance to attack twice instead of once.\n\nIn combination with Sunder Armor and Parry, he can easily deal over 12000 damage in one second, this makes phase 2 very random and hard for healers and tanks. Get him to phase 3 as fast as you possibly can.", flag1 = DEADLY}), -- Thrash
        },
      }),
      Stage({
        so = true,
        name = "Phase 3",
        sections = {
          Spell(39095, {desc = "Increases all damage taken by 100%."}), -- Amplify Damage
          Spell(30898, {desc = "Utters a word of darkness, inflicting 1313 to 1687 Shadow damage to a random enemy every 3 seconds for 18 seconds.", flag1 = MAGIC}), -- Shadow Word: Pain (random)
          Stage({
            name = "Flying Axes",
            desc = "Malchezaar unleashes his axes on random targets, they can not be targeted and will attack at random. They will increase they damage as they change targets, first start at 400 damage per swing and work their way up to 1000 damage per swing.",
            flag1 = HEALER,
          }),
        },
      }),
    },
    adds = {
      {
        name = "Netherspite Infernal",
        creature = 17646,
        display = 18036,
      },
    },
  },
})

table.insert(db, KARAZHAN)
