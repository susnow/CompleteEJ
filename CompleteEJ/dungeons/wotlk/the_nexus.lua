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

local THE_NEXUS = CreateInstance({
  name = "The Nexus",
  desc = "The Nexus, a dungeon hub, is an ice fortress found in the center of Coldarra, in Northrend's Borean Tundra. It is a column of magical energy surrounded by levitating earth-covered rings with ice caves underneath. The Nexus is an extensive series of caves and tunnels under Coldarra. The Nexus is an entry level 5 man dungeon with the final boss Keristrasza in the center of the dungeon.",
  texture = "TheNexus",
  area = 520,
}, {
  {
    name = "Commander Kolurg and Stoutbeard",
    desc = "Commander Kolurg and Commander Stoutbeard are optional bosses in Heroic mode of the dungeon. The Alliance will encounter Kolurg and the Horde will encounter Stoutbeard.",
    --icon = true,
    creature = 26798,
    display = 24352,
    coords = {0.27, 0.27, 1},
    loot = {{37728,H5},{37729,H5},{37730,H5},{37731,H5},},
    sections = {
      Spell(31403, {fbd = H5, so = true}), -- Battle Shout
      Spell(60067, {fbd = H5, so = true, desc = "Charges the player furthest away, inflicting normal damage plus 75 Physical damage and stunning it for 2 seconds."}), -- Charge
      Spell(38619, {fbd = H5, so = true}), -- Whirlwind (triggered 38618 but this had better tooltip)
      Spell(19134, {fbd = H5, so = true, flag1 = MAGIC}), -- Frightening Shout
      Stage({
        fbd = N5,
        so = true,
        name = "Alliance and Horde Commander",
        desc = "Replaces the regular encounter with a much weaker one and drops no superior loot.",
        sections = {
          Spell(31403, {so = true}), -- Battle Shout
          Spell(60067, {so = true, desc = "Charges the player furthest away, inflicting normal damage plus 75 Physical damage and stunning it for 2 seconds."}), -- Charge
          Spell(38619, {so = true}), -- Whirlwind (triggered 38618 but this had better tooltip)
        },
      }),
    },
    adds = {
      {
        name = "Commander Stoutbeard",
        creature = 26796,
        display = 24366,
      },
    },
  },
  {
    name = "Grand Magus Telestra",
    desc = "Grand Magus Telestra is one of the mages of the Kirin Tor who has sided with Malygos to retain her arcane powers. Currently, she is guarding one part of Keristrasza's prison. She is also the leader of the effort to redirect the ley lines in the Dragonblight.",
    --icon = true,
    creature = 26731,
    display = 24066,
    coords = {0.276, 0.400, 1},
    loot = {{35605,N5},{35604,N5},{37139,H5},{35617,N5},{37135,H5},{37134,H5},{37138,H5},},
    sections = {
      Stage({
        so = true,
        name = "Phase 1",
        sections = {
          Spell(47765, {icon = "Interface\\Icons\\Spell_Nature_Earthbind", desc = "Continuously pulls all players within 60 yards to the caster, rapidly dealing 75 Shadow damage for 6 seconds."}), -- Gravity Well
          Spell(47773, {fbd = N5, desc = "Inflicts 1700 to 2300 Fire damage to a target and nearby allies."}), -- Firebomb
          Spell(47772, {fbd = N5, desc = "Inflicts 2357 to 2643 Frost damage to all enemiest within 60 yards and stuns them for 3 seconds."}), -- Ice Nova
          Spell(56934, {fbd = H5, desc = "Inflicts 2720 to 3680 Fire damage to a target and nearby allies."}), -- Firebomb
          Spell(56935, {fbd = H5, desc = "Inflicts 3299 to 3701 Frost damage to all enemiest within 60 yards and stuns them for 3 seconds."}), -- Ice Nova
        },
      }),
      Stage({
        so = true,
        name = "Phase 2",
        desc = "She enters her second pahse at 50% health and again at 15% in Heroic mode.",
        sections = {
          Stage({
            so = true,
            stype = ABILITY,
            icon = "Interface\\Icons\\Spell_Magic_LesserInvisibilty",
            name = "Mirror Images",
            desc = "At 50% health she will split into 3 mirror images, each of which uses a different type of spells. On Heroic mode she will split again at 15% health.",
            sections = {
              Stage({
                stype = CREATURE,
                creature = 26741,
                display = 24066,
                name = "Arcane Image",
                sections = {
                  Spell(47731, {so = true}), -- Critter
                  Spell(47736, {so = true}), -- Time Stop
                },
              }),
              Stage({
                stype = CREATURE,
                creature = 26741,
                display = 24066,
                name = "Fire Image",
                sections = {
                  Spell(47721, {fbd = N5, so = true, desc = "Inflicts 2357 to 2643 Fire damage to the target."}), -- Fire Blast
                  Spell(47723, {fbd = N5, so = true, desc = "Inflicts 1275 to 1725 Fire damage to the target."}), -- Scorch
                  Spell(56939, {fbd = H5, so = true, desc = "Inflicts 3770 to 4230 Fire damage to the target."}), -- Fire Blast
                  Spell(56938, {fbd = H5, so = true, desc = "Inflicts 2550 to 3450 Fire damage to the target."}), -- Scorch
                },
              }),
              Stage({
                stype = CREATURE,
                creature = 26741,
                display = 24066,
                name = "Frost Image",
                sections = {
                  Spell(47727, {fbd = N5, so = true}), -- Blizzard
                  Spell(47729, {fbd = N5, so = true}), -- Ice Barb
                  Spell(56936, {fbd = H5, so = true}), -- Blizzard
                  Spell(56937, {fbd = H5, so = true}), -- Ice Barb
                },
              }),
            },
          }),
        },
      }),
      Stage({
        so = true,
        name = "Phase 3",
        desc = "After the images have been destroyed, she emerges back and uses the same abilities like the first phase. When she reaches 25% health, she will Ice Nova all enemies and cast Fireball Volley.",
      }),
    },
  },
  {
    name = "Anomalus",
    desc = "Anomalus, an arcane elemental, is one of the 3 bosses guarding Keristrasza's prison, inside The Nexus. It is related to Chaos Theory.",
    --icon = true,
    creature = 26763,
    display = 26259,
    coords = {0.610, 0.218, 1},
    loot = {{35599,N5},{35598,N5},{37141,H5},{35600,N5},{37144,H5},{37150,H5},{37149,H5},},
    sections = {
    	Stage({
        so = true,
        name = "Phase 1",
        sections = {
          Spell(47751, {fbd = N5, desc = "Hurls a magical bolt at an enemy, inflicting 2025 to 2475 Arcane damage."}), -- Spark
          Spell(57062, {fbd = H5, desc = "Hurls a magical bolt at an enemy, inflicting 4275 to 4725 Arcane damage."}), -- Spark
          Spell(57063, {fbd = H5, flag1 = MAGIC}), -- Arcane Attraction
        },
    	}),
    	Stage({
    		so = true,
    		name = "Phase 2",
    		desc = "At 50% health Anomalus enters his second phase. It will end either when his shield expires or you have closed all his portals, then first phase will repeat.",
    		sections = {
          Spell(47748), -- Rift Shield
          Spell(47747), -- Charge Rifts
          Spell(47743, {so = true, desc = "Tears the fabric of space, opening a Chaotic Rift near Anomalus. The rift continuously spawns Crazed Mana Wraith, and even at a faster rate once charged by Anomalus.", sections = {
            Spell(47688), -- Chaotic Energy Burst
            Spell(47737), -- Charged Chaotic Energy Burst
            Stage({
              stype = CREATURE,
              creature = 26746,
              display = 27810,
              name = "Crazed Mana Wraith",
              sections = {
                Spell(33833, {so = true, desc = "Inflicts 24 to 29 Arcane damage per second for 5 seconds."}), -- Arcane Missilies
              }
            }),
          }}), -- Create Rift
    		},
    	}),
    },
  },
  {
    name = "Ormorok the Tree-Shaper",
    desc = "Ormorok the Tree-Shaper and his creations were probably captured and put into the Nexus to serve as one of the guards. Ormorok himself is the sentinel to one part of Keristrasza's prison. They were subjected to massive amounts of Arcane energy daily. Over time, they were corrupted and became mad.",
    --icon = true,
    creature = 26794,
    display = 26298,
    coords = {0.566, 0.710, 1},
    loot = {{35602,N5},{35601,N5},{37155,H5},{35603,N5},{37152,H5},{37151,H5},{37153,H5},},
    sections = {
      Spell(47958, {fbd = N5, so = true, flag1 = IMPORTANT}), -- Crystal Spikes
      Spell(57082, {fbd = H5, so = true, flag1 = IMPORTANT}), -- Crystal Spikes
      Spell(47981, {desc = "Reflects the next 4 spells cast on him back to their casters.", flag1 = IMPORTANT}), -- Spell Reflection
      Spell(48016, {fbd = N5}), -- Trample
      Spell(57066, {fbd = H5}), -- Trample
      Spell(57086, {fbd = N5, desc = "When health drops below 25%, he will frenzy and increase his damage done by 50%.", flag1 = HEALER}), -- Frenzy
      Spell(48017, {fbd = H5, desc = "When health drops below 25%, he will frenzy and increase his damage done by 100%.", flag1 = HEALER}), -- Frenzy
      Spell(61564, {fbd = H5, so = true, icon = "Interface\\Icons\\Spell_Nature_Stranglevines", desc = "Occasionally summons an add to attack the healer.", sections = {
        Stage({
          stype = CREATURE,
          creature = 32665,
          display = 19033,
          name = "Crystalline Tangler",
          sections = {
            Spell(61556, {so = true, desc = "On successful melee attack, causes roots to grow around the target, rendering them unable to move for 2 seconds."}), -- Tangle
          },
        }),
      }}, 1), -- Summon Crystalline Tangler
    },
  },
  {
    name = "Keristrasza",
    desc = "As a human questgiver Keristrasza can be called by activating the Augmented Arcane Prison, and handles a series of quests that lets the player help in the battle against Malygos.\n\nIn gratitude, Keristrasza aids her rescuers in the fight against the Lord of Magic by luring his consort, Saragosa, to her death. After slaying his consort and luring him into battle with elements of the red dragonflight, Keristrasza is captured by Malygos, who makes her his new consort. Malygos abused her constantly, branding runes into her body and using his powerful magic to bend her will, until she finally went insane. Those who had once aided her now must enter the Nexus to release her from her tortured existence - an unfortunate but necessary end to a sad and tragic tale.",
    --icon = true,
    creature = 26723,
    display = 24307,
    coords = {0.354, 0.672, 1},
    loot = {{35596,N5},{35597,N5},{37162,H5},{35595,N5},{37169,H5},{43102,H5},{37167,H5},{37170,H5},{37172,H5},{37166,H5},{37165,H5},{37171,H5},},
    sections = {
      Spell(48094, {desc = "Debuffs idle players with a stack of Intense Cold, dealing 100 Frost damage per stack. Applies 1 stack every 2 seconds. Removed upon movement.", flag1 = IMPORTANT}), -- Intense Cold
      Spell(50997, {desc = "Inflicts 1650 to 1850 Frost damage and roots the target for 10 seconds.", flag1 = MAGIC}), -- Crystal Chains
      Spell(48096, {fbd = N5, desc = "Inflicts 2763 to 3737 Frost damage, slows movement speed and applies a debuff on the victim dealing 1000 Frost damage every 2 seconds for 10 seconds.", flag1 = TANK}), -- Crystalfire Breath
      Spell(57091, {fbd = H5, desc = "Inflicts 3825 to 5175 Frost damage, slows movement speed and applies a debuff on the victim dealing 1000 Frost damage every 2 seconds for 10 seconds.", flag1 = TANK}), -- Crystalfire Breath
      Spell(50155, {flag1 = DPS}), -- Tail Sweep
      Spell(8599, {desc = "At 25% health she will enrage and deal 10% more damage by Physical attacks, and increase attack speed by30% for 2 minutes."}), -- Enrage
      Spell(48179, {fbd = H5, desc = "Inflicts 1650 to 1859 Frost damage to everyone and immobilizes them for up to 10 seconds.", flag1 = MAGIC}), -- Crystallize
    },
  },
})

table.insert(db, THE_NEXUS)
