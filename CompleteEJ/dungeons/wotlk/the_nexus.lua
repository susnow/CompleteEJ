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

local THE_NEXUS = CreateInstance({
  name = "魔枢",
  desc = "玛里苟斯使用利用魔网能量线，使魔法能量导向他位于诺森德的地下要塞 —— 魔枢。一旦他获得成功，能量就将通过奈克瑟斯的上升循环集中，并且爆炸成为扭曲虚空.",
  texture = "TheNexus",
  area = 520,
}, {
  {
    name = "指挥官库鲁尔格",
    desc = "指挥官库鲁尔格和指挥官斯托比德是在英雄模式下才会遇到的Boss,如果玩家是联盟方,那么遇到的是鲁尔格,如果玩家是部落方,那么将遇到斯托比德.",
    --icon = true,
    creature = 26798,
    display = 24352,
    coords = {0.27, 0.27, 1},
    loot = {{37728,H5},{37729,H5},{37730,H5},{37731,H5},},
    sections = {
      Spell(31403, {fbd = H5, so = true}), -- Battle Shout
      Spell(60067, {fbd = H5, so = true, desc = "Charges the player furthest away, inflicting normal damage plus 75 Physical damage and stunning it for 2 seconds."}), -- Charge
      Spell(38619, {fbd = H5, so = true}), -- Whirlwind (triggered 38618 but this had better tooltip)
      Spell(19134, {fbd = H5, so = true, flag1 = MAGIC}), -- Frightening Shout
      Stage({
        fbd = N5,
        so = true,
        name = "联盟和部落的指挥官",
        desc = "这个Boss的掉落列表与难度完全不成正比....",
        sections = {
          Spell(31403, {so = true}), -- Battle Shout
          Spell(60067, {so = true, desc = "冲锋一名敌人，造成普通伤害再加上75点伤害，并使对手昏迷2秒."}), -- Charge
          Spell(38619, {so = true}), -- Whirlwind (triggered 38618 but this had better tooltip)
        },
      }),
    },
    adds = {
      {
        name = "指挥官斯托比德",
        creature = 26796,
        display = 24366,
      },
    },
  },
  {
    name = "大魔导师泰蕾丝塔",
    desc = "大魔导师泰蕾丝塔是蓝龙军团安插在肯瑞托的眼线",
    --icon = true,
    creature = 26731,
    display = 24066,
    coords = {0.276, 0.400, 1},
    loot = {{35605,N5},{35604,N5},{37139,H5},{35617,N5},{37135,H5},{37134,H5},{37138,H5},},
    sections = {
      Stage({
        so = true,
        name = "第一阶段",
        sections = {
          Spell(47765, {icon = "Interface\\Icons\\Spell_Nature_Earthbind", desc = "持续将60码内所有玩家向施法者方向拉拽，并在6秒内迅速造成75点暗影伤害."}), -- Gravity Well
          Spell(47773, {fbd = N5, desc = "对一名敌人及其附近的敌人造成1700~2300点火焰伤害."}), -- Firebomb
          Spell(47772, {fbd = N5, desc = "对附近60码内的敌人造成2357~2643点冰霜伤害,并且将他们定在原地,持续3秒."}), -- Ice Nova
          Spell(56934, {fbd = H5, desc = "对一名敌人及其附近的敌人造成2720~3680点火焰伤害"}), -- Firebomb
          Spell(56935, {fbd = H5, desc = "对附近60码内的敌人造成3299~3701点冰霜伤害,并且将他们定在原地,持续3秒."}), -- Ice Nova
        },
      }),
      Stage({
        so = true,
        name = "第二阶段",
        desc = "当泰蕾丝塔的生命值降至50%时(英雄模式是15%),进入第二阶段.",
        sections = {
          Stage({
            so = true,
            stype = ABILITY,
            icon = "Interface\\Icons\\Spell_Magic_LesserInvisibilty",
            name = "镜像",
            desc = "泰蕾丝塔召唤出3名镜像,分别使用不同的法术攻击玩家.",
            sections = {
              Stage({
                stype = CREATURE,
                creature = 26741,
                display = 24066,
                name = "奥术镜像",
                sections = {
                  Spell(47731, {so = true}), -- Critter
                  Spell(47736, {so = true}), -- Time Stop
                },
              }),
              Stage({
                stype = CREATURE,
                creature = 26741,
                display = 24066,
                name = "火焰镜像",
                sections = {
                  Spell(47721, {fbd = N5, so = true, desc = "对目标造成2357~2643点火焰伤害"}), -- Fire Blast
                  Spell(47723, {fbd = N5, so = true, desc = "对目标造成1275~1725点火焰伤害"}), -- Scorch
                  Spell(56939, {fbd = H5, so = true, desc = "对目标造成3770~4230点火焰伤害"}), -- Fire Blast
                  Spell(56938, {fbd = H5, so = true, desc = "对目标造成2550~3450点火焰伤害"}), -- Scorch
                },
              }),
              Stage({
                stype = CREATURE,
                creature = 26741,
                display = 24066,
                name = "冰霜镜像",
                sections = {
                  Spell(47727, {fbd = N5, so = true}), -- Blizzard
                  Spell(47729, {fbd = N5, so = true}), -- Ice Barb
                  Spell(56936, {fbd = H5, so = true}), -- Blizzard
                  Spell(56937, {fbd = H5, so = true}), -- Ice Barb
                },
              }),
            },
          }),
        },
      }),
      Stage({
        so = true,
        name = "第三阶段",
        desc = "当3个镜像都被消灭之后,泰蕾丝塔将重新开始使用第一阶段的技能,并且更加频繁的施展冰霜新星和火球术.",
      }),
    },
  },
  {
    name = "阿诺玛鲁斯",
    desc = "神秘的元素生物,与成就混沌理论有关.",
    --icon = true,
    creature = 26763,
    display = 26259,
    coords = {0.610, 0.218, 1},
    loot = {{35599,N5},{35598,N5},{37141,H5},{35600,N5},{37144,H5},{37150,H5},{37149,H5},},
    sections = {
    	Stage({
        so = true,
        name = "第一阶段",
        sections = {
          Spell(47751, {fbd = N5, desc = "向目标射出一支奥术箭,对其造成2025~2475点奥术伤害."}), -- Spark
          Spell(57062, {fbd = H5, desc = "向目标射出一支奥术箭,对其造成4275~4725点奥术伤害."}), -- Spark
          Spell(57063, {fbd = H5, flag1 = MAGIC}), -- Arcane Attraction
        },
    	}),
    	Stage({
    		so = true,
    		name = "第二阶段",
    		desc = "当阿诺玛鲁斯生命值降至50%以下时,进入第二阶段.阿诺玛鲁斯为自己引导一个裂隙之盾,免疫一切伤害.这个阶段将在阿诺玛鲁斯引导法术结束之后或者摧毁了所有混乱裂隙之后结束,并且重新回到第一阶段.",
    		sections = {
          Spell(47748), -- Rift Shield
          Spell(47747), -- Charge Rifts
          Spell(47743, {so = true, desc = "撕裂空间的结构，在阿诺玛鲁斯身旁开启一道混乱裂隙.", sections = {
            Spell(47688), -- Chaotic Energy Burst
            Spell(47737), -- Charged Chaotic Energy Burst
            Stage({
              stype = CREATURE,
              creature = 26746,
              display = 27810,
              name = "狂乱的法力怨灵",
              sections = {
                Spell(33833, {so = true, desc = "向目标射出魔法箭，对其造成24~29点奥术伤害."}), -- Arcane Missilies
              }
            }),
          }}), -- Create Rift
    		},
    	}),
    },
  },
  {
    name = "塑树者奥莫洛克",
    desc = "塑树者奥莫洛克被抓获之后,他和他的手下被委任成为魔枢的守卫之一,由于奥术能量的缘故,他们逐渐变得疯狂.",
    --icon = true,
    creature = 26794,
    display = 26298,
    coords = {0.566, 0.710, 1},
    loot = {{35602,N5},{35601,N5},{37155,H5},{35603,N5},{37152,H5},{37151,H5},{37153,H5},},
    sections = {
      Spell(47958, {fbd = N5, so = true, flag1 = IMPORTANT}), -- Crystal Spikes
      Spell(57082, {fbd = H5, so = true, flag1 = IMPORTANT}), -- Crystal Spikes
      Spell(47981, {desc = "反射魔法,可以使用4次.", flag1 = IMPORTANT}), -- Spell Reflection
      Spell(48016, {fbd = N5}), -- Trample
      Spell(57066, {fbd = H5}), -- Trample
      Spell(57086, {fbd = N5, desc = "当奥莫洛克的生命值降低到25%以下时,物理伤害提高50%.", flag1 = HEALER}), -- Frenzy
      Spell(48017, {fbd = H5, desc = "当奥莫洛克的生命值降低到25%以下时,物理伤害提高100%.", flag1 = HEALER}), -- Frenzy
      Spell(61564, {fbd = H5, so = true, icon = "Interface\\Icons\\Spell_Nature_Stranglevines", desc = "召唤水晶纠结者.", sections = {
        Stage({
          stype = CREATURE,
          creature = 32665,
          display = 19033,
          name = "水晶纠结者",
          sections = {
            Spell(61556, {so = true, desc = "近战攻击命中目标后，在目标脚下生出盘足之根，使其无法移动,持续2秒."}), -- Tangle
          },
        }),
      }}, 1), -- Summon Crystalline Tangler
    },
  },
  {
    name = "克莉斯塔萨",
    desc = "红龙军团原本集合红龙想杀死玛利苟斯，但是低估了玛利苟斯的能力，克莉斯塔萨被玛利苟斯抓走强迫成为他的新配偶，囚禁在魔枢，被玛利苟斯摧残心智.",
    --icon = true,
    creature = 26723,
    display = 24307,
    coords = {0.354, 0.672, 1},
    loot = {{35596,N5},{35597,N5},{37162,H5},{35595,N5},{37169,H5},{43102,H5},{37167,H5},{37170,H5},{37172,H5},{37166,H5},{37165,H5},{37171,H5},},
    sections = {
      Spell(48094, {desc = "周期性对附近的敌人造成伤害并使其移动速度、攻击速度和施法速度持续降低。移动可以打破该效果.", flag1 = IMPORTANT}), -- Intense Cold
      Spell(50997, {desc = "对一名敌人造成1650~1850点冰霜伤害并使其无法移动，最多持续10秒.", flag1 = MAGIC}), -- Crystal Chains
      Spell(48096, {fbd = N5, desc = "对施法者正面锥形区域内的敌人造成2763~3737点冰霜伤害,并且每2秒造成额外的1000点冰霜伤害,持续10秒.受到水晶烈焰吐息影响的玩家移动速度降低.", flag1 = TANK}), -- Crystalfire Breath
      Spell(57091, {fbd = H5, desc = "对施法者正面锥形区域内的敌人造成3825~5175点冰霜伤害,并且每2秒造成额外的1000点冰霜伤害,持续10秒.受到水晶烈焰吐息影响的玩家移动速度降低.", flag1 = TANK}), -- Crystalfire Breath
      Spell(50155, {flag1 = DPS}), -- Tail Sweep
      Spell(8599, {desc = "当克莉斯塔萨生命值降至25%的时候,进入狂暴状态.攻击速度提高30%,近战伤害提高10%,持续2分钟."}), -- Enrage
      Spell(48179, {fbd = H5, desc = "对附近敌人造成1650~1859点冰霜伤害并使其无法移动，最多持续10秒.", flag1 = MAGIC}), -- Crystallize
    },
  },
})

table.insert(db, THE_NEXUS)
