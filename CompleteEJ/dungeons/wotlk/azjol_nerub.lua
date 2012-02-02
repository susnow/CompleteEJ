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

local AZJOL_NERUB = CreateInstance({
  name = "Azjol-Nerub",
  desc = "Azjol-Nerub is a vast underground dungeon hub home to the ruins of the arachnid-like nerubian empire. Located in icy Dragonblight, Azjol-Nerub can be divided into two sections: the Old Kingdom and the Upper Kingdom. Many of the deepest areas in Azjol-Nerub are held by Faceless Ones.",
  --texture = "AzjolNerub",
  area = 533,
}, {
  {
    name = "Krik'thir the Gatewatcher",
    desc = "Krik'thir the Gatewatcher is the first boss of Azjol-Nerub. He is a nerubian vizier under the command of Anub'Arak — a powerful servant of the Lich King. He is linked to the achievement Watch Him Die.",
    --icon = true,
    creature = 28684,
    display = 27394,
    --coords = {x, y, level},
    loot = {{35657,N5},{35655,N5},{37219,H5},{35656,N5},{37217,H5},{37218,H5},{37216,H5},},
    sections = {
		Spell(59368, {so = true, fbd = H5, flag1 = CURSE}), -- Curse of Fatigue
		Spell(52592, {so = true, fbd = N5, flag1 = CURSE}), -- Curse of Fatigue

		Spell(52586, {desc = "Inflicts 1885 to 2115 Shadow damage to a target every second for 3 seconds.", fbd = N5}), -- Mind Flay
		Spell(59367, {desc = "Increases attack speed by 50% and Physical damage by 100%.", fbd = H5}), -- Mind Flay

		Spell(28747), -- Frenzy

		Stage({
			so = true,
			name = "Watchers",
			sections = {
				Stage({
					stype = CREATURE,
					name = "Watcher Gashra",
					creature = 28730,
					display = 23568,
					sections = {
						Spell(52470),	-- enrage
						Spell(52469, {fbd = N5}), -- infected bite normal
						Spell(59364, {fbd = H5}), -- infected bite heroic
						Spell(52086, {flag1 = DPS}), -- web wrap
					}
				}),
				Stage({
					stype = CREATURE,
					name = "Watcher Narjil",
					creature = 28729,
					display = 23984,
					sections = {
						Spell(52524), -- blinding webs
						Spell(52469, {fbd = N5}), -- infected bite normal
						Spell(59364, {fbd = H5}), -- infected bite heroic
						Spell(52086, {flag1 = DPS}), -- web wrap
					}
				}),
				Stage({
					stype = CREATURE,
					name = "Watcher Silthik",
					creature = 28731,
					display = 25729,
					sections = {
						Spell(52493, {desc = "Inflicts 875 to 1125 Nature damage and an additional 619 to 881 every 3 seconds for 10 seconds", fbd = N5}),
						Spell(59366, {desc = "Inflicts 3063 to 3937 Nature damage and an additional 1238 to 1762 every 3 secibds for 10 seconds", fbd = H5}),
						Spell(52469, {fbd = N5}), -- infected bite normal
						Spell(59364, {fbd = H5}), -- infected bite heroic
						Spell(52086, {flag1 = DPS}), -- web wrap
					}
				}),
			}
		}),
    },
  },
  {
    name = "Hadronox",
    desc = "Hadronox is the second boss in Azjol-Nerub. He is a giant spider, native to Northrend, and opposes the Scourge--players initially encounter him fighting off mobs. He is linked to the achievement Hadronox Denied.",
    --icon = true,
    creature = 28921,
    display = 26776,
    coords = {0.756, 0.468, 3},
    loot = {{35658,N5},{35659,N5},{37220,H5},{35660,N5},{37222,H5},{37230,H5},{37221,H5},},
    sections = {
      Spell(59419, {fbd = H5}), -- Acid Cloud
      Spell(53400, {fbd = N5}), -- Acid Cloud
      Spell(59417, {so = true, fbd = H5, flag1 = POISON}), -- Leech Poison
      Spell(53030, {so = true, fbd = N5, flag1 = POISON}), -- Leech Poison
      Spell(53418), -- Pierce Armor
      Spell(53406, {so = true, fbd = N5}), -- Web Grab
      Spell(59420, {so = true, fbd = H5}), -- Web Grab
    },
  },
  {
    name = "Anub'arak",
    desc = "Anub'arak is the final boss in Azjol-Nerub. The former king of the Nerbuians, Anub'arak is now a Crypt Lord, a mindless servant of the Lich King. He is tied to the achievement Gotta Go!.",
    --icon = true,
    creature = 29120,
    display = 27856,
    --coords = {x, y, level},
    loot = {{35662,N5},{35663,N5},{37237,H5},{35661,N5},{37238,H5},{43102,H5},{37236,H5},{37240,H5},{37241,H5},{37235,H5},{37232,H5},{37242,H5},},
    sections = {
		-- burrows at 66/33 and 15, summons nerubian darter assasin and guardians
		Stage({
			so = true,
			stype = ABILITY,
			name = "Phase 1: A pestilence upon you!",
			sections = {
				Spell(53520), -- Carrion Beetles
				Spell(53472, {fbd = N5}), -- Pound
				Spell(59433, {fbd = H5}), -- Pound
			}
		}),
		Stage({
			so = true,
			stype = ABILITY,
			name = "Phase 2: Come forth, my brethren!",
			sections = {
				Spell(59446, {fbd = H5}), -- Impale
				Spell(53454, {fbd = N5}), -- Impale
				Spell(53467, {fbd = N5}), -- Leeching Swarm
				Stage({
					stype = ABILITY,
					name = "Call for help",
					desc = "At 66%, 33% and 15%, Anub'Arak will summon adds",
					sections = {
						Stage({
							stype = CREATURE,
							name = "Nerubian Darter",
							creature = 29213,
							display = 26056,
							sections = {
								Spell(53602, {fbd = N5}),
								Spell(59349, {fbd = H5}),
							}
						}),
						Stage({
							stype = CREATURE,
							name = "Nerubian Guardian",
							creature = 29216,
							display = 23561,
							sections = {
								Spell(52532, {desc = "Strikes at an enemy, inflicting 200% weapon damage"}),
								Spell(53618, {fbd = N5}),
								Spell(59350, {fbd = H5}),
							}
						}),
						Stage({
							stype = CREATURE,
							name = "Nerubian Assasin",
							creature = 29214,
							display = 23820,
							sections = {
								Spell(52540),
							}
						}),
					}
				}),
			}
		}),
	},
  },
})

table.insert(db, AZJOL_NERUB)
