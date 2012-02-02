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

local TEMPLE_OF_AHNQIRAJ = CreateInstance({
  name = "Temple of Ahn'Qiraj",
  desc = "Temple of Ahn'Qiraj (AQ40) is a 40-man raid dungeon located in southwestern Silithus. It was released during a massive world event called the Gates of Ahn'Qiraj in which players rang a gong to receive a legendary silithid mount. Interestingly enough, AQ40 was one of the first zones where Blizzard started to itemize items correctly for the classes -- previously, unwanted stats like strength or agility would find themselves on healing items and so on. It was also the first raid to introduce meaningful reputation rewards; Brood of Nozdormu was earned through clearing the instance and gave then best-in-slot rings that increased with ilevel with each reputation ranking. The instance contains a 5-piece Tier 2.5 set for all classes except death knights that's designed after the inhabitants of the instance with distinctive spikes and bright colors much like silithids themselves.",
  texture = "TempleofAhnQiraj",
  area = 766,
  dflag = N10,
}, {
  {
    name = "The Prophet Skeram",
    desc = "The Prophet Skeram is an important religious leader in Ahn'Qiraj, being the author of the Prophecy of C'Thun.",
    --icon = true,
    creature = 15263,
    display = 15345,
    coords = {0.459, 0.518, 2},
    loot = {21703,21699,21702,20731,21708,22222,21704,20734,21814,20736,},
    sections = {
      Spell(26194, {desc = "Shocks an enemy with concussive force, inflicting 149 to 174 Nature damage and interrupting spellcasts for 2 seconds.\n\nIf the Prophets target is not in melee range, he will cast this spell each second until his target is properly meleeing him.", flag1 = TANK, flag2 = IMPORTANT}), -- Earth Shock
      Spell(26192, {desc = "Sends out a blast wave of magic, inflicting 187 to 217 Arcane damage to enemies within 30 yards.", flag1 = MAGIC, flag2 = INTERRUPT}), -- Arcane Explosion
      Spell(785, {desc = "Controls a random enemy for 20 seconds. The charmed target will do 300% more damage, all casts are instant casts, resistances increased by 50 and movement speed increased by 40%. Their size is also increased by 300% to match these new powers accordingly.\n\nThe target can still be crowd controlled and should be as soon as possible.", flag1 = IMPORTANT}), -- True Fulfillment
      Spell(747, {name = "Quartile Split", desc = "Two more copies of Skeram join the fight, each at the same health percentage as the original. They will cast and behave exactly like the original.  The copies will have less health than the original, and should be killed first to avoid too many players being mind controlled at one time.\n\nSkeram will do this when he is at 75%, 50% and 25% health. When he splits he will in random order place him and his copies on the two platforms on the sides and the middle."}, 1), -- Summon Images
      Spell(4801, {desc = "Skeram and his copies will randomly trade places with one another."}), -- Teleport (8195, 20449, duplicates?)
      --Spell(3730), -- Initialize Image
      --Spell(20477), -- Summon Player
    },
  },
  {
    name = "Silithid Royalty",
    desc = "Optional encounter, featuring Lord Kri, Princess Yauji and their child Vem. The order of the kills decide the type of loot dropped.\n\nEasiest way is to kill Lord Kri, then Princess Yauji and then Vem. The hardest is saving Lord Kri for last.",
    --icon = true,
    creature = 15511,
    display = 15656,
    coords = {0.284, 0.497, 1},
    loot = {20727,21603,21232,21695,21681,21692,20731,21694,20736,},
    sections = {
      Stage({
        stype = CREATURE,
        creature = 15511,
        display = 15656,
        name = "Lord Kri",
        sections = {
          Spell(25812, {desc = "Inflicts 450 to 750 Nature damage to all enemies and deals 150 Nature damage every 2 seconds for 16 seconds. This stacks to 20 and causes ultimately 3000 Nature damage every 2 seconds, if left undispelled.", flag1 = POISON}), -- Toxic Volley
          Spell(40504), -- Cleave
          Spell(3391), -- Thrash
          Spell(26590, {so = true, desc = "Upon the death of Lord Kri, he releases a Poison Cloud that damages anyone standing in it for 2000 Nature damage each second and slows their movement speed by 40% for 9 seconds. This cloud lasts for 2 minutes.", flag1 = DEADLY}), -- Summon Poison Cloud
          --Spell(20477), -- Summon Player
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 15543,
        display = 15657,
        name = "Princess Yauj",
        sections = {
          Spell(25807, {desc = "Heals an ally for 69375 to 80625 health.", flag1 = INTERRUPT, flag2 = IMPORTANT}), -- Great Heal
          Spell(26580, {desc = "Fears enemies within 45 yards for 8 seconds.\n\nKeep in mind that if someone exits the cave entrance the encounter will reset.", flag1 = MAGIC}), -- Fear
          Spell(3242), -- Ravage
          --Spell(20477), -- Summon Player
          Spell(26590, {so = true, name = "Summon Bugs", desc = "Upon the death of Princess Yauji, spawns many bugs that are crowd controllable."}, 1),
          --Spell(26662), -- Berserk
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 15544,
        display = 15658,
        name = "Vem",
        sections = {
          Spell(26561, {desc = "Charges at an enemy within 40 yards, knocking them far away and dealing normal damage plus 300.", flag1 = IMPORTANT}), -- Berserker Charge
          --Spell(18670), -- Knock Away
          Spell(19128, {desc = "Inflicts normal damage plus 15% more at an enemy and its nearest allies, stunning them for 2 seconds. Affects up to 5 targets."}), -- Knockdown
          Spell(26590, {so = true, name = "Enrage Parents", desc = "Upon the death of Vem, will Enrage Lord Kri and Princess Yauj making them attack 150% faster and deal 100% more Physical damage.", flag1 = IMPORTANT}, 1),
          --Spell(20477), -- Summon Player
          --Spell(25790), -- Vengeance
        },
      }),
      Spell(26662, {so = true, desc = "After 15 minutes of combat the alive bosses enrage, increasing attack and movement speed by 150% and all damage dealt by 500%. Makes them immune to Taunt effects."}), -- Berserk
    },
    adds = {
      {
        name = "Princess Yauj",
        creature = 15543,
        display = 15657,
      },
      {
        name = "Vem",
        creature = 15544,
        display = 15658,
      },
    },
  },
  {
    name = "Battleguard Sartura",
    desc = "Battleguard Sartura is the apparent leader of the Qiraji battleguards. She is joined by three members of Sartura's Royal Guard.",
    --icon = true,
    creature = 15516,
    display = 15583,
    coords = {0.444, 0.338, 1},
    loot = {21237,21648,21675,21672,20731,21667,76402,21668,20734,21673,20727,},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 15984,
        display = 15465,
        name = "Sartura's Royal Guard",
        sections = {
          Spell(26027, {desc = "Knocks away all enemies within 10 yards and ignoring them.", flag1 = IMPORTANT}), -- Knockback
          Spell(26038, {desc = "Attacks enemies within 10 yards and hits them for 1080 to 1320 Physical damage each second. This lasts for 8 seconds."}), -- Whirlwind (triggers 26686 each second)
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 15516,
        display = 15583,
        name = "Battleguard Sartura",
        sections = {
          Spell(25174, {desc = "Inflicts normal damage plus 30 to an enemy and its nearest allies, affecting up to 3 targets. Those hit also get their armor reduced by 240 for 30 seconds.", flag1 = TANK}), -- Sundering Cleave
          Spell(26083, {desc = "Attacks enemies within 10 yards and hits them for normal damage plus 680 to 920 Physical damage each second. This lasts for 15 seconds."}), -- Whirlwind (triggers 26084 each second)
          Spell(8269, {desc = "At 20% health she will Frenzy and attack 60% faster."}), -- Frenzy
        },
      }),
      Spell(26662, {so = true, desc = "After 10 minutes of combat, Sartura will Enrage and attack 150% faster and deal 500% more damage."}), -- Berserk
    },
    adds = {
      {
        name = "Sartura's Royal Guard",
        creature = 15984,
        display = 15465,
      },
    },
  },
  {
    name = "Fankriss the Unyielding",
    desc = "Fankriss the Unyielding, a sand reaver, is the big brother of Kurinnaxx, and the third boss of the Temple of Ahn'Qiraj.",
    --icon = true,
    creature = 15510,
    display = 15743,
    coords = {0.621, 0.228, 1},
    loot = {76402,21664,21663,20727,22402,21650,21627,21232,21639,20730,},
    sections = {
      Spell(518, {so = true, desc = "At random times during the encounter, Spawn of Fankriss will join the fight from a random location in the room.", flag1 = DEADLY, sections = {
        Stage({
          stype = CREATURE,
          creature = 15630,
          display = 15582,
          name = "Spawn of Fankriss",
          flag1 = DEADLY,
          sections = {
            Spell(26662, {so = true, desc = "You have 20 seconds to kill it after it spawns, otherwise the Spawn of Fankriss will Berserk and increase all damage it deals by 500%, attack and move 150% faster and will be immune to taunt.", flag1 = DEADLY}), -- Berserk
          },
        }),
      }}), -- Summon Worm (25831, 25832, all the 3 locations got their own spell)
      Spell(720, {so = true, desc = "As four Vekniss Hatchlings spawn from the three tunnels in the room, Fankriss will teleport a random player to one of the three bug tunnels, rooting them in place for 8 seconds and having the hatchlings in that tunnel attack that player.\n\nRoughly each 60 seconds, four bugs spawn in these tunnels and a random player is teleported. Off-tanks should help out save the players caught and off-tank the bugs.", flag1 = IMPORTANT, sections = {
        Stage({
          stype = CREATURE,
          creature = 15962,
          display = 15362,
          name = "Vekniss Hatchling",
          desc = "Auto attacks and deals around 900 damage on cloth users, much less on tanks.",
        }),
      }}), -- Entangle (731, 1121, all the 3 tunnels got their own spell)
      Spell(25646, {so = true, desc = "A pushing blow strikes the target, reducing the effectiveness of healing spells by 10%, stacks up maximum 10 times, ultimately reducing all healing received by 100%. Lasts 15 seconds.", flag1 = TANK}), -- Mortal Wound
    },
    adds = {
      {
        name = "Spawn of Fankriss",
        creature = 15630,
        display = 15582,
      },
      {
        name = "Vekniss Hatchling",
        creature = 15962,
        display = 15362,
      },
    },
  },
  {
    name = "Viscidus",
    desc = "Viscidus is an optional boss in the Temple of Ahn'Qiraj, a giant slime that can be accessed after the death of Fankriss the Unyielding. This boss requires a high Nature Resistance as it uses AoE poison bolts which have direct damage along with DoTs. He resets if taken outside his room, much like the bosses in Zul'Gurub. If you are about to wipe, run outside the room and you may be able to save your life.",
    --icon = true,
    creature = 15299,
    display = 15686,
    coords = {0.721, 0.181, 1},
    loot = {20734,21232,21623,20932,21625,76402,22399,20727,},
    sections = {
      Stage({
        name = "The Three Frost Stages",
        desc = "Viscidus must be slowed by Frost attacks in order to defeat him. The damage does not mater, only the number of hits.",
        sections = {
          Stage({
            so = true,
            name = "Viscidus begins to slow",
            desc = "Movement and attack speed reduced by 15%. This phase begins after 100 frost abilities were used.",
          }),
          Stage({
            so = true,
            name = "Viscidus is freezing up",
            desc = "Movement and attack speed reduced by 30%. This phase begins after 150 frost abilities were used.",
          }),
          Stage({
            so = true,
            name = "Viscidus is frozen solid",
            desc = "Movement and attacks cease completely. This phase begins after 200 frost abilities were used.\n\nYou have now started The Three Melee Stages.",
          }),
        },
      }),
      Stage({
        name = "The Three Melee Stages",
        desc = "Once Viscidus is frozen solid, he must be shattered. This must happen quickly or he will thaw out and you have to do the frost stages again.",
        sections = {
          Stage({
            so = true,
            name = "Viscidus begins to crack",
            desc = "Continue melee attacks.",
          }),
          Stage({
            so = true,
            name = "Viscidus looks ready to shatter",
            desc = "Continue melee attacks.",
          }),
          Stage({
            so = true,
            name = "Viscidus explodes",
            desc = "Viscidus shatters into multiple small Globs of Viscidus in a circle around the room. They will move towards the center of the room, slowly at first but they will gain speed eventually. Once they reach the center, Viscidus will be reformed.",
          }),
          Stage({
            stype = CREATURE,
            creature = 15667,
            display = 12349,
            name = "Glob of Viscidus",
            desc = "These only walk towards the center of the room, in order to reform Viscidus.",
          }),
        },
      }),
      Spell(25993, {so = true, desc = "Splashes all enemies within 15 yards and in a cone in front, for 1050 to 1350 Nature damage.", flag1 = IMPORTANT}), -- Poison Shock
      Spell(25991, {so = true, desc = "Shoots poison bolts at all enemies, inflicting 1313 to 1687 Nature damage, then additional 413 to 587 Nature damage every 2 seconds for 10 seconds. Stacks to maximum 99 stacks.", flag1 = POISON}), -- Poison Bolt Volley
      Stage({
        so = true,
        stype = ABILITY,
        icon = "Interface\\Icons\\INV_Misc_Slime_01",
        name = "Toxin Clouds",
        desc = "Spews out a cloud of toxin at a random player every 30 to 40 seconds. Anyone in it will take 1500 unresistable damage every 2 seconds and have their movement speed slown by 40%.",
        flag1 = DEADLY,
      }),
      --Spell(26608), -- Despawn Globs
      --Spell(20477), -- Summon Player
    },
    adds = {
      {
        name = "Glob of Viscidus",
        creature = 15667,
        display = 12349,
      },
    },
  },
  {
    name = "Princess Huhuran",
    desc = "Princess Huhuran is a large silithid wasp, and the fourth boss of the Temple of Ahn'Qiraj. She requires very high amounts of nature resistance on all players.",
    --icon = true,
    creature = 15509,
    display = 15739,
    coords = {0.436, 0.505, 1},
    loot = {20731,21232,21617,20932,21620,20727,21616,20734,},
    sections = {
      Spell(26050, {desc = "Inflicts 219 to 281 Nature damage every 2 seconds for 30 seconds on the target. Stacks to maximum 99 stacks.", flag1 = TANK}), -- Acid Spit
      Spell(26053, {desc = "Spits a noxious poison onto a nearby enemy, and any nearby enemies within 15 yards of that target, dealing 750 Nature damage and silencing them for 8 seconds.", flag1 = IMPORTANT}), -- Noxious Poison
      Spell(26180, {desc = "Stings a nearby enemy and puts them to sleep for 12 seconds. Any damage taken will cancel the effect.", flag1 = POISON}), -- Wyvern Sting
      Spell(26051, {so = true, desc = "Decreases time between attacks by 150% for 8 seconds, along with damaging all enemies for 1500 to 2500 Nature damage each 4 seconds.", flag1 = ENRAGE}), -- Enrage
      Spell(26068, {so = true, desc = "At 30% health, Huhuran will attack 200% faster and inflict 1500 to 2500 Nature damage each 2 seconds to all enemies.", flag1 = DEADLY}), -- Berserk
    },
  },
  {
    name = "The Twin Emperors",
    desc = "The clever brothers Combat Vek'lor and Combat Vek'nilash are known as the Twin Emperors. They rule over the qiraji from the sanctuary of their temple.\n\nIn this area, Qiraji Scarabs and Qiraji Scorpions are scattered all around the floor, and if killed, they constantly respawn throughout the fight. They are initially neutral, but turn hostile when hit by any sort of area of effect spell or when mutated by Emperor Vek'nilash.\n\nBoth brothers share the same health pool, meaning if you damage one, the other takes the same amount of damage in percent.",
    --icon = true,
    creature = 15276,
    display = 15778,
    coords = {0.605, 0.698, 1},
    loot = {20726,20735,21232,21597,21598,21602,21604,21606,21609,76402,},
    sections = {
      Stage({
        so = true,
        name = "Abilities shared by both",
        sections = {
          Spell(7393, {so = true, desc = "Heals the other brother for 30000 when within 60 yards. They will both cast it on each other, ultimately healing themselves 60000 per tick.", flag1 = IMPORTANT}), -- Heal Brother
          Spell(800, {so = true, desc = "Every 30 to 40 seconds, the twins will switch places with each other. They will be rooted for about 2 seconds, and then the first attack to hit them receives all the built up threat from their last tanking target. This includes DoT abilities cast before the teleport, so to the tanks; be swift to pick them up.", flag1 = IMPORTANT, flag2 = TANK}), -- Twin Teleport
          --Spell(20477), -- Summon Player
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 15276,
        display = 15778,
        name = "Emperor Vek'lor",
        desc = "The caster brother, immune to all physical damage and has a mana bar.",
        sections = {
          Spell(26006, {desc = "Hurls a bolt of dark magic at the target, inflicting 3600 to 4400 Shadow damage."}), -- Shadow Bolt
          Spell(26607, {desc = "Ice shards pelt the target area doing 1388 to 1612 Frost damage every 2 seconds for 10 seconds, to all targets within 10 yards. Also reduces movement speed by 30%.", flag1 = IMPORTANT}), -- Blizzard
          Spell(568, {flag1 = TANK}), -- Arcane Burst
          Spell(804, {desc = "Forces a bug within 30 yards to explode after 3 seconds, used every 7 to 10 seconds. The explosion causes 2813 to 3187 Fire damage to anyone within 15 yards.", flag1 = IMPORTANT}), -- Explode Bug
          Spell(27897, {desc = "After 15 minutes will go berserk and cast Arcane Explosion every 4 seconds and hit all enemies for 2480 to 2900 Arcane damage.", flag1 = DEADLY}), -- Frenzy
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 15275,
        display = 15761,
        name = "Emperor Vek'nilash",
        desc = "The melee brother, swings a big sword. Immune to all magical damage except Holy.",
        sections = {
          Spell(26007, {desc = "Inflicts normal damage plus 950 to 1050 to the target, knocking it far back.", flag1 = TANK}), -- Uppercut
          Spell(26613, {flag1 = HEALER}), -- Unbalancing Strike
          Spell(802, {desc = "Increases health by 300% and damage dealt by 1800% to a scarab within 25 yards. Easily noticable because the scarab grows 400% in size.", flag1 = IMPORTANT}), -- Mutate Bug
          Spell(27680, {desc = "After 15 minutes will go berserk and deal 500% more damage, and move 150% faster.", flag1 = DEADLY}), -- Berserk
        },
      }),
    },
    adds = {
      {
        name = "Emperor Vek'nilash",
        creature = 15275,
        display = 15761,
      },
    },
  },
  {
    name = "Ouro",
    desc = "The ancient sand worm, Ouro, is a being of legendary power. He is rumored to have been created by the Old God C'Thun himself as a mockery of life. He resides in the Temple of Ahn'Qiraj.\n\nHis skin is unnaturally thick, nearly impregnable. It's flexible and allows him to move with the speed and grace of a much smaller creature.",
    --icon = true,
    creature = 15517,
    display = 15509,
    coords = {0.304, 0.819, 1},
    loot = {20731,21232,23558,20931,23570,20728,21610,20730,},
    sections = {
      Stage({
        so = true,
        name = "Phase 1",
        sections = {
          Stage({
            stype = ABILITY,
            icon = "Interface\\Icons\\Spell_Nature_Earthquake",
            name = "Submerge",
            desc = "Burrows under the ground. Ouro becomes untargetable and undamagable. He will try to submerge each 90 seconds, but will not if he is busy casting Sand Blast or Sweep. If he has no melee targets at him for a longer perioid, he will also submerge.",
            flag1 = IMPORTANT,
            sections = {
              Spell(26058, {so = true, name = "Dirt Mound's Quake", icon = "Interface\\Icons\\INV_Misc_Dust_02", desc = "Scarabs below the surface start moving around, dealing 675 to 825 Nature damage to anyone standing within 8 yards of them.", flag1 = IMPORTANT}, 1), -- Summon Ouro Mounds
              Spell(26100, {so = true, desc = "When Ouro reappears from below ground, he deals 2250 to 2750 damage to enemies standing on top of him, knocking them far back. This also summons many Ouro Scarabs.", flag1 = IMPORTANT}), -- Ground Rupture
              Stage({
                so = true,
                stype = CREATURE,
                creature = 15718,
                display = 11108,
                name = "Ouro Scarab",
                desc = "As they emerge with Ouro, they will pick a nearby target and fixate on it, auto attacking it for 40 to 300 damage. These scarabs are weak and will retreat after 45 seconds of combat.",
              }),
            },
          }), -- Submerge
          Spell(26103, {desc = "Deals 2625 to 3375 damage to enemies within 30 yards, knocking them back.", flag1 = TANK}), -- Sweep
          Spell(26102), -- Sand Blast
        },
      }),
      Stage({
        so = true,
        name = "Phase 2",
        desc = "Ouro enters phase 2 when he reaches 20% health.",
        sections = {
          Spell(26615, {so = true, desc = "Ouro will go berserk, become unstoppable and attack 150% faster.", flag1 = DEADLY}), -- Berserk
          Spell(26616, {so = true, icon = "Interface\\Icons\\INV_Stone_10", desc = "If there is no melee at Ouro during this phase, he will throw a boulder at random enemies and inflict 6000 damage.", flag1 = DEADLY}, 1), -- Boulder
        },
      }),
    },
    adds = {
      {
        name = "Ouro Scarab",
        creature = 15718,
        display = 11108,
      },
    },
  },
  {
    name = "C'Thun",
    desc = "C'Thun (pronounced \"Kah-Thoon\" or \"Kathune\") is the final boss in the Temple of Ahn'Qiraj. Until the release of the original Naxxramas and later The Burning Crusade, C'Thun was considered the most difficult raid boss in the game.",
    --icon = true,
    creature = 15589,
    display = 15556,
    coords = {0.570, 0.630, 3},
    loot = {21585,22731,20929,20933,22732,21134,21586,21126,},
    sections = {
      Stage({
        so = true,
        name = "Phase 1",
        desc = "This phase lasts until the Eye of C'Thun has been destroyed.",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 15589,
            display = 15556,
            name = "Eye of C'Thun",
            sections = {
              Spell(32950, {so = true, flag1 = IMPORTANT}), -- Eye Beam
              Spell(26029, {so = true, desc = "Randomly selects an enemy, focusing at its location and after a moment unleashes the Dark Glare beam, rotating 180 degrees either clockwise or anticlockwise, and killing anything that passes trough.", flag1 = DEADLY}), -- Dark Glare
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15726,
            display = 15788,
            name = "Eye Tentacle",
            desc = "Spawns eight small eyes around C'Thun, each 45 seconds. Deals 1350 to 1650 damage upon spawn to anyone on top of it, knocking them back.",
            sections = {
              Spell(26143, {so = true, desc = "Inflicts 750 Shadow damage every second for 10 seconds. Slows movement to 30% of normal.", flag1 = IMPORTANT}), -- Mind Flay
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15726,
            display = 15788,
            name = "Claw Tentacle",
            desc = "Spawns at random locations at random times. Deals 1350 to 1650 damage upon spawn to anyone on top of it, knocking them back.",
            sections = {
              Spell(26141, {so = true, desc = "Inflicts 463 to 537 damage to an enemy, reducing its movement speed by 70% for 10 seconds.", flag1 = IMPORTANT}), -- Hamstring
            },
          }),
        },
      }),
      Stage({
        so = true,
        name = "Phase 2",
        desc = "This phase lasts until the Body of C'Thun has been weakened then killed.",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 15727,
            display = 15787,
            name = "Body of C'Thun",
            desc = "Every 10 seconds, C'Thun will swallow an enemy and place them in his stomach.",
            sections = {
              Stage({
                so = true,
                stype = CREATURE,
                creature = 15802,
                display = 15793,
                name = "Flesh Tentacle",
                desc = "Upon the destruction of both tentacles in the stomach, C'Thun will be weakened for 45 seconds and can be damaged.",
                flag1 = IMPORTANT,
              }),
              Spell(26476, {so = true, desc = "While in the stomach of C'Thun, inflicts 150 damage every 5 seconds, stacking up to 99 stacks.\n\nDue to a bug the damage scales with Spell Power. If you have 5000 Spell Power it will tick 5000, then 10000, 15000, 20000, and so forth.", flag1 = DEADLY}), -- Digestive Acid
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15726,
            display = 15788,
            name = "Eye Tentacle",
            desc = "These continue to spawn around C'Thun, only this time they spawn each 30 seconds. Deals 1350 to 1650 damage upon spawn to anyone on top of it, knocking them back.",
            sections = {
              Spell(26143, {so = true, desc = "Inflicts 750 Shadow damage every second for 10 seconds. Slows movement to 30% of normal.", flag1 = IMPORTANT}), -- Mind Flay
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15334,
            display = 15948,
            name = "Giant Eye Tentacle",
            desc = "Once every minute, within a 30 seconds offset from a Giant Claw Tentacle, C'Thun will summon a Giant Eye Tentacle. Deals 2250 to 2750 damage upon spawn to anyone on top of it, knocking them back.",
            sections = {
              Spell(26134, {so = true, flag1 = IMPORTANT}), -- Eye Beam
            },
          }),
          Stage({
            stype = CREATURE,
            creature = 15728,
            display = 15790,
            name = "Giant Claw Tentacle",
            desc = "Once every minute, within a 30 seconds offset from a Giant Eye Tentacle, C'Thun will summon a Giant Claw Tentacle. Deals 2250 to 2750 damage upon spawn to anyone on top of it, knocking them back. If no one is near them, they will burrow and emerge near an enemy, restoring its health in the process.",
            sections = {
              Spell(26211, {so = true, desc = "Inflicts weapon damage plus 657 to 843 to an enemy, reducing its movement speed by 70% for 10 seconds."}), -- Hamstring
              Spell(6524, {so = true, desc = "Stuns enemies within 20 yards for 2 seconds."}), -- Ground Tremor
              Spell(3391, {flag1 = HEALER}), -- Thrash
            },
          }),
        },
      }),
    },
    adds = {
      {
        name = "Body of C'Thun",
        creature = 15727,
        display = 15787,
      },
    },
  },
})

table.insert(db, TEMPLE_OF_AHNQIRAJ)
