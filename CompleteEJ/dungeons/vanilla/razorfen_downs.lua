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

local RAZORFEN_DOWNS = CreateInstance({
  name = "Razorfen Downs",
  desc = "Crafted from the same mighty vines as Razorfen Kraul, Razorfen Downs is the traditional capital city of the quilboar race. The sprawling, thorn-ridden labyrinth houses a veritable army of loyal quilboar as well as their high priests - the Death's Head tribe. Recently, however, a looming shadow has fallen over the crude den. Agents of the undead Scourge - led by the lich, Amnennar the Coldbringer - have taken control over the quilboar race and turned the maze of thorns into a bastion of undead might. Now the quilboar fight a desperate battle to reclaim their beloved city before Amnennar spreads his control across the Barrens.",
  texture = "RazorfenDowns",
  area = 760,
  dflag = N5,
}, {
  {
    name = "Tuten'kash",
    desc = "This crypt fiend can be spawned by hitting the gong in The Caller's Chamber. Before you face him you will face two waves of his minions.",
    --icon = true,
    creature = 7355,
    display = 7845,
    coords = {0.591, 0.340, 1},
    loot = {10775,10776,10777,},
    sections = {
      Spell(12255, {so = true, flag1 = CURSE}), -- Curse of Tuten'kash
      Spell(12251, {so = true, desc = "Inflicts 4 Nature damage every 3 seconds for 15 seconds. Stacks maximum 3 times.", flag1 = POISON}), -- Virulent Poison
      Spell(12252, {so = true}), -- Web Spray
    },
  },
  {
    name = "Mordresh Fire Eye",
    desc = "Accompanied by many dancing skeletons, they can be engaged without engaging the boss, but will come and assist Mordresh Fire Eye if you attack him.",
    --icon = true,
    creature = 7357,
    display = 8055,
    coords = {0.858, 0.468, 1},
    loot = {10771,10770,10769,},
    sections = {
      Spell(12466, {so = true, desc = "Inflicts 99 to 116 Fire damage to an enemy."}), -- Fireball
      Spell(12470, {so = true, desc = "Inflicts 49 to 58 Fire damage to nearby enemies."}), -- Fire Nova
    },
  },
  {
    name = "Glutton",
    desc = "Glutton was created from the remains of Tartek the Enraged. He is a powerful melee fighter and repeatedly enrages during the fight, attacking even harder.",
    --icon = true,
    creature = 8567,
    display = 25730,
    coords = {0.345, 0.667, 1},
    loot = {10774,10772,},
    sections = {
      Spell(77978, {so = true, desc = "Periodically deals 27 to 32 Nature damage each 3 seconds to nearby enemies."}), -- Disease Cloud
      Spell(12795, {so = true, desc = "Glutton enrages at 10% health, increasing damage done by 1 and attack speed by 30% for 2 minutes."}), -- Frenzy
    },
  },
  {
    name = "Amnennar the Coldbringer",
    desc = "He is the leader of Death's Head, a group of undead quilboars allied with the Scourge. Apparently, his is also its creator; he is credited in the book Compendium of Fallen Heroes for making the abomination Tartek the Enraged which single-handedly slew more than 1200 quilboars before falling. The corpses were quickly raised by Amnennar, creating the first major Scourge-outpost on Kalimdor. He now rules the Death's Head's every move through the power of his massive consciousness.",
    --icon = true,
    creature = 7358,
    display = 32610,
    coords = {0.443, 0.604, 1},
    loot = {10762,10764,10765,10761,10763,},
    sections = {
      Spell(77977, {desc = "Encases Amnennar in a layer of frost. The thick ice increases armor by 12, slows melee attackers' movement by 30%, and increases the time between their attacks by 20%."}), -- Frost Armor (triggers 6136)
      Spell(15530, {desc = "Inflicts 174 to 203 Frost damage to an enemy and reduces its movement speed by 50% for 4 seconds.", flag1 = MAGIC}), -- Frostbolt
      Spell(15531, {desc = "Inflicts 99 to 116 Frost damage to nearby enemies, immobilizing them for 8 seconds.", flag1 = MAGIC}), -- Frost Nova
      Spell(13009, {desc = "Knocks an enemy slightly back and hopefully interrupts any spell being cast."}), -- Amnennar's Wrath
      Spell(12642, {so = true, desc = "Summons 3 Frost Spectres to assist Amnennar in battle.", sections = {
        Stage({
          stype = CREATURE,
          creature = 8585,
          display = 146,
          name = "Frost Spectre",
          desc = "Does not perform any special abilities.",
        }),
      }}), -- Summon Frost Spectres
    },
  },
})

table.insert(db, RAZORFEN_DOWNS)
