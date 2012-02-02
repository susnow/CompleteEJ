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

local AHNKAHET_THE_OLD_KINGDOM = CreateInstance({
  name = "Ahn'kahet: The Old Kingdom",
  desc = "Azjol-Nerub is a vast underground dungeon hub home to the arachnid-like nerubian who were defeated by the Lich King in the War of the Spider. Located in icy Dragonblight, Azjol-Nerub can be divided into two sections: the Old Kingdom and the Upper Kingdom. In addition, many of the deepest areas in Azjol-Nerub are invaded by Faceless Ones. Ahn'kahet: The Old Kingdom is the second dungeon located within Azjol-Nerub and was controlled by nerubians until recently. An earthquake pushed Ahn'kahet closer to the surface, exposing the nerubian kingdom to attacks from the Scourge. Now, remnants of the old Nerubian empire, minions of the Lich King, and servants of the Old Gods fight for control in the underground galleries of the Old Kingdom.",
  --texture = "AhnkahetTheOldKingdom",
  area = 522,
}, {
  {
    name = "Elder Nadox",
    desc = "Elder Nadox is the first boss of Ahn'kahet: The Old Kingdom. He is tied to the achievement Respect Your Elders.",
    --icon = true,
    creature = 29309,
    display = 27407,
    coords = {0.698, 0.276, 1},
    loot = {{35607,N5},{35608,N5},{37591,H5},{35606,N5},{37594,H5},{37593,H5},{37592,H5},},
    sections = {
		-- normal
		Spell(56130, {so = true, desc = "Applies a disease inflicting 1275 Nature damage every 3 seconds for 30 seconds", fbd = N5, flag1 = DISEASE}),
		
		-- heroic
		Spell(59467, {so = true, desc = "Applies a disease inflicting 1275 Nature damage every 3 seconds for 30 seconds", fbd = H5, flag1 = DISEASE}),
		Spell(59465, {so = true, desc = "Enrages a swarmer, increasing its damage by 200%, size by 100% and health by 10 000", fbd = H5, flag1 = IMPORTANT}),
		
		Stage({
			so = true,
			stype = CREATURE,
			name = "Ahn'kahar Guardian",
			desc = "At 50% health, Nadox will summon an Ahn'kahar Guardian which renders all nearby swarmers and Nadox himself immune to damage",
			creature = 30176,
			display = 28079,
			flag1 = DPS, 
			flag2 = IMPORTANT,
			sections = {
				Spell(56153, {desc = "Aura that renders nearby swarmers and Nadox immune to damage"}),
			}
		}),
		
		-- common
		Spell(26662, {desc = "Increases the caster's attack and movement speeds by 150% and all damage it deals by 500%. Grants immunity to Taunt effects. Used when Nadox is pulled too far away"}),
    },
  },
  {
    name = "Prince Taldaram",
    desc = "Prince Taldaram, a vampiric darkfallen, is the second boss of Ahn'kahet: The Old Kingdom.",
    --icon = true,
    creature = 29308,
    display = 27406,
    coords = {0.626, 0.494, 1},
    loot = {{35609,N5},{35611,N5},{37614,H5},{35610,N5},{37595,H5},{37613,H5},{37612,H5},},
    sections = {
		-- common
		Spell(55968), -- Bloodthirst
		
		Stage({
			so = true,
			stype = ABILITY,
			name = "Conjure Flame Sphere",
			desc = "Summons a Flame Orb which deals Fire damage to all players. Cannot be targeted. Will move outside the platform and despawn",
			icon = "Interface\\Icons\\spell_fire_sealoffire",
			sections = {
				Spell(57748, {fbd = N5}),
				Spell(58938, {fbd = H5}),
			}
		}),
		
		-- normal
		Spell(59513, {so = true, fbd = H5}), -- Embrace of the Vampyr
		
		-- heroic
		Spell(55959, {so = true, fbd = N5}), -- Embrace of the Vampyr
		
		Spell(55964), -- Vanish
    },
  },
  {
    name = "Jedoga Shadowseeker",
    desc = "Jedoga Shadowseeker, a Twilight Hammer's cultist, is the third boss of Ahn'kahet: The Old Kingdom. It is related to Volunteer Work.",
    --icon = true,
    creature = 29310,
    display = 26777,
    coords = {0.486, 0.730, 1},
    loot = {{43277,N5},{43279,N5},{43280,H5},{43278,N5},{43281,H5},{43282,H5},{43283,H5},},
    sections = {
		Spell(56855, {fbd = N5}), -- Cyclone Strike
		Spell(60032, {fbd = H5}), -- Lightning Bolt
		Spell(56891, {fbd = N5}), -- Lightning Bolt
		Spell(60029, {fbd = H5}), -- Thundershock
		Spell(56926, {fbd = N5}), -- Thundershock
		Spell(56219, {flag1 = DPS}), -- Gift of the Herald
    },
  },
  {
    name = "Herald Volazj",
    desc = "Herald Volazj, a faceless one, is the last boss of Ahn'kahet: The Old Kingdom. He is linked to the achievement Volazj's Quick Demise.",
    --icon = true,
    creature = 29311,
    display = 27408,
    coords = {0.236, 0.506, 1},
    loot = {{35614,N5},{35612,N5},{37619,H5},{35613,N5},{37615,H5},{37618,H5},{43102,H5},{37620,H5},{37616,H5},{37622,H5},{37617,H5},{37623,H5},{41790,H5},},
    sections = {
		Spell(59974, {desc = "Inflicts 2828 to 3172 Shadow damage every second for 3 seconds and reduces movement speed by 50%.", fbd = H5}), -- Mind Flay
		Spell(57941, {desc = "Inflicts 5655 to 6345 Shadow damage every second for 3 seconds and reduces movement speed by 50%.", fbd = N5}), -- Mind Flay
		Spell(57942, {desc = "Inflicts 850 to 1,150 Shadow damage to all players in the room.", fbd = N5}), -- Shadow Bolt Volley
		Spell(59975, {desc = "Inflicts 2550 to 3450 Shadow damage to all players in the room.", fbd = H5}), -- Shadow Bolt Volley
		Spell(57949, {so = true, fbd = N5, flag1 = CURSE}), -- Shiver
		Spell(59978, {so = true, fbd = H5, flag1 = CURSE}), -- Shiver
		Stage({
			so = true,
			stype = ABILITY,
			name = "Insanity",
			icon = "Interface\\Icons\\spell_shadow_painandsuffering",
			desc = "Drive all players in the room insane and will be forced to fight Twilight Visages of their party members. Used at 66% and 33% of Voljazj's health",
		}),
    },
  },
  {
    name = "Amanitar",
    desc = "Amanitar is an optional boss in Ahn'kahet: The Old Kingdom, only found in Heroic mode.",
    --icon = true,
    creature = 30258,
    display = 28133,
    --coords = {x, y, level},
    loot = {{43284,H5},{43287,H5},{43285,H5},{43286,H5},},
    sections = {
		Spell(57094, {fbd = H5}), -- Bash
		Spell(57088, {fbd = H5}), -- Venom Bolt Volley
		Spell(57095, {fbd = H5, flag1 = MAGIC}), -- Entangling Roots
		Stage({
			so = true,
			stype = ABILITY,
			fbd = H5,
			name = "Mini",
			desc = "Reduces damage done by 75% and Defense by 500. Lasts until receiving the Potent Fungus buff trough destroying a Healthy mushroom",
			icon = "Interface\\Icons\\spell_shadow_antishadow",
		}),
		Stage({
			so = true,
			stype = ABILITY,
			fbd = H5,
			name = "Summon Mushroom",
			desc = "Amanitar randomly summons mushrooms",
			sections = {
				Stage({
					stype = CREATURE,
					fbd = H5,
					creature = 30435,
					display = 23870,
					name = "Poisonous Mushroom",
					desc = "Drops a poison cloud at their death.",
					sections = {
						Spell(57061),
					}
				}),
				
				Stage({
					stype = CREATURE,
					fbd = H5,
					creature = 30435,
					display = 23870,
					name = "Healthy Mushroom",
					desc = "Buff players with Potent Fungus. Removes mini",
					sections = {
						Spell(56648),
					}
				}),
				}
		})
    },
  },
})

table.insert(db, AHNKAHET_THE_OLD_KINGDOM)
