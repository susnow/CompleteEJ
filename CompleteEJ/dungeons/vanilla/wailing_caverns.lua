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

local WAILING_CAVERNS = CreateInstance({
  name = "Wailing Caverns",
  desc = "Recently, a night elf druid named Naralex discovered a network of underground caverns within the heart of the Barrens. Dubbed the 'Wailing Caverns', these natural caves were filled with steam fissures which produced long, mournful wails as they vented. Naralex believed he could use the caverns' underground springs to restore lushness and fertility to the Barrens - but to do so would require siphoning the energies of the fabled Emerald Dream. Once connected to the Dream however, the druid's vision somehow became a nightmare.\n\nSoon the Wailing Caverns began to change - the waters turned foul and the once-docile creatures inside metamorphosed into vicious, deadly predators. It is said that Naralex himself still resides somewhere inside the heart of the labyrinth, trapped beyond the edges of the Emerald Dream. Even his former acolytes have been corrupted by their master's waking nightmare - transformed into the wicked Druids of the Fang.",
  texture = "WailingCaverns",
  area = 749,
  dflag = N5,
}, {
  {
    name = "Lady Anacondra",
    desc = "She has three different potential spawn locations. Lady Anacondra is one of the Druids of the Fang Fanglords within the Wailing Caverns. She once was one of the Disciples of Naralex but was changed after Naralex connected with the Emerald Dream.",
    --icon = true,
    creature = 3671,
    display = 4313,
    coords = {0.307, 0.432, 1},
    loot = {5404,10412,6446,},
    sections = {
      Spell(20295, {desc = "Blasts an enemy with lightning, inflicting 49 to 58 Nature damage."}), -- Lightning Bolt
      Spell(8148, {desc = "Causes 20 Nature damage to melee attackers that strike allies afflicted by this aura."}), -- Thorns Aura
      Spell(8040, {desc = "Puts the enemy target to sleep for 6 seconds. Any damage will break the effect.", flag1 = MAGIC}), -- Druid's Slumber
      Spell(23381, {desc = "Calls upon Nature magic to heal an ally for 152 to 177."}), -- Healing Touch
    },
  },
  {
    name = "Kresh",
    desc = "Oddly, the turtles that inhabit the Wailing Caverns were not affected by Naralex's nightmare. Oblivious to the evil around him, the ancient tortoise Kresh wanders the caverns living his life normally.",
    --icon = true,
    creature = 3653,
    display = 5126,
    coords = {0.243, 0.455, 1},
    loot = {6447,13245,},
    sections = {
      Stage({
        so = true,
        name = "Auto Attack",
        desc = "Does not perform any special abilities.",
      }),
    },
  },
  {
    name = "Lord Pythas",
    desc = "A seasoned warrior and once one of Naralex's personal guard, the corrupted Lord Pythas now uses his skills in battle to aid the Druids of the Fang.",
    --icon = true,
    creature = 3670,
    display = 4214,
    coords = {0.189, 0.400, 1},
    loot = {6472,6473,},
    sections = {
      Spell(20805, {desc = "Blasts an enemy with lightning, inflicting 60 to 70 Nature damage."}), -- Lightning Bolt
      Spell(8147, {desc = "Inflicts 71 to 79 Nature damage to enemies within 10 yards, increasing the time between their attacks by 40% and slowing their movement by 40% for 6 seconds.", flag1 = MAGIC}), -- Thunderclap
      Spell(8040, {desc = "Puts the enemy target to sleep for 6 seconds. Any damage will break the effect.", flag1 = MAGIC}), -- Druid's Slumber
      Spell(11431, {desc = "Calls upon Nature magic to heal an ally for 108 to 125."}), -- Healing Touch
    },
  },
  {
    name = "Lord Cobrahn",
    desc = "One of the leaders in the Wailing Caverns. His unique traits that differ him from the other druids is a claw on his right hand, is surrounded by deviate pythons, and is much larger in size than the other druids.",
    --icon = true,
    creature = 3669,
    display = 4213,
    coords = {0.160, 0.568, 1},
    loot = {6465,10410,6460,},
    sections = {
      Spell(20805, {desc = "Blasts an enemy with lightning, inflicting 60 to 70 Nature damage."}), -- Lightning Bolt
      Spell(744, {desc = "Inflicts 4 Nature damage to an enemy every 3 seconds for 15 seconds. Stacks maximum 5 times.", flag1 = POISON}), -- Poison
      Spell(8040, {desc = "Puts the enemy target to sleep for 6 seconds. Any damage will break the effect.", flag1 = MAGIC}), -- Druid's Slumber
      Spell(23381, {desc = "Calls upon Nature magic to heal an ally for 152 to 177."}), -- Healing Touch
      Spell(7965, {name = "Serpent Form", desc = "Shapeshifts into a serpent for 5 minutes, increasing damage done by 50, and slows attack speed by 30%."}, 1), -- Cobrahn Serpent Form
    },
  },
  {
    name = "Skum",
    desc = "A great thunder lizard captured from the vast plains of the Barrens, Skum has quickly become Lord Pythas' favorite pet. Strengthened by the corruption of Naralex's nightmare, Skum is a vicious beast, and should not be underestimated.",
    --icon = true,
    creature = 3674,
    display = 4203,
    coords = {0.620, 0.743, 1},
    loot = {6448,6449,},
    sections = {
      Spell(6254, {so = true}), -- Chained Bolt
    },
  },
  {
    name = "Deviate Faerie Dragon (Rare)",
    desc = "Even faerie dragons do not escape from the evil force of Naralex's nightmare. It is said that the faerie dragon and the thunder lizard, Skum, are pets of Lord Pythas.\n\nAs a rare spawn, this mob will not always be in the instance. Some estimates place his spawn rate at between 5 to 10%. He is a solitary mob, and is always located on the side heading towards Lord Serpentis.",
    --icon = true,
    creature = 5912,
    display = 1267,
    coords = {0.725, 0.743, 1},
    loot = {6632,5243,},
    sections = {
      Stage({
        so = true,
        name = "Auto Attack",
        desc = "Does not perform any special abilities.",
      }),
    },
  },
  {
    name = "Lord Serpentis",
    desc = "Once a druid of great power and prestige, Lord Serpentis has been corrupted by Naralex's nightmare and now leads the Druids of the Fang.",
    --icon = true,
    creature = 3673,
    display = 4215,
    coords = {0.616, 0.536, 1},
    loot = {10411,6469,5970,6459,},
    sections = {
      Spell(12167, {desc = "Blasts an enemy with lightning, inflicting 74 to 84 Nature damage."}), -- Lightning Bolt
      Spell(8040, {desc = "Puts the enemy target to sleep for 6 seconds. Any damage will break the effect.", flag1 = MAGIC}), -- Druid's Slumber
      Spell(23381, {desc = "Calls upon Nature magic to heal an ally for 152 to 177."}), -- Healing Touch
    },
  },
  {
    name = "Verdan the Everliving",
    desc = "Formed long ago from the lush foliage of the Wailing Caverns, the massive elemental Verdan the Everliving was once the Caverns' guardian. Corrupted by Naralex's nightmare, the once gentle giant is now an enormous abomination that will crush any living creature that ventures too close to his lair.",
    --icon = true,
    creature = 5775,
    display = 4256,
    coords = {0.552, 0.466, 1},
    loot = {6630,6629,6631,},
    sections = {
      Spell(8142, {so = true, desc = "Inflicts 150 to 250 Physical damage to enemies within 10 yards, knocking them down stunning them for 2 seconds, and immobilizing them for 5 seconds.", flag1 = MAGIC}), -- Grasping Vines
    },
  },
  {
    name = "Mutanus the Devourer",
    desc = "Mutanus appears to disrupt any attempt by the Disciple of Naralex to wake the sleeping Naralex. Manifested from Naralex's Nightmare, Mutanus the Devourer has been ordered by whatever force has infected Naralex’s dreams to prevent anyone from awakening him. Mutanus appears as a colossal albino Murloc.\n\nMutanus is the final boss in Wailing Caverns. You must return to the entrance to summon him. He'll appear during the Naralex event after 2 waves of smaller mobs. He hits quite hard, and if he catches you off-guard, he could potentially wipe out your group. Make sure you eat and drink before he spawns. Mutanus has a powerful sleep spell called Delusions of Naralex which he will sometimes cast during the fight. Only enter at full health.",
    --icon = true,
    creature = 3654,
    display = 4088,
    coords = {0.343, 0.139, 1},
    loot = {6627,6463,6461,},
    sections = {
      Spell(8150, {desc = "Inflicts 94 to 106 Nature damage to enemies within 20 yards, stunning them for 2 seconds.", flag1 = MAGIC}), -- Thundercrack
      Spell(7967, {desc = "Puts the enemy target to sleep for 8 seconds. Any damage will break the effect.", flag1 = MAGIC}), -- Naralex's Nightmare
      Spell(7399, {desc = "Terrifies an enemy, causing it to flee in fear for 3 seconds.", flag1 = MAGIC}), -- Terrify
    },
  },
})

table.insert(db, WAILING_CAVERNS)
