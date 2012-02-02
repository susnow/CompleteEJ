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

local DIRE_MAUL = CreateInstance({
  name = "Dire Maul",
  desc = "Built twelve thousand years ago by a covert sect of night elf sorcerers, the ancient city of Eldre'Thalas was used to protect Queen Azshara's most prized arcane secrets. Though it was ravaged by the Great Sundering of the world, much of the wondrous city still stands as the imposing Dire Maul. The ruins' three distinct districts have been overrun by all manner of creatures — especially the spectral Highborne, foul satyr and brutish ogres. Only the most daring party of adventurers can enter this broken city and face the ancient evils locked within its ancient vaults.",
  texture = "DireMaul",
  area = 699,
  dflag = N5,
}, {
  {
    name = "Pusillin",
    desc = "This annoying Imp will keep running away when you talk to him, keep following him into his lair. Once cornered, you may take back the Book of Incantations and return it to Dagg'thol at the entrance. It's usually the first boss in the east wing to be defeated, in order to avoid uneccesary backtracking.",
    --icon = true,
    creature = 14354,
    display = 7552,
    coords = {0.757, 0.445, 5},
    loot = {18261,18267,12662,},
    sections = {
      Spell(22735, {so = true, desc = "Once engaged, Pusillin will grow in size, attack 20% faster and reflect 50% of all harmful spells cast at him.", flag1 = IMPORTANT}), -- Spirit of Runn Tum
      Spell(17145, {so = true, desc = "Unleashes a wave of flame, inflicting 49 to 58 Fire damage to nearby enemies and reducing their movement speed by 50% for 6 seconds."}), -- Blast Wave
      Spell(14145, {desc = "Inflicts 49 to 58 Fire damage to an enemy."}), -- Fire Blast
      Spell(15242, {desc = "Inflicts 124 to 145 Fire damage to an enemy."}), -- Fireball
      Stage({
        stype = CREATURE,
        creature = 13276,
        display = 911,
        name = "Wildspawn Imp",
        desc = "Once engaged, four Wildspawn Imps will appear and assist Pusillin.",
        sections = {
          Spell(13340, {so = true, desc = "Inflicts 24 to 29 Fire damage to an enemy."}), -- Fire Blast
        },
      }),
    },
  },
  {
    name = "Lethtendris",
    desc = "She is often the second boss to be defeated in the east wing.",
    --icon = true,
    creature = 14327,
    display = 21012,
    coords = {0.438, 0.476, 5},
    loot = {18301,18302,18325,18311,},
    sections = {
      Spell(16247, {flag1 = CURSE}), -- Curse of Thorns
      Spell(13338, {flag1 = CURSE}), -- Curse of Tongues
      Spell(20787, {desc = "Burns an enemy for 49 to 58 Fire damage, then inflicts additional 6 Fire damage every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Immolate
      Spell(14887, {desc = "Hurls missiles of dark magic, inflicting 74 to 87 Shadow damage to nearby enemies."}), -- Shadow Bolt Volley
      Spell(22709), -- Void Bolt
      Spell(22710, {desc = "Enlarges Pimgib, increases his Physical damage by 6 and making all his spells instant cast.", flag1 = MAGIC}), -- Enlarge
      Stage({
        so = true,
        stype = CREATURE,
        creature = 14349,
        display = 14380,
        name = "Pimgib",
        sections = {
          Spell(22713, {desc = "Inflicts 19 to 21 Fire damage to an enemy and increases the Fire damage it takes by 20 for 20 seconds. Stacks maximum 5 times."}), -- Flame Buffet
          Spell(15744, {desc = "Unleashes a wave of flame, inflicting 37 to 43 Fire damage to nearby enemies and reducing their movement speed by 50% for 6 seconds."}), -- Blast Wave
          Spell(14034, {desc = "Inflicts 74 to 87 Fire damage to an enemy."}), -- Fireball
        },
      }),
    },
  },
  {
    name = "Hydrospawn",
    desc = "This elemental is located on the lower level, past Lethtendris in the east wing.",
    --icon = true,
    creature = 13280,
    display = 5489,
    coords = {0.525, 0.700, 6},
    loot = {18317,18324,18322,18307,18305,19268,},
    sections = {
      Spell(22419, {so = true, flag1 = MAGIC}), -- Riptide
      Spell(22420, {so = true, desc = "Reduces the Stamina of nearby enemies by 10 for 1 minute. Stacks maximum 20 times.", flag1 = MAGIC}), -- Submersion
      Spell(22714, {so = true, desc = "Summons two Hydrolings to aid Hydrospawn. They do not perform any special abilities."}), -- Summon Hydroling
      Spell(22421, {so = true, desc = "Summons a massive geyser.", sections = {
        Spell(22422), -- Water
      }}), -- Massive Geyser
    },
  },
  {
    name = "Zevrim Thornhoof",
    desc = "He is located on a platform above Hydrospawn in the east wing. There is a ramp leading you up to him.",
    --icon = true,
    creature = 11490,
    display = 11335,
    coords = {0.585, 0.750, 6},
    loot = {18319,18323,18313,18308,18306,},
    sections = {
      Spell(22651, {so = true, flag1 = IMPORTANT}), -- Sacrifice
      Spell(22478, {so = true, flag1 = MAGIC}), -- Intense Pain
    },
  },
  {
    name = "Alzzin the Wildshaper",
    desc = "He took over the east side of Dire Maul and corrupted the Fruit of Fertility tree so that it produces vile Felvine Shards. Alzzin has attracted all manner of corrupted plant life, satyrs, mages and demons to his cause. The entire district is overgrown with crazed plant life. he is the final boss of the Warpwood Quarter.",
    --icon = true,
    creature = 11492,
    display = 14416,
    coords = {0.563, 0.286, 6},
    loot = {18310,18312,18321,18318,18326,18315,18327,18309,18314,18328,},
    sections = {
      Spell(22691), -- Disarm
      Spell(10101), -- Knock Away
      Spell(22660, {so = true, desc = "Randomly transforms into a Dire Wolf, increasing melee attack speed by 75% and melee damage by 50%.", sections = {
        Spell(19319, {desc = "Bites an enemy, inflicting weapon damage."}), -- Vicious Bite
        Spell(22689), -- Mangle
      }}), -- Dire Wolf Form
      Spell(22688, {so = true, icon = "Interface\\Icons\\Ability_Druid_ForceOfNature", desc = "Randomly transforms into a Tree, increasing armor by 3000 and melee damage by 25%.", sections = {
        Spell(22128, {desc = "Thorns sprout from Alzzin causing 20 Nature damage to attackers when hit.", flag1 = MAGIC}), -- Thorns
        Spell(22662, {flag1 = DISEASE}), -- Wither
        Spell(22661, {desc = "Drains 200 mana from the enemy target every 2 seconds for 8 seconds.", flag1 = POISON}), -- Enervate
        Spell(7948, {flag1 = MAGIC}), -- Wild Regeneration
      }}), -- Tree Form
      Stage({
        so = true,
        name = "At 30% health",
        desc = "Alzzin summons a horde of imps to help him. Any remaining adds nearby will also join the battle.",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 11460,
            display = 911,
            name = "Alzzin's Minion",
            desc = "Does not perform any special abilities.",
          }),
        },
      }),
    },
  },
  {
    name = "Guard Mol'dar",
    desc = "First boss in the north wing. If you complete the Tribute Run, you can return to him and receive Mol'dar's Moxie, a buff increasing stamina by 15% for 2 hours. In order to complete a Tribute Run, you have to skip killing Guard Mol'dar and carry onward. The end chest will drop better items than his loot table, and combine all skipped bosses.",
    --icon = true,
    creature = 14326,
    display = 11561,
    coords = {0.694, 0.758, 1},
    loot = {18451,18493,18460,18496,18463,18494,18498,18497,18450,18462,18459,18458,18464,},
    sections = {
      Spell(14516, {so = true, desc = "Strikes at an enemy, inflicting 110% weapon damage."}), -- Strike
      Spell(11972, {so = true}), -- Shield Bash
      Spell(15749, {so = true, desc = "Charges an enemy within 8 to 25 yards range, knocking it back and inflicting normal damage plus 150."}), -- Shield Charge
      Spell(8269, {so = true, desc = "At 20% health he will frenzy and attack 60% faster for 2 minutes."}), -- Frenzy
      --Spell(22818, {flag1 = MAGIC}), -- Mol'dar's Moxie
    },
  },
  {
    name = "Stomper Kreeg",
    desc = "The second boss in the north wing. If you complete the Tribute Run, you can return to him and purchace some consumables. In order to complete a Tribute Run, you have to skip killing Stomper Kreeg and carry onward. The end chest will drop better items than his loot table, and combine all skipped bosses.",
    --icon = true,
    creature = 14322,
    display = 11545,
    coords = {0.610, 0.685, 1},
    loot = {18425,},
    sections = {
      Spell(22833, {so = true}), -- Booze Spit
      Spell(16740, {so = true}), -- War Stomp
      Spell(15578, {so = true}), -- Whirlwind
      Spell(8269, {so = true, desc = "At 20% health he will frenzy and attack 60% faster for 2 minutes."}), -- Frenzy
      --Spell(22835, {desc = ""}), -- Drunken Rage
    },
  },
  {
    name = "Guard Fengus",
    desc = "The third boss in the north wing. If you complete the Tribute Run, you can return to him and receive Fengus' Ferocity, a buff increasing attack power by 200 for 2 hours. In order to complete a Tribute Run, you have to skip killing Guard Fengus and carry onward. The end chest will drop better items than his loot table, and combine all skipped bosses.",
    --icon = true,
    creature = 14321,
    display = 11561,
    coords = {0.496, 0.785, 1},
    loot = {18460,18450,18462,18458,18451,18459,18463,18464,},
    sections = {
      Spell(14516, {so = true, desc = "Strikes at an enemy, inflicting 110% weapon damage."}), -- Strike
      Spell(11972, {so = true}), -- Shield Bash
      Spell(15749, {so = true, desc = "Charges an enemy within 8 to 25 yards range, knocking it back and inflicting normal damage plus 150."}), -- Shield Charge
      Spell(8269, {so = true, desc = "At 20% health he will frenzy and attack 60% faster for 2 minutes."}), -- Frenzy
      --Spell(22817, {flag1 = MAGIC}), -- Fengus' Ferocity
    },
  },
  {
    name = "Guard Slip'kik",
    desc = "The fourth boss in the north wing. If you complete the Tribute Run, you can return to him and receive Slip'kik's Savvy, a buff increasing critical strike rating by 42 for 2 hours. In order to complete a Tribute Run, you have to trap him using the nearby trap. The end chest will drop better items than his loot table, and combine all skipped bosses.",
    --icon = true,
    creature = 14323,
    display = 11561,
    coords = {0.264, 0.576, 1},
    loot = {18463,18494,18450,18496,18459,18451,18498,18497,18458,18493,18460,18462,18464,},
    sections = {
      Spell(14516, {so = true, desc = "Strikes at an enemy, inflicting 110% weapon damage."}), -- Strike
      Spell(11972, {so = true}), -- Shield Bash
      Spell(15749, {so = true, desc = "Charges an enemy within 8 to 25 yards range, knocking it back and inflicting normal damage plus 150."}), -- Shield Charge
      Spell(8269, {so = true, desc = "At 20% health he will frenzy and attack 60% faster for 2 minutes."}), -- Frenzy
      --Spell(22820, {flag1 = MAGIC}), -- Slip'kik's Savvy
      --Spell(22856), -- Ice Lock
    },
  },
  {
    name = "Captain Kromcrush",
    desc = "The fifth boss in the north wing. If you complete the Tribute Run, you can return to him and start a quest. In order to complete a Tribute Run, you have to receive a Gordok Ogre Suit from Knot Thimblejack, he is located near Guard Slip'kik. One person has to use the suit, talk to Kromcrush and make him abandon his post. The end chest will drop better items than his loot table, and combine all skipped bosses.",
    --icon = true,
    creature = 14325,
    display = 11564,
    coords = {0.318, 0.502, 1},
    loot = {18507,18502,18503,18505,},
    sections = {
      Spell(19134, {desc = "Shouts at nearby enemies causing them to flee in fear for 6 seconds and increases their movement speed by 25%.", flag1 = IMPORTANT}), -- Frightening Shout (triggers 29544)
      Spell(22859, {flag1 = HEALER}), -- Mortal Cleave
      Spell(22857, {desc = "Instantly counterattacks any enemies that strikes Captain Kromcrush for 8 seconds.", flag1 = DPS}), -- Retaliation
      Spell(8599, {desc = "Enrages at 20% health and increases physical damage done by 10% and attack speed by 30% for 2 minutes.", flag1 = ENRAGE}), -- Enrage
      Spell(22860, {so = true, name = "At 50% health: Call Reavers", sections = {
        Stage({
          so = true,
          stype = CREATURE,
          creature = 52761,
          display = 10709,
          name = "Gordok Reaver",
          sections = {
            Spell(15496, {flag1 = TANK}), -- Cleave
            Spell(13737, {flag1 = HEALER}), -- Mortal Strike
            Spell(15572, {flag1 = HEALER}), -- Sunder Armor
          },
        }),
      }}, 1), -- Call Reavers
    },
  },
  {
    name = "King Gordok",
    desc = "The last boss in the north wing. In order to complete a Tribute Run, you have to spare Cho'Rush the Observer and then defeat King Gordok. He will turn friendly once the king is defeated, and you speak to him to spawn the Gordok Tribute chest, containing all sort of high quality items.",
    --icon = true,
    creature = 11501,
    display = 11583,
    coords = {0.318, 0.270, 1},
    loot = {18527,18523,18524,19258,18526,18521,18520,18525,18522,18780,18483,18485,18484,18490,},
    sections = {
      Spell(22886, {desc = "Charges a random enemy, knocking it far back and inflicting normal damage plus 300.", flag1 = IMPORTANT}), -- Berserker Charge
      Spell(16856, {flag1 = HEALER}), -- Mortal Strike
      Spell(15572, {flag1 = HEALER}), -- Sunder Armor
      Spell(16727), -- War Stomp
      Stage({
        so = true,
        stype = CREATURE,
        creature = 14324,
        display = 11537,
        name = "Cho'Rush the Observer",
        desc = "Each instance he will have a different role and cast spells accosiated with that role.",
        sections = {
          Stage({
            icon = "Interface\\Icons\\INV_Staff_13",
            name = "Mage",
            sections = {
              Spell(12466, {desc = "Inflicts 99 to 116 Fire damage to an enemy."}), -- Fireball
              Spell(15531, {desc = "Inflicts 99 to 116 Frost damage to nearby enemies, immobilizing them for 8 seconds.", flag1 = MAGIC}), -- Frost Nova
              Spell(33860, {desc = "Sends out a blast wave of magic, inflicting 49 to 58 Arcane damage to nearby enemies."}), -- Arcane Explosion
            },
          }),
          Stage({
            icon = "Interface\\Icons\\Inv_Staff_30",
            name = "Priest",
            sections = {
              Spell(15587, {desc = "Inflicts 49 to 58 Shadow damage to an enemy."}), -- Mind Blast
              Spell(22884, {flag1 = MAGIC}), -- Psychic Scream
              Spell(17139, {desc = "Wraps an ally in a shield that lasts up to 30 sec, absorbing 274 damage.", flag1 = MAGIC}), -- Power Word: Shield
              Spell(38209, {desc = "Calls upon Holy magic to heal an ally for 326 to 379.", flag1 = INTERRUPT}), -- Heal
            },
          }),
          Stage({
            icon = "Interface\\Icons\\Spell_Nature_Bloodlust",
            name = "Shaman",
            sections = {
              Spell(15801, {desc = "Blasts an enemy with lightning, inflicting 99 to 116 Nature damage."}), -- Lightning Bolt
              Spell(16006, {desc = "Strikes an enemy with a lightning bolt that arcs to another nearby enemy. The spell affects up to 3 targets, causing 99 to 116 Nature damage to each."}), -- Chain Lightning
              Spell(15982, {desc = "Calls upon Nature magic to heal an ally for 319 to 370.", flag1 = INTERRUPT}), -- Healing Wave
              Spell(16170, {desc = "Increases an ally's attack speed by 60% for 30 seconds.", flag1 = MAGIC}), -- Bloodlust
              --Spell(8376), -- Earthgrab Totem
              Stage({
                so = true,
                stype = CREATURE,
                creature = 6066,
                display = 2420,
                name = "Earthgrab Totem",
                desc = "Summons an Earthgrab Totem that lasts 30 seconds.",
                sections = {
                  Spell(8377, {so = true}), -- Earthgrab
                },
              }),
            },
          }),
        },
      }),
    },
  },
  {
    name = "Magister Kalendris",
    desc = "The first boss in the west wing. For a more optimal path, you should head over to him by running to one of the side paths and saving Tendris Warpwood for later. Remember to destroy the crystal by killing the Mana Remnants and Arcane Aberrations, along with the patrolling Ironbark Protectors.",
    --icon = true,
    creature = 11487,
    display = 14384,
    coords = {0.337, 0.448, 3},
    loot = {18350,18397,18374,18351,18371,},
    sections = {
      Spell(22917, {desc = "His Shadowform increases his Shadow damage by 40% and reduces melee damage taken by 40%."}), -- Shadowform
      Spell(7645, {desc = "Takes control of a humanoid enemy for 10 seconds, but increases the time between its attacks by 100%.", flag1 = MAGIC}), -- Dominate Mind
      Spell(15654, {desc = "Utters a word of darkness, inflicting 9 Shadow damage to an enemy every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Shadow Word: Pain
      Spell(22919, {desc = "Inflicts 160 Shadow damage each second on up to 3 enemies and reduces their movement speed by 50% for 3 seconds."}), -- Mind Flay
      Spell(15587, {desc = "Inflicts 49 to 58 Shadow damage to an enemy."}), -- Mind Blast
    },
  },
  {
    name = "Illyanna Ravenoak",
    desc = "Once Magister Kalendris is defeated, continue up the ramp and onto the upper floor. Make your way and destroy the two crystals and you will soon enough also encounter Illyanna Ravenoak and her pet. Note that no mater what level you are, she has a 60 yards aggro range.",
    --icon = true,
    creature = 11488,
    display = 11270,
    coords = {0.208, 0.782, 2},
    loot = {18386,18349,18383,18347,},
    sections = {
      Spell(22910, {desc = "Place a fire trap that will burn the first enemy to approach for 4 Fire damage every 3 seconds over 15 seconds.", flag1 = MAGIC}), -- Immolation Trap (triggers 78578)
      Spell(22914, {desc = "Dazes an enemy, reducing its movement speed by 50% or stuns it for 3 seconds.", flag1 = MAGIC}), -- Concussive Shot (triggers 22915)
      Spell(20735), -- Multi-Shot
      Spell(30933), -- Volley
      Stage({
        so = true,
        stype = CREATURE,
        creature = 14308,
        display = 1083,
        name = "Ferra",
        sections = {
          Spell(22911, {desc = "Charges an enemy, inflicting 75% weapon damage and stunning the enemy for 2 seconds."}), -- Charge
          Spell(17156, {desc = "Increases melee damage done by 10% on next attack."}), -- Maul
        },
      }),
    },
  },
  {
    name = "Tendris Warpwood",
    desc = "Once engaged, any remaining Ironbark Protectors will come to assist.",
    --icon = true,
    creature = 11489,
    display = 14383,
    coords = {0.332, 0.534, 2},
    loot = {18390,18353,18352,18393,},
    sections = {
      Spell(22994, {so = true, desc = "Entangles an enemy in roots, inflicting 4 Nature damage every 3 seconds and immobilizing it for 10 seconds."}), -- Entangle
      Spell(22924, {so = true, desc = "Inflicts 263 to 337 Physical damage to nearby enemies, knocking them down for 2 seconds and immobilizing them for 10 seconds.", flag1 = MAGIC}), -- Grasping Vines
      Spell(5568, {so = true, desc = "Inflicts 108% weapon damage to nearby enemies."}), -- Trample
    },
  },
  {
    name = "Immol'thar",
    desc = "In order to fight Immol'thar you have to destroy the two crystals in his room, and thw two crystals on the second floor in the Capital Gardens, don't forget the one right at the start of the dungeon.",
    --icon = true,
    creature = 11496,
    display = 14173,
    coords = {0.348, 0.573, 4},
    loot = {18370,18384,18389,18379,18391,18372,18385,18377,18394,18381,},
    sections = {
      Spell(16128, {desc = "Inflicts 13 Nature damage to an enemy every 3 seconds and increases the Physical damage it takes by 20 for 15 seconds.", flag1 = DISEASE}), -- Infected Bite
      Spell(5568, {desc = "Inflicts 108% weapon damage to nearby enemies."}), -- Trample
      Spell(8269, {desc = "Frenzies at 20% health and increases attack speed by 60% for 2 minutes."}), -- Frenzy
      Spell(22950, {desc = "Teleports a random enemy infront of himself."}), -- Portal of Immol'thar
      --Spell(22899, {desc = "Periodically summons an Eye of Immol'thar."}), -- Eye of Immol'thar
      Stage({
        so = true,
        stype = CREATURE,
        creature = 14396,
        display = 14430,
        name = "Eye of Immol'thar",
        --desc = "If left alive for too long, Immol'thar will be healed.",
        sections = {
          Spell(22909), -- Eye of Immol'thar
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 11466,
        display = 11207,
        name = "Highborne Summoner",
        sections = {
          Spell(9053, {desc = "Inflicts 49 to 58 Fire damage to an enemy."}), -- Fireball
          Spell(13339, {desc = "Inflicts 24 to 29 Fire damage to an enemy."}), -- Fire Blast
          Spell(11831, {desc = "Inflicts 24 to 29 Frost damage to nearby enemies, immobilizing them for 6 seconds.", flag1 = MAGIC}), -- Frost Nova
        },
      }),
    },
  },
  {
    name = "Prince Tortheldrin",
    desc = "The final boss in the west wing. Before you can face him you have to defeat Immol'thar.",
    --icon = true,
    creature = 11486,
    display = 11256,
    coords = {0.621, 0.233, 4},
    loot = {18380,18375,18376,18373,18378,18396,18382,18388,18392,18395,},
    sections = {
      Spell(22920, {so = true}), -- Arcane Blast
      Spell(20537, {so = true, desc = "Counters an enemy's spell, preventing the enemy from casting that spell again for 15 seconds.", flag1 = IMPORTANT}), -- Counterspell
      Spell(15589, {so = true, desc = "Attacks nearby enemies in a whirlwind of steel that inflicts normal damage plus 300.", flag1 = DPS}), -- Whirlwind
      Spell(3391, {so = true}), -- Thrash
      --Spell(22995), -- Summon
    },
  },
})

table.insert(db, DIRE_MAUL)
