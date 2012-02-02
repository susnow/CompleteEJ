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

local SUNWELL_PLATEAU = CreateInstance({
  name = "Sunwell Plateau",
  desc = "Sunwell Plateau is a 25-man raid instance located on the Isle of Quel'Danas which was implemented with Patch 2.4. The instance is intended to be the most difficult in the game until Wrath of the Lich King, and caters to Black Temple/Hyjal geared raiders. The instance bosses drop tokens redeemable for new pieces added to the Tier 6 Armor Sets and loot better than that from Black Temple. This raid dungeon requires no attunement.",
  --texture = "SunwellPlateau",
  area = 789,
}, {
  {
    name = "Kalecgos",
    desc = "Kalecgos, one of the few surviving blue dragons, is the first boss in the Sunwell Plateau. He is being corrupted by Sathrovarr the Corruptor, a servant of Kil'jaeden.",
    --icon = true,
    creature = 24850,
    display = 23345,
    coords = {0.316, 0.506, 1},
    loot = {},
    sections = {
      Spell(45018, {fbd = N10}), -- Arcane Buffet
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(44806, {fbd = N10}), -- Crazed Rage
      Spell(44799, {fbd = N10, flag1 = MAGIC}), -- Frost Breath
      Spell(45122, {fbd = N10}), -- Tail Lash
      Spell(45002, {fbd = N10}), -- Wild Magic
      Spell(44978, {fbd = N10}), -- Wild Magic
      Spell(45006, {fbd = N10}), -- Wild Magic
      Spell(45001, {fbd = N10}), -- Wild Magic
      Spell(45004, {fbd = N10}), -- Wild Magic
      Spell(45010, {fbd = N10}), -- Wild Magic
    },
  },
  {
    name = "Sathrovarr the Corruptor",
    desc = "Sathrovarr the Corruptor is a dreadlord tasked by Kil'jaeden with the corruption of the blue dragon Kalecgos. He is part of the first boss encounter of the Sunwell Plateau. Players encounter him in the inner veil, a shadowy spectral realm where they will find Kalecgos' humanoid form battling the demon to stave off the corruption.",
    --icon = true,
    creature = 24892,
    display = 26628,
    --coords = {x, y, level},
    loot = {},
    sections = {
      Spell(45029, {fbd = N10}), -- Corrupting Strike
      Spell(44806, {fbd = N10}), -- Crazed Rage
      Spell(45032, {fbd = N10, flag1 = CURSE}), -- Curse of Boundless Agony
      Spell(45031, {fbd = N10}), -- Shadow Bolt Volley
    },
  },
  {
    name = "Brutallus",
    desc = "Brutallus is a pit lord and the second boss of the Sunwell Plateau. He can also be seen from outside the instance, where he is engaging the blue dragon Madrigosa. He succeeds in slaying the dragon and turns her into Felmyst.",
    --icon = true,
    creature = 24882,
    display = 22711,
    coords = {0.642, 0.868, 1},
    loot = {34854,34176,34855,34179,34180,32228,},
    sections = {
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(45141, {fbd = N10}), -- Burn
      Spell(45150, {fbd = N10}), -- Meteor Slash
      Spell(45185, {fbd = N10}), -- Stomp
    },
  },
  {
    name = "Felmyst",
    desc = "Felmyst is a fel dragon who is raised from from the corpse of the blue dragon Madrigosa. She is the third boss in the Sunwell Plateau, and can only be fought once Brutallus has been defeated.",
    --icon = true,
    creature = 25038,
    display = 22838,
    coords = {0.618, 0.900, 1},
    loot = {34186,34856,34857,34664,34352,},
    sections = {
      Spell(19983, {fbd = N10}), -- Cleave
      Spell(45866, {fbd = N10}), -- Corrosion
      Spell(45717, {fbd = N10}), -- Fog of Corruption
      Spell(45855, {fbd = N10, flag1 = MAGIC}), -- Gas Nova
      Spell(47002, {fbd = N10}), -- Noxious Fumes
    },
  },
  {
    name = "Grand Warlock Alythess",
    desc = "Grand Warlock Alythess, a man'ari eredar, is the fire based demon eredar twin located in Sunwell Plateau.",
    --icon = true,
    creature = 25166,
    display = 23334,
    coords = {0.650, 0.330, 1},
    loot = {34857,34198,35290,34664,34193,34852,34196,32228,34209,34192,34195,34854,34199,34858,34194,34855,34203,32230,},
    sections = {
      Spell(45235, {fbd = N10}), -- Blaze
      Spell(45342, {fbd = N10}), -- Conflagration
      Spell(45333, {fbd = N10}), -- Conflagration
      Spell(45366, {fbd = N10}), -- Empower
      Spell(45232, {fbd = N10}), -- Fireblast
      Spell(46771, {fbd = N10}), -- Flame Sear
      Spell(45230, {fbd = N10, flag1 = MAGIC}), -- Pyrogenics
      Spell(45329, {fbd = N10}), -- Shadow Nova
    },
  },
  {
    name = "Lady Sacrolash",
    desc = "Lady Sacrolash, a man'ari eredar, is the shadow based demon eredar twin located in Sunwell Plateau.",
    --icon = true,
    creature = 25165,
    display = 23177,
    coords = {0.644, 0.322, 1},
    loot = {34855,34198,35292,34664,34189,34857,34197,32249,34208,34204,34192,34858,34205,34856,34209,34853,34193,32228,},
    sections = {
      Spell(45342, {fbd = N10}), -- Conflagration
      Spell(45256, {fbd = N10}), -- Confounding Blow
      Spell(45366, {fbd = N10}), -- Empower
      Spell(45232, {fbd = N10}), -- Fireblast
      Spell(45248, {fbd = N10}), -- Shadow Blades
      Spell(45329, {fbd = N10}), -- Shadow Nova
      Spell(45332, {fbd = N10}), -- Shadow Nova
    },
  },
  {
    name = "M'uru",
    desc = "M'uru is a fallen naaru and former guardian of Tempest Keep. After his defeat in Tempest Keep, Kael'thas and his felblood minions captured M'uru from Silvermoon and took him to the Sunwell Plateau, presumably to drain his power and aid in the summoning of Kil'jaeden. As such, he is now the fifth boss of the instance.",
    --icon = true,
    creature = 25741,
    display = 23404,
    --coords = {x, y, level},
    loot = {},
    sections = {
      Spell(45996, {fbd = N10}), -- Darkness
      Spell(46177, {fbd = N10}), -- Open All Portals
    },
  },
  {
    name = "Kil'jaeden",
    desc = "Kil'jaeden the Deceiver is a powerful eredar demon lord and is the acting leader of the Burning Legion. He is the sixth and final boss of the instance where [layers face off against this twisted avatar of Kil'jaeden, which is still being summoned into Azeroth through the Sunwell itself by his new lieutenant, Kael'thas Sunstrider. Anveena, the embodiment of the Sunwell's energies, is held in an arcane barrier, her powers being drained to feed the portal.",
    --icon = true,
    creature = 25315,
    display = 23200,
    --coords = {x, y, level},
    loot = {34664,34247,34340,34329,34336,32231,34332,34337,34345,34242,34243,32228,34333,32249,},
    sections = {
      Spell(46605, {fbd = N10}), -- Darkness of a Thousand Souls
      Spell(46707, {fbd = N10}), -- Destroy All Drakes
      Spell(45641, {fbd = N10}), -- Fire Bloom
      Spell(45737, {fbd = N10}), -- Flame Dart
      Spell(45741, {fbd = N10}), -- Flame Dart
      Spell(45740, {fbd = N10}), -- Flame Dart
      Spell(45664, {fbd = N10}), -- Legion Lightning
      Spell(46680, {fbd = N10}), -- Shadow Spike
      Spell(46589, {fbd = N10}), -- Shadow Spike
      Spell(45892, {fbd = N10}), -- Sinister Reflection
      Spell(45442, {fbd = N10}), -- Soul Flay
    },
  },
})

table.insert(db, SUNWELL_PLATEAU)
