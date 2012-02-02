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

local RUINS_OF_AHNQIRAJ = CreateInstance({
  name = "Ruins of Ahn'Qiraj",
  desc = "During the final hours of the War of the Shifting Sands, the combined forces of the night elves and the four dragonflights drove the battle to the very heart of the qiraji empire, to the fortress city of Ahn'Qiraj. Yet at the city gates, the armies of Kalimdor encountered a concentration of silithid war drones more massive than any they had encountered before. Ultimately the silithid and their qiraji masters were not defeated, but merely imprisoned inside a magical barrier, and the war left the cursed city in ruins.\n\nA thousand years have passed since that day, but the qiraji forces have not been idle. A new and terrible army has been spawned from the hives, and the ruins of Ahn'Qiraj are teeming once again with swarming masses of silithid and qiraji. This threat must be eliminated, or else all of Azeroth may fall before the terrifying might of the new qiraji army.",
  texture = "RuinsofAhnQiraj",
  area = 717,
  dflag = N10,
}, {
  {
    name = "Kurinnaxx",
    desc = "Kurinnaxx, a large sand reaver, is the first boss found in the Ruins of Ahn'Qiraj. He has a wide aggro radius and can see stealthed rogues.",
    --icon = true,
    creature = 15348,
    display = 15742,
    coords = {0.560, 0.353, 0},
    loot = {20885,20884,21500,20888,21503,76401,},
    sections = {
      Spell(26527, {desc = "At 30% health Kurinnaxx will enter a frenzied state, increasing physical damage dealt by 250 and attack speed increased by 75%. Lasts 2 minutes."}), -- Frenzy
      Spell(25646, {desc = "A punshing blow strikes the target, reducing the effectiveness of healing spells by 10%. Stacks 10 times and lasts 15 seconds.", flag1 = TANK}), -- Mortal Wound
      --Spell(20477), -- Summon Player
      --Spell(26446), -- Summon Player
      Spell(3391), -- Thrash
      Spell(25814, {desc = "Inflicts normal damage plus 500 to all enemies within 10 yards, in front of Kurinnaxx.", flag1 = DPS}), -- Wide Slash
    },
  },
  {
    name = "General Rajaxx",
    desc = "The mighty qiraji known as General Rajaxx commands the qiraji armies in battle. He was described in the War of the Shifting Sands as a towering monstrosity, swinging clawed limbs, looming over all and always shouting commands to the insect soldiers of Qiraji and Silithid during battle. During the War of the Shifting Sands, Rajaxx clashed with Fandral and Valstann Staghelm, the leaders of the night elf forces. Later, he personally killed Valstann.",
    --icon = true,
    creature = 15341,
    display = 15376,
    coords = {0.583, 0.495, 0},
    loot = {20885,20888,21495,20884,21497,76401,},
    sections = {
      Stage({
        so = true,
        name = "Assistance",
        desc = "Lieutenant General Andorov and his four Kaldorei Elite can assist during the fight. Talk to him instead of manually engaging the event.",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 15471,
            display = 15688,
            name = "Lieutenant General Andorov",
            sections = {
              Spell(25516, {so = true, desc = "Nearby allies are healed for 200 health every 3 seconds, attack speed increased by 10% and casting speed increased by 11%. Lasts 30 seconds."}), -- Aura of Command
              Spell(25515, {desc = "Stuns an enemy, rendering it unable to move or attack for 5 seconds."}), -- Bash
              Spell(22591, {desc = "Strikes an enemy, inflicting normal and 20 bonus damage."}), -- Strike
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15473,
            display = 15689,
            name = "Kaldorei Elite",
            sections = {
              Spell(26350), -- Cleave
              Spell(16856), -- Mortal Strike
            },
          }),
        },
      }),
      Stage({
        so = true,
        name = "Waves",
        desc = "Before you fight General Rajaxx, you will fight seven waves of his subordinates and their minions.",
        sections = {
          Stage({
            name = "Subordinates",
            sections = {
              Stage({
                so = true,
                name = "Shared abilities among subordinates",
                sections = {
                  Spell(40504), -- Cleave
                  Spell(24317), -- Sunder Armor
                },
              }),
              Stage({
                stype = CREATURE,
                creature = 15391,
                display = 15738,
                name = "Captain Qeez",
                sections = {
                  Spell(19134, {so = true, desc = "Shouts at enemies within 15 yards, causing them to flee in fear for 6 seconds.", flag1 = IMPORTANT}), -- Frightening Shout
                },
              }),
              Stage({
                stype = CREATURE,
                creature = 15392,
                display = 15738,
                name = "Captain Tuubid",
                sections = {
                  Spell(25471, {so = true, desc = "Marks a random enemy for death, nearby minions focus their attacks at the marked target.", flag1 = IMPORTANT}), -- Attack Order
                },
              }),
              Stage({
                stype = CREATURE,
                creature = 15389,
                display = 15738,
                name = "Captain Drenn",
                sections = {
                  Spell(26550, {so = true, flag1 = IMPORTANT}), --  Lightning Cloud
                },
              }),
              Stage({
                stype = CREATURE,
                creature = 15390,
                display = 15738,
                name = "Captain Xurrem",
                sections = {
                  Spell(25425, {so = true, desc = "Inflicts 1313 to 1687 Nature damage to enemies within 20 yards and stunning them for 2 seconds and disarming them for 5 seconds.", flag1 = IMPORTANT}), -- Shockwave
                },
              }),
              Stage({
                stype = CREATURE,
                creature = 15386,
                display = 15738,
                name = "Major Yeggeth",
                sections = {
                  Spell(25282, {so = true, desc = "Makes the caster immune to all schools of magic for 6 seconds.", flag1 = IMPORTANT}), -- Shield of Rajaxx
                },
              }),
              Stage({
                stype = CREATURE,
                creature = 15388,
                display = 15738,
                name = "Major Pakkon",
                sections = {
                  Spell(25322, {so = true, desc = "Inflicts normal damage plus 1750 to 2250 to enemies within 15 yards and in front of Major Pakkon, also knocking them back.", flag1 = IMPORTANT}), -- Sweeping Slam
                },
              }),
              Stage({
                stype = CREATURE,
                creature = 15385,
                display = 15738,
                name = "Colonel Zerran",
                sections = {
                  Spell(25462, {so = true, desc = "Increases physical damage dealt by 438 to 562 and increasing Colonel Zerran's size by 50% to match his new strenght.", flag1 = IMPORTANT}), -- Enlarge
                },
              }),
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15344,
            display = 15354,
            name = "Swarmguard Needler",
            sections = {
              Spell(40504), -- Cleave
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15387,
            display = 15437,
            name = "Qiraji Warrior",
            sections = {
              Spell(8599, {desc = "Enrages the caster and increases physical damage dealt by 10% and attack speed increased by 30% for 2 minutes."}), -- Enrage
              Spell(15588, {desc = "Inflicts 71 to 79 Nature damage to enemies within 10 yards, increasing the time between their attacks by 33% and reducing their movement speed by 40% for 6 seconds."}), -- Thunderclap
              Spell(10966), -- Uppercut
            },
          }),
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 15341,
        display = 15376,
        name = "General Rajaxx",
        sections = {
          Spell(6713), -- Disarm
          Spell(8269), -- Frenzy
          --Spell(20477), -- Summon Player
          Spell(25599, {so = true, desc = "Reduces the health of all players by 50% of current health and knocks them back.", flag1 = IMPORTANT}), -- Thundercrash
        },
      }),
    },
    adds = {
      {
        name = "Lieutenant General Andorov",
        creature = 15471,
        display = 15688,
      },
      {
        name = "Kaldorei Elite",
        creature = 15473,
        display = 15689,
      },
      {
        name = "Subordinates",
        creature = 15391,
        display = 15738,
      },
      {
        name = "Swarmguard Needler",
        creature = 15344,
        display = 15354,
      },
      {
        name = "Qiraji Warrior",
        creature = 15387,
        display = 15437,
      },
    },
  },
  {
    name = "Moam",
    desc = "C'Thun commanded Emperor Vek'lor to create a new obsidian statue superior to all other Destroyers. Vek'lor sought his twin brother's aid in the task, and while Vek'nilash used his physical might to craft a grand body of volcanic rock, Vek'lor fortified the shell with powerful magic.\n\nEmperor Vek'lor named the finished construct Moam, and observed as the dark master infused it with life. He was pleased and surprised to find that the improved Obsidian Destroyer was far more versatile than its earlier counterparts. The Twin Emperors intended to use Moam as a colossal weapon, knowing that its strengths would help it survive in the thick of melee as well as magical combat-but they did not expect for the construct's abilities to advance further without their own assistance.",
    --icon = true,
    creature = 15340,
    display = 15392,
    coords = {0.330, 0.364, 0},
    loot = {21479,20890,21468,21471,21455,21477,21475,21467,21473,21472,},
    sections = {
      Spell(27526, {desc = "Periodically mana drains nearby enemies, restoring Moam's own mana supply.", flag1 = IMPORTANT}), -- Mana Drain
      Spell(25672, {desc = "Once Moam has Mana Drained enough and reaches 100%, he will deal 3063 to 3937 Arcane damage to enemies within 45 yards and knock them high up into the air.\n\nThis can and should be avoided by draining Moam's mana in return, forcing him to never reach 100%.", flag1 = IMPORTANT}), -- Arcane Eruption
      Spell(15550, {desc = "Inflicts weapon damage to enemies within 10 yards."}), -- Trample
      --Spell(25685), -- Energize
    },
  },
  {
    name = "Buru the Gorger",
    desc = "Protector of the hive eggs and the silithid queen in the Hatchery.",
    --icon = true,
    creature = 15370,
    display = 15654,
    coords = {0.699, 0.617, 0},
    loot = {20884,21488,21487,21491,20890,20885,76401,},
    sections = {
      Stage({
        so = true,
        name = "Phase 1: Eggs",
        desc = "Buru will fixate himself upon an enemy, either until that target dies or he takes damage from one of his Eggs.",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 15370,
            display = 15654,
            name = "Buru the Gorger",
            sections = {
              Spell(1557, {so = true, desc = "During the encounter. Buru will increase his speed the more health he looses, ultimately making it harder to kite."}), -- Full Speed
              Spell(96, {so = true, desc = "Increases the damage of your next melee swing by 100 and causes the target to bleed for 1248 damage every 2 seconds for 10 seconds."}), -- Dismember
            },
          }),
          Stage({
            --so = true,
            stype = CREATURE,
            creature = 15514,
            display = 15512,
            name = "Buru Egg",
            flag1 = IMPORTANT,
            sections = {
              Spell(19593, {so = true, desc = "Upon the destruction of an Egg, the closer Buru and other players are to it, the more damage they take. The radius of impact is 25 yards."}),
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15521,
            display = 11095,
            name = "Hive'Zara Hatchling",
            desc = "When an Egg is destroyed, a Hive'Zara Hatchling spawns at its location.",
          }),
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 15370,
        display = 15655,
        name = "Phase 2: Buru the Gorger",
        sections = {
          Spell(20512, {desc = "Inflicts 70 Nature damage each 2 seconds to all enemies, stacking up to 20 and doing maximum 1400 Nature damage each 2 seconds. Lasts for 20 seconds.", flag1 = IMPORTANT}), -- Creeping Plague
          Spell(25640, {desc = "Thorns sprout from Buru, causing 40 Nature damage to melee attackers."}), -- Thorns
        },
      }),
    },
    adds = {
      {
        name = "Buru Egg",
        creature = 15514,
        display = 15512,
      },
      {
        name = "Hive'Zara Hatchling",
        creature = 15521,
        display = 11095,
      },
    },
  },
  {
    name = "Ayamiss the Hunter",
    desc = "The wasp Ayamiss hunts his prays from above and commands hundreds of minion wasps. He will lay waste to any living organism and use their carcasses to spawn more minions for him to command.",
    --icon = true,
    creature = 15369,
    display = 15431,
    coords = {0.616, 0.905, 0},
    loot = {20884,21484,21466,21480,20886,20889,76401,},
    sections = {
      Stage({
        so = true,
        name = "Common for both phases",
        sections = {
          Spell(25749, {so = true, desc = "During the entire encounter, Ayamiss will spray all enemies in a cone in front of Ayamiss for 875 to 1125 Nature damage. This ability has a 30 seconds cooldown."}), -- Stinger Spray
        },
      }),
      Stage({
        so = true,
        name = "Phase 1: Air",
        sections = {
          Stage({
            stype = CREATURE,
            name = "Ayamiss the Hunter",
            creature = 15369,
            display = 15431,
            sections = {
              Spell(25748, {so = true, desc = "Stings an enemy, inflicting 25 Nature damage every second for 10 seconds. Stacks 100 times and will tick for 2500 Nature damage every second at max stack.", flag1 = IMPORTANT}), -- Poison Stinger
              Spell(25725, {so = true, desc = "Stuns a random group member and teleports them on top of the altar. A Hive'Zara Larva will appear near the bottom and head towards that player.", flag1 = IMPORTANT}), -- Paralyze
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15555,
            display = 15554,
            name = "Hive'Zara Larva",
            desc = "The larva will walk toward the stunned player on top of the altar.\n\nWhen their fixated target is reached, it will be impregnated and give birth to a Hive'Zara Hornet.",
            flag1 = IMPORTANT,
            sections = {
              Stage({
                so = true,
                stype = CREATURE,
                creature = 15934,
                display = 14522,
                name = "Hive'Zara Hornet",
                desc = "Should be handled quickly as the Hornet deals quite a lot of damage.",
              }),
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15546,
            display = 482,
            name = "Hive'Zara Swarmer",
            desc = "During the flying phase, he will call upon Hive'Zara Swarmer to gather until 20 have been called, then swarm upon the players.",
          }),
        },
      }),
      Stage({
        so = true,
        name = "Phase 2: Ground",
        desc = "This phase starts when Ayamiss reaches 70% health.",
        sections = {
          Spell(25852), -- Lash
          Spell(3391), -- Thrash
        },
      }),
    },
    adds = {
      {
        name = "Hive'Zara Larva",
        creature = 15555,
        display = 15554,
      },
      {
        name = "Hive'Zara Hornet",
        creature = 15934,
        display = 14522,
      },
      {
        name = "Hive'Zara Swarmer",
        creature = 15546,
        display = 482,
      },
    },
  },
  {
    name = "Ossirian the Unscarred",
    desc = "The legends say that Vek'nilash secretly entrusted Ossirian with the responsibility of maintaining a watch on General Rajaxx, to ensure that the commander would never fail again.\n\nOssirian serves the Emperors to the best of his ability, despite the frustration of being eternally bound to a single location. The bones of Grakkarond have become a sacred site to the Anubisaths; a testimony to their ability to defeat even the most powerful of enemies.",
    --icon = true,
    creature = 15339,
    display = 15432,
    coords = {0.433, 0.696, 0},
    loot = {21458,21220,20886,20884,21463,21454,21461,21459,21453,76401,},
    sections = {
      Spell(25176, {desc = "Increases damage done by 300% and size by 25%.\n\nThis can be countered by activating a Ossirian Crystal while Ossirian is near it.", flag1 = IMPORTANT}), -- Strength of Ossirian
      Spell(25189, {desc = "Surrounds his targeted enemy with a cyclone for up to 10 sec. If the target takes any damage, it will break free of the imprisoning winds. Target is ignorred as long this effect lasts.", flag1 = IMPORTANT}), -- Enveloping Winds
      Spell(25195, {desc = "Forces enemies within 45 yards to speak in Demonic, reducing their casting speed by 75% for 15 seconds.", flag1 = CURSE}), -- Curse of Tongues
      --Spell(20477), -- Summon Player
      Spell(25188, {desc = "Ossirian will occasionally stomp the ground and send enemies within 20 yards flying back and taking 2188 to 2812 Physical damage."}), -- War Stomp
    },
  },
})

table.insert(db, RUINS_OF_AHNQIRAJ)
