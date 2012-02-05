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

local BLACKROCK_DEPTHS = CreateInstance({
  name = "Blackrock Depths",
  desc = "Once the capital city of the Dark Iron dwarves, this volcanic labyrinth now serves as the seat of power for Ragnaros the Firelord. Ragnaros has uncovered the secret to creating life from stone and plans to build an army of unstoppable golems to aid him in conquering the whole of Blackrock Mountain. Obsessed with defeating Nefarian and his draconic minions, Ragnaros will go to any extreme to achieve final victory.",
  texture = "BlackrockDepths",
  area = 704,
  dflag = N5,
}, {
  {
    name = "Bael'Gar",
    desc = "Once you enter the instance, take the port to the left and head forward. It's recommended to do him first to save time from running.",
    --icon = true,
    creature = 9016,
    display = 12162,
    coords = {0.256, 0.529, 1},
    loot = {11807,11805,11803,11802,},
    sections = {
      Spell(13895, {so = true, flag1 = IMPORTANT}), -- Summon Spawn of Bael'Gar
      Spell(23379, {so = true, desc = "Deals 70 to 80 Fire damage to the current target and additional 50 Fire damage every 3 seconds for 24 seconds. Stacks maximum 3 times.", flag1 = HEALER}), -- Magma Splash
    },
  },
  {
    name = "Lord Roccor",
    desc = "Lord Roccor can be found patroling the lower Halls of the Law, right outside the room of Houndmaster Grebmar, nearby the arena.",
    --icon = true,
    creature = 9025,
    display = 5781,
    coords = {0.560, 0.670, 1},
    loot = {22397,22234,11631,11632,},
    sections = {
      Spell(13729, {so = true, desc = "Instantly burns an enemy for 24 to 29 Fire damage, then inflicts additional 4 Fire damage every 3 seconds for 12 seconds.", flag1 = MAGIC}), -- Flame Shock
      Spell(13728, {so = true, flag1 = HEALER}), -- Earth Shock
      Spell(6524, {so = true}), -- Ground Tremor
    },
  },
  {
    name = "Houndmaster Grebmar",
    desc = "Houndmaster Grebmar resides under the arena, protected by a pack of his pet dogs.",
    --icon = true,
    creature = 9319,
    display = 9212,
    coords = {0.505, 0.630, 1},
    loot = {11629,11627,11623,11628,},
    sections = {
      Spell(13730, {so = true, desc = "Reduces the melee attack power of nearby enemies by 10 for 20 seconds."}), -- Demoralizing Shout
      Spell(15615, {so = true, flag1 = HEALER}), -- Pummel
      Spell(21049, {so = true, flag1 = MAGIC}), -- Bloodlust
    },
  },
  {
    name = "High Interrogator Gerstahn",
    desc = "The final boss of the Lower City section of the instance, usually most Looking for Dungeon groups go straight for her to finish up quickly and then queue again.",
    --icon = true,
    creature = 9018,
    display = 8761,
    coords = {0.476, 0.923, 1},
    loot = {11626,11625,11624,22240,},
    sections = {
      Spell(14033, {so = true, flag1 = INTERRUPT}), -- Mana Burn
      Spell(14032, {so = true, desc = "Utters a word of darkness, inflicting 6 Shadow damage to an enemy every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Shadow Word: Pain
      Spell(13704, {so = true, flag1 = MAGIC}), -- Psychic Scream
      Spell(12040, {so = true, desc = "Surrounds the caster with a shield woven of Shadow magic. The shield lasts 30 seconds and absorbs 200 damage.", flag1 = MAGIC}), -- Shadow Shield
    },
  },
  {
    name = "High Justice Grimstone",
    desc = "High Justice Grimstone can be found within the Ring of Law, also known as the arena. When you walk near the center of the room, he will start an event that will spawn random waves of mobs, then one of six possible bosses.",
    --icon = true,
    creature = 10096,
    display = 9329,
    coords = {0.504, 0.899, 2},
    loot = {11610,11633,11634,11635,11662,11665,11675,11677,11678,11679,11685,11686,11702,11703,11722,11726,11728,11729,11730,11731,11824,22257,22266,22270,22271,},
    sections = {
      Stage({
        stype = CREATURE,
        creature = 9031,
        display = 3004,
        name = "Anub'shiah",
        sections = {
          Spell(13787, {desc = "Protects the caster, increasing armor by 210, Shadow resistance by 3 and health regeneration by 7 for 30 minutes.", flag1 = MAGIC}), -- Demon Armor
          Spell(8994, {desc = "Banishes an enemy, preventing all action but making it invulnerable for up to 5 seconds.", flag1 = MAGIC}), -- Banish
          Spell(15471), -- Enveloping Web
          Spell(15470, {flag1 = CURSE}), -- Curse of Tongues
          Spell(12493, {desc = "Reduces the 1 Physical damage dealt by an enemy for 20 seconds.", flag1 = CURSE}), -- Curse of Weakness
          Spell(15472, {desc = "Hurls a bolt of dark magic at an enemy, inflicting 199 to 232 Shadow damage."}), -- Shadow Bolt
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9029,
        display = 523,
        name = "Eviscerator",
        sections = {
          Spell(7121, {desc = "Creates an anti-magic shell around Eviscerator, making him immune to magic for 6 seconds.", flag1 = DPS}), -- Anti-Magic Shield
          Spell(15245, {desc = "Hurls missiles of dark magic, inflicting 99 to 116 Shadow damage to nearby enemies."}), -- Shadow Bolt Volley
          Spell(14331, {desc = "Inflicts 18 Physical damage to an enemy every 3 seconds for 15 seconds. Stacks maximum 3 times.", flag1 = TANK}), -- Vicious Rend
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9027,
        display = 8760,
        name = "Gorosh the Dervish",
        sections = {
          Spell(16856, {flag1 = MAGIC}), -- Bloodlust
          Spell(21049, {flag1 = HEALER}), -- Mortal Strike
          Spell(13736, {desc = "Attacks nearby enemies in a whirlwind of steel that lasts 2 seconds and inflicts normal damage plus 300."}), -- Whirlwind (triggers 15589)
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9028,
        display = 7873,
        name = "Grizzle",
        sections = {
          Spell(40504, {flag1 = TANK}), -- Cleave
          Spell(6524), -- Ground Tremor
          Spell(8269, {desc = "Frenzies at low health, increases attack speed by 60% for 2 minutes.", flag1 = HEALER}), -- Frenzy
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9032,
        display = 8271,
        name = "Hedrum the Creeper",
        sections = {
          Spell(15475, {flag1 = POISON}), -- Baneful Poison
          Spell(3609, {flag1 = POISON}), -- Paralyzing Poison
          Spell(15474), -- Web Explosion
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9030,
        display = 11538,
        name = "Ok'thor the Breaker",
        sections = {
          Spell(15254, {desc = "Hurls a magical bolt at an enemy, inflicting 99 to 116 Arcane damage."}), -- Arcane Bolt
          Spell(15453, {desc = "Sends out a blast wave of magic, inflicting 124 to 145 Arcane damage to enemies within 30 yards."}), -- Arcane Explosion
          Spell(13323, {desc = "Transforms an enemy into a sheep, forcing it to wander around for up to 6 sec. While wandering, the sheep cannot attack or cast spells. Any damage will transform the target back into its normal form.", flag1 = MAGIC}), -- Polymorph
          Spell(13747, {flag1 = MAGIC}), -- Slow
        },
      }),
    },
  },
  {
    name = "Pyromancer Loregrain",
    desc = "Loregrain is located just past the arena, accessible after you've first defeated the random boss event. Run past the crowd on the top floor and you are on your right way.",
    --icon = true,
    creature = 9024,
    display = 8762,
    coords = {0.544, 0.960, 2},
    loot = {11747,11748,11750,11749,},
    sections = {
      Spell(15041, {so = true, desc = "Surrounds Loregrain with a shield that lasts 1 minute and absorbs 120 Fire damage.", flag1 = MAGIC}), -- Fire Ward
      Spell(15616, {so = true, desc = "Instantly burns an enemy for 49 to 58 Fire damage, then inflicts additional 9 Fire damage every 3 seconds for 12 seconds.", flag1 = MAGIC}), -- Flame Shock
      Spell(15095, {so = true, desc = "Burns an enemy, inflicting 66 to 77 Fire damage."}), -- Molten Blast
      --Spell(15038), -- Scorching Totem
      Stage({
        so = true,
        stype = CREATURE,
        creature = 9637,
        display = 4589,
        name = "Scorching Totem",
        desc = "Attacks enemies with Scorch, dealing 33 to 38 Fire damage each 2 seconds. The totem lasts 35 seconds.", -- 15037
      }),
    },
  },
  {
    name = "Warder Stilgiss and Verek",
    desc = "Warder Stilgiss and his pet darkhound Verek, are found in the Black Vault. They are protecting the coffer rooms and access to The Heart of the Mountain.",
    --icon = true,
    creature = 9041,
    display = 9089,
    coords = {0.596, 0.657, 2},
    loot = {11782,11783,11784,22241,},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 9041,
        display = 9089,
        name = "Warder Stilgiss",
        sections = {
          Spell(12544, {desc = "Encases the caster in a layer of frost that lasts 30 minutes. If an enemy strikes the caster, they may have their movement slowed by 30% and the time between their attacks increased by 20% for 5 seconds.", flag1 = MAGIC}), -- Frost Armor (triggers 6136)
          Spell(15044, {desc = "Surrounds the caster with a shield that lasts 1 minute and can absorb 120 Frost damage.", flag1 = MAGIC}), -- Frost Ward
          Spell(12674, {desc = "Inflicts 87 to 101 Frost damage to nearby enemies, immobilizing them for 8 seconds.", flag1 = MAGIC}), -- Frost Nova
          Spell(12675, {desc = "Inflicts 149 to 174 Frost damage to an enemy and reduces its movement speed by 50% for 4 seconds.", flag1 = MAGIC}), -- Frostbolt
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 9042,
        display = 9019,
        name = "Verek",
        sections = {
          Spell(15042, {desc = "Increases the Physical damage taken by an enemy by 1 for 20 seconds.", flag1 = CURSE}), -- Curse of Blood
          Spell(8599, {desc = "Enrages, increasing physical damage dealt by 10% and attack speed by 30% for 2 minutes.", flag1 = ENRAGE}), -- Enrage
        },
      }),
    },
  },
  {
    name = "Fineous Darkvire",
    desc = "Fineous Darkvire is the current Chief Architect of the Dark Iron dwarves in Shadowforge City. He is one of the most difficult bosses to handle at lower levels.",
    --icon = true,
    creature = 9056,
    display = 8704,
    coords = {0.633, 0.210, 1},
    loot = {22223,11841,11842,11839,},
    sections = {
      Spell(8258, {desc = "This passive aura grants him and nearby allies 20 bonus armor for 4 minutes."}), -- Devotion Aura
      Spell(15346, {so = true, desc = "Every time an enemy is struck the caster is healed for 8.", flag1 = MAGIC}), -- Seal of Reckoning
      Spell(15493, {so = true, desc = "Calls upon Holy magic to heal an ally for 185 to 215.", flag1 = INTERRUPT}), -- Holy Light
      Spell(11978, {so = true, flag1 = HEALER}), -- Kick
      Spell(13953, {so = true}), -- Holy Strike
    },
  },
  {
    name = "Lord Incendius",
    desc = "Lord Incendius can be found guarding the Black Anvil.",
    --icon = true,
    creature = 9017,
    display = 1204,
    coords = {0.565, 0.309, 1},
    loot = {11765,11767,11766,11764,19268,},
    sections = {
      Spell(26977, {so = true, desc = "Reduces the Fire Resistance of all enemies within 45 yards by 100 for 30 seconds. Stacks maximum 3 times.", flag1 = CURSE}), -- Curse of the Elemental Lord
      Spell(14099, {so = true, flag1 = TANK}), -- Mighty Blow
      Spell(13900, {so = true, desc = "Inflicts 510 to 690 Fire damage to all enemies in a selected area."}), -- Fiery Burst
      Spell(13899, {so = true}), -- Fire Storm
    },
  },
  {
    name = "General Angerforge",
    desc = "General Angerforge is the venerable general of the Dark Iron armies. He is located just past the arena and across the bridge. You can skip the arena event you are doing the upper city run by using the doors instead. Remember to use the mechanism to lower the bridge before heading out.",
    --icon = true,
    creature = 9033,
    display = 8756,
    coords = {0.364, 0.829, 2},
    loot = {11820,11817,11810,11816,11821,},
    sections = {
      Spell(15572, {flag1 = HEALER}), -- Sunder Armor
      Spell(17687, {desc = "Increases attack speed by 30% for 15 seconds, affecting up to 3 swings."}), -- Flurry
      Spell(15061, {desc = "Periodically enrages, increasing physical damage dealt by 1 and attack speed by 30% for 5 seconds."}), -- Enrage
      Stage({
        so = true,
        stype = CREATURE,
        creature = 8894,
        display = 8752,
        name = "Anvilrage Medic",
        desc = "Engages the players once General Angerforge reaches low health. He accompanied by several militia dwarves.",
        flag1 = IMPORTANT,
        sections = {
          Spell(15587, {desc = "Inflicts 49 to 58 Shadow damage to an enemy."}), -- Mind Blast
          Spell(15585, {desc = "Invokes Holy magic to heal allies within 30 yards for 217 to 252.", flag1 = INTERRUPT}), -- Prayer of Healing
          Spell(15586, {desc = "Calls upon Holy magic to heal an ally for 249 to 290.", flag1 = INTERRUPT}), -- Heal
          Spell(13864, {flag1 = MAGIC}), -- Power Word: Fortitude
        },
      })
    },
  },
  {
    name = "Golem Lord Argelmach",
    desc = "Golem Lord Argelmach can be found in a private room of the Manufactory, accompanied by two elite golems.",
    --icon = true,
    creature = 8983,
    display = 8759,
    coords = {0.364, 0.649, 2},
    loot = {11823,11669,11822,11819,},
    sections = {
      Spell(15507, {so = true, desc = "Surrounds the caster with 3 balls of lightning that have a 50% chance of striking melee or ranged attackers for Nature damage. Each time the lightning shield strikes, a ball of lightning dissipates.", flag1 = MAGIC}), -- Lightning Shield
      Spell(15305, {so = true, desc = "Strikes an enemy with a lightning bolt that deals 149 to 174 Nature damage and arcs to another nearby enemy. The spell affects up to 5 targets, inflicting greater Nature damage to each successive target."}), -- Chain Lightning
      Spell(15605, {desc = "Instantly throws a bolt of lightning at an enemy, inflicting 62 to 72 Nature damage."}), -- Shock
      Stage({
        so = true,
        stype = CREATURE,
        creature = 8906,
        display = 8177,
        name = "Ragereaver Golem",
        sections = {
          Spell(17687, {desc = "Increases attack speed by 30% for 15 seconds, affecting up to 3 swings."}), -- Flurry
          Spell(12795, {desc = "Enrages at low health, increasing damage dealt by 1 and attack speed by 30% for 2 minutes."}), -- Frenzy
        },
      }),
    },
  },
  {
    name = "Hurley Blackbreath",
    desc = "Engaged once the kegs of beer in the storage room have been destroyed. He is accompanied by four guards.",
    --icon = true,
    creature = 9537,
    display = 8658,
    coords = {0.477, 0.589, 2},
    loot = {22275,18044,18043,11735,},
    sections = {
      Spell(9573, {so = true, desc = "Inflicts 10 Fire damage to enemies in a cone in front of the caster."}), -- Flame Breath
      Spell(14872, {so = true}), -- Drunken Rage
      Stage({
        so = true,
        stype = CREATURE,
        creature = 9541,
        display = 8661,
        name = "Blackbreath Crony",
        sections = {
          Spell(15581, {so = true, desc = "Inflicts normal damage plus 3 to an enemy."}), -- Sinister Strike
          Spell(15583, {so = true, desc = "Inflicts 6 Physical damage to an enemy every 2 seconds for 10 seconds."}), -- Rupture
        },
      }),
    },
  },
  {
    name = "Ribbly Screwspigot",
    desc = "Ribbly Screwspigot hides from bounty hunters in the Grim Guzzler bar. You need to talk to him in order to engage the fight. He is accompanied by bodyguards.",
    --icon = true,
    creature = 9543,
    display = 8667,
    coords = {0.492, 0.670, 2},
    loot = {11742,11612,},
    sections = {
      Spell(12540, {so = true, flag1 = TANK}), -- Gouge
      Spell(9080, {so = true}), -- Hamstring
      Stage({
        so = true,
        stype = CREATURE,
        creature = 10043,
        display = 9233,
        name = "Ribbly's Crony",
        sections = {
          Spell(13298, {desc = "Inflicts 9 Nature damage to an enemy every 3 seconds for 15 seconds.", flag1 = POISON}), -- Poison
          Spell(15581, {desc = "Inflicts normal damage plus 3 to an enemy."}), -- Sinister Strike
          Spell(15692), -- Eviscerate
        },
      }),
    },
  },
  {
    name = "Plugger Spazzring",
    desc = "Plugger Spazzring supplies his Dark Iron dwarf patrons with mugs of ale, and holds the key to the bar door. While killing him may give access to the key, a rogue could simply pickpocket the key and sneak off. Once you engage Plugger Spazzring, nearby neutral dwarves will enter the fight and assist him. Alternatively you may talk to Private Rocknot nearby, and gain access further into the dungeon.",
    --icon = true,
    creature = 9499,
    display = 8652,
    coords = {0.505, 0.589, 2},
    loot = {12793,12791,},
    sections = {
      Spell(13787, {desc = "Protects the caster, increasing armor by 210, Shadow resistance by 3 and health regeneration by 7 for 30 minutes.", flag1 = MAGIC}), -- Demon Armor
      Spell(8994, {desc = "Banishes an enemy, preventing all action but making it invulnerable for up to 5 seconds.", flag1 = MAGIC}), -- Banish
      Spell(12742, {desc = "Burns an enemy for 66 to 77 Fire damage, then inflicts additional 9 Fire damage every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Immolate
      Spell(13338, {flag1 = CURSE}), -- Curse of Tongues
      Spell(12739, {desc = "Hurls a bolt of dark magic at an enemy, inflicting 99 to 116 Shadow damage."}), -- Shadow Bolt
    },
  },
  {
    name = "Phalanx",
    desc = "In order to fight Phalanx you need to talk to Private Rocknot and make him knock down the door. Phalanx will run to protect the door and become hostile. It is important you engage him before any other bosses, as he may reset back to being friendly due to several reasons.",
    --icon = true,
    creature = 9502,
    display = 8177,
    coords = {0.525, 0.643, 2},
    loot = {11745,11744,22212,},
    sections = {
      Spell(15588, {so = true, desc = "Inflicts 71 to 79 Nature damage to nearby enemies, increasing the time between their attacks by 33% and slowing their movement by 40% for 6 seconds.", flag1 = MAGIC}), -- Thunderclap
      Spell(14099, {so = true, desc = "Inflicts normal damage plus 25 to an enemy, knocking it back."}), -- Mighty Blow
      Spell(15285, {so = true, desc = "Inflicts 49 to 58 Fire damage to enemies within 20 yards."}), -- Fireball Volley
    },
  },
  {
    name = "Ambassador Flamelash",
    desc = "Ambassador Flamelash is a servant of Sulfuron Harbinger, and is the first Flamewalker to be encountered by adventurers.",
    --icon = true,
    creature = 9156,
    display = 8329,
    coords = {0.538, 0.487, 2},
    loot = {11812,11809,11814,11832,11808,},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 9178,
        display = 4607,
        name = "Burning Spirit",
        desc = "Once engaged, small burning spirits will swarm from edges of the room and walk toward Ambassador Flamelash. Once they reach him, he will absorb them and grow in size and power.",
        sections = {
          --Spell(13489), -- Burning Spirit
          Spell(14744, {so = true, desc = "Increases the damage dealt by Ambassador Flamelash by 5% for 3 minutes. Stacks maximum 50 times.", flag1 = IMPORTANT}), -- Burning Spirit
        },
      }),
    },
  },
  {
    name = "The Seven",
    desc = "The Seven consist of Anger'rel, Doom'rel, Dope'rel, Gloom'rel, Hate'rel, Seeth'rel and Vile'rel. Talking to Doom'rel will engage the encounter. Before doing that, Miner characters would want to talk to Gloom'rel first for a quest to learn to smelt dark iron ore.",
    --icon = true,
    creature = 9039,
    display = 8687,
    coords = {0.536, 0.244, 2},
    loot = {11922,11926,11925,11929,11921,11927,11923,11920,},
    sections = {
      Stage({
        stype = CREATURE,
        creature = 9035,
        display = 8686,
        name = "Anger'rel (Protection Warrior)",
        sections = {
          Spell(15061, {desc = "Periodically enrages, increasing physical damage dealt by 1 and attack speed by 30% for 5 seconds."}), -- Enrage
          Spell(11971, {flag1 = HEALER}), -- Sunder Armor
          Spell(15580, {desc = "Strikes at an enemy, inflicting normal damage plus 15."}), -- Strike
          Spell(12169), -- Shield Block
          Spell(15062), -- Shield Wall
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9039,
        display = 8687,
        name = "Doom'rel (Warlock)",
        sections = {
          Spell(15092, {desc = "Once engaged, summons three Voidwalkers to assist Doom'rel. The summons do not perform any special abilities."}), -- Summon Voidwalkers
          Spell(13787, {desc = "Protects the caster, increasing armor by 210, Shadow resistance by 3 and health regeneration by 7 for 30 minutes.", flag1 = MAGIC}), -- Demon Armor
          Spell(8994, {desc = "Banishes an enemy, preventing all action but making it invulnerable for up to 5 seconds.", flag1 = MAGIC}), -- Banish
          Spell(12493, {desc = "Reduces the 1 Physical damage dealt by an enemy for 20 seconds.", flag1 = CURSE}), -- Curse of Weakness
          Spell(12742, {desc = "Burns an enemy for 66 to 77 Fire damage, then inflicts additional 9 Fire damage every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Immolate
          Spell(15245, {desc = "Hurls missiles of dark magic, inflicting 99 to 116 Shadow damage to nearby enemies."}), -- Shadow Bolt Volley
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9040,
        display = 8688,
        name = "Dope'rel (Rogue)",
        sections = {
          Spell(15087), -- Evasion
          Spell(12540, {flag1 = TANK}), -- Gouge
          Spell(15581, {desc = "Inflicts normal damage plus 3 to an enemy."}), -- Sinister Strike
          Spell(15583, {desc = "Inflicts 6 Physical damage to an enemy every 2 seconds for 10 seconds."}), -- Rupture
          Spell(15582, {desc = "Inflicts normal attack damage plus 30 to an enemy, but only if attacking from behind."}), -- Backstab
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9037,
        display = 8689,
        name = "Gloom'rel (Arms Warrior)",
        sections = {
          Spell(13847, {desc = "Grants Glom'rel immunity to fear effects, all his attacks do critical hits but has his armor reduced by 35% for 15 seconds.", flag1 = IMPORTANT}), -- Recklessness
          Spell(40504, {flag1 = TANK}), -- Cleave
          Spell(13737, {flag1 = HEALER}), -- Mortal Strike
          Spell(9080), -- Hamstring
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9034,
        display = 8690,
        name = "Hate'rel",
        sections = {
          Spell(12040, {desc = "Surrounds the caster with a shield woven of Shadow magic. The shield lasts 30 seconds and absorbs 200 damage.", flag1 = MAGIC}), -- Shadow Shield
          Spell(15232, {desc = "Hurls a bolt of dark magic at an enemy, inflicting 149 to 174 Shadow damage."}), -- Shadow Bolt
          Spell(17687, {desc = "Increases attack speed by 30% for 15 seconds, affecting up to 3 swings."}), -- Flurry
          Spell(15580, {desc = "Strikes at an enemy, inflicting normal damage plus 15."}), -- Strike
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9038,
        display = 8691,
        name = "Seeth'rel (Frost Mage)",
        sections = {
          Spell(12544, {desc = "Encases the caster in a layer of frost that lasts 30 minutes. If an enemy strikes the caster, they may have their movement slowed by 30% and the time between their attacks increased by 20% for 5 seconds.", flag1 = MAGIC}), -- Frost Armor (triggers 6136)
          Spell(15244, {desc = "Inflicts 49 to 58 Frost damage to enemies in a cone in front of the caster, reducing their movement speed by 50% for 8 seconds.", flag1 = TANK}), -- Cone of Cold
          Spell(15044, {desc = "Surrounds the caster with a shield that lasts 1 minute and can absorb 120 Frost damage.", flag1 = MAGIC}), -- Frost Ward
          Spell(12674, {desc = "Inflicts 87 to 101 Frost damage to nearby enemies, immobilizing them for 8 seconds.", flag1 = MAGIC}), -- Frost Nova
          Spell(12675, {desc = "Inflicts 149 to 174 Frost damage to an enemy and reduces its movement speed by 50% for 4 seconds.", flag1 = MAGIC}), -- Frostbolt
          Spell(8364, {desc = "Calls down a blizzard that lasts 8 seconds, inflicting 4 Frost damage every 2 seconds to all enemies in a selected area."}), -- Blizzard
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 9036,
        display = 8692,
        name = "Vile'rel (Priest)",
        sections = {
          Spell(15587, {desc = "Inflicts 49 to 58 Shadow damage to an enemy."}), -- Mind Blast
          Spell(15586, {desc = "Calls upon Holy magic to heal an ally for 249 to 290.", flag1 = INTERRUPT}), -- Heal
          Spell(15585, {desc = "Invokes Holy magic to heal nearby party members for 217 to 252.", flag1 = INTERRUPT}), -- Prayer of Healing
          Spell(11974, {desc = "Wraps an ally in a shield that lasts up to 30 seconds, absorbing 137 damage.", flag1 = MAGIC}), -- Power Word: Shield
        },
      }),
    },
  },
  {
    name = "Magmus",
    desc = "Magmus protects the Emperor's Seat from penetration by any interested adventurers. When forced into battle, Magmus triggers statues in the Iron Hall to spew fire. The fire can be avoided by standing between statues while taking him down.\n\nIn order to fight him, you need to light two braziers in The Lyceum. You can do this by seeking out and defeating the patrolling Shadowforge Flame Keepers. The assigned party member has to loot the Shadowforge Torch and use it on one of the braziers.",
    --icon = true,
    creature = 9938,
    display = 12162,
    coords = {0.802, 0.116, 2},
    loot = {11935,22400,22208,11746,22395,},
    sections = {
      Spell(15668, {so = true, desc = "Inflicts 133 to 154 Fire damage to all enemies in a selected area."}), -- Fiery Burst
      Spell(15593, {so = true, desc = "Inflicts weapon damage plus 50 as Physical damage to nearby enemies, knocking them back and stunning them for 4 seconds."}), -- War Stomp
    },
  },
  {
    name = "Emperor Dagran Thaurissan",
    desc = "Dagran Thaurissan is the current ruler of the Dark Iron clan, a descendant of Emperor Thaurissan and Modgud. Even as the leader of his clan, he is, like all Dark Iron dwarves, a servant of Ragnaros. The Emperor rules his people not from the city founded by (and named for) his ancestor, but rather from the depths of Blackrock Mountain near the entrance to Ragnaros's domain, the Molten Core.\n\nThe Emperor seduced King Magni Bronzebeard's daughter, Princess Moira Bronzebeard, and she is now pregnant with his child, who is half Bronzebeard dwarf and half Dark Iron dwarf, and the heir to both thrones of Shadowforge and Ironforge.",
    --icon = true,
    creature = 9019,
    display = 8807,
    coords = {0.916, 0.116, 2},
    loot = {11684,11815,11924,11928,11930,11931,11932,11933,11934,12553,12554,12556,12557,22204,22207,},
    sections = {
      Stage({
        so = true,
        name = "Emperor Dagran Thaurissan",
        sections = {
          Spell(15636, {flag1 = IMPORTANT}), -- Avatar of Flame
          Spell(17492, {desc = "Inflicts 49 to 58 Fire damage to an enemy, stunning it for 5 seconds."}), -- Hand of Thaurissan
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 8929,
        display = 8705,
        name = "Princess Moira Bronzebeard", -- "High Priestess of Thaurissan" does no longer appear since the quests were removed and the lore broke with Cataclysm, good job!
        sections = {
          Spell(15587, {desc = "Inflicts 49 to 58 Shadow damage to an enemy."}), -- Mind Blast
          Spell(15537, {desc = "Hurls a bolt of dark magic at an enemy, inflicting 124 to 145 Shadow damage."}), -- Shadow Bolt
          Spell(15654, {desc = "Utters a word of darkness, inflicting 9 Shadow damage to an enemy every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Shadow Word: Pain
          Spell(8362, {desc = "Heals an ally for 5 every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Renew
          Spell(15586, {desc = "Calls upon Holy magic to heal an ally for 249 to 290.", flag1 = INTERRUPT}), -- Heal
        },
      }),
    },
  },
})

table.insert(db, BLACKROCK_DEPTHS)
