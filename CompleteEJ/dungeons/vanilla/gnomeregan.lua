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

local GNOMEREGAN = CreateInstance({
  name = "Gnomeregan",
  desc = "Gnomeregan was the capital city of the gnome race until a trogg invasion led to its tragic downfall. In a desperate attempt to kill the troggs, their ruler, on the advice of advisor Mekgineer Thermaplugg, detonated a radiation bomb in its halls, but only succeeded in corrupting whatever gnomes that remained - and empowering the victorious troggs. A few loyal gnomes still left in the city fought desperately to keep the troggs at bay. Their ruler, thought by certain gnomes to have abandoned them, eventually sent a rescue force of adventurers on a recon mission.\n\nHorde players can gain access by using the teleport machine in the west parts of Grom'gol Base Camp in Stranglethorn.",
  texture = "Gnomeregan",
  area = 691,
  dflag = N5,
}, {
  {
    name = "Grubbis",
    desc = "Grubbis is trogg boss found in Gnomeregan. He is accompanied by his pet basilisk, Chomper. Grubbis and Chomper spawn near the end of Blastmaster Emi Shortfuse's event.",
    --icon = true,
    creature = 7361,
    display = 6533,
    coords = {0.775, 0.667, 1},
    loot = {9445,},
    sections = {
      Stage({
        so = true,
        name = "Waves",
        desc = "Before you face the boss, Emi Shortfuse will close the two tunnels so trogs stop flowing out from them. While she places her explosives, you must fight off the incoming trog attacks.",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 6207,
            display = 764,
            name = "Caverndeep Ambusher",
            desc = "Does not perform any special abilities.",
          }),
          Stage({
            stype = CREATURE,
            creature = 6206,
            display = 830,
            name = "Caverndeep Burrower",
            sections = {
              Spell(87081, {so = true}), -- Strike
            },
          }),
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7361,
        display = 6533,
        name = "Grubbis",
        desc = "He and his pet Chomper will emerge from the last tunnel, they both do not perform any special abilities.",
        sections = {
          Stage({
            so = true,
            stype = CREATURE,
            creature = 6215,
            display = 4906,
            name = "Chomper",
            desc = "Does not perform any special abilities.",
          }),
        },
      }),
    },
    adds = {
      {
        name = "Blastmaster Emi Shortfuse",
        creature = 7998,
        display = 7138,
      },
    },
  },
  {
    name = "Viscous Fallout",
    desc = "Due to the radiation released into Gnomeregan, a portion of the city was taken over by radioactive oozes. Viscous Fallout has coalesced from that mass, and formed its own consciousness, and its own agenda.",
    --icon = true,
    creature = 7079,
    display = 36529,
    coords = {0.757, 0.463, 2},
    loot = {9452,9453,9454,},
    sections = {
      Spell(21687, {so = true, desc = "Inflicts 37 to 43 Nature damage to enemies within 45 yards, and additional 5 Nature damage every 3 seconds for 15 seconds.", flag1 = POISON}), -- Toxic Volley
    },
  },
  {
    name = "Electrocutioner 6000",
    desc = "Electrocutioner 6000 is robotic spider tank found in Gnomeregan. This machine is driven by one of the insane gnomish lieutenants who still follow the leadership of Mekgineer Thermaplugg.",
    --icon = true,
    creature = 6235,
    display = 36558,
    coords = {0.242, 0.680, 2},
    loot = {9447,9446,9448,},
    sections = {
      Spell(11082, {so = true, flag1 = TANK}), -- Megavolt
      Spell(11085, {so = true}), -- Chain Bolt
      Spell(11084, {so = true}), -- Shock
    },
  },
  {
    name = "Crowd Pummeler 9-60",
    desc = "Crowd Pummeler 9-60 is a Gnomish mech found in Gnomeregan, in the south side of the upper level of the Engineering Labs.",
    --icon = true,
    creature = 6229,
    display = 36560,
    coords = {0.431, 0.879, 3},
    loot = {9449,9450,},
    sections = {
      Spell(8374, {so = true, flag1 = TANK}), -- Arcing Smash
      Spell(10887, {so = true, desc = "Pummels enemies within 10 yards for normal damage plus 10 and interrupts and spell being cast for 4 seconds.", flag1 = IMPORTANT}), -- Crowd Pummel
      Spell(5568, {so = true, desc = "Inflicts normal damage plus 8 to enemies within 10 yards."}), -- Trample
    },
  },
  {
    name = "Dark Iron Ambassador (Rare)",
    desc = "The ambassador was the envoy between the Gnomish traitor Sicco Thermaplugg and the foul Dark Iron Clan, led by the Emperor Dagran Thaurissan. He can sometimes be found walking around the north side of the tunnel, right before Mekgineer Thermaplugg.",
    --icon = true,
    creature = 6228,
    display = 6669,
    coords = {0.353, 0.638, 4},
    loot = {9456,9455,9457,},
    sections = {
      Stage({ --Spell(10870), -- Summon Burning Servant
        so = true,
        stype = CREATURE,
        creature = 7738,
        display = 2172,
        name = "Burning Servant",
        desc = "Summoned by the Ambassador to assist him for 4 minutes.\n\nIt's important to take note that the Burning Servant will summon Embers to assist him, periodically summoning three at a time.",
        flag1 = IMPORTANT,
        sections = {
          Stage({ --Spell(10869), -- Summon Embers
            stype = CREATURE,
            creature = 7266,
            display = 6537,
            name = "Ember",
            desc = "Does not perform any special abilities.",
          }),
        },
      }),
      Spell(184, {so = true, desc = "A shield of flame that inflicts 15 Fire damage to nearby enemies each 3 seconds."}), -- Fire Shield
      Spell(9053, {so = true, desc = "Inflicts 49 to 58 Fire damage to an enemy."}), -- Fireball
    },
  },
  {
    name = "Mekgineer Thermaplugg",
    desc = "Sicco Thermaplugg was once a proud and ambitious gnomish engineer who sought to make Gnomeregan a great and powerful nation. His greedy desire for power combined with a lust for revenge against those he felt had cheated him from his rightful place in gnomish society turned him into the greatest traitor of Gnomeregan.",
    --icon = true,
    creature = 7800,
    display = 36563,
    coords = {0.312, 0.296, 4},
    loot = {9458,9461,9459,9492,},
    sections = {
      Stage({
        so = true,
        name = "Open Hatch",
        desc = "Opens a hatch on one of his seven bomb dispensers. This happens periodically and if the fight is too long, you may be overwhelmed with bombs. Luckily these can be closed with a big red button on the side. Each bomb dispenser will spawn forth a Walking Bomb that will walk toward the center of the room.",
        flag1 = IMPORTANT,
        sections = {
          Stage({
            stype = CREATURE,
            creature = 7915,
            display = 6977,
            name = "Walking Bomb",
            desc = "If they reach the center of the room, or attack a player in melee for too long, they explode and inflict area wide damage. If killed at a distance they will not explode.",
            sections = {
              Spell(11504, {so = true, name = "Explosion", desc = "Detonates causing 200 to 300 damage to all enemies within 10 yards.", flag1 = IMPORTANT}, 1), -- Walking Bomb Effect
            },
          }),
        },
      }),
      Spell(74720, {so = true}), -- Pound
      Spell(93655, {so = true}), -- Steam Blast
      Spell(52778, {so = true, desc = "Inflicts 180 Nature damage to an enemy over 5 seconds."}), -- Welding Beam
    },
  },
})

table.insert(db, GNOMEREGAN)
