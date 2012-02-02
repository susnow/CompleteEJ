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

local MOLTEN_CORE = CreateInstance({
  name = "Molten Core",
  desc = "The Molten Core is a level 60 raid dungeon located within Blackrock Mountain, home to Ragnaros the Firelord. It was one of two forty (40) player raid dungeons available upon release of World of Warcraft, with the other being Onyxia's Lair. Considered the pinnacle of raiding achievement at the time, the Molten Core enticed adventurers to enter the instance in the search of realm glory.\n\nJust before the re-opening of the Dark Portal, Ragnaros - the land's fiery overlord - was cast down from his dark throne and returned to the firelands. Ragnaros now rages war on the world tree Nordrassil.",
  texture = "MoltenCore",
  area = 696,
  dflag = N10,
}, {
  {
    name = "Lucifron",
    desc = "Lucifron, and his two Flamewaker Protector guards, can be found watching over the enormous core hound Magmadar, favored pet of Ragnaros.",
    --icon = true,
    creature = 12118,
    display = 13031,
    coords = {0.658, 0.380, 1},
    loot = {17077,18875,17109,16805,16829,19145,19147,19146,},
    sections = {
      Stage({
        so = true,
        name = "Lucifron",
        sections = {
          Spell(19702, {flag1 = MAGIC}), -- Impending Doom
          Spell(19703, {flag1 = CURSE}), -- Lucifron's Curse
          Spell(19460, {desc = "Instantly lashes an enemy with dark magic, inflicting 24 to 29 Shadow damage."}), -- Shadow Shock
        },
      }),
      Stage({
        so = true,
        name = "Flamewaker Protector",
        sections = {
          Spell(20605, {desc = "Inflicts normal damage to an enemy and its 3 nearest allies."}), -- Cleave
          Spell(20604, {desc = "Takes control of a humanoid enemy for 15 seconds. If line-of-sight with Lucifron is broken, the Protector will not cast this spell.", flag1 = MAGIC}), -- Dominate Mind
        },
      }),
    },
    adds = {
      {
        name = "Flamewaker Protector",
        creature = 12119,
        display = 12030,
      },
    },
  },
  {
    name = "Magmadar",
    desc = "A terrifying behemoth composed of igneous rock and roiling magma, Magmadar serves as the origin of the core hounds that roam the earthen halls of Molten Core. Favored among Ragnaros's pets, Magmadar is protected by the flamewaker Lucifron and surrounded by vicious packs of ravenous hounds.",
    --icon = true,
    creature = 11982,
    display = 10193,
    coords = {0.691, 0.241, 1},
    loot = {21371,16822,18829,17069,19142,17073,18292,16835,16796,16843,18822,16847,18820,19144,18259,18824,18257,},
    sections = {
      Stage({
        so = true,
        name = "Core Hound Packs",
        sections = {
          Spell(19771, {desc = "Inflicts 1500 Physical damage to an enemy over 30 seconds, stacks up to 10 times and dealing maximum of 15000 Physical damage over 30 seconds, 500 Physical damage per tick."}),
          Stage({
            name = "Revive",
            icon = "Interface\\Icons\\Spell_Holy_Resurrection",
            desc = "If all Core Hounds do not die within 10 seconds of the first Core Hound death, they will be brought back to life with full health and the process will repeat.",
            flag1 = IMPORTANT,
          }),
        },
      }),
      Stage({
        so = true,
        name = "Magmadar",
        sections = {
          Spell(19451, {desc = "Increases attack speed by 150% for 8 seconds.", flag1 = ENRAGE}), -- Enrage
          Spell(19411, {desc = "Throws a Lava Bomb at an enemy, inflicting 3200 Fire damage over 8 seconds, as long the target remains in the fire.", flag1 = IMPORTANT}), -- Lava Bomb (#20474 too, duplicate or not?)
          Spell(19450, {desc = "Spews 93 to 107 Fire damage at the target, dealing 75 additional Fire damage every 3 seconds."}), -- Magma Spit
          Spell(19408, {desc = "Panics enemies within 45 yards, causing them to flee in fear for 8 seconds.", flag1 = MAGIC}), -- Panic
          --Spell(20477), -- Summon Player
        },
      }),
    },
  },
  {
    name = "Gehennas",
    desc = "Gehennas and his fellow flamewakers were extricated from the Elemental Plane by Ragnaros shortly after Thaurissan accidentally summoned the Firelord. Unlike the fire elementals, who are beings of pure flame, the flamewakers are elementals composed of flesh and blood.\n\nGehennas resides near the bottom of the Firelord's elemental hierarchy and covets the power and station of his superiors. He is distrusted by all who serve with him, with the exception of his two loyal guards, who believe they might gain from their overseer's ascension.",
    --icon = true,
    creature = 12259,
    display = 13030,
    coords = {0.335, 0.489, 1},
    loot = {16860,16812,19145,16839,19147,18879,18878,},
    sections = {
      Stage({
        so = true,
        name = "Flamewaker Elite",
        sections = {
          Spell(20229), -- Blast Wave
          Spell(20623), -- Fire Blast
          Spell(20420), -- Fireball
          Spell(21095, {desc = "When separated further than 45 yards of Gehennas, will become immune to all damage and increase damage done by 200%.", flag1 = IMPORTANT}), -- Separation Anxiety
        },
      }),
      Stage({
        so = true,
        name = "Gehennas",
        sections = {
          Spell(19716, {flag1 = CURSE}), -- Gehennas' Curse
          Spell(19717), -- Rain of Fire
          Spell(19728), -- Shadow Bolt (#19729 is a duplicate?)
        },
      }),
    },
    adds = {
      {
        name = "Flamewaker Elite",
        creature = 11664,
        display = 12002,
      },
    },
  },
  {
    name = "Garr",
    desc = "Garr is described as one of the lieutenants of Ragnaros who carried out the betrayal of Lord Thunderaan, the Prince of Air and otherwise referred to as the \"Windseeker.\" During the Elemental Sundering, Ragnaros sought to consume Thunderaan, and did so by having his two lieutenants, Baron Geddon and Garr perpetrate him. Thunderaan, caught off guard, was utterly destroyed. Ragnaros almost completely consumed Thunderaan's essence, and stored the rest within a talisman of elemental binding. Ragnaros cleaved this talisman into two equal pieces, to which he assigned Baron Geddon and Garr.",
    --icon = true,
    creature = 12057,
    display = 12110,
    coords = {0.309, 0.698, 1},
    loot = {18292,16813,19136,17071,18820,16808,18264,16854,18832,16866,18822,17066,18564,19142,21371,18824,18252,},
    sections = {
      Stage({
        so = true,
        name = "Firesworn",
        sections = {
          Spell(19497, {desc = "Will upon death Erupt and deal 1850 to 2150 Fire damage to all enemies within 15 yards, also knocking them back.", flag1 = IMPORTANT}), -- Eruption
          Spell(15732, {desc = "Burns an enemy for 37 to 43 Fire damage, then inflicts 6 additional Fire damage every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Immolate
          Spell(23492, {desc = "When separated further than 45 yards of Garr, will become immune to all damage and increase damage done by 300%.", flag1 = IMPORTANT}), -- Separation Anxiety
          Spell(19516, {desc = "When killed will increase Garr's attack speed by 9%. If all 8 Firesworn are killed, Garr will attack 72% faster.", flag1 = IMPORTANT}), -- Frenzy
        },
      }),
      Stage({
        so = true,
        name = "Garr",
        sections = {
          Spell(19492, {desc = "Occasionally dispels a beneficial magic spell on enemies within 45 yards."}), -- Antimagic Pulse
          Spell(19496, {flag1 = MAGIC}), -- Magma Shackles
          --Spell(20477), -- Summon Player
        },
      }),
    },
    adds = {
      {
        name = "Firesworn",
        creature = 12099,
        display = 5781,
      },
    },
  },
  {
    name = "Shazzrah",
    desc = "Of all the flamewakers who followed Ragnaros into the world of Azeroth, Shazzrah is the most talented in the realm of the arcane. He is aware that his colleague Baron Geddon suspects the elemental Garr of treachery.\n\nThe conflict between Baron Geddon and Garr suits Shazzrah well, for in fact it is Shazzrah who seeks to posses both halves of the Talisman of Elemental Binding so that he might find a way to siphon its energes for his own use. Ragnaros was very likely aware of his underling's penchant for duplicity when he split the talisman in half and entrusted the pieces to Baron Geddon and Garr.",
    --icon = true,
    creature = 12264,
    display = 13032,
    coords = {0.553, 0.852, 1},
    loot = {16852,16803,17077,16811,18879,19147,19145,},
    sections = {
      Spell(19712), -- Arcane Explosion
      Spell(19715), -- Counterspell
      Spell(23138, {desc = "Randomly teleports to an enemy location inside line-of-sight."}), -- Gate of Shazzrah
      Spell(19714, {flag1 = MAGIC}), -- Magic Grounding
      Spell(19713, {flag1 = CURSE}), -- Shazzrah's Curse
    },
  },
  {
    name = "Baron Geddon",
    desc = "Baron Geddon is one of the eldest of all fire elementals, and he served as Ragnaros' right hand during the beginning of the war against the titans.  During one of the first battles against the then-unknown titan attackers, Geddon was defeated and forced into humiliating retreat.  Ragnaros immediately demoted his commander, thinking that Geddon had been defeated by an inferior foe, since the Old Gods and their lieutenants had never yet met a challenge.  His replacement was the flamewaker Majordomo Executus; Geddon was infuriated that a creature not purely of fire replaced him, a noble among the elementals. In an effort to regain his master's faith, Baron Geddon planned the now legendary betrayal of Thunderaan the Windseeker. In the midst of a great battle, Geddon separated the massive lightning elemental from his allies, and together with Garr and Ragnaros, they ambushed the great elemental in an effort to steal his power.",
    --icon = true,
    creature = 12056,
    display = 12129,
    coords = {0.517, 0.758, 1},
    loot = {19136,16856,18291,16836,18257,18861,16797,18822,18820,18824,18264,18829,18265,},
    sections = {
      Spell(20478, {desc = "Will randomly pulse and hit all enemies within 20 yards for Fire damage. The damage increases after every other pulse by 500, starting at 500 damage. He will do 6 to 10 pulses and the last once will do 1500 Fire damage or more.", flag1 = IMPORTANT}), -- Armageddon
      Spell(19659, {flag1 = MAGIC}), -- Ignite Mana
      Spell(19695, {desc = "Unable to move or use abilities. Periodically inflicts Fire damage to nearby enemies, lasts 8 seconds."}), -- Inferno
      Spell(20475, {desc = "Throws a bomb at en enemy. After 8 seconds the bomb explodes, inflicting 3200 Fire damage to the target and all nearby allies. The target is thrown into the air, taking fall damage upon landing.", flag1 = IMPORTANT}), -- Living Bomb
      --Spell(20477), -- Summon Player
    },
  },
  {
    name = "Sulfuron Harbinger",
    desc = "Among the most favored of the flamewakers, Sulfuron Harbinger is the terrifying herald of Ragnaros himself. From the infernal depths of the Molten Core, the Harbinger commands Ambassador Flamelash and the other lesser flamewakers in the outside world.  Sulfuron Harbinger answers only to Executus and guards the rune of Koro, one of several runes that empower the Firelord's servants.  Sulfuron Harbinger keeps Shazzrah in particular under close watch, believing that Shazzrah seeks to betray Ragnaros. Flanked by four of the Firelord's most fervid priests, the Harbinger prepares for the day when the elemental lord of fire claims the world of Azeroth for his own.",
    --icon = true,
    creature = 12098,
    display = 13030,
    coords = {0.826, 0.832, 1},
    loot = {17074,16816,19146,18879,18861,18870,17077,},
    sections = {
      Stage({
        so = true,
        name = "Flamewaker Priest",
        sections = {
          Spell(19775, {desc = "Uses dark magic to heal an ally for 27750 to 32250 damage. This ability has 60 yards range and will be cast on any ally that is low on health.", flag1 = INTERRUPT}), -- Dark Mending
          Spell(19777), -- Dark Strike
          Spell(20294, {flag1 = MAGIC}), -- Immolate
          Spell(19776, {desc = "Utters a word of darkness, inflicting 4 Shadow damage to an enemy every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Shadow Word: Pain
        },
      }),
      Stage({
        so = true,
        name = "Sulfuron Harbinger",
        sections = {
          Spell(19778), -- Demoralizing Shout
          Spell(19781, {desc = "Tosses a spear of flame, inflicting 850 to 1150 Fire damage to an enemy, as well as scorching any other enemies in the vicinity of the target, within 10 yards.", flag1 = IMPORTANT}), -- Flame Spear
          Spell(19780, {flag1 = HEALER}), -- Hand of Ragnaros
          Spell(19779), -- Inspire
          Spell(19785), -- Throw
        },
      }),
    },
    adds = {
      {
        name = "Flamewaker Priest",
        creature = 11662,
        display = 12030,
      },
    },
  },
  {
    name = "Golemagg the Incinerator",
    desc = "The most feared soldiers of Ragnaros's elemental forces are the molten giants, and among them Golemagg the Incinerator is unrivaled for his sheer brutality and savage efficiency. So absolute is the molten behemoth's power that he has cowed two core ragers - offspring of the colossal beast Magmadar - which he now uses as pets.  For this affront, he has earned Magmadar's eternal and unwavering ire, although the fearsome creature has yet to act on his savage impulses.",
    --icon = true,
    creature = 11988,
    display = 11986,
    coords = {0.686, 0.586, 1},
    loot = {18292,16809,18821,16820,19136,16815,18291,16798,17011,16845,18822,16833,18861,18824,18264,18820,18257,},
    sections = {
      Stage({
        so = true,
        name = "Core Rager",
        sections = {
          Spell(19820), -- Mangle 
          Stage({
            name = "Death Insurance",
            icon = "Interface\\Icons\\Spell_Holy_Resurrection",
            desc = "If the Core Rager health drops below 50% they will refuse to die and heal to full health.",
            flag1 = IMPORTANT,
          }),
          Stage({
            name = "Evade",
            icon = "Interface\\Icons\\Ability_Rogue_Smoke",
            desc = "If separated too far from Golemagg, will Evade the Core Ragers and Golemagg and reset the encounter.",
            flag1 = IMPORTANT,
          }),
        },
      }),
      Stage({
        so = true,
        name = "Golemagg the Incinerator",
        sections = {
          Spell(19798, {desc = "Inflicts 1388 to 1612 damage to enemies within 18 yards."}), -- Earthquake
          Spell(13880, {desc = "Splashes the target with Magma, melting its armor, dealing 93 to 107 Fire damage and additional 50 Fire damage every 3 seconds for 30 sec. This can stack up to 50 times."}), -- Magma Splash
          Spell(20228), -- Pyroblast
          --Spell(20477), -- Summon Player
        },
      }),
    },
    adds = {
      {
        name = "Core Rager",
        creature = 11672,
        display = 11997,
      },
    },
  },
  {
    name = "Majordomo Executus",
    desc = "Executus comes with four Flamewaker Healers and four Flamewaker Elite guards making this a total of a nine enemy encounter. Executus will \"submit\" and the fight is won when all the adds are dead.  He then appears in Ragnaros' chamber and will summon the Firelord to begin the encounter.",
    --icon = true,
    creature = 12018,
    display = 12029,
    coords = {0.845, 0.659, 1},
    loot = {19139,18812,18809,18810,18808,},
    sections = {
      Stage({
        so = true,
        name = "Flamewaker Healer and Elite",
        sections = {
          Stage({
            name = "Flamewaker Healer",
            sections = {
              Spell(21077), -- Shadow Bolt
              Spell(20603, {desc = "Instantly lashes enemies within 20 yards with dark magic, inflicting 740 to 860 Shadow damage."}), -- Shadow Shock
            },
          }),
          Stage({
            name = "Flamewaker Elite",
            sections = {
              Spell(20229), -- Blast Wave
              Spell(20623), -- Fire Blast
              Spell(20420), -- Fireball
            },
          }),
          Spell(21095, {desc = "When separated further than 45 yards of Majordomo Executus, will become immune to all damage and increase damage done by 200%.", flag1 = IMPORTANT}), -- Separation Anxiety
        },
      }),
      Stage({
        so = true,
        name = "Majordomo Executus",
        sections = {
          Spell(20620, {desc = "Surrounds the caster with a shield woven of Shadow magic. The shield lasts 5 minutes, absorbs up to 30000 Physical or magical damage, and inflicts 250 damage to melee attackers. Heals the caster to full health periodically."}), -- Aegis of Ragnaros
          Spell(21075, {desc = "Shields the target and inflicts 100 Arcane damage to each melee strike received."}), -- Damage Shield
          Spell(20619), -- Magic Reflection
          --Spell(19774), -- Summon Ragnaros
          Spell(20534), -- Teleport (#20618 duplicate?)
        },
      }),
    },
    adds = {
      {
        name = "Flamewaker Healer",
        creature = 11663,
        display = 13029,
      },
      {
        name = "Flamewaker Elite",
        creature = 11664,
        display = 12002,
      },
    },
  },
  {
    name = "Ragnaros",
    desc = "Ragnaros the Firelord was an incredibly powerful Elemental Lord and master of all fire elementals. He ruled for more than three hundred years over his minions from deep inside the fiery core of Blackrock Mountain. After being banished back to the Firelands, he aligned himself with Deathwing and his fellow Elemental Lord, Al'Akir, in the effort to purge all life from Azeroth.  To help bring about the end of days, Ragnaros laid siege to the World Tree Nordrassil on Mount Hyjal, unleashing his most powerful minions. Despite the incredible destructive forces at his disposal, the mortal champions of Azeroth were able to lay siege to the Firelord's domain, where they bested all of the challenges he laid before them, and eventually destroyed him within his own fortress.",
    --icon = true,
    creature = 11502,
    display = 11121,
    coords = {0.558, 0.542, 1},
    loot = {13040,13113,18814,13072,16962,13015,16954,17063,17106,17104,16901,13075,19137,13000,18816,13091,18817,17082,13008,13077,13144,13067,13007,13120,13123,13053,13125,13036,13130,13047,13009,13003,9402,13001,},
    sections = {
      Stage({
        so = true,
        name = "Phase 1: Ragnaros",
        desc = "You have 3 minutes before the next phase starts.",
        sections = {
          --Spell(19773), -- Elemental Fire (used on Majordomo Executus)
          Spell(20564, {flag1 = HEALER}), -- Elemental Fire
          Spell(20565, {desc = "Inflicts 6000 Fire damage to an random enemy. Only used when there is no one in melee range of Ragnaros.", flag1 = TANK}), -- Magma Blast
          Spell(20566), -- Wrath of Ragnaros
        },
      }),
      Stage({
        so = true,
        name = "Phase 2: Son of Flame",
        desc = "You have 90 seconds to defeat all the Sons of Flame before Ragnaros rises back up. Note that he will rise instantly after the sons are defeated, regardless of the timer.\n\nPhase 1 is repeated after this phase ends.",
      }),
    },
    adds = {
      {
        name = "Son of Flame",
        creature = 12143,
        display = 5488,
      },
    },
  },
})

table.insert(db, MOLTEN_CORE)
