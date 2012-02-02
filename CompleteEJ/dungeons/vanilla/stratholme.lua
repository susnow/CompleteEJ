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

local STRATHOLME = CreateInstance({
  name = "Stratholme",
  desc = "Once the jewel of northern Lordaeron, the city of Stratholme is where Prince Arthas turned against his mentor, Uther Lightbringer, and slaughtered hundreds of his own subjects who were believed to have contracted the dreaded plague of undeath. Arthas' downward spiral and ultimate surrender to the Lich King soon followed. The broken city is now inhabited by the undead Scourge -- led by the powerful lich, Kel'Thuzad. A contingent of Scarlet Crusaders, led by Grand Crusader Dathrohan, also holds a portion of the ravaged city. The two sides are locked in constant, violent combat. Those adventurers brave (or foolish) enough to enter Stratholme will be forced to contend with both factions before long. It is said that the city is guarded by three massive watchtowers, as well as powerful necromancers, banshees and abominations. There have also been reports of a malefic Death Knight riding atop an unholy steed, dispensing indiscriminate wrath on all those who venture within the realm of the Scourge.",
  texture = "Stratholme",
  area = 765,
  dflag = N5,
}, {
  {
    name = "Hearthsinger Forresten (Rare)",
    desc = "Hearthsinger Forresten is a wandering minstrel ghost, he can be found on the Crusader's Square at random locations, usually on the right side near the Festival Lane.",
    --icon = true,
    creature = 10558,
    display = 10482,
    coords = {0.598, 0.280, 1},
    loot = {13378,13383,13379,13384,16682,},
    sections = {
      Spell(15620, {so = true, desc = "Shoots at an enemy, inflicting 49 to 58 Physical damage."}), -- Shoot
      Spell(14443, {so = true}), -- Multi-Shot
      Spell(16798, {so = true, flag1 = MAGIC}), -- Enchanting Lullaby
      Spell(16244, {so = true, desc = "Reduces the melee attack power of nearby enemies by 20 for 30 seconds."}), -- Demoralizing Shout
    },
  },
  {
    name = "The Unforgiven",
    desc = "Not much is known about The Unforgiven, but some have mentioned his mask is a truly powerful item.",
    --icon = true,
    creature = 10516,
    display = 10771,
    coords = {0.734, 0.202, 1},
    loot = {13409,13408,13405,13404,},
    sections = {
      Spell(6136, {so = true, desc = "If an enemy strikes The Unforgiven, they may have their movement slowed by 30% and the time between their attacks increased by 20% for 5 seconds.", flag1 = MAGIC}), -- Chilled
      Spell(14907, {so = true, desc = "Inflicts 24 to 29 Frost damage to nearby enemies, immobilizing them for 8 seconds.", flag1 = MAGIC}), -- Frost Nova
    },
  },
  {
    name = "Timmy the Cruel",
    desc = "It is said that Timmy the Cruel is a former champion of the Light who committed heinous acts against innocents in Stratholme in the name of gaining unholy power.",
    --icon = true,
    creature = 10808,
    display = 571,
    coords = {0.496, 0.168, 1},
    loot = {13400,13402,13401,13403,},
    sections = {
      Spell(17470, {so = true}), -- Ravenous Claw
      Spell(8599, {so = true, desc = "Timmy enrages at 50% health, increasing his damage done by 10% and attack speed by 30% for 2 minutes.", flag1 = ENRAGE, flag2 = HEALER}), -- Enrage
    },
  },
  {
    name = "Commander Malor",
    desc = "When Balnazzar revealed himself, Commander Malor, like the rest of the Scarlets in Stratholme, was killed and brought back as one of Balnazzar's Risen.",
    --icon = true,
    creature = 11032,
    display = 34463,
    coords = {0.297, 0.408, 1},
    loot = {12845,},
    sections = {
      Spell(16172, {so = true}), -- Head Crack
      Spell(12734, {so = true, desc = "Inflicts 37 to 43 Physical damage to nearby enemies, stunning them for 2 seconds."}), -- Ground Smash
      Spell(15245, {so = true, desc = "Hurls missiles of dark magic, inflicting 99 to 116 Shadow damage to nearby enemies."}), -- Shadow Bolt Volley
    },
  },
  {
    name = "Willey Hopebreaker",
    desc = "The trick of this event is to kill him as fast as you can, because adds will continously spawn from afar and shoot at the group. You can use the cannon balls nearby to shoot the cannon and kill all adds, beware there is a limit of cannonballs and you do not want to be overwhelmed with adds.",
    --icon = true,
    creature = 10997,
    display = 34480,
    coords = {0.042, 0.510, 1},
    loot = {22406,13381,13382,22407,18721,22403,13380,22404,22405,12839,},
    sections = {
      Spell(59146, {so = true, desc = "Shoots at an enemy, inflicting 99 to 116 Physical damage."}), -- Shoot
      Spell(15615, {so = true}), -- Pummel
      Spell(10101, {so = true}), -- Knock Away
      --Spell(17279), -- Summon Crimson Rifleman
      Stage({
        so = true,
        stype = CREATURE,
        creature = 11054,
        display = 34481,
        name = "Risen Rifleman",
        desc = "Calls for three Risen Riflemen to assist Willey Hopebreaker.",
        sections = {
          Spell(17353, {desc = "Shoots at an enemy, inflicting 19 to 22 Physical damage."}), -- Shoot
        },
      }),
    },
  },
  {
    name = "Instructor Galford",
    desc = "Instructor Galford used to be known as Archivist Galford a mortal human adept at Fire magic.",
    --icon = true,
    creature = 10811,
    display = 34498,
    coords = {0.270, 0.748, 1},
    loot = {18716,13387,13386,13385,},
    sections = {
      Spell(17293, {so = true, flag1 = MAGIC}), -- Burning Winds
      Spell(17366, {so = true, desc = "Inflicts 49 to 58 Fire damage to enemies within 10 yards."}), -- Fire Nova
      Spell(33975, {so = true, desc = "Inflicts 218 to 253 Fire damage to an enemy, then additional 9 Fire damage every 3 seconds for 12 seconds.", flag1 = INTERRUPT}), -- Pyroblast
    },
  },
  {
    name = "Balnazzar",
    desc = "Balnazzar -- formerly under the guise of Saidan Dathrohan, Grand Crusader of the Scarlet Crusade -- was one of the three nathrezim siblings left behind in Lordaeron to oversee the demonic conquest of that land.  The return of Prince Arthas, following the defeat of Archimonde, sent the three brothers packing, but they quickly regrouped and concocted a new plan to destroy Arthas once and for all. Though they didn't destroy Arthas, the undead prince left Lordaeron, leaving Balnazzar to rule Stratholme.",
    --icon = true,
    creature = 10813,
    display = 34424,
    coords = {0.204, 0.819, 1},
    loot = {18720,13348,13360,18718,14512,13358,13359,13369,12103,18717,13353,},
    sections = {
      Spell(80750, {desc = "Inflicts 74 to 87 Shadow damage to an enemy."}), -- Mind Blast
      Spell(17399, {desc = "Instantly lashes nearby enemies with dark magic, inflicting 49 to 58 Shadow damage."}), -- Shadow Shock
      Spell(13704, {flag1 = MAGIC}), -- Psychic Scream
      Spell(66290, {desc = "Puts an enemy to sleep for 6 seconds. Any damage caused will awaken the target.", flag1 = MAGIC}), -- Sleep
      Spell(17405, {flag1 = IMPORTANT}), -- Domination
    },
  },
  {
    name = "Baroness Anastari",
    desc = "Baroness Anastari was once a beautiful high elf baroness who was brutally murdered by the Scourge and is now under the control of the Lich King. She now guards a ziggurat.",
    --icon = true,
    creature = 10436,
    display = 10698,
    coords = {0.744, 0.461, 2},
    loot = {13539,18730,13538,13534,18729,18728,13535,13537,16704,},
    sections = {
      Spell(16867, {so = true, flag1 = CURSE}), -- Banshee Curse
      Spell(18327, {so = true, flag1 = MAGIC}), -- Silence
      Spell(16868, {so = true, desc = "Wails with anguish, inflicting 74 to 87 Shadow damage to an enemy."}), -- Banshee Wail
      Spell(17244, {so = true, desc = "Takes control of a humanoid enemy for 2 minutes and increases its maximum health by 2000.  The possession ends when the target reaches 50% health.", flag1 = IMPORTANT}), -- Possess
    },
  },
  {
    name = "Nerub'enkan",
    desc = "Known to be one of the hardest hitting bosses in The Gauntlet. He is guarding a ziggurat.",
    --icon = true,
    creature = 10437,
    display = 9793,
    coords = {0.572, 0.461, 2},
    loot = {18739,18738,18740,13529,16675,},
    sections = {
      Spell(31602, {so = true, desc = "Summons several crypt scarabs to attack the caster's target. Damage dealt equals weapon damage."}), -- Crypt Scarabs
      Spell(4962, {so = true}), -- Encasing Webs
      Spell(6016, {so = true, flag1 = HEALER}), -- Pierce Armor
      --Spell(17235), -- Raise Undead Scarab
      Stage({
        so = true,
        stype = CREATURE,
        creature = 10876,
        display = 10031,
        name = "Undead Scarab",
        desc = "Periodically summons an Undead Scarab to attack her enemies.",
        sections = {
          Spell(13298, {desc = "Inflicts 9 Nature damage to an enemy every 3 seconds for 15 seconds.", flag1 = POISON}), -- Poison
        },
      }),
    },
  },
  {
    name = "Maleki the Pallid",
    desc = "Maleki is a mortal human adept at Frost and Shadow magic. He is guarding a ziggurat.",
    --icon = true,
    creature = 10438,
    display = 10546,
    coords = {0.676, 0.215, 2},
    loot = {13525,18737,18735,12833,18734,13527,13524,13528,13526,16691,},
    sections = {
      Spell(6136, {so = true, desc = "If an enemy strikes Maleki the Pallid, they may have their movement slowed by 30% and the time between their attacks increased by 20% for 5 seconds.", flag1 = MAGIC}), -- Chilled
      Spell(54791, {so = true, desc = "Inflicts 99 to 116 Frost damage to an enemy and reduces its movement speed by 50% for 4 seconds.", flag1 = MAGIC}), -- Frostbolt
      Spell(16869, {so = true}), -- Ice Tomb
      Spell(17620, {so = true, flag1 = MAGIC, flag2 = INTERRUPT}), -- Drain Life
    },
  },
  {
    name = "Magistrate Barthilas",
    desc = "At some point, Barthilas became Magistrate of Stratholme, where he remained until the time the city was purged by Prince Arthas Menethil. He evidently falls during this period, becoming the creature seen in Stratholme today.",
    --icon = true,
    creature = 10435,
    display = 10433,
    coords = {0.567, 0.158, 2},
    loot = {18725,13376,18722,18726,18727,23198,},
    sections = {
      Spell(10887, {so = true}), -- Crowd Pummel
      Spell(14099, {so = true, desc = "Inflicts normal damage plus 25 to an enemy, knocking it back."}), -- Mighty Blow
      Spell(16793, {so = true}), -- Draining Blow
      Spell(16791, {so = true, desc = "Physical damage dealt is increased by 15 and attack speed increased by 4% for 1 minute. Stacks maximum 25 times."}), -- Furious Anger
    },
  },
  {
    name = "Ramstein the Gorger",
    desc = "Like all abominations he is not particularly intelligent, and relying on his sense of tactics is an exceptionally poor idea. He is fearless, tenacious, and resilient, capable of pressing his advantage in combat for hours without growing weary or weak. He is responsible for the death of thousands, including ranger lord Nathanos Marris. Marris, now undead and working for the Forsaken under the name Nathanos Blightcaller, wants Ramstein killed.",
    --icon = true,
    creature = 10439,
    display = 12818,
    coords = {0.455, 0.205, 2},
    loot = {13375,13374,18723,13515,13372,13373,16737,},
    sections = {
      Spell(17687, {so = true, flag1 = HEALER}), -- Flurry
      Spell(17307, {so = true}), -- Knockout
      Spell(5568, {so = true, desc = "Inflicts normal damage plus 8 to enemies within 10 yards."}), -- Trample
    },
  },
  {
    name = "Lord Aurius Rivendare",
    desc = "Lord Aurius Rivendare was a Knight of the Silver Hand, and the son of the Scourge death knight Baron Rivendare. Aurius aided adventurers in battling the Baron in the Slaughter House in the northern districts of the city of Stratholme, but succumbed to wounds incurred in the battle. He was eventually raised into undeath and took his father's place as leader of the Scourge remnants in Stratholme.",
    --icon = true,
    creature = 45412,
    display = 34837,
    coords = {0.390, 0.205, 2},
    loot = {13361,22411,13368,22409,13349,22408,22410,22412,13345,13344,13340,13346,13505,13335,},
    sections = {
      Spell(17467, {so = true, flag1 = IMPORTANT}), -- Unholy Aura
      Spell(15496, {so = true, flag1 = TANK}), -- Cleave
      Spell(16856, {so = true, flag1 = HEALER}), -- Mortal Strike
      Spell(17393, {desc = "Hurls a bolt of dark magic at an enemy, inflicting 145 to 169 Shadow damage."}), -- Shadow Bolt (17434 and 17435 are duplicates?)
    },
  },
})

table.insert(db, STRATHOLME)
