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

local RAZORFEN_KRAUL = CreateInstance({
  name = "Razorfen Kraul",
  desc = "Ten thousand years ago - during the War of the Ancients, the mighty demigod, Agamaggan, came forth to battle the Burning Legion. Though the colossal boar fell in combat, his actions helped save Azeroth from ruin. Yet over time, in the areas where his blood fell, massive thorn-ridden vines sprouted from the earth. The quilboar - believed to be the mortal offspring of the mighty god, came to occupy these regions and hold them sacred. The heart of these thorn-colonies was known as the Razorfen. The great mass of Razorfen Kraul was conquered by the old crone, Charlga Razorflank. Under her rule, the shamanistic quilboar stage attacks on rival tribes as well as Horde villages. Some speculate that Charlga has even been negotiating with agents of the Scourge - aligning her unsuspecting tribe with the ranks of the Undead for some insidious purpose.",
  texture = "RazorfenKraul",
  area = 761,
  dflag = N5,
}, {
  {
    name = "Roogug",
    desc = "Roogug and his Stone Rumbler pet can be found to the left on the first split road you encounter.",
    --icon = true,
    creature = 6168,
    display = 6110,
    coords = {0.644, 0.427, 1},
    loot = {},
    sections = {
      Spell(20824, {so = true, desc = "Blasts an enemy with lightning, inflicting 69 to 81 Nature damage."}), -- Lightning Bolt
      --Spell(8270), -- Summon Earth Rumbler
      Stage({
        so = true,
        stype = CREATURE,
        creature = 4528,
        display = 9589,
        name = "Stone Rumbler",
        desc = "Does not perform any special abilities.",
      }),
    },
  },
  {
    name = "Aggem Thorncurse",
    desc = "Prophet of the Death's Head tribe. Masters the ability to summon Boar Spirits to assist him in combat.",
    --icon = true,
    creature = 4424,
    display = 6097,
    coords = {0.807, 0.515, 1},
    loot = {6681,},
    sections = {
      Spell(14900, {so = true, desc = "Infuses a wounded ally with healing energy, healing it for 100 and spreading to another nearby ally. The spell affects up to 3 targets, but the healing energy is diminished by 50% for each successive target.", flag1 = INTERRUPT}), -- Chain Heal
      Spell(30931, {so = true}), -- Battle Shout
      Spell(8286, {so = true, desc = "Summons a Boar Spirit to aid Aggem Thorncurse for 1 minute.", sections = {
        Stage({
          so = true,
          stype = CREATURE,
          creature = 6021,
          display = 4716,
          name = "Boar Spirit",
          desc = "Does not perform any special abilities.",
        }),
      }}), -- Summon Boar Spirit
    },
  },
  {
    name = "Death Speaker Jargba",
    desc = "Jargba is a Death Speaker, a prophet of the Quilboar religion which preaches their fallen god Agamaggan will rise from the dead. As such, he is a combination of priest and powerful warrior.",
    --icon = true,
    creature = 4428,
    display = 4644,
    coords = {0.874, 0.416, 1},
    loot = {6685,6682,2816,},
    sections = {
      Spell(7645, {so = true, desc = "Takes control of a humanoid enemy for 10 seconds, but increases the time between its attacks by 100%.", flag1 = MAGIC}), -- Dominate Mind
      Spell(20825, {so = true, desc = "Hurls a bolt of dark magic at an enemy, inflicting 69 to 81 Shadow damage."}), -- Shadow Bolt
    },
  },
  {
    name = "Overlord Ramtusk",
    desc = "Overlord Ramtusk is accompanied by two Razorfen Spearhide guards.",
    --icon = true,
    creature = 4420,
    display = 4652,
    coords = {0.573, 0.309, 1},
    loot = {6679,6686,6687,},
    sections = {
      Spell(15548, {so = true, desc = "Inflicts 35 to 39 Nature damage to nearby enemies, increasing the time between their attacks by 33% and slowing their movement speed by 40% for 6 sec.", flag1 = MAGIC}), -- Thunderclap
      Spell(9128, {so = true, desc = "Increases the melee attack power of nearby party members by 4 for 2 min."}), -- Battle Shout
      --Spell(7165), -- Battle Stance
      Stage({
        so = true,
        stype = CREATURE,
        creature = 4438,
        display = 6078,
        name = "Razorfen Spearhide",
        sections = {
          Spell(8148, {desc = "Causes 20 Nature damage to anyone that strikes the caster or nearby allies."}), -- Thorns Aura
          Spell(8259, {desc = "Inflicts normal damage plus 50 to enemies within 30 yards."}), -- Whirling Barrage
        },
      }),
    },
  },
  {
    name = "Earthcaller Halmgar (Rare)",
    desc = "A rare spawn that spawns on the platform across the first bridge, right after Overlord Ramtusk. Accompanied by a Earth Rumbler.",
    --icon = true,
    creature = 4842,
    display = 6102,
    coords = {0.487, 0.458, 1},
    loot = {6688,6689,},
    sections = {
      Spell(20824, {so = true, desc = "Blasts an enemy with lightning, inflicting 69 to 81 Nature damage."}), -- Lightning Bolt
      --Spell(8270), -- Summon Earth Rumbler
      Stage({
        so = true,
        stype = CREATURE,
        creature = 4528,
        display = 9589,
        name = "Stone Rumbler",
        desc = "Does not perform any special abilities.",
      }),
      --Spell(2484, {so = true, desc = "Summons an Earthbind Totem with 5 health at the feet of the caster for 45 seconds."}), -- Earthbind Totem
      Stage({
        so = true,
        stype = CREATURE,
        creature = 2630,
        display = 4588,
        name = "Earthbind Totem",
        desc = "Summons an Earthbind Totem with 5 health at the feet of the caster for 45 seconds.",
        sections = {
          Spell(3600, {desc = "Reduces the movement speed of all nearby enemies by 50% for 5 seconds.", flag1 = MAGIC}), -- Earthbind
          Spell(64695, {desc = "Occasionally roots nearby enemies for 5 seconds.", flag1 = MAGIC}), -- Earthgrab
        },
      }),
    },
  },
  {
    name = "Agathelos the Raging",
    desc = "Agathelos is a truly collosal armoured boar roughly twice the size of a common thunder lizard, and becomes even bigger when enraged. He is kept in a short tunnel guarded by several quilboar who maintain a field to keep the monstrous creature penned in.\n\nGiven that the god and progenitor of the Quilboar is Agamaggan, a titanic boar, an animal such as Agathelos is one of considerable spiritual significance.",
    --icon = true,
    creature = 4422,
    display = 2450,
    coords = {0.080, 0.683, 1},
    loot = {6691,6690,},
    sections = {
      Spell(8555, {so = true, desc = "Inflicts 200 damage to an enemy and forces it to feign death for up to 5 minutes. This wipes any threat that enemy had with Agathelos.", flag1 = TANK}), -- Left for Dead
      Spell(8285, {so = true}), -- Rampage
      Spell(8260, {desc = "Rushes over to his target, moving 60% faster and inflicting 10% additional damage on first attack."}), -- Rushing Charge
      Spell(8269), -- Frenzy
    },
  },
  {
    name = "Blind Hunter (Rare)",
    desc = "A rare bat that spawns in the alcove right before Charlga Razorflank.",
    --icon = true,
    creature = 4425,
    display = 4735,
    coords = {0.112, 0.316, 1},
    loot = {6695,6696,6697,},
    sections = {
      Stage({
        so = true,
        name = "Auto Attack",
        desc = "Does not perform any special abilities.",
      }),
    },
  },
  {
    name = "Charlga Razorflank",
    desc = "The great mass of Razorfen Kraul was conquered by the old crone, Charlga Razorflank. Under her rule, the shamanistic quilboar stage attacks on rival tribes as well as Horde villages. Some speculate that Charlga has even been negotiating with agents of the Scourge - aligning her unsuspecting tribe with the ranks of the Undead for some insidious purpose. Charlga is a tenacious leader and an extremely powerful geomancer.",
    --icon = true,
    creature = 4421,
    display = 31042,
    coords = {0.219, 0.309, 1},
    loot = {5793,6693,6694,6692,},
    sections = {
      Spell(8292, {so = true}), -- Chain Bolt
      Spell(25058, {so = true, desc = "Heals herself for 200 over 15 seconds.", flag1 = MAGIC}), -- Renew
      Spell(8361, {so = true}), -- Purity
      Spell(8358, {desc = "Fully restores her mana."}), -- Mana Spike
    },
  },
})

table.insert(db, RAZORFEN_KRAUL)
