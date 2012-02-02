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
  name = "The Underbog",
  desc = "The Underbog is the second 5-man wing of the Coilfang Reservoir. The only Naga presence in this section defends the structure they built to house their hydra god, Ghaz'an. Killing mobs and bosses grant Cenarion Expedition reputation, capped to Honored in normal mode.",
  --texture = "TheUnderbog",
  area = 726,
}, {
  {
    name = "Hungarfen",
    desc = "Hungarfen is a large fungal giant and the first boss of The Underbog.",
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
    name = "Ghaz'an",
    desc = "Ghaz'an the Hydra is the second boss of The Underbog.",
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
    name = "Swamplord Musel'ek",
    desc = "Swamplord Musel'ek is a Broken hunter, ruler of the Murkblood, and the third boss of The Underbog. He is accompanied by his pet, Claw.",
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
    name = "The Black Stalker",
    desc = "The Black Stalker is the final boss of The Underbog.",
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
