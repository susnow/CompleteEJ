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

local ZULFARRAK = CreateInstance({
  name = "Zul'Farrak",
  desc = "This sun-blasted city is home to the Sandfury trolls, known for their particular ruthlessness and dark mysticism. Troll legends tell of a powerful sword called Sul'thraze the Lasher, a weapon capable of instilling fear and weakness in even the most formidable of foes. Long ago, the weapon was split in half. However, rumors have circulated that the two halves may be found somewhere within Zul'Farrak's walls. Reports have also suggested that a band of mercenaries fleeing Gadgetzan wandered into the city and became trapped. Their fate remains unknown. But perhaps most disturbing of all are the hushed whispers of an ancient creature sleeping within a sacred pool at the city's heart - a mighty demigod who will wreak untold destruction upon any adventurer foolish enough to awaken him.",
  texture = "ZulFarrak",
  area = 686,
  dflag = N5,
}, {
  {
    name = "Zerillis (Rare)",
    desc = "A rare spawn that appears on the road west of the intersection. Being ranged he is subjected to a deadzone.",
    --icon = true,
    creature = 10082,
    display = 9293,
    coords = {0.522, 0.424, 0},
    loot = {12470,},
    sections = {
      Spell(12551, {so = true, desc = "Shoots at an enemy, inflicting weapon damage as Frost damage and slowing its movement by 60% for 10 seconds.", flag1 = MAGIC}), -- Frost Shot
      Spell(15547, {so = true, desc = "Shoots at an enemy, inflicting 37 to 43 Physical damage."}), -- Shoot
      Spell(6533, {so = true}), -- Net
    },
  },
  {
    name = "Sandarr Dunereaver (Rare)",
    desc = "A rare spawn that appears on the road west of the intersection.",
    --icon = true,
    creature = 10080,
    display = 9291,
    coords = {0.459, 0.562, 0},
    loot = {862,2040,5616,6440,9243,9480,9481,9482,9483,9484,9511,9512,},
    sections = {
      Spell(15615, {so = true, flag1 = HEALER}), -- Pummel
      Spell(13730, {so = true}), -- Demoralizing Shout
      Spell(14516, {so = true, desc = "Strikes at an enemy, inflicting weapon damage plus 10."}), -- Strike
    },
  },
  {
    name = "Theka the Martyr",
    desc = "Not a traditional boss because he has no drops. Be causious because nearby Scarabs will aggro if not careful.",
    --icon = true,
    creature = 7272,
    display = 6696,
    coords = {0.545, 0.267, 0},
    loot = {},
    sections = {
      Spell(8600, {so = true, flag1 = DISEASE}), -- Fevered Plague
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7269,
        display = 7470,
        name = "Scarab",
        desc = "If a Scarab is attacked, nearby Scarabs will assist it.",
        sections = {
          Spell(3256, {so = true, desc = "Reduces Strength, Agility and Intellect by 4 for all enemies nearby for 20 seconds."}), -- Plague Cloud
        },
      }),
    },
  },
  {
    name = "Antu'sul",
    desc = "Once his cave is approached he will come out by himself and attack the players.",
    --icon = true,
    creature = 8127,
    display = 7353,
    coords = {0.643, 0.275, 0},
    loot = {9639,9641,9640,9379,},
    sections = {
      Spell(16006, {desc = "Strikes an enemy with a lightning bolt that arcs to another nearby enemy. The spell affects up to 3 targets, causing 99 to 116 Nature damage to each."}), -- Chain Lightning
      Spell(15501, {desc = "Shocks an enemy with concussive force, inflicting 37 to 43 Nature damage and interrupting the spell being cast for 2 seconds."}), -- Earth Shock
      Spell(12491, {desc = "Calls upon Nature magic to heal an ally for 148 to 172.", flag1 = INTERRUPT}), -- Healing Wave
      Spell(11895, {flag1 = INTERRUPT}), -- Healing Wave of Antu'sul
      --Spell(8376), -- Earthgrab Totem
      Stage({
        stype = CREATURE,
        creature = 8179,
        display = 2030,
        name = "Earthgrab Totem",
        desc = "Summons an Earthgrab Totem that lasts 30 seconds and periodically immobilizes nearby enemies.",
      }),
      --Spell(32062), -- Fire Nova Totem
      Stage({
        stype = CREATURE,
        creature = 8179,
        display = 2030,
        name = "Fire Nova Totem",
        desc = "Summons a Fire Nova Totem that has 5 health and lasts 6 seconds. Uses Fire Nova after 6 seconds.",
        sections = {
          Spell(96004, {so = true, desc = "Inflicts 33 to 38 Fire damage to nearby enemies."}), -- Fire Nova
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 8179,
        display = 2030,
        name = "Greater Healing Ward",
        desc = "Summons a ward that lasts 30 seconds and periodically heals allies in an area around it.",
      }),
      --Spell(11894), -- Antu'sul's Minion
      Stage({
        stype = CREATURE,
        creature = 8156,
        display = 601,
        name = "Servant of Antu'sul",
        desc = "Summons four minions to assist him.",
        sections = {
          Spell(11020, {so = true, flag1 = MAGIC}), -- Petrify
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 8138,
        display = 1075,
        name = "Sul'lithuz Broodling",
        desc = "At low health he will summon eight to ten broodlings.",
      }),
    },
  },
  {
    name = "Witch Doctor Zum'rah",
    desc = "Turns hostile when you run up to him.",
    --icon = true,
    creature = 7271,
    display = 6434,
    coords = {0.441, 0.176, 0},
    loot = {18082,18083,},
    sections = {
      Spell(12739, {so = true, desc = "Hurls a bolt of dark magic at an enemy, inflicting 99 to 116 Shadow damage."}), -- Shadow Bolt
      Spell(15245, {so = true, desc = "Hurls missiles of dark magic, inflicting 99 to 116 Shadow damage to nearby enemies."}), -- Shadow Bolt Volley
      Spell(12491, {so = true, desc = "Calls upon Nature magic to heal an ally for 148 to 172.", flag1 = INTERRUPT}), -- Healing Wave
      --Spell(11086, {so = true, desc = "Casts a Ward of Zum'rah totem, which lasts 20 seconds and periodically summons a Skeleton of Zum'rah. Each Skeleton lasts 20 seconds."}), -- Ward of Zum'rah
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7785,
        display = 2418,
        name = "Ward of Zum'rah",
        desc = "Casts a Ward of Zum'rah totem, which lasts 20 seconds and periodically summons a Skeleton of Zum'rah. Each Skeleton lasts 20 seconds.",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 7786,
            display = 200,
            name = "Skeleton of Zum'rah",
            desc = "Does not perform any special abilities.",
          }),
        },
      }),
    },
  },
  {
    name = "Sandfury Executioner",
    desc = "Once defeated, you can free the prisoners and start the event where you and your group must defeat waves of trolls, before you can fight Nekrum Gutchewer and Shadowpriest Sezz'ziz.",
    --icon = true,
    creature = 7274,
    display = 6440,
    coords = {0.237, 0.178, 0},
    loot = {8444},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7274,
        display = 6440,
        name = "Sandfury Executioner",
        sections = {
          Spell(15496, {so = true}), -- Cleave
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 8876,
        display = 6411,
        name = "Sandfury Acolyte",
        sections = {
          Spell(11981, {flag1 = IMPORTANT}), -- Mana Burn
          Spell(11980, {flag1 = CURSE}), -- Curse of Weakness
          Spell(11639, {desc = "Utters a word of darkness, inflicting 4 Shadow damage to an enemy every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Shadow Word: Pain
          Spell(9613, {desc = "Hurls a bolt of dark magic at an enemy, inflicting 37 to 43 Shadow damage."}), -- Shadow Bolt
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 7789,
        display = 6682,
        name = "Sandfury Cretin",
        sections = {
          Spell(20798, {desc = "Increases the caster's armor by 40 and speeds its health regeneration by 3 per 5 seconds for 30 minutes.", flag1 = MAGIC}), -- Demon Skin
          Spell(14032, {desc = "Utters a word of darkness, inflicting 6 Shadow damage to an enemy every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Shadow Word: Pain
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 7788,
        display = 6680,
        name = "Sandfury Drudge",
        desc = "Does not perform any special abilities.",
      }),
      Stage({
        stype = CREATURE,
        creature = 7787,
        display = 6678,
        name = "Sandfury Slave",
        desc = "Does not perform any special abilities.",
      }),
      Stage({
        stype = CREATURE,
        creature = 8877,
        display = 6423,
        name = "Sandfury Zealot",
        sections = {
          Spell(8599, {so = true, desc = "Enrages the caster at low health, increasing physical damage done by 10% and attack speed by 30% for 2 minutes.", flag1 = ENRAGE}), -- Enrage
        },
      }),
    },
  },
  {
    name = "Nekrum and Sezz'ziz",
    desc = "Once you have defeated the Sandfury Executioner and the waves of trolls, you may finally face two of the most important figures in the Sandfury tribe.",
    --icon = true,
    creature = 7796,
    display = 6690,
    coords = {0.300, 0.124, 0},
    loot = {9474,9470,9473,9475,},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7796,
        display = 6690,
        name = "Nekrum Gutchewer",
        sections = {
          Spell(8600, {flag1 = DISEASE}), -- Fevered Plague
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7275,
        display = 6441,
        name = "Shadowpriest Sezz'ziz",
        sections = {
          Spell(12739, {desc = "Hurls a bolt of dark magic at an enemy, inflicting 99 to 116 Shadow damage."}), -- Shadow Bolt
          Spell(13704, {flag1 = MAGIC}), -- Psychic Scream
          Spell(12039, {desc = "Calls upon Holy magic to heal an ally for 186 to 217.", flag1 = INTERRUPT}), -- Heal
          Spell(8362, {desc = "Heals an ally for 5 health every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Renew
        },
      }),
    },
  },
  {
    name = "Sergeant Bly and Co.",
    desc = "This infamous group of mercenaries, led by Sergeant Bly, are prisoners of the Sandfury Tribe, awaiting their deaths at the hands of the Sandfury Executioner. Once rescued from death, and Nekrum Gutchewer and Shadowpriest Sezz'ziz both are defeated, you can question Sergeant Bly about the Divino-matic Rod and he and his party will turn on you.\n\nBeware, talk to Weegli Blastfuse first while he is on your side, to blow up the gate to the final boss of Zul'Farrak.",
    --icon = true,
    creature = 7604,
    display = 6433,
    coords = {0.300, 0.228, 0},
    loot = {8548,},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7604,
        display = 6433,
        name = "Sergeant Bly (Warrior)",
        sections = {
          Spell(11972, {flag1 = HEALER}), -- Shield Bash
          Spell(12170, {desc = "Instantly counterattack an enemy to deal 16 to 19 damage, used after a block, dodge or parry."}), -- Revenge
          Spell(3639, {desc = "Increases Sergeant Bly's chance to block by 85% for 6 seconds."}), -- Improved Blocking
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7605,
        display = 6435,
        name = "Raven (Rogue)",
        sections = {
          Spell(12540), -- Gouge
          Spell(7159, {desc = "Inflicts 10 damage and additional bonus damage to an enemy, but only if attacking from behind."}), -- Backstab
          Spell(744, {desc = "Inflicts 4 Nature damage to an enemy every 3 seconds for 15 seconds. Stacks maximum 5 times.", flag1 = POISON}), -- Poison
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7608,
        display = 6438,
        name = "Murta Grimgut (Priest)",
        sections = {
          Spell(11642, {desc = "Calls upon Holy magic to heal an ally for 124 to 145.", flag1 = INTERRUPT}), -- Heal
          Spell(11640, {desc = "Heals an ally 20 every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Renew
          Spell(11974, {desc = "Wraps an ally in a shield that lasts up to 30 seconds, absorbing 137 damage.", flag1 = MAGIC}), -- Power Word: Shield
          Spell(9734, {desc = "Smites an enemy, inflicting 41 to 48 Holy damage."}), -- Holy Smite
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7606,
        display = 6432,
        name = "Oro Eyegouge (Warlock)",
        sections = {
          Spell(12741, {desc = "Reduces the Physical damage dealt by nearby enemies by 1 for 20 seconds.", flag1 = CURSE}), -- Curse of Weakness
          Spell(11990, {desc = "Calls down a molten rain, burning all enemies in a selected area, dealing 3 Fire damage every 3 seconds for 9 seconds."}), -- Rain of Fire
          Spell(11962, {desc = "Burns an enemy for 33 to 38 Fire damage, then inflicts additional 4 Fire damage every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Immolate
          Spell(9613, {desc = "Hurls a bolt of dark magic at an enemy, inflicting 37 to 43 Shadow damage."}), -- Shadow Bolt
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7607,
        display = 7222,
        name = "Weegli Blastfuse (Goblin Tinker)",
        sections = {
          Spell(6660, {desc = "Shoots at an enemy, inflicting 24 to 29 Physical damage."}), -- Shoot
          Spell(8858, {desc = "Bombs all enemies in a selected area, inflicting weapon damage as Fire damage."}), -- Bomb
          Spell(21688, {flag1 = IMPORTANT}), -- Goblin Land Mine
          --Spell(10772), -- Plant explosives
        },
      }),
    },
  },
  {
    name = "Hydromancer Velratha",
    desc = "Hydromancer Velratha seems to be a prominent member of the sand troll priestly order, perhaps commanding the Zealots and Acolytes who are so numerous in Zul'Farrak, or presiding over the secret rituals surrounding the mysterious Gahz'rilla.",
    --icon = true,
    creature = 7795,
    display = 6685,
    coords = {0.250, 0.361, 0},
    loot = {9234,10661,71637,},
    sections = {
      Spell(78802, {so = true}), -- Crashing Wave
      Spell(78801, {so = true, desc = "Hurls a watery bolt at an enemy, inflicting 83 to 96 Frost damage."}), -- Water Bolt
      Spell(12491, {so = true, desc = "Calls upon Nature magic to heal an ally for 148 to 172.", flag1 = INTERRUPT}), -- Healing Wave
    },
  },
  {
    name = "Gahz'rilla",
    desc = "Long ago, when trolls used to occupy the land of Tanaris, they built up Zul'Farrak, the sand troll city in Tanaris, with a sacred pool. From that pool the trolls summoned the huge hydra Gahz'rilla, so fierce that even his scales crackle with energy. The trolls worshipped him as a deity, but the summoning of Gahz'rilla is a well-kept secret of the trolls. Gahz'rilla is said to be a demigod.",
    --icon = true,
    creature = 7273,
    display = 7271,
    coords = {0.312, 0.411, 0},
    loot = {8707,9467,9469,71636,},
    sections = {
      Spell(11131, {so = true}), -- Icicle
      Spell(11836, {so = true, desc = "Stuns an enemy and inflicts 93 to 107 Frost damage every 2 seconds for 6 seconds.", flag1 = MAGIC}), -- Freeze Solid
      Spell(11902, {so = true, desc = "Inflicts normal damage plus 50 to nearby enemies and knocks them high up in the air, taking falldamage as they hit the ground.", flag1 = DEADLY}), -- Gahz'rilla Slam
    },
  },
  {
    name = "Chief Ukorz Sandscalp",
    desc = "Chief Ukorz Sandscalp is the chief of the Sandfury Tribe and ruler of their city, Zul'Farrak. He can be accessed by talking to Weegli Blastfuse, you have to kill the Sandfury Executioner for that. He is also accompanied by Ruuzlu, who is presumably a retainer or perhaps a relative.",
    --icon = true,
    creature = 7267,
    display = 6439,
    coords = {0.423, 0.338, 0},
    loot = {9243,9477,9479,9478,11086,9476,},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7267,
        display = 6439,
        name = "Chief Ukorz Sandscalp",
        sections = {
          Spell(15496, {flag1 = TANK}), -- Cleave
          Spell(11837, {flag1 = TANK}), -- Wide Slash
          Spell(8269, {desc = "Frenzies at low health, increasing attack speed by 60% for 2 minutes."}), -- Frenzy
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7797,
        display = 6687,
        name = "Ruuzlu",
        sections = {
          Spell(15496, {flag1 = TANK}), -- Cleave
          Spell(77720, {flag1 = HEALER}), -- Execute
        },
      }),
    },
  },
})

table.insert(db, ZULFARRAK)
