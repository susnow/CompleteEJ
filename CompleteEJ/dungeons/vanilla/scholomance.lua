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

local SCHOLOMANCE = CreateInstance({
  name = "通灵学院",
  desc = "通灵学院藏匿凯尔达隆城堡的废墟下的地窖群里。凯尔达隆被毁于第二次战争时期，它曾经属于高贵的巴罗夫家族。在巫师克尔苏加德招募诅咒神教教徒的时候，经常用永生来诱惑人们为巫妖王服务。巴罗夫家族受了克尔苏加德的迷惑，并将城堡及地下室献给了天灾军团。教徒们随后杀害了巴罗夫家族的成员，并将那些古老的地下室改造成了一座亡灵法术学院，取名通灵学院。虽然克尔苏加德已经不再住在这里，狂热的教徒和导师们却留了下来。目前，强大的巫妖霜语，黑暗院长加丁正领导着这座学院。",
  texture = "Scholomance",
  area = 763,
  dflag = N5,
}, {
  {
    name = "传令官基尔图诺斯",
    desc = "Long ago, he became the master of Scholomance's Doctor Theolen Krastinov. Responsible for many of the atrocities during Krastinov's rule over Scholomance, Kirtonos fed on the blood of his innocent victims. To appease his master, Doctor Krastinov had to provide the gargoyle with more and more blood.",
    --icon = true,
    creature = 10506,
    display = 7534,
    coords = {0.495, 0.106, 2},
    loot = {13956,13967,13983,13955,14024,13960,13969,13957,},
    sections = {
      Stage({
        so = true,
        name = "Phase 1: Gargoyle",
        sections = {
          Spell(6016, {flag1 = HEALER}), -- Pierce Armor
          Spell(18144, {flag1 = TANK}), -- Swoop
          Spell(12882, {desc = "Strikes enemies in a cone in front of the caster, knocking them back, hopefully out the balcony.", flag1 = IMPORTANT}), -- Wing Flap
          --Spell(16467), -- Kirtonos Transform
        },
      }),
      Stage({
        so = true,
        name = "Phase 2: Vampire",
        sections = {
          Spell(8379), -- Disarm
          Spell(17228, {desc = "Hurls missiles of dark magic, inflicting 49 to 58 Shadow damage to nearby enemies."}), -- Shadow Bolt Volley
          Spell(12889, {desc = "Forces nearby enemies to speak in Demonic, reducing their casting speed by 50% for 15 seconds.", flag1 = CURSE}), -- Curse of Tongues
          Spell(14515, {desc = "Takes control of a humanoid enemy for 15 seconds.", flag1 = MAGIC}), -- Dominate Mind
        },
      }),
    },
    adds = {
      {
        name = "Kirtonos the Vampire",
        creature = 10579,
        display = 9943,
      },
    },
  },
  {
    name = "Jandice Barov",
    desc = "Jandice Barov was once an archmage of Dalaran and a powerful illusionist. In life, she developed a spell that \"displayed several images of her body that were nearly indistinguishable from her real form. These images duplicated her actions from different locations, making it nearly impossible for her enemies to find her. It was almost infallible.\" It is also said that Jandice stewards the blood of innocents from Doctor Theolen Krastinov to Kirtonos the Herald.",
    --icon = true,
    creature = 10503,
    display = 11073,
    coords = {0.542, 0.148, 3},
    loot = {14548,22394,14545,18689,18690,14541,},
    sections = {
      Spell(8994, {so = true, desc = "Banishes an enemy, preventing all action but making it invulnerable for up to 5 seconds.", flag1 = MAGIC}), -- Banish
      Spell(16098, {so = true, desc = "Increases the Physical damage taken by enemies within 10 yards by 2 for 20 seconds.", flag1 = CURSE}), -- Curse of Blood
      Spell(17773, {so = true, desc = "Occasionally summons 15 Illusions of herself. These will avoid any area-of-effect ability but can be targeted and damaged with direct attacks. After a short while the real Jandice Barov will again emerge and her images will disappear."}), -- Summon Illusions (creature 11439)
    },
  },
  {
    name = "Rattlegore",
    desc = "Rattlegore is a bone golem, this means he will hit hard on even the heaviest of armors with his scythe-like arms.",
    --icon = true,
    creature = 11622,
    display = 12073,
    coords = {0.316, 0.647, 3},
    loot = {18782,18686,14538,14531,14537,14528,14539,16711,},
    sections = {
      Spell(10101, {so = true}), -- Knock Away
      Spell(18368, {so = true, desc = "Strikes at an enemy, inflicting normal damage plus 15."}), -- Strike
      Spell(16727, {so = true, desc = "Inflicts normal damage plus 50 to nearby enemies, stunning them for 4 seconds."}), -- War Stomp
    },
  },
  {
    name = "Marduk Blackpool",
    desc = "Marduk Blackpool is a brutal warlord of the Scourge, also known as Marduk the Black. Amongst his many campaigns against the humans of Lordaeron, he cut a swath through their forces at the Battle of Darrowshire causing great death and suffering with his foul, rune laden sword.",
    --icon = true,
    creature = 10433,
    display = 10248,
    coords = {0.432, 0.642, 2},
    loot = {14576,18692,},
    sections = {
      Spell(15284, {so = true, flag1 = TANK}), -- Cleave
      Spell(17228, {so = true, desc = "Hurls missiles of dark magic, inflicting 49 to 58 Shadow damage to enemies within 30 yards."}), -- Shadow Bolt Volley
      Spell(12040, {so = true, desc = "Shields the caster with Shadow magic, absorbing 200 Physical and magical damage for 30 seconds.", flag1 = MAGIC}), -- Shadow Shield
      Spell(17695, {so = true, desc = "Periodically reduces Shadow resistance of nearby enemies by 100."}), -- Defiling Aura (triggers 17697)
    },
  },
  {
    name = "Vectus",
    desc = "Vectus is one of the main necromancy teachers of Scholomance, the School of Necromancy. Vectus developed the plagued dragonflight found inside Scholomance, which he got by paying Tinkee Steamboil in the Burning Steppes money for eggs out of Blackrock Spire.",
    --icon = true,
    creature = 10432,
    display = 2606,
    coords = {0.499, 0.642, 2},
    loot = {14577,18691,},
    sections = {
      Spell(16046, {so = true, desc = "Unleashes a wave of flame, inflicting 49 to 58 Fire damage to nearby enemies and reducing their movement speed by 70% for 6 seconds."}), -- Blast Wave
      Spell(18399, {so = true, desc = "Calls down a pillar of flame, burning all enemies in a selected area for 99 to 116 Fire damage and inflicting additional 6 damage every 2 seconds for 8 seconds."}), -- Flamestrike
    },
  },
  {
    name = "Ras Frostwhisper",
    desc = "Ras Frostwhisper was once a human mage from Stromgarde. He was a hedge mage, a rogue wizard that never received his formal training from Dalaran. He was among the first to join the Cult of the Damned and quickly advanced through its ranks. He turned himself over to the Lich King when the Scourge invaded, in return for immortality. Upon the ground in Stratholme, within the Slaughterhouse, Ras Frostwhisper took a dagger to his own neck and cut from one side to the other梐ll the time with a smile upon his face. His corpse fell onto Menethil's Gift and it is there that the Lich King raised his fallen corpse as a Lich, granting him immortality while Leonid Barthalomew the Revered looked on. He now spends his time overseeing the operations in the necromancy school of Scholomance. Magistrate Marduke has a plan to rob the lich of his powers, return him to his mortal form, and slay him once and for all.",
    --icon = true,
    creature = 10508,
    display = 7919,
    coords = {0.404, 0.811, 4},
    loot = {14487,14502,14522,18693,14340,14503,13952,18694,14525,18695,18696,13314,},
    sections = {
      Spell(18100, {desc = "Encases Ras Frostwhisper in a layer of frost that increases his armor by 12 and slows melee attackers' movement speed by 40% and attack speed by 100%.", flag1 = MAGIC}), -- Frost Armor (triggers 18101)
      Spell(18099, {desc = "Blasts enemies within 10 yards for 49 to 58 Frost damage, knocking them back and reducing their movement speed by 50% for 5 seconds.", flag1 = MAGIC}), -- Chill Nova
      Spell(18763, {desc = "Stuns an enemy and inflicts 460 to 536 Frost damage over 8 seconds.", flag1 = MAGIC}), -- Freeze
      Spell(8398, {desc = "Inflicts 33 to 38 Frost damage to enemies within 20 yards, reducing their movement speed by 50% for 4 seconds.", flag1 = MAGIC}), -- Frostbolt Volley
      Spell(22678, {desc = "Strikes fear in an enemy, causing it to flee in terror for 6 seconds.", flag1 = MAGIC}), -- Fear
    },
  },
  {
    name = "Instructor Malicia",
    desc = "Seeing her there may be a mark of power of the Lich King, able to find his underlings even among the high elves without having to kill or even enslave them. She is required to be defeated in order to call forth Darkmaster Gandling.",
    --icon = true,
    creature = 10505,
    display = 20981,
    coords = {0.726, 0.704, 3},
    loot = {14636,14637,14623,18680,14621,18684,23201,18682,14641,18681,14616,14611,14620,18683,14638,23200,14640,14624,14614,14632,14612,14626,14631,14633,14629,14615,14622,},
    sections = {
      Spell(78535, {flag1 = CURSE}), -- Call of the Grave
      Spell(41988, {desc = "Corrupts nearby enemies, inflicting 45 Shadow damage over 15 seconds.", flag1 = MAGIC}), -- Corruption
      Spell(13747, {desc = "Increases the time between enemies' attacks and casting time by 50% and slows their movement by 60% for 6 seconds. Affects enemies within 20 yards.", flag1 = MAGIC}), -- Slow
      Spell(15586, {desc = "Calls upon Holy magic to heal an ally for 249 to 290.", flag1 = INTERRUPT}), -- Heal
      Spell(17843, {desc = "Calls upon Holy magic to heal an ally for 120 to 139.", flag1 = INTERRUPT}), -- Flash Heal
      Spell(8362, {desc = "Heals an ally for 5 every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Renew
    },
  },
  {
    name = "Doctor Theolen Krastinov",
    desc = "His first victims were recruited from among the household of Caer Darrow. Among them were servants of the Barov family, Eva and Lucien Sarkhoff. Trapped, tortured and maimed for months, they vowed vengeance on Krastinov even beyond the grave. He is required to be defeated in order to call forth Darkmaster Gandling.",
    --icon = true,
    creature = 11261,
    display = 10901,
    coords = {0.888, 0.459, 3},
    loot = {14629,14614,18682,14621,18683,14612,18680,14633,18684,14616,23200,14622,14637,18681,23201,14636,14626,14615,14624,14631,14611,14638,14641,14623,14640,14620,14632,16684,},
    sections = {
      Spell(18103, {so = true}), -- Backhand
      Spell(16509, {so = true, desc = "Inflicts 13 Physical damage to an enemy every 3 seconds for 15 seconds."}), -- Rend
      Spell(8269, {so = true, desc = "At 50% health or lower, will enrage and increase his attack speed by 60% for 2 minutes."}), -- Frenzy
    },
  },
  {
    name = "Lorekeeper Polkelt",
    desc = "As we can tell from his name, he was once the keeper of knowledge, knowledge that has sadly been lost, however, as he is now a shambling, unintelligent monster. He is required to be defeated in order to call forth Darkmaster Gandling.",
    --icon = true,
    creature = 10901,
    display = 11492,
    coords = {0.726, 0.224, 3},
    loot = {14622,18683,18682,16705,14626,18684,14624,14629,23200,23201,14637,14614,14641,18681,18680,14631,14611,14640,},
    sections = {
      Spell(8245, {so = true, flag1 = MAGIC}), -- Corrosive Acid
      Spell(18151, {so = true, flag1 = DISEASE}), -- Noxious Catalyst
      Spell(18149, {so = true, flag1 = DISEASE}), -- Volatile Infection (triggers 18150)
    },
  },
  {
    name = "The Ravenian",
    desc = "He is required to be defeated in order to call forth Darkmaster Gandling.",
    --icon = true,
    creature = 10507,
    display = 10433,
    coords = {0.675, 0.485, 4},
    loot = {14641,14622,18681,14629,18682,14620,18683,14632,18684,14615,14637,14616,23201,18680,14624,14640,23200,14623,14626,14612,14611,14621,14636,14631,14633,14614,14638,16716,},
    sections = {
      Spell(40504, {so = true, flag1 = TANK}), -- Cleave
      Spell(18670, {so = true, flag1 = TANK}), -- Knock Away
      Spell(17963, {so = true, desc = "Hacks at the armor of an enemy and its nearby allies, affecting up to 3 targets. A target's armor is reduced by 1440 per Sundering Cleave applied. Can be applied up to 5 times. Lasts 30 seconds.", flag1 = HEALER}), -- Sundering Cleave
      Spell(15550, {so = true, desc = "Inflicts weapon damage to enemies within 10 yards."}), -- Trample
    },
  },
  {
    name = "Lord Alexei Barov",
    desc = "Lord Alexei Barov was the lord of Caer Darrow, Brill, Tarren Mill and Southshore. He was the father of Alexi, Weldon, and Jandice Barov and husband of Lady Illucia Barov. Like Jandice and Illucia, he is now an agent of the Scourge found in Scholomance. He is required to be defeated in order to call forth Darkmaster Gandling.",
    --icon = true,
    creature = 10504,
    display = 11072,
    coords = {0.792, 0.299, 4},
    loot = {14614,18683,14612,18684,14631,18681,18682,18680,14621,14637,14641,14626,14622,23200,14623,23201,14640,14611,14629,14624,14638,14632,14615,14636,14616,14633,14620,},
    sections = {
      Spell(17467, {so = true}), -- Unholy Aura
      Spell(15732, {so = true, desc = "Burns an enemy for 37 to 43 Fire damage, then inflicts additional 6 Fire damage every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Immolate
      Spell(17820, {so = true, desc = "Reduces healing effects for enemies within 8 yards by 60% for 15 seconds.", flag1 = CURSE}), -- Veil of Shadow
    },
  },
  {
    name = "Lady Illucia Barov",
    desc = "She is the wife of Lord Alexei Barov and is required to be defeated in order to call forth Darkmaster Gandling.",
    --icon = true,
    creature = 10502,
    display = 11835,
    coords = {0.675, 0.153, 4},
    loot = {14615,14637,14640,23201,14622,18683,18684,23200,14631,18680,14633,14624,14614,18681,14623,14611,14629,14626,14621,18682,14612,14632,14641,14620,14636,14616,14638,},
    sections = {
      Spell(17234, {desc = "Instantly lashes an enemy with dark magic, inflicting 49 to 58 Shadow damage."}), -- Shadow Shock
      Spell(12542, {so = true, desc = "Strikes fear in an enemy, causing it to flee in terror for 4 seconds.", flag1 = MAGIC}), -- Fear
      Spell(18671, {so = true, desc = "Curses enemies within 45 yards with agony, inflicting 13 Shadow damage every 3 seconds for 15 seconds.", flag1 = CURSE}), -- Curse of Agony
      Spell(12528, {so = true, desc = "Silences enemies within 5 yards, preventing them from casting spells for 5 seconds.", flag1 = MAGIC}), -- Silence
      Spell(7645, {so = true, desc = "Takes control of a humanoid enemy for 10 seconds, but increases the time between its attacks by 100%.", flag1 = MAGIC}), -- Dominate Mind
    },
  },
  {
    name = "Darkmaster Gandling",
    desc = "Darkmaster Gandling is a mummified wretch. He teaches students how to raise the dead in the Lich King抯 name. Formerly a Dalaran wizard, he betrayed his masters for dark power and now revels in undeath. His graduates go on to Stratholme, the Scourge's capital in the Eastern Plaguelands. He apparently teaches at both the Scholomance in Caer Darrow and School of Necromancy in Andorhal.",
    --icon = true,
    creature = 1853,
    display = 11070,
    coords = {0.675, 0.299, 4},
    loot = {13944,13938,13953,19276,13398,13951,13964,14514,22433,13937,},
    sections = {
      Spell(15791, {so = true, desc = "Launches magical missiles at an enemy, inflicting 33 to 38 Arcane damage."}), -- Arcane Missiles
      Spell(12040, {so = true, desc = "Surrounds the caster with a shield woven of Shadow magic. The shield lasts 30 seconds and absorbs 610 damage and deals 30 damages to anyone who strikes it.", flag1 = MAGIC}), -- Shadow Shield
      Spell(18702, {so = true, flag1 = CURSE}), -- Curse of the Darkmaster
      Spell(17950, {so = true, desc = "Teleports an enemy to one of six locations within the Barov Family Vault.\n\nTo get the gate to open the one teleported inside has to kill the enemies in the room by themselves. After that the gate opens and the player can join back in the fight against Darkmaster Gandling."}), -- Shadow Portal
    },
  },
})

table.insert(db, SCHOLOMANCE)
