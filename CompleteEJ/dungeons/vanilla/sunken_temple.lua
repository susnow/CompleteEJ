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

local SUNKEN_TEMPLE = CreateInstance({
<<<<<<< HEAD
  name = "沉没的神庙",
  desc = "阿塔哈卡神庙，沉没的神庙，是阿塔莱巨魔为血神哈卡建立的。它坐落于悲伤沼泽。",
  --texture = "SunkenTemple",
=======
  name = "Sunken Temple",
  desc = "Over a thousand years ago, the powerful Gurubashi Empire was torn apart by a massive civil war. An influential group of troll priests, known as the Atal'ai, attempted to bring back an ancient blood god named Hakkar the Soulflayer. Though the priests were defeated and ultimately exiled, the great troll empire buckled in upon itself. The exiled priests fled far to the north, into the Swamp of Sorrows. There they erected a great temple to Hakkar - where they could prepare for his arrival into the physical world. The great dragon Aspect, Ysera, learned of the Atal'ai's plans and smashed the temple beneath the marshes. To this day, the temple's drowned ruins are guarded by the green dragons who prevent anyone from getting in or out. However, it is believed that some of the fanatical Atal'ai may have survived Ysera's wrath - and recommitted themselves to the dark service of Hakkar.",
  texture = "SunkenTemple",
>>>>>>> origin/code
  area = 687,
  dflag = N5,
}, {
  {
<<<<<<< HEAD
    name = "预言者迦玛兰",
    --desc = "",
=======
    name = "Jammal'an the Prophet",
    desc = "Jammal'an is the spiritual leader of the great Atal'ai tribe and of the Hakkari of Zul'Gurub and Swamp of Sorrows. He believes the summoning of the blood god Hakkar the Soulflayer will bring the Atal'ai to immortality.",
>>>>>>> origin/code
    --icon = true,
    creature = 5710,
    display = 6708,
    coords = {0.760, 0.458, 1},
    loot = {10807,10808,10806,},
    sections = {
      Spell(12480, {so = true, desc = "Hexes the target, twisting their form, increasing their damage dealt by 400, and turning them against their allies for 15 seconds.", flag1 = CURSE}), -- Hex of Jammal'an
      Spell(12468, {so = true, desc = "Calls down a pillar of flame, burning all enemies in a selected area for 74 to 87 Fire damage and additional 4 Fire damage every 2 seconds for 8 seconds."}), -- Flamestrike
      Spell(12492, {so = true, desc = "Calls upon Nature magic to heal an ally for 217 to 252.", flag1 = INTERRUPT}), -- Healing Wave
      --Spell(8376), -- Earthgrab Totem
      Stage({
        so = true,
        stype = CREATURE,
        creature = 8179,
        display = 2030,
        name = "Earthgrab Totem",
        desc = "Summons an Earthgrab Totem that lasts 30 seconds and periodically immobilizes nearby enemies.",
      }),
    },
  },
  {
<<<<<<< HEAD
    name = "哈卡的化身",
    --desc = "",
=======
    name = "Avatar of Hakkar", -- Shade of Hakkar #8440 7690
    desc = "The Avatar of Hakkar is the mortal presence of the god Hakkar the Soulflayer. Its spirit still haunts the Temple of Atal'Hakkar, waiting for the right time to regain its power.",
>>>>>>> origin/code
    --icon = true,
    creature = 8443,
    display = 8053,
    coords = {0.241, 0.458, 1},
    loot = {10842,10838,10843,10845,10846,10844,12462,},
    sections = {
      Spell(12888, {so = true, flag1 = MAGIC}), -- Cause Insanity
      Spell(12889, {so = true, desc = "Forces nearby enemies to speak in Demonic, reducing their casting speed by 50% for 15 seconds.", flag1 = CURSE}), -- Curse of Tongues
      Spell(6607, {so = true, desc = "Knocks down an enemy and stuns them for 2 seconds, and has a chance to disarm the target for 5 seconds."}), -- Lash (triggers 33126 and 11920)
    },
  },
  {
    name = "The Dragon Guardians",
    desc = "Once Jammal'an the Prophet and Avatar of Hakkar are defeated, the dragons Dreamscythe and Weaver will emerge in the center of The Pit of Sacrifice, along with Hazzas and Morphaz in the south end of the tunnel. If not defeated, these will come and aid Eranikus once he is engaged. The four guardians use the same abilities and have a chance to drop the same items.",
    --icon = true,
    creature = 5721,
    display = 7553,
    coords = {0.500, 0.868, 1},
    loot = {10795,10796,10797,12243,12463,12464,12465,12466,},
    sections = {
      Spell(12884, {so = true, flag1 = TANK}), -- Acid Breath
      Spell(12882, {so = true, flag1 = TANK}), -- Wing Flap
    },
  },
  {
<<<<<<< HEAD
    name = "伊兰尼库斯的阴影",
    --desc = "",
=======
    name = "Shade of Eranikus",
    desc = "The great Emerald Wyrm Eranikus was dispatched by Ysera, the Dragon Aspect of the Emerald Dream, to deal with the growing troll threat in the Swamp of Sorrows. Unfortunately, Eranikus was possessed and corrupted by the Old Gods and now is a malevolent force in the Sunken Temple.",
>>>>>>> origin/code
    --icon = true,
    creature = 5709,
    display = 7806,
    coords = {0.664, 0.873, 1},
    loot = {10829,10833,10837,10828,10835,10836,10847,},
    sections = {
      Spell(12890, {so = true, desc = "Lulls the target into a deep sleep for 8 seconds, rendering it unable to act, but also making it invulnerable.", flag1 = IMPORTANT}), -- Deep Slumber
      Spell(12891, {so = true, flag1 = TANK}), -- Acid Breath
      Spell(11876, {so = true, desc = "Inflicts weapon damage plus 23 to nearby enemies and stuns them for 4 seconds."}), -- War Stomp
      Spell(3391, {so = true, flag1 = HEALER}), -- Thrash
    },
  },
})

table.insert(db, SUNKEN_TEMPLE)
