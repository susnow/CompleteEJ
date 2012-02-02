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

local BLACKFATHOM_DEEPS = CreateInstance({
  name = "Blackfathom Deeps",
  desc = "Situated along the Zoram Strand of Ashenvale, Blackfathom Deeps was once a glorious temple dedicated to the night elves' moon goddess, Elune. However, the Great Sundering shattered the temple - sinking it beneath the waves of the Veiled Sea. There, the temple remained untouched until naga and satyr, drawn by its ancient power, emerged to plumb its secrets.\n\nLegends hold that Aku'mai, a favored pet of the primordial Old Gods, has taken up residence within the temple's ruins. The cult known as the Twilight's Hammer has also come to bask in Aku'mai's evil presence - and members of the shamanic order known as the Earthen Ring rush to oppose them, knowing that where the Old Gods are invoked, dangers to the whole of Azeroth cannot be far behind.",
  texture = "BlackfathomDeeps",
  area = 688,
  dflag = N5,
}, {
  {
    name = "Ghamoo-Ra",
    desc = "Ghamoo-Ra lives on the small island in the second cavern of the instance. He roams around the center of the landmass and is surrounded by several other turtles. The additional turtles are neutral, and Ghamoo-Ra can be engaged without disturbing these other beasts.",
    --icon = true,
    creature = 4887,
    display = 37143,
    coords = {0.330, 0.604, 1},
    loot = {6907,6908,},
    sections = {
      Spell(5568, {so = true, desc = "Inflicts 172 to 229 damage plus 8 to nearby enemies."}), -- Trample
    },
  },
  {
    name = "Lady Sarevess",
    desc = "Lady Sarevess is a very twisted spellcaster who dabbles in the realm of magic. She can be a bit tough for a spellcaster, so get ready for a good tangle in the Blackfathom Deeps.",
    --icon = true,
    creature = 4831,
    display = 4979,
    coords = {0.113, 0.398, 1},
    loot = {888,11121,3078,},
    sections = {
      Spell(6660, {so = true, desc = "Shoots at an enemy, inflicting 24 to 29 damage."}), -- Shoot
      Spell(8435, {so = true}), -- Forked Lightning
      Spell(246, {so = true, flag1 = MAGIC}), -- Slow
    },
  },
  {
    name = "Gelihast",
    desc = "Gelihast is a level 26 elite murloc mini-boss in Blackfathom Deeps. He goes down quite quickly but he can interrupt and kill casters very quickly, dealing high damage as he is wielding 2 swords and has an incredible attack speed. Killing him allows access to an altar, when used it gives the beneficial debuff Blessing of Blackfathom.",
    --icon = true,
    creature = 6243,
    display = 1773,
    coords = {0.544, 0.573, 1},
    loot = {6905,6906,},
    sections = {
      Spell(6533, {so = true}), -- Net
    },
  },
  {
    name = "Lorgus Jett",
    desc = "Lorgus Jett is a high ranking Twilight's Hammer human found in Blackfathom Deeps. His death is a required criterion for completion of Allegiance to the Old Gods, a Horde-only quest. Jett may be found in a few different locations within Blackfathom Deeps, so it may take extra searching to find him.",
    --icon = true,
    creature = 12902,
    display = 12822,
    coords = {0.386, 0.200, 2},
    loot = {},
    sections = {
      Spell(12550, {so = true, desc = "Surrounds Lorgus Jett with 3 balls of lightning, melee and range attackers have a 50% chance to trigger one of the orbs and take 2 Nature damage. Each time the shield strikes, a ball of lightning dissipates.", flag1 = MAGIC}), -- Lightning Shield
      Spell(12167, {so = true, desc = "Blasts an enemy with lightning, inflicting 74 to 87 Nature damage."}), -- Lightning Bolt
    },
  },
  {
    name = "Baron Aquanis",
    desc = "Baron Aquanis is a water elemental found in Blackfathom Deeps that can be summoned through a horde-only quest Baron Aquanis when attempting to gather the Fathom Core from the Fathom Stone.",
    --icon = true,
    creature = 12876,
    display = 110,
    coords = {0.408, 0.722, 2},
    loot = {16782,},
    sections = {
      Spell(15531, {so = true, desc = "Inflicts 99 to 116 Frost damage to nearby enemies, immobilizing them for up to 8 seconds.", flag1 = MAGIC}), -- Frost Nova
      Spell(15043, {so = true, desc = "Inflicts 99 to 116 Frost damage to an enemy and reduces its movement speed by 50% for 4 seconds.", flag1 = MAGIC}), -- Frostbolt
    },
  },
  {
    name = "Old Serra'kis",
    desc = "Old Serra'kis is a giant threshadon found in Blackfathom Deeps. Finding Serra'kis proves to be harder than the actual fight. To reach him, you must dive into the water around Moonshrine Sanctum and swim under the left side of the ruins. The fight is not tough, and as long as you're careful not to run out of breath you shouldn't have any problems. Having a Warlock to cast Unending Breath or Shaman for Water Breathing is helpful here. Without either of these classes, it will be difficult to kill him quickly enough due to his locations not having an opening to the surface for air. Coaxing him out of the cave may be a better option than fighting him inside it in this case.",
    --icon = true,
    creature = 4830,
    display = 1816,
    coords = {0.588, 0.304, 3},
    loot = {6902,6904,6901,},
    sections = {
      Stage({
        so = true,
        name = "Auto Attack",
        desc = "Does not perform any special abilities.",
      }),
    },
  },
  {
    name = "Twilight Lord Kelris",
    desc = "Twilight Lord Kelris is the commander of the sect of the cult Twilight's Hammer that has inhabited Blackfathom Deeps. Kelris will be found in a trance as you enter the room, and as such he will not notice you until attacked directly. This gives the group ample time to clear the room of any other Twilight's Hammer cultists before engaging Kelris himself. He will use a Mind Control spell periodically, as well as a Sleep. Be prepared to deal with incapacitated or charmed players accordingly. His main attack is a Shadow Bolt spell identical to player warlocks. His head is the required criterion for completion of Blackfathom Villainy.\n\nAfter dispatching Twilight Lord Kelris, the four candles around the statue of Queen Azshara must be lit to open the door to Aku'mai. Beware, though, the candles will each spawn a wave of enemies. Be prepared to fight each time your group lights one of the candles.",
    --icon = true,
    creature = 4832,
    display = 4939,
    coords = {0.527, 0.819, 2},
    loot = {1155,6903,},
    sections = {
      Spell(15587, {so = true, desc = "Inflicts 49 to 58 Shadow damage to an enemy."}), -- Mind Blast
      Spell(8399, {so = true, desc = "Puts an enemy to sleep for up to 6 seconds. Any damage caused will awaken them.", flag1 = MAGIC}), -- Sleep
    },
  },
  {
    name = "Aku'mai",
    desc = "The ancient hydra Aku'mai, princess of the deep, has taken up residence within the Blackfathom Deeps, which once was a glorious temple dedicated to the night elves' moon-goddess Elune. A favored pet of the primordial Old Gods, Aku'mai has been a scourge to the Zoram Strand for ages. Drawn to Aku'mai's presence in the Deeps, the cult known as the Twilight's Hammer has gathered to bask in the Old Gods' evil presence by sacrificing innocents to the monstrous beast in order to gain favor with her twisted masters.",
    --icon = true,
    creature = 4829,
    display = 2837,
    coords = {0.858, 0.863, 2},
    loot = {6910,6909,6911,},
    sections = {
      Spell(3490, {so = true, desc = "Increases attack speed by 75% for 5 seconds. Reduces physical damage dealt by 15."}), -- Frenzied Rage
      Spell(3815, {so = true, desc = "Inflicts 35 Nature damage to enemies within 8 years every 3 seconds for 15 seconds.", flag1 = POISON}), -- Poison Cloud
    },
  },
})

table.insert(db, BLACKFATHOM_DEEPS)
