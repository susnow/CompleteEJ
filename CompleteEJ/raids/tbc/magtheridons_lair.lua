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

local MAGTHERIDONS_LAIR = CreateInstance({
  name = "玛瑟里顿的巢穴",
  desc = "玛瑟里顿的巢穴这个副本处于外域地狱火半岛之中，在这个副本里，你将直面深渊领主玛瑟里顿。你可以在地狱火堡垒的西边找到这个副本的入口。",
  texture = "MagtheridonsLair",
  area = 779,
  dflag = N25,
}, {
  {
    name = "玛瑟里顿",
    desc = "玛瑟里顿暴雪开发的魔兽系列游戏中的角色。他是前外域之王，在兽人家乡毁灭之后征服了这片土地的一名深渊领主。他的统治因为伊利丹·怒风的到来而被终结，伊利丹正是想将玛瑟里顿在黑暗神殿的王位据为己有。伊利丹认为玛瑟里顿尚能发挥余热，所以将其拖至地狱火堡垒进行监禁，把他的性命留给了地狱兽人。玛瑟里顿震耳的哀嚎响彻云霄。玩家们可以进入这个副本，解除玛瑟里顿的枷锁并最终击败他，把玛瑟里顿的头颅当做实力的证明。 ",
    --icon = true,
    creature = 17257,
    display = 18527,
    coords = {0.691, 0.743, 1},
    loot = {28783,29753,28782,29754,34845,32385,28780,28775,28777,},
    sections = {
      Stage({
        so = true,
        name = "第一阶段： 地狱火魔导师",
        desc = "你需要面对五名地狱火导魔师，他们使用五个盒子来禁锢玛瑟里顿。攻击他们中的任何一员将开始战斗，战斗开始之后的两分钟时，进入第二阶段。",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 17256,
            display = 9865,
            name = "地狱火魔导师",
            desc = "当杀死一名地狱火魔导师，剩余的地狱火魔导师伤害就会提高20%，施法速度提高10%。",
            sections = {
              Spell(30528, {desc = "治疗30码内的一名盟友 69375~80625点生命值 。", flag1 = INTERRUPT}), -- Dark Mending
              Spell(30510, {desc = "向30码内的所有敌人射出暗影箭，造成 1488~2012点 暗影伤害。"}), -- Shadow Bolt Volley
              --Spell(30511), -- Burning Abyssal
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 17454,
            display = 16874,
            name = "地狱火",
            desc = "地狱火魔导师将召唤出巨大的地狱火来参与战斗 ，能被恐惧或放逐。 ",
          }),
        },
      }),
      Stage({
        so = true,
        name = "第二阶段： 玛瑟里顿",
        sections = {
          Spell(30616, {so = true, desc = "每60秒玛瑟里顿就会施放火焰新星，每两秒造成 2188~2812点 火焰伤害，持续10秒。\n\n同时点击五个盒子可以打断这个技能。", flag1 = IMPORTANT}), -- Blast Nova
          Spell(30619, {flag1 = TANK}), -- Cleave
          --Spell(30205), -- Shadow Cage
        },
      }),
      Stage({
        so = true,
        name = "第三阶段： 30%血量",
        desc = "玛瑟里顿会敲击墙壁，造成落石。持续两秒对敌方全体造成 5250~6750点 伤害。\n\n如果待在落石处，你必死无疑。",
        flag1 = DEADLY,
      }),
      Spell(26662, {desc = "战斗持续22分钟后，玛瑟里顿将进入狂暴状态，攻速提高150%，伤害提高500%。", flag1 = DEADLY}), -- Berserk
    },
  },
})

table.insert(db, MAGTHERIDONS_LAIR)
