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

local ULDAMAN = CreateInstance({
  name = "Uldaman",
  desc = "Uldaman is an ancient Titan vault that has laid buried deep within the earth since the world's creation. Dwarven excavations have recently penetrated this forgotten city, releasing the Titans' first failed creations: the Troggs. Legends say that the Titans created troggs from stone. When they deemed the experiment a failure, the Titans locked the troggs away and tried again - resulting in the creation of the dwarven race. The secrets of the dwarves' creation are recorded on the fabled Discs of Norgannon - massive Titan artifacts that lie at the very bottom of the ancient city. Recently, the Dark Iron dwarves have launched a series of incursions into Uldaman, hoping to claim the discs for their fiery master, Ragnaros. However, protecting the buried city are several guardians - giant constructs of living stone that crush any hapless intruders they find. The Discs themselves are guarded by a massive, sapient Stonekeeper called Archaedas. Some rumors even suggest that the dwarves' stone-skinned ancestors, the earthen, still dwell deep within the city's hidden recesses.",
  texture = "Uldaman",
  area = 692,
  dflag = N5,
}, {
  {
    name = "The Lost Dwarves",
    desc = "Baelog, Eric \"The Swift\" and Olaf are friendly to the Alliance, but can be defeated by the Horde.",
    --icon = true,
    creature = 6906,
    display = 5710,
    coords = {0.587, 0.923, 1},
    loot = {9400,9401,7453,9398,9394,9403,9404},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 6906,
        display = 5710,
        name = "Baelog",
        sections = {
          Spell(15620, {desc = "Shoots at an enemy, inflicting 49 to 58 Physical damage."}), -- Shoot
          Spell(14516, {desc = "Strikes at an enemy, inflicting 10% bonus damage."}), -- Strike
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 6907,
        display = 5708,
        name = "Eric \"The Swift\"",
        sections = {
          Spell(6268, {desc = "Eric charges the target and inflicts 30% additional damage on his next attack."}), -- Rushing Charge
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 6908,
        display = 5709,
        name = "Olaf",
        sections = {
          Spell(8242, {desc = "Inflicts 20 Physical damage to an enemy, stunning it for 2 seconds."}), -- Shield Slam
        },
      }),
    },
  },
  {
    name = "Revelosh",
    desc = "Revelosh is the first trogg boss found in Uldaman.",
    --icon = true,
    creature = 6910,
    display = 5945,
    coords = {0.532, 0.727, 1},
    loot = {9389,9390,9387,9388,},
    sections = {
      Spell(16006, {so = true, desc = "Strikes an enemy with a lightning bolt that arcs to another nearby enemy. The spell affects up to 3 targets, causing 99 to 116 Nature damage to each."}), -- Chain Lightning
      Spell(15801, {so = true, desc = "Blasts an enemy with lightning, inflicting 99 to 116 Nature damage."}), -- Lightning Bolt
    },
  },
  {
    name = "Ironaya",
    desc = "Ironaya tries to guard the secrets of Uldaman from curious adventurers.",
    --icon = true,
    creature = 7228,
    display = 6089,
    coords = {0.370, 0.740, 1},
    loot = {9409,9408,9407,},
    sections = {
      Spell(8374, {so = true, flag1 = TANK}), -- Arcing Smash
      Spell(10101, {so = true}), -- Knock Away
      Spell(11876, {so = true}), -- War Stomp
    },
  },
  {
    name = "Obsidian Sentinel",
    desc = "The Titans built the Stone keeper Obsidian Sentinel to help protect Uldaman from would-be invaders and to oversee daily operations while Ironaya and Archaedas slumber. Aoren Sunglow and Kand Sandseeker suspects that one of the Old Gods corrupted this keeper. Another keeper not yet corrupted is the Ancient Stone Keeper in the Temple Hall.",
    --icon = true,
    creature = 7023,
    display = 5285,
    coords = {0.290, 0.602, 1},
    loot = {62053,},
    sections = {
      Spell(9941, {so = true, desc = "Raises a shield of magic, each spell cast has a 20% chance to be reflected back to the original caster.", flag1 = DPS}), -- Obsidian Reflection
      Spell(10061, {so = true, desc = "At he shatters, his smaller shards come to life and fight with the sentinel."}), -- Summon Obsidian Shard
      Spell(10072, {so = true, desc = "Each time he splits into shards, he applies one application of this buff, each increasing his damage dealt by 60. Stacks up to 4 times."}), -- Splintered Obsidian
      Stage({
        stype = CREATURE,
        creature = 7209,
        display = 3731,
        name = "Obsidian Shard",
        sections = {
          Spell(9941, {so = true, desc = "Raises a shield of magic, each spell cast has a 20% chance to be reflected back to the original caster.", flag1 = DPS}), -- Obsidian Reflection
        },
      }),
    },
  },
  {
    name = "Ancient Stone Keeper",
    desc = "The Titans built the Ancient Stone Keeper to help protect Uldaman from would-be invaders and to oversee daily operations while Ironaya and Archaedas slumber. Another keeper yet corrupted is the Obsidian Sentinel in the Echomok Cavern.",
    --icon = true,
    creature = 7206,
    display = 10798,
    coords = {0.474, 0.442, 1},
    loot = {9410,9411,62055,},
    sections = {
      Spell(10094, {so = true, desc = "Summons sand storms on the battlefield, reducing the movement speed and causing damage from harsh winds to enemies that get caught in them."}), -- Sand Storms (spawns at ranged enemies, 10132 spawns at melee specifically)
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7226,
        display = 31882, -- not the same NPC but borrowing from 42639
        name = "Sand Storm",
        sections = {
          Spell(10092, {so = true, desc = "Causes 9 to 10 Physical damage and slows movement speed by 50% each second to all enemies within 5 yards of the eye of the storm."}), -- Sand Storm (triggers 10093)
        },
      }),
    },
  },
  {
    name = "Galgann Firehammer",
    desc = "Assisted by his shadowforge minions.",
    --icon = true,
    creature = 7291,
    display = 6059,
    coords = {0.267, 0.327, 1},
    loot = {9412,9419,11310,11311,},
    sections = {
      Spell(9482, {so = true, flag1 = MAGIC}), -- Amplify Flames
      Spell(3356, {so = true, desc = "Burns an enemy, dealing 24 to 29 Fire damage and reducing their Fire resistance by 10 for each application for 20 seconds. Stacks maximum 3 times.", flag1 = MAGIC}), -- Flame Lash
      Spell(11969, {so = true, desc = "Inflicts 33 to 38 Fire damage to enemies within 10 yards."}), -- Fire Nova
      Stage({
        stype = CREATURE,
        creature = 4849,
        display = 6067,
        name = "Shadowforge Archaeologist",
        sections = {
          Spell(6713, {so = true}), -- Disarm
          Spell(11972, {so = true}), -- Shield Bash
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 7030,
        display = 6056,
        name = "Shadowforge Geologist",
        sections = {
          Spell(3356, {so = true, desc = "Burns an enemy, dealing 24 to 29 Fire damage and reducing their Fire resistance by 10 for each application for 20 seconds. Stacks maximum 3 times.", flag1 = MAGIC}), -- Flame Lash
          Spell(8814, {so = true, desc = "Calls down a pillar of flame, burning all enemies in the selected area for 93 to 107 Fire damage and additional 50 Fire damage every 3 seconds for 9 seconds."}), -- Flame Spike
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 4848,
        display = 6055,
        name = "Shadowforge Darkcaster",
        sections = {
          Spell(11981, {so = true, desc = "Hits an enemy with an anti-mana bolt. Burns 46 to 53 mana and damages them for the same amount of mana drained."}), -- Mana Burn
          Spell(9081, {so = true, desc = "Hurls missiles of dark magic, inflicting 49 to 58 Shadow damage to enemies within 30 yards."}), -- Shadow Bolt Volley
        },
      }),
    },
  },
  {
    name = "Grimlok",
    desc = "Accompanied by his pet Jadespine Basilisk and his two companions.",
    --icon = true,
    creature = 4854,
    display = 11165,
    coords = {0.221, 0.262, 1},
    loot = {9415,9414,9416,},
    sections = {
      Spell(12167, {so = true, desc = "Blasts an enemy with lightning, inflicting 74 to 87 Nature damage."}), -- Lightning Bolt
      Spell(8292, {so = true}), -- Chain Bolt
      Spell(11892, {so = true, flag1 = CURSE}), -- Shrink
      Spell(6742, {so = true, flag1 = MAGIC}), -- Bloodlust
      Stage({
        stype = CREATURE,
        creature = 4863,
        display = 4486,
        name = "Jadespine Basilisk",
        sections = {
          Spell(3636, {so = true, desc = "Deals 15 Arcane damage and stuns an enemy, rendering it unable to move or attack for 3 seconds.", flag1 = MAGIC}), -- Crystalline Slumber
          Spell(9906, {so = true, flag1 = DPS}), -- Reflection
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 4855,
        display = 11166,
        name = "Stonevault Brawler",
        sections = {
          Spell(8599, {so = true, desc = "Enrages and increases physical damage done by 10% and attack speed by 30% for 2 minutes.", flag1 = ENRAGE}), -- Enrage
          Spell(3391, {so = true}), -- Thrash
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 4853,
        display = 1194,
        name = "Stonevault Geomancer",
        sections = {
          Spell(14034, {so = true, desc = "Inflicts 74 to 87 Fire damage to an enemy."}), -- Fireball
          Spell(10452, {so = true, desc = "Inflicts 19 to 21 Fire damage to an enemy and increases the Fire damage it takes by 20 for 15 seconds. Stacks maximum 5 times."}), -- Flame Buffet
        },
      }),
    },
  },
  {
    name = "Archaedas",
    desc = "Archaedas is one of the ancient servants of the titans, a giant of stone crafted to guard the vault of Uldaman. To ensure he would always be vigilant, his creators sealed him in a stone shell that keeps him magically preserved in a timeless sleep. Any attempt to activate the keystone that opens the vault awakens him immediately.",
    --icon = true,
    creature = 2748,
    display = 5988,
    coords = {0.552, 0.505, 2},
    loot = {11118,9418,9413,},
    sections = {
      Spell(6524, {so = true, desc = "Stuns enemies within 20 yards, rendering them unable to move or attack for 2 seconds."}), -- Ground Tremor
      Stage({
        name = "Phase 1",
        sections = {
          Spell(10252, {so = true, name = "Awaken an Earthen Guardian", desc = "Randomly awakes one of the many Earthen Guardian statues of the outer circle."}, 1), -- Awaken Earthen Guardians
        },
      }),
      Stage({
        name = "Phase 2: At 66% health",
        sections = {
          Spell(10252, {so = true, name = "Awaken six Earthen Guardians", desc = "Randomly awakes six of the many Earthen Guardian statues of the outer circle."}, 1), -- Awaken Earthen Guardians
        },
      }),
      Stage({
        name = "Phase 3: At 33% health",
        sections = {
          Spell(10258, {so = true, name = "Awaken two Vault Warders", desc = "Randomly awakes two of the Vault Warders from the inner circle."}, 1), -- Awaken Vault Warder
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 7076,
        display = 6026,
        name = "Earthen Guardian",
        sections = {
          Spell(17207, {so = true, desc = "Attacks nearby enemies in a whirlwind of steel that lasts 2 seconds, inflicting 110% weapon damage."}), -- Whirlwind (triggers 15576)
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 10120,
        display = 5989,
        name = "Vault Warder",
        sections = {
          Spell(5568, {so = true, desc = "Inflicts normal damage plus 8% additional damage to nearby enemies."}), -- Trample
        },
      }),
    },
  },
})

table.insert(db, ULDAMAN)
