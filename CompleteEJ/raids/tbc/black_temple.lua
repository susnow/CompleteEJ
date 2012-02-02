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

local BLACK_TEMPLE = CreateInstance({
  name = "Black Temple",
  desc = "The Black Temple is the fortress-citadel of Illidan Stormrage, Lord of Outland. It contains tier 6 set pieces as well as many notable items, including . It's also known for providing reputation for , easily earned through clearing the raid a few times.",
  --texture = "BlackTemple",
  area = 796,
}, {
  {
    name = "High Warlord Naj'entus",
    desc = "High Warlord Naj'entus is the first boss of Black Temple.",
    --icon = true,
    creature = 22887,
    display = 21174,
    --coords = {x, y, level},
    loot = {32744,32377,32234,32238,32754,32247,32242,32240,32750,32243,32747,},
    sections = {
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(39837, {fbd = N10}), -- Impaling Spine
      Spell(39878, {fbd = N10}), -- Tidal Burst
      Spell(39872, {fbd = N10}), -- Tidal Shield
    },
  },
  {
    name = "Supremus",
    desc = "Supremus, an abyssal, is the second boss in Black Temple.",
    --icon = true,
    creature = 22898,
    display = 21145,
    coords = {0.640, 0.474, 1},
    loot = {32259,32260,32251,32750,32257,32255,32253,32744,32262,32749,},
    sections = {
      Spell(41581, {fbd = N10}), -- Charge
      Spell(20477, {fbd = N10}), -- Summon Player
      Spell(40276, {fbd = N10}), -- Volcanic Eruption
    },
  },
  {
    name = "Shade of Akama",
    desc = "Shade of Akama is the dark soul of Akama that binds him to Illidan Stormrage's service. This is the third boss in the Black Temple.",
    --icon = true,
    creature = 22841,
    display = 21357,
    coords = {0.406, 0.800, 2},
    loot = {32754,32266,32264,32263,32737,32268,32279,32270,32753,32361,32744,},
    sections = {
    },
  },
  {
    name = "Teron Gorefiend",
    desc = "Teron Gorefiend, formally the leader of the death knights, is the fourth boss in Black Temple. The encounter features an extremely unique mechanic where players die and then become ghosts--however, with level 85 DPS, you are unlikely to reach this point.",
    --icon = true,
    creature = 22871,
    display = 21254,
    coords = {0.392, 0.136, 4},
    loot = {32750,32512,32329,32747,32510,32330,32280,32737,32323,32749,},
    sections = {
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(40243, {fbd = N10}), -- Crushing Shadows
      Spell(44659, {fbd = N10}), -- Destroy All Spirits
      Spell(41626, {fbd = N10}), -- Destroy Spirit
      Spell(40239, {fbd = N10, flag1 = MAGIC}), -- Incinerate
      Spell(40251, {fbd = N10}), -- Shadow of Death
    },
  },
  {
    name = "Gurtogg Bloodboil",
    desc = "Gurtogg Bloodboil, a mutated fel orc, is the fifth boss in Black Temple.",
    --icon = true,
    creature = 22948,
    display = 21443,
    coords = {0.534, 0.474, 3},
    loot = {32342,32501,32334,32738,32337,32338,32341,32750,32333,32749,},
    sections = {
      Spell(40481, {fbd = N10}), -- Acidic Wound
      Spell(40599, {fbd = N10}), -- Arcing Smash
      Spell(40457, {fbd = N10}), -- Arcing Smash
      Spell(40491, {fbd = N10}), -- Bewildering Strike
      Spell(42005, {fbd = N10}), -- Bloodboil
      Spell(40602, {fbd = N10}), -- Charge
      Spell(40486, {fbd = N10}), -- Eject
      Spell(40597, {fbd = N10}), -- Eject
      Spell(40594, {fbd = N10}), -- Fel Rage
      Spell(40604, {fbd = N10}), -- Fel Rage
      Spell(40595, {fbd = N10}), -- Fel-Acid Breath
      Spell(40508, {fbd = N10}), -- Fel-Acid Breath
      Spell(40601, {fbd = N10}), -- Fury
      Spell(40618, {fbd = N10}), -- Insignificance
    },
  },
  {
    name = "Essence of Suffering",
    desc = "Reliquary of the Lost Essence of Suffering Essence of Desire Essence of Anger Essence of Suffering is the first part of the Reliquary of the Lost encounter in Black Temple.",
    --icon = true,
    creature = 23418,
    display = 21483,
    coords = {0.702, 0.850, 3},
    loot = {},
    sections = {
      Spell(41292, {fbd = N10}), -- Aura of Suffering
      Spell(42017, {fbd = N10}), -- Aura of Suffering
      Spell(41294, {fbd = N10}), -- Fixate
      Spell(41305, {fbd = N10}), -- Frenzy
      Spell(41303, {fbd = N10, flag1 = MAGIC}), -- Soul Drain
    },
  },
  {
    name = "Mother Shahraz",
    desc = "Mother Shahraz, a Shivarra demon, is the seventh boss in Black Temple.",
    --icon = true,
    creature = 22947,
    display = 21252,
    coords = {0.650, 0.368, 5},
    loot = {32750,32370,31101,31103,32366,32753,32365,32747,},
    sections = {
      Spell(41001, {fbd = N10}), -- Fatal Attraction
      Spell(40823, {fbd = N10}), -- Silencing Shriek
      Spell(40827, {fbd = N10}), -- Sinful Beam
      Spell(40859, {fbd = N10}), -- Sinister Beam
      Spell(40860, {fbd = N10}), -- Vile Beam
      Spell(40861, {fbd = N10}), -- Wicked Beam
    },
  },
  {
    name = "The Illidari Council",
    desc = "The Illidari Council Gathios the Shatterer High Nethermancer Zerevor Lady Malande Veras Darkshadow  The Illidari Council is a group of four blood elves located within the Black Temple who serve as adviser to Illidan Stormrage and are the last bosses fought before encountering the Betrayer himself.",
    --icon = true,
    creature = 23426,
    display = Array,
    --coords = {x, y, level},
    loot = {},
    sections = {
      Spell(41499, {fbd = N10}), -- Empyreal Balance
    },
  },
  {
    name = "Illidan Stormrage",
    desc = "Illidan Stormrage is the current Lord of Outland and serves as the final boss of Black Temple; he is the twin brother of Malfurion Stormrage. He is often referred to as the betrayer due to his acts against his own kind, for which he suffered imprisonment. He drops two legendaries: Warglaive of Azzinoth and Warglaive of Azzinoth.",
    --icon = true,
    creature = 22917,
    display = 21135,
    coords = {0.540, 0.576, 7},
    loot = {32235,32754,31089,32837,32521,31091,32524,32375,32374,32753,32500,32749,},
    sections = {
      Spell(40932, {fbd = N10}), -- Agonizing Flames
      Spell(41142, {fbd = N10}), -- Aura of Dread
      Spell(40585, {fbd = N10}), -- Dark Barrage
      Spell(40904, {fbd = N10}), -- Draw Soul
      Spell(40598, {fbd = N10}), -- Fireball
      Spell(41126, {fbd = N10}), -- Flame Burst
      Spell(40832, {fbd = N10}), -- Flame Crash
      Spell(40683, {fbd = N10}), -- Frenzy
      Spell(41917, {fbd = N10}), -- Parasitic Shadowfiend
      Spell(41078, {fbd = N10}), -- Shadow Blast
      Spell(40647, {fbd = N10}), -- Shadow Prison
      Spell(41117, {fbd = N10}), -- Summon Shadow Demons
      Spell(39849, {fbd = N10}), -- Throw Glaive
      Spell(39635, {fbd = N10}), -- Throw Glaive
    },
  },
})

table.insert(db, BLACK_TEMPLE)
