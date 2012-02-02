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

local UTGARDE_KEEP = CreateInstance({
  name = "Utgarde Keep",
  desc = "Utgarde Keep is the first dungeon hub located on the shores of Lake Cauldros in the Howling Fjord of Northrend. Inhabited by the vrykul who are led by King Ymiron, a half-giant Viking-like race bent on proving their strength to the Lich King, they are raising the most worthy of their warriors to serve him beyond the grave here at their main base of operations. Utgarde Keep is the first 5 man entry level dungeon of Utgarde Keep.",
  texture = "UtgardeKeep",
  area = 523,
}, {
  {
    name = "Prince Keleseth",
    desc = "Prince Keleseth is the first boss of Utgarde Keep. He is the Scourge overlord of Howling Fjord and ambassador to the vrykul.",
    --icon = true,
    creature = 23953,
    display = 25338,
    coords = {0.287, 0.628, 1},
    loot = {{35570,N5},{35571,N5},{37178,H5},{35572,N5},{37179,H5},{37177,H5},{37180,H5},},
    sections = {
      Spell(43667, {so = true, desc = "Hurls a bolt of dark magic at an enemy, inflicintg 2975 to 4025 Shadow damage.", fbd = N5}), -- Shadow Bolt Normal
      Spell(59389, {so = true, desc = "Hurls a bolt of dark magic at an enemy, inflicting 5950 to 8050 Shadow damage.", fbd = H5}), -- Shadow Bolt Heroic
      Spell(48400, {so = true, desc = "Encases a random group member in ice for 20 seconds. Inflicts 400 damage every second.", flag1 = IMPORTANT, fbd = N5}), -- Frost Tomb Normal
      Spell(48400, {so = true, desc = "Encases a random group member in ice for 20 seconds. Inflicts 400 damage every second.\n\nIn Heroic mode, by not destroying the ice you will be granted the achievement On The Rocks.", flag1 = IMPORTANT, fbd = H5}), -- Frost Tomb Normal (but with a tip for Heroic achievement)
      Stage({
        so = true,
      	stype = CREATURE,
      	creature = 23970,
      	display = 27651,
      	name = "Vrykul Skeleton",
        desc = "Summons four skeletons, they resurrect after a short while.",
      	sections = {
      		Spell(42702, {desc = "Decrepifies the target, reducing Strength by 100 and slowing movement by 30% for 10 seconds.", flag1 = DISEASE, fbd = N5}), -- Decrepify Normal
      		Spell(59397, {desc = "Decrepifies the target, reducing Strength by 200 and slowing movement by 30% for 10 seconds.", flag1 = DISEASE, fbd = H5}), -- Decrepify Heroic
      		Spell(59386, {desc = "Encases Prince Keleseth in bone armor, absorbing 7400 to 8600 damage for 1 minute. While the armor holds, spellcasting cannot be interrupted by Physical attacks.", flag1 = DPS, fbd = H5}), -- Bone Armor Heroic
      	}
      }),
    },
  },
  {
    name = "Skarvald and Dalronn",
    desc = "Skarvald the Constructor is a Vrykul boss in the Utgarde Keep. It is likely he is the one building the tunnel to Gjalerbron. He is also accompanied by Dalronn the Controller, a necromancer. Both of them will fight at the same time when aggroed.",
    --icon = true,
    creature = 24200,
    display = 22194,
    coords = {0.582, 0.615, 2},
    loot = {{35574,N5},{35575,N5},{37181,H5},{35573,N5},{37182,H5},{37183,H5},{37184,H5},},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 24200,
        display = 22194,
        name = "Skarvald the Constructor",
        sections = {
          Spell(43651), -- Charge
          Spell(48583), -- Stone Strike
          Spell(48193, {flag1 = ENRAGE, fbd = H5}), -- Enrage
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 24201,
        display = 26349,
        name = "Dalronn the Controller",
        sections = {
          Spell(43650, {desc = "Debilitates the target, lowering melee attack, spell casting, movement, and ranged attack speeds by 50%. Deals 750 Shadow damage every 2 seconds for 8 seconds."}), -- Debilitate
          Spell(43649, {fbd = N5}), -- Shadow Bolt
          Spell(59575, {fbd = H5}), -- Shadow Bolt
          --Spell(52611, {fbd = H5}), -- Summon Skeletons
          Stage({
            stype = CREATURE,
            creature = 28878,
            display = 5231,
            name = "Skeletal Minion",
            desc = "Summons two skeletons with regular intervals, these only auto attack.",
            fbd = H5,
          }),
        },
      }),
    },
    adds = {
      {
        name = "Dalronn the Controller",
        creature = 24201,
        display = 26349,
      },
    },
  },
  {
    name = "Ingvar the Plunderer",
    desc = "Ingvar the Plunderer is the last boss in Utgarde Keep. He directs the attacks on Valgarde from the balcony over the waterfall in Daggercap Bay. Under the command of Ingvar the Plunderer, the dragon riders revel in slaughtering their enemies from above without warning. He's known among both ally and enemy forces for his brute strength. His axe is duller than one would think; when close up, he relies on his brute strength to cut down foes.",
    --icon = true,
    creature = 23954,
    display = 21953,
    coords = {0.724, 0.380, 3},
    loot = {{35578,N5},{35577,N5},{37188,H5},{35576,N5},{37190,H5},{37194,H5},{37191,H5},{43102,H5},{37192,H5},{37186,H5},{37189,H5},{37193,H5},{41793,H5},},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 23954,
        display = 21953,
        name = "Phase 1: Vrykul",
        sections = {
          Spell(42724), -- Cleave
          Spell(42669, {fbd = N5}), -- Smash
          Spell(59706, {fbd = H5}), -- Smash
          Spell(59708, {fbd = H5}), -- Staggering Roar
          Spell(42708, {fbd = N5}), -- Staggering Roar
          Spell(42705, {fbd = N5}), -- Enrage
          Spell(59707, {fbd = H5}), -- Enrage
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 23980,
        display = 26351,
        name = "Phase 2: Vargul",
        desc = "The Val'kyr, Annhylde the Caller, will bring Ingvar the Plunderer back to life as a Vargul.",
        sections = {
          Spell(42723), -- Dark Smash
          Spell(42729, {fbd = N5}), -- Dreadful Roar
          Spell(59734, {fbd = H5}), -- Dreadful Roar
          Spell(42730, {fbd = N5, flag1 = CURSE}), -- Woe Strike
          Spell(59735, {fbd = H5, flag1 = CURSE}), -- Woe Strike
          Spell(42751, {icon = "Interface\\Icons\\INV_Axe_17", desc = "Throws a Shadow Axe at a random target. The axe will arrive at that location and spin in place for 10 seconds, dealing 1750 to 2250 damage per second to all nearby enemies.", fbd = N5}, 1), -- Shadow Axe
          Spell(59720, {icon = "Interface\\Icons\\INV_Axe_17", desc = "Throws a Shadow Axe at a random target. The axe will arrive at that location and spin in place for 10 seconds, dealing 3500 to 4500 damage per second to all nearby enemies.", fbd = H5}, 1), -- Shadow Axe
        },
      }),
    },
  },
})

table.insert(db, UTGARDE_KEEP)
