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

local THE_UNDERBOG = CreateInstance({
  name = "幽暗沼泽",
  desc = "幽暗沼泽是盘牙水库地下城的第二个5人副本,是盘牙水库内未被纳迦侵入消灭的自然生命的家园.在这个地区仅有的纳迦们保护着他们的多头蛇神加兹安的居所.剩余区域是一个自然的栖息地,赞加沼泽最强大生物种类们的家.",
  --texture = "TheUnderbog",
  area = 726,
}, {
  {
    name = "霍加尔芬",
    desc = "大型真菌巨人霍加尔芬是幽暗沼泽的第一个BOSS.",
    --icon = true,
    creature = 17770,
    display = 17228,
    coords = {0.706, 0.914, 1},
    loot = {{27631,N5},{24451,N5},{24413,N5},{27744,H5},{27743,H5},{24450,N5},{27747,H5},{24452,N5},{27748,H5},{30607,H5},{27745,H5},{27746,H5},{30608,H5},{30606,H5},},
    sections = {
      Spell(38739, {fbd = H5}), -- Acid Geyser
      Spell(34874), -- Despawn Underbog Mushrooms
      Spell(31673, {flag1 = MAGIC}), -- Foul Spores
    },
  },
  {
    name = "加兹安",
    desc = "加兹安是幽暗沼泽的第二个BOSS.",
    --icon = true,
    creature = 18105,
    display = 17528,
    --coords = {x, y, level},
    loot = {{24460,N5},{24461,N5},{24462,N5},{27761,H5},{27759,H5},{24459,N5},{27758,H5},{24458,N5},{27760,H5},{30608,H5},{27757,H5},{27755,H5},{30607,H5},{30606,H5},},
    sections = {
      Spell(34268), -- Acid Breath
      Spell(34290), -- Acid Spit
      Spell(15716), -- Enrage
      Spell(34267, {fbd = N5}), -- Tail Sweep
      Spell(38737, {fbd = H5}), -- Tail Sweep
    },
  },
  {
    name = "沼地领主穆塞雷克",
    desc = "一个带宝宝的德莱尼猎人,他带的宝宝其实是任务需要找的一个德鲁伊NPC,但是战斗刚开始的时候他是敌对的,将他打成空血的时候才会转变成友善的目标.",
    --icon = true,
    creature = 17826,
    display = 18570,
    --coords = {x, y, level},
    loot = {{24455,N5},{24454,N5},{24456,N5},{27763,H5},{27765,H5},{24457,N5},{27766,H5},{24453,N5},{27762,H5},{30608,H5},{27764,H5},{27767,H5},{30607,H5},{30606,H5},},
    sections = {
      Spell(31623), -- Aimed Shot
      Spell(34662), -- Bear Command
      Spell(31567), -- Deterrence
      Spell(31932, {flag1 = MAGIC}), -- Freezing Trap Effect
      Spell(31615, {flag1 = MAGIC}), -- Hunter's Mark
      Spell(18813), -- Knock Away
      Spell(34974), -- Multi-Shot
      Spell(31547), -- Notify of Death
      Spell(31566), -- Raptor Strike
      Spell(22907), -- Shoot
      Spell(31946), -- Throw Freezing Trap
    },
  },
  {
    name = "黑色阔步者",
    desc = "黑色阔步者是幽暗沼泽中的最终BOSS.",
    --icon = true,
    creature = 17882,
    display = 18194,
    coords = {0.252, 0.424, 1},
    loot = {{24464,N5},{24481,N5},{24465,N5},{27771,H5},{24463,N5},{30541,H5},{29265,H5},{27779,H5},{23572,H5},{27896,H5},{29350,H5},{27769,H5},{27773,H5},{24466,N5},{27770,H5},{32081,H5},{27772,H5},{27768,H5},{30607,H5},{27780,H5},{27938,H5},{27781,H5},{30608,H5},{27907,H5},{30606,H5},},
    sections = {
      Spell(31717), -- Chain Lightning
      Spell(31704), -- Levitate
      Spell(31715), -- Static Charge
    },
  },
})

table.insert(db, THE_UNDERBOG)
