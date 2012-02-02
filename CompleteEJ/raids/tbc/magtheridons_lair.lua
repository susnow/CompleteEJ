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

local MAGTHERIDONS_LAIR = CreateInstance({
  name = "Magtheridon's Lair",
  desc = "Magtheridon's Lair is the raid wing of the Hellfire Citadel dungeon in Outland where you fight the brutish pit lord Magtheridon himself. You can find the entrance to Magtheridon's Lair on the very bottom of the western side of the Citadel, opposite side from Rampars.",
  texture = "MagtheridonsLair",
  area = 779,
  dflag = N25,
}, {
  {
    name = "Magtheridon",
    desc = "Magtheridon, the former Lord of Outland, is a pit lord who conquered the ruins of the orcish homeworld following its destruction. His reign was ended by the arrival of Illidan Stormrage, who took Magtheridon's throne at the Black Temple for himself. Deciding that Magtheridon would have a further part to play, Illidan had Magtheridon's body dragged to the Hellfire Citadel where he imprisoned the pit lord, leaving him at the mercy of the fel orcs. A group of adventurers entered the depths of Hellfire Citadel, released the former Lord of Outland from his bonds, and finally destroyed him, taking his head as proof of their prowess.",
    --icon = true,
    creature = 17257,
    display = 18527,
    coords = {0.691, 0.743, 1},
    loot = {28783,29753,28782,29754,34845,32385,28780,28775,28777,},
    sections = {
      Stage({
        so = true,
        name = "Phase 1: Hellfire Channelers",
        desc = "You will face 5 Hellfire Channelers, each using their own Manticron Cube to keep Magtheridon banished. They do not aggro on vicinity, you must attack to engage the encounter. After combat starts you have 2 minutes before phase 2 starts.",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 17256,
            display = 9865,
            name = "Hellfire Channeler",
            desc = "When killed transfers the soul to remaining Hellfire Channelers, increasing their damage by 20% and casting speed by 10%. This buff stacks.",
            sections = {
              Spell(30528, {desc = "Heals an ally  for 69375 to 80625, 30 yards range.", flag1 = INTERRUPT}), -- Dark Mending
              Spell(30510, {desc = "Hurls missiles of dark magic, inflicting 1488 to 2012 Shadow damage to enemies within 30 yards."}), -- Shadow Bolt Volley
              --Spell(30511), -- Burning Abyssal
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 17454,
            display = 16874,
            name = "Burning Abyssal",
            desc = "Summoned by Hellfire Channelers, they do not perform any special abilities, they auto attack and hit hard but can be feared and banished.",
          }),
        },
      }),
      Stage({
        so = true,
        name = "Phase 2: Magtheridon",
        sections = {
          Spell(30616, {so = true, desc = "Each 60 seconds, Magtheridon will cast Blast Nova, it will inflict 2188 to 2812 Fire damage each 2 seconds for 10 seconds.\n\nThis can be countered by using all the Manticron Cubes in the room at the same time.", flag1 = IMPORTANT}), -- Blast Nova
          Spell(30619, {flag1 = TANK}), -- Cleave
          --Spell(30205), -- Shadow Cage
        },
      }),
      Stage({
        so = true,
        name = "Phase 3: At 30% health",
        desc = "Magtheridon will shatter the walls, causing the roof to crash on the group. This deals 5250 to 6750 damage to everyone and stuns for 2 seconds.\n\nAvoid falling debris, if hit by falling rocks you will instantly be killed.",
        flag1 = DEADLY,
      }),
      Spell(26662, {desc = "Magtheridon will berserk after 22 minutes of combat, increasing attack speed by 150% and damage done by 500%. Also becomes immune to Taunt effects.", flag1 = DEADLY}), -- Berserk
    },
  },
})

table.insert(db, MAGTHERIDONS_LAIR)
