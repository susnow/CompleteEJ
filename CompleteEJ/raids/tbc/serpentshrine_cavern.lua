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

local SERPENTSHRINE_CAVERN = CreateInstance({
  name = "毒蛇神殿",
  desc = "\"控制了水源就控制外域。\"  这些话是伊利丹·怒风对他最忠实的盟友，瓦斯琪女士说的。在第三次兽人战争之后，伊利丹像娜迦寻求帮助，瓦斯琪带领的娜迦回应了他。自那之后，瓦斯琪就成为了伊利丹的盟友。\n\n现在，娜迦统治了盘牙水库，并严格监管着这片水域。\n\n至于瓦斯琪是否只对伊利丹忠诚，这还有待考察。",
  --texture = "SerpentshrineCavern",
  area = 780,
  dflag = N25,
}, {
  {
    name = "不稳定的海度斯",
    desc = "不稳定的海度斯是你要面对的第一个BOSS。有两个能源通道连向它。它处于平台之上，它处于\"稳定状态\"，它一旦越过那个平台，那它就会编程\"不稳定状态\"。它更像是一个瓦斯琪的囚犯，用来守护门口防止入侵者侵入其中。娜迦把海度斯抓来并与它交易，海度斯负责镇守这个区域，而娜迦负责净化它的身体，不过，显然他没的选择。",
    --icon = true,
    creature = 21216,
    display = 20162,
    coords = {0.362, 0.844, 1},
    loot = {30306,30047,30324,30050,30307,30049,30629,30054,30283,33055,30308,30053,30281,},
    sections = {
      Stage({
        name = "水元素形态",
        desc = "在平台上处于这种形态，免疫冰霜伤害。",
        sections = {
          Spell(45574, {desc = "将目标击晕4秒并造成大量的伤害，目标范围内8码的其他人也会受到同样的伤害且会不断跳向下一个附近的目标。"}), -- Water Tomb (38235 old?)
          --Spell(38215), -- Mark of Hydross (10%)
          --Spell(38216), -- Mark of Hydross (25%)
          --Spell(38217), -- Mark of Hydross (50%)
          --Spell(38218), -- Mark of Hydross (100%)
          --Spell(38231), -- Mark of Hydross (250%)
          Spell(40584, {desc = "每15秒为全团每人叠加一次冰霜法术易伤 10/25/50/100/250/500% 。"}), -- Mark of Hydross (500%)
        },
      }),
      Stage({
        name = "毒元素形态",
        desc = "离开那个平台处于毒元素形态，免疫自然伤害。",
        sections = {
          --Spell(37961), -- Corruption
          Spell(45573, {desc = "转换阶段时，刷出四个水元素，需要迅速处理掉。"}), -- Vile Sludge (38246 old?)
          --Spell(38219), -- Mark of Corruption (10%)
          --Spell(38220), -- Mark of Corruption (25%)
          --Spell(38221), -- Mark of Corruption (50%)
          --Spell(38222), -- Mark of Corruption (100%)
          --Spell(38230), -- Mark of Corruption (250%)
          Spell(40583, {desc = "每15秒为全团每人叠加一次自然法术易伤 10/25/50/100/250/500% 。"}), -- Mark of Corruption (500%)
        },
      }),
      Spell(36459, {so = true, icon = "Interface\\Icons\\Spell_Frost_SummonWaterElemental_2", name = "Summon Elementals", desc = "After each form change, four elementals are summoned to serve. If he enters Water Form then Water Elementals will spawn, otherwise Poison Elementals.\n\nJust like Hydross, these spawns will attack and be immune to the same school of magic as themselves.", flag1 = IMPORTANT}, 1), -- Summon Water Elemental
    },
    adds = {
      {
        name = "不稳定的海度斯 (毒元素形态)",
        creature = 21932,
        display = 20609,
      },
    },
  },
  {
    name = "鱼斯拉",
    desc = "鱼斯拉是毒蛇神殿的二号BOSS。为了引出这个BOSS，你必须在BOSS所在的池中钓鱼。",
    --icon = true,
    creature = 21217,
    display = 20216,
    coords = {0.404, 0.588, 1},
    loot = {30067,30064,30062,30059,30063,30665,30058,30323,},
    sections = {
      Spell(37478), -- Geyser
      Spell(37138), -- Water Bolt
    },
  },
  {
    name = "盲眼者莱欧瑟拉斯",
    desc = "盲眼者莱欧瑟拉斯是毒蛇神殿的三号BOSS。他有两种形态，每60秒切换一次。一旦他还剩15%血量，他的两种形态会分开，也就是说你必须同时面对他的两种形态。",
    --icon = true,
    creature = 21215,
    display = 20514,
    coords = {0.408, 0.260, 1},
    loot = {30307,30096,30239,30240,30091,30308,30097,30282,},
    sections = {
      Spell(27680), -- Berserk
      Spell(37675), -- Chaos Blast
      Spell(37749), -- Consuming Madness
      Spell(37676), -- Insidious Whisper
      Spell(37640), -- Whirlwind
      Spell(37641), -- Whirlwind
    },
  },
  {
    name = "深水领主卡拉瑟拉斯",
    desc = "深水领主卡拉瑟拉斯有三名护卫，深水护卫沙基斯、深水护卫泰达维斯和深水护卫卡里布迪斯，在85级想要solo他依旧很难，很大程度是因为他有一个技能，可以无视等级打掉你50%的血量—这使得他很容易就杀死你。",
    --icon = true,
    creature = 21214,
    display = 20662,
    coords = {0.480, 0.170, 1},
    loot = {30324,30245,30283,30100,30247,30663,30307,30090,30281,},
    sections = {
      Spell(27680), -- Berserk
      Spell(38441), -- Cataclysmic Bolt
      Spell(38445), -- Sear Nova
      Spell(38373), -- The Beast Within
    },
  },
  {
    name = "莫洛格里·踏潮者",
    desc = "莫洛格里·踏潮者是毒蛇神殿的五号BOSS。",
    --icon = true,
    creature = 21213,
    display = 20739,
    coords = {0.594, 0.258, 1},
    loot = {30008,30324,30098,30283,33058,30720,30082,30282,30084,30307,30080,30302,},
    sections = {
      Spell(37764), -- Earthquake
      Spell(37730), -- Tidal Wave
      Spell(37850), -- Watery Grave
      Spell(38028), -- Watery Grave
      Spell(38023), -- Watery Grave
      Spell(38024), -- Watery Grave
      Spell(38025), -- Watery Grave
    },
  },
  {
    name = "瓦斯琪女士",
    desc = "瓦斯琪女士是毒蛇神殿的最终BOSS。她曾经需要玩家击败所有的BOSS才有击杀她的资格，但现在这个限制已经去掉了，你可以直接来击杀她。",
    --icon = true,
    creature = 21212,
    display = 20748,
    coords = {0.714, 0.590, 1},
    loot = {30242,30281,30243,30308,30112,30323,30107,30621,30104,30306,30105,30324,30108,30301,},
    sections = {
      Spell(38316), -- Entangle
      Spell(38145), -- Forked Lightning
      Spell(38310), -- Multi-Shot
      Spell(38509), -- Shock Blast
      Spell(38295), -- Shoot
      Spell(38280), -- Static Charge
    },
  },
})

table.insert(db, SERPENTSHRINE_CAVERN)
