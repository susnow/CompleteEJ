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

local DRAKTHARON_KEEP = CreateInstance({
  name = "达克萨隆要塞",
  desc = "达克萨隆要塞 Keep is located in the northwestern part of the Grizzly Hills and is an ancient ice troll stronghold. The Scourge drove the trolls out and took possession. The strange dungeon is filled with dinosaurs and lizards as well as teeming with undead. Players are sent in to learn the secrets behind Drakuru.",
  --texture = "DrakTharonKeep",
  area = 534,
}, {
  {
    name = "托尔戈",
    desc = "托尔戈, a dire troll, is the first boss of Drak'Tharon Keep. He is linked to Consumption Junction.",
    --icon = true,
    creature = 26630,
    display = 26352,
    coords = {0.568, 0.220, 1},
    loot = {{35619,N5},{35620,N5},{37717,H5},{35618,N5},{37714,H5},{37715,H5},{37712,H5},},
    sections = {
      Spell(59803, {fbd = H5}), -- Consume
      Spell(49380, {fbd = N5}), -- Consume
      Spell(59807, {fbd = H5}), -- Corpse Explode
      Spell(49555, {fbd = N5}), -- Corpse Explode
      Spell(49639), -- Crush
      Spell(49637, {flag1 = DISEASE}), -- Infected Wound
    },
  },
  {
    name = "召唤者诺沃斯",
    desc = "召唤者诺沃斯, a lich, is the second boss of Drak'Tharon Keep. It is tied to Oh Novos!.",
    --icon = true,
    creature = 26631,
    display = 26292,
    coords = {0.710, 0.476, 1},
    loot = {{35631,N5},{35632,N5},{40490,H5},{35630,N5},{37722,H5},{37721,H5},{37718,H5},},
    sections = {
      Spell(49198, {fbd = N5}), -- Arcane Blast
      Spell(59909, {fbd = H5}), -- Arcane Blast
      Spell(47346), -- Arcane Field
      Spell(49034, {fbd = N5}), -- Blizzard
      Spell(59854, {fbd = H5}), -- Blizzard
      Spell(59855, {fbd = H5, flag1 = MAGIC}), -- Frostbolt
      Spell(49037, {fbd = N5, flag1 = MAGIC}), -- Frostbolt
      Spell(59910, {fbd = H5}), -- Summon Minions
      Spell(50089, {fbd = N5, flag1 = CURSE}), -- Wrath of Misery
      Spell(59856, {fbd = H5, flag1 = CURSE}), -- Wrath of Misery
    },
  },
  {
    name = "暴龙之王爵德",
    desc = "暴龙之王爵德, a large raptor, is an optional boss of Drak'Tharon Keep. It is tied to Better Off Dred and he can also be tamed.",
    --icon = true,
    creature = 27483,
    display = 5240,
    coords = {0.670, 0.816, 1},
    loot = {{35635,N5},{35633,N5},{37723,H5},{35634,N5},{37725,H5},{37724,H5},{37726,H5},},
    sections = {
      Spell(22686), -- Bellowing Roar
      Spell(48849, {fbd = N5}), -- Fearsome Roar
      Spell(59422, {fbd = H5}), -- Fearsome Roar
      Spell(48920), -- Grievous Bite
      Spell(48873), -- Mangling Slash
      Spell(48878), -- Piercing Slash
      Spell(59416, {fbd = H5}), -- Raptor Call
    },
  },
  {
    name = "先知萨隆亚",
    desc = "先知萨隆亚, a skeletal wind serpent, is the last boss of Drak'Tharon Keep.",
    --icon = true,
    creature = 26632,
    display = 27072,
    --coords = {x, y, level},
    loot = {{35637,N5},{35636,N5},{37784,H5},{35638,N5},{37732,H5},{43102,H5},{37734,H5},{37735,H5},{37733,H5},{37798,H5},{37788,H5},{37791,H5},},
    sections = {
      Spell(59972, {fbd = H5, flag1 = CURSE}), -- Curse of Life
      Spell(49527, {fbd = N5, flag1 = CURSE}), -- Curse of Life
      Spell(49356), -- Decay Flesh
      Spell(49544, {fbd = N5}), -- Eye Beam
      Spell(59965, {fbd = H5}), -- Eye Beam
      Spell(49537, {fbd = N5}), -- Lightning Breath
      Spell(59963, {fbd = H5}), -- Lightning Breath
      Spell(49548, {fbd = N5}), -- Poison Cloud
      Spell(59969, {fbd = H5}), -- Poison Cloud
      Spell(49518, {fbd = N5}), -- Rain of Fire
      Spell(59971, {fbd = H5}), -- Rain of Fire
      Spell(53463), -- Return Flesh
      Spell(59973, {fbd = H5}), -- Shadow Volley
      Spell(49528, {fbd = N5}), -- Shadow Volley
    },
  },
  {
    name = "达库鲁",
    --desc = "",
    --icon = true,
    creature = 28016,
    display = 27136,
    --coords = {x, y, level},
    loot = {},
    sections = {
    },
  },
})

table.insert(db, DRAKTHARON_KEEP)
