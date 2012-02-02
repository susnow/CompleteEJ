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

local SCARLET_MONASTERY = CreateInstance({
  name = "Scarlet Monastery",
  desc = "The Scarlet Monastery is a stronghold for the Scarlet Crusade. The dungeon can be found northeast of the Undercity, near Lordaeron's northern coast. It features four different instances, each serving a different range of levels. The Graveyard is the lowest of the four with the Cathedral the highest.",
  texture = "ScarletMonastery",
  area = 762,
  dflag = N5,
}, {
  {
    name = "Interrogator Vishas",
    desc = "James Vishas is the Scarlet Crusade's lead interrogator at the Scarlet Monastery. He enjoys torturing any captured undead and takes great pride in his work. Vishas is known for his unrelenting sadism, cruel expertise, and high pitched voice.\n\nInterrogator Vishas has tortured Vorrel Sengutz for weeks. Vishas took Sengutz's wedding ring and gave it to his own wife, Nancy Vishas. Nancy lives with Grandpa Vishas, who is presumably James' father, although it is not mentioned, at a cottage on the eastern coast of Lordamere Lake in the Alterac Mountains.",
    --icon = true,
    creature = 3983,
    display = 2044,
    coords = {0.721, 0.596, 1},
    loot = {7683,7682,},
    sections = {
      Spell(9034, {so = true, desc = "Burns an enemy for 116 Fire damage, then inflicts additional 30 Fire damage every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Immolate
      Spell(14032, {so = true, desc = "Utters a word of darkness, inflicting 6 Shadow damage to an enemy every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Shadow Word: Pain
    },
  },
  {
    name = "Azshir, Fallen Champion, Ironspine (Rare)",
    desc = "One of these three bosses may spawn at random places at the graveyard, keep an eye out.",
    --icon = true,
    creature = 6490,
    display = 5534,
    coords = {0.490, 0.625, 1},
    loot = {7686,7687,7688,7689,7690,7691,7708,7709,7731,},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 6490,
        display = 5534,
        name = "Azshir the Sleepless",
        sections = {
          Spell(5137, {desc = "Inflicts 22 Shadow damage to an enemy after 15 seconds.", flag1 = CURSE}), -- Call of the Grave
          Spell(9373, {flag1 = MAGIC}), -- Soul Siphon
          Spell(7399, {desc = "Terrifies an enemy, causing it to flee in fear for 3 seconds.", flag1 = MAGIC}), -- Terrify
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 6488,
        display = 5230,
        name = "Fallen Champion",
        sections = {
          Spell(15496), -- Cleave
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 6489,
        display = 5231,
        name = "Ironspine",
        sections = {
          Spell(21007, {flag1 = CURSE}), -- Curse of Weakness
          Spell(3815, {flag1 = POISON}), -- Poison Cloud
        },
      }),
    },
  },
  {
    name = "Bloodmage Thalnos",
    desc = "Although he lacks any distinguishing mortal features, judging from his title it is assumed that Thalnos was once a blood elf mage prior to his undeath.",
    --icon = true,
    creature = 4543,
    display = 11396,
    coords = {0.244, 0.562, 1},
    loot = {7685,7684,},
    sections = {
      Spell(12470, {so = true, desc = "Inflicts 49 to 58 Fire damage to nearby enemies."}), -- Fire Nova
      Spell(8814, {so = true, desc = "Calls down a pillar of flame, burning all enemies in a selected area for 93 to 107 Fire damage and an additional 50 Fire damage every 3 seconds for 9 seconds."}), -- Flame Spike
      Spell(23038, {so = true, desc = "Instantly burns an enemy for 34 to 40 Fire damage, then inflicts additional 6 Fire damage every 3 seconds for 12 seconds.", flag1 = MAGIC}), -- Flame Shock
      Spell(20825, {so = true, desc = "Hurls a bolt of dark magic at an enemy, inflicting 69 to 81 Shadow damage."}), -- Shadow Bolt
    },
  },
  {
    name = "Headless Horseman (Hallow's End)",
    desc = "During Hallow's End, the Headless Horseman is a summoned elite boss spawned in the Pumpkin Shrine in the middle of the Forlorn Cloister in The Graveyard, an instanced wing of the Scarlet Monastery. Additionally, his shade attacks Horde and Alliance villages at various times throughout the event.\n\nThe Horseman was once a knight of the Silver Hand, but is now cursed. He is of the belief that he is alive, while those who face him are dead. When defeated, he is revealed as Thomas Thomson (aka Sir Thomas).",
    --icon = true,
    creature = 23682,
    display = 22351,
    coords = {0.342, 0.625, 1},
    loot = {71328,71327,71330,71329,},
    sections = {
      Stage({
        so = true,
        name = "Phase 1: The Horseman",
        desc = "As he enters, he will engage who ever first used the candle.",
        sections = {
          Spell(42587, {flag1 = TANK}), -- Horseman's Cleave
          Stage({
            so = true,
            stype = CREATURE,
            creature = 23775,
            display = 21908,
            name = "Head of the Horseman",
            desc = "He will toss his head at 1% and become immune to damage, walk around disoriented and heal to 100% health. Attack his head to enter phase 2.",
          }),
        },
      }),
      Stage({
        name = "Phase 2: The Horseman",
        desc = "This phase repeats two more times, with him tossing his head and walking around disoriented. The difference is that he has an additional ability.",
        sections = {
          Spell(42380, {so = true, desc = "Sets an enemy aflame, instantly inflicting 22587 Fire damage and burning it and its nearest allies for 4875 to 5125 Fire damage every 2 seconds for 4 seconds.", flag1 = IMPORTANT}), -- Conflagration
        },
      }),
      Stage({
        name = "Phase 3: Pumpkins",
        desc = "This is his last phase, entered after tossing his head three times. He will not use Conflagration, instead he will use this ability.",
        sections = {
          Stage({
            so = true,
            stype = CREATURE,
            creature = 23545,
            display = 21822,
            name = "Pumpkin Fiend",
            desc = "Needs a few seconds to sprout, before joining the battle.",
            sections = {
              Spell(42514, {so = true, desc = "Squashes the target soul, increases damage taken by 10% for 15 seconds, stacks 10 times.", flag1 = DISEASE}), -- Squash Soul
              --Spell(42281, {so = true}), -- Sprouting
            },
          }),
        },
      }),
      --Spell(44185), -- Jack-o'-Lanterned!
    },
  },
  {
    name = "Houndmaster Loksey",
    desc = "Houndmaster Loksey is one of the four leaders of the Scarlet Monastery, and captain in charge of training the hounds which the Scarlet Crusade use to track down their enemies. Loksey commands the loyalty of fearsome hyenas that can tear their victim apart limb by limb within minutes.\n\nHe is apparently the brother of Huntsman Leopold, a Scarlet emissary sent to Light's Hope Chapel as part of the Scarlet Crusade's reluctant alliance with the Argent Dawn. When speaking to him, Leopold is of the opinion that Loksey can't even take care of his own hounds, let alone represent the Crusade - which is why Leopold was sent instead of Loksey.",
    --icon = true,
    creature = 3974,
    display = 2040,
    coords = {0.294, 0.845, 2},
    loot = {7710,3456,7756,},
    sections = {
      Spell(77808, {so = true, desc = "Increases the melee attack power of nearby allies by 2 for 2 minutes."}), -- Battle Shout
      Spell(6742, {so = true, desc = "Increases an ally's attack speed by 30% for 30 seconds.", flag1 = MAGIC}), -- Bloodlust
      Stage({
        so = true, 
        stype = CREATURE,
        creature = 4304,
        display = 35353,
        name = "Scarlet Tracking Hound",
        desc = "Loksey is accompanied by four of his companions, their bite is quite painful.",
      }),
    },
  },
  {
    name = "Arcanist Doan",
    desc = "He is the keeper of the Monastery's library; a guardian of the arcane that the Scarlet Crusade is rumoured to distrust. Yet he is indeed a trusted official of the Crusade, keeping a vital key (The Scarlet Key) that grants access to Scarlet operations across the Plaguelands. Arcanist Doan believes that arcane magic is the only way to rid Lordaeron of the Scourge.",
    --icon = true,
    creature = 6487,
    display = 5266,
    coords = {0.833, 0.743, 2},
    loot = {7713,7711,7712,7714,34227,},
    sections = {
      Spell(34517, {desc = "Sends out a blast wave of magic, inflicting 49 to 58 Arcane damage to enemies within 10 yards."}), -- Arcane Explosion
      Spell(13323, {desc = "Transforms an enemy into a sheep, forcing it to wander around for 6 seconds. Any damage will transform the target back into its normal form.", flag1 = MAGIC}), -- Polymorph
      Spell(8988, {desc = "Randomly silences nearby enemies, preventing them from casting spells for 4 seconds.", flag1 = MAGIC, flag2 = IMPORTANT}), -- Silence
      Spell(9438, {so = true, desc = "At 50% health, Arcanist Doan will form a protective bubble around himself, making him immune to all attacks and spells for 8 seconds.", sections = {
        Spell(9435, {so = true, desc = "Before his protective shield expires, he will deal 638 to 862 Fire damage in a 30 yards radius, to all enemies in range.", flag1 = DEADLY}), -- Detonation
      }}), -- Arcane Bubble
    },
  },
  {
    name = "Herod",
    desc = "Herod is one of the four Scarlet Crusade leaders in the Scarlet Monastery. It is known that both Raleigh the Devout in the Hillsbrad Foothills and Varimathras in the Undercity are determined to eliminate the leadership of the Scarlet Monastery, albeit for different reasons.",
    --icon = true,
    creature = 3975,
    display = 2041,
    coords = {0.787, 0.108, 3},
    loot = {10330,7718,7719,7717,23192,},
    sections = {
      Spell(15496, {flag1 = TANK}), -- Cleave
      Spell(8260, {desc = "Rushes over to his target, moving 60% faster and inflicting 10% additional damage on first attack."}), -- Rushing Charge
      Spell(8989, {so = true, desc = "Attacks nearby enemies in a whirlwind of steel that lasts 10 seconds, inflicting weapon damage plus 100 every 2 seconds. This also makes Herod immune to magic for the duration.", flag1 = IMPORTANT}), -- Whirlwind (triggers 15578)
      Spell(8269, {so = true, desc = "At 50% health, Herod will frenzy and increase his attack speed by 60% for 2 minutes.", flag1 = HEALER}), -- Frenzy
      Stage({
        stype = CREATURE,
        creature = 6575,
        display = 2467,
        name = "Scarlet Trainee",
        desc = "Upon defeating Herod, twenty trainees will charge into the room.",
      }),
    },
  },
  {
    name = "High Inquisitor Fairbanks",
    desc = "Fairbanks was Highlord Mograine's most trusted advisor, and was present during the meeting in Southshore that led to the creation of the Ashbringer.\n\nFairbanks was tricked and led along with the Highlord by Mograine's son Renault to Stratholme where legions of the Scourge awaited them. Fairbanks was the first to fall, but did not die - he was trapped and hidden under the corpses of the undead. He bore silent witness to Renault's betrayal of his father, hearing Mograine's anguished cries as Ashbringer was plunged through his heart and fouling the blade. Kel'Thuzad later resurrected Mograine as a Death Knight.\n\nMaking his way back to the Scarlet Monastery, Fairbanks told the tale of betrayal to anyone who would listen. Those who believed him broke away from the Crusade to found the Argent Dawn. Fairbanks was subsequently murdered by the remaining crusaders for his blasphemy as well as possibly showing symptoms of the plague. His body was discarded in a secret chamber in the Scarlet Cathedral.\n\nJudging by his title, he was succeeded by High Inquisitor Whitemane.",
    --icon = true,
    creature = 4542,
    display = 2605,
    coords = {0.555, 0.252, 4},
    loot = {19509,19508,19507,},
    sections = {
      Spell(15090), -- Dispel Magic
      Spell(8282, {flag1 = CURSE}), -- Curse of Blood
      Spell(22678, {desc = "Strikes fear in an enemy, causing it to flee in terror for 6 seconds.", flag1 = MAGIC}), -- Fear
      Spell(8399, {desc = "Puts enemies within 5 yards to sleep for 6 seconds. Any damage caused will awaken them.", flag1 = MAGIC}), -- Sleep
      Spell(11647, {desc = "Wraps himself in a shield that lasts up to 30 seconds, absorbing maximum 801 Physical or magical damage."}), -- Power Word: Shield
      Spell(12039, {desc = "Heals himself for 186 to 217."}), -- Heal
    },
  },
  {
    name = "High Inquisitor Whitemane",
    desc = "Mograine and Whitemane are part of a two-part boss fight.",
    --icon = true,
    creature = 3977,
    display = 2043,
    coords = {0.489, 0.168, 4},
    loot = {7722,7721,7720,71635,},
    sections = {
      Spell(25054, {desc = "Smites an enemy, inflicting 83 to 96 Holy damage."}), -- Holy Smite (9481 old spell or what?)
      Spell(12039, {desc = "Heals an ally for 186 to 217.", flag1 = INTERRUPT}), -- Heal
      Spell(22187, {desc = "Wraps an ally in a shield that lasts up to 30 seconds, absorbing 206 damage.", flag1 = MAGIC}), -- Power Word: Shield
      Spell(7645, {desc = "After a long perioid of time after engaged, she will take control of a humanoid enemy for 10 seconds, but increase the time between their attacks by 100%.", flag1 = MAGIC, flag2 = IMPORTANT}), -- Dominate Mind
      Spell(9256, {desc = "When Whitemane reaches 50% health, she will put all enemies to sleep for 10 seconds.", flag1 = IMPORTANT, sections = {
        Spell(9232, {so = true, desc = "Brings Mograine back to life with full health and mana. He returns the favor by restoring her health to full as well."}), -- Scarlet Resurrection
      }}), -- Deep Sleep
      Stage({
        so = true,
        stype = CREATURE,
        creature = 3976,
        display = 2042,
        name = "Scarlet Commander Mograine",
        desc = "The same fight as before repeats, but it is adviced to focus your attention on Whitemane.",
        sections = {
          Spell(14518, {flag1 = MAGIC}), -- Crusader Strike
          Spell(77787, {flag1 = MAGIC}), -- Hammer of Justice
          Spell(63148, {desc = "Protects Mograine from all damage and spells for 12 seconds, but increases the time between attacks by 100%.", flag1 = MAGIC}), -- Divine Shield
          Spell(8990, {desc = "Passive aura that inflicts 3 Holy damage to melee attackers."}), -- Retribution Aura
          --Spell(9257, {desc = "Used by Mograine to restore Whitemane to full health, after she resurrects him."}), -- Lay on Hands
        },
      }),
    },
  },
  {
    name = "Scarlet Commander Mograine",
    desc = "Mograine and Whitemane are part of a two-part boss fight.",
    --icon = true,
    creature = 3976,
    display = 2042,
    coords = {0.489, 0.278, 4},
    loot = {7724,7726,10330,7723,},
    sections = {
      Spell(14518, {flag1 = MAGIC}), -- Crusader Strike
      Spell(77787, {flag1 = MAGIC}), -- Hammer of Justice
      Spell(63148, {desc = "Protects Mograine from all damage and spells for 12 seconds, but increases the time between attacks by 100%.", flag1 = MAGIC}), -- Divine Shield
      Spell(8990, {desc = "Passive aura that inflicts 3 Holy damage to melee attackers."}), -- Retribution Aura
      --Spell(9257, {desc = "Used by Mograine to restore Whitemane to full health, after she resurrects him."}), -- Lay on Hands
      Stage({
        so = true,
        stype = CREATURE,
        creature = 3977,
        display = 2043,
        name = "High Inquisitor Whitemane",
        desc = "After you defeat Mograine, Whitemane will burst from the doors behind the altar and engage you. It is adviced you focus your attention on Whitemane.",
        sections = {
          Spell(25054, {desc = "Smites an enemy, inflicting 83 to 96 Holy damage."}), -- Holy Smite (9481 old spell or what?)
          Spell(12039, {desc = "Heals an ally for 186 to 217.", flag1 = INTERRUPT}), -- Heal
          Spell(22187, {desc = "Wraps an ally in a shield that lasts up to 30 seconds, absorbing 206 damage.", flag1 = MAGIC}), -- Power Word: Shield
          Spell(7645, {desc = "After a long perioid of time after engaged, she will take control of a humanoid enemy for 10 seconds, but increase the time between their attacks by 100%.", flag1 = MAGIC, flag2 = IMPORTANT}), -- Dominate Mind
          Spell(9256, {desc = "When Whitemane reaches 50% health, she will put all enemies to sleep for 10 seconds.", flag1 = IMPORTANT, sections = {
            Spell(9232, {so = true, desc = "Brings Mograine back to life with full health and mana. He returns the favor by restoring her health to full as well."}), -- Scarlet Resurrection
          }}), -- Deep Sleep
        },
      }),
    },
  },
})

table.insert(db, SCARLET_MONASTERY)
