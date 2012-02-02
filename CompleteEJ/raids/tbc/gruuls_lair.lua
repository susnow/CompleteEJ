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

local GRUULS_LAIR = CreateInstance({
  name = "Gruul's Lair",
  desc = "When the infamous Dragon Aspect, Deathwing, discovered the Dark Portal and Draenor, he felt sure that few of Draenor's denizens would dare challenge the black dragonflight, so he scattered clutches of his eggs throughout the world.\n\nDeathwing made a serious miscalculation when he chose to leave his eggs under meager guardianship in Blade's Edge Mountains. The guardian dragons were torn from the sky by the gronn living in Blade's Edge, and the leader of the gronn, Gruul, impaled the wyrms he fought on the stone spires of the mountains.\n\nToday Gruul the Dragonkiller is worshipped as a deity by the ogres of Blade's Edge Mountains. His powerful sons ravage both the spires of their home and the plains of Nagrand. Gruul's unparalleled strength and experience in battle would pose a serious threat if he ever chose to attack Horde or Alliance forces in Outland.",
  texture = "GruulsLair",
  area = 776,
  dflag = N25,
}, {
  {
    name = "High King Maulgar",
    desc = "The Bladespire clan was once among the weakest ogre clans, lacking the numbers of the Bloodmaul or the physical strength of the Boulderfist. The birth of Maulgar changed their fate forever. Maulgar was stronger and hardier than any other ogre of his age, and his prowess in battle swiftly drew the attention of the previous high king. The king demanded a demonstration of Maulgar’s might, and Maulgar granted it, snapping the king’s neck where he stood. This action shifted the balance of power from the Boulderfist to the Bladespire, and drew the attention of mighty Gruul himself.",
    --icon = true,
    creature = 18831,
    display = 18649,
    coords = {0.551, 0.576, 1},
    loot = {28797,29763,29764,28801,28799,},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 18831,
        display = 18649,
        name = "High King Maulgar",
        sections = {
          Spell(39144, {flag1 = TANK}), -- Arcing Smash (28168 old?)
          Spell(33230, {flag1 = TANK}), -- Mighty Blow
          Spell(16508), -- Intimidating Roar
          Spell(33238, {desc = "Attacks nearby enemies in a whirlwind of steel that lasts 15 seconds, and inflicts normal damage each 2 seconds. Slows movement speed by 50%.", flag1 = IMPORTANT}), -- Whirlwind (triggers 33239)
          Spell(26561, {desc = "At 50% health and lower, the High King will charge random enemies within 40 yards and inflict normal damage plus 300, knocking them far back.", flag1 = IMPORTANT}), -- Berserker Charge
          Spell(33232, {desc = "Increases melee attack speed by 200% but decreases Physical damage dealth by 50%. While under this effect, Maulgar is subjected to Dual Wield penalties, such as extra chance to miss."}), -- Flurry
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 18836,
        display = 11585,
        name = "Blindeye the Seer (Priest)",
        sections = {
          Spell(33144, {desc = "Calls upon Holy magic to heal an ally for 46250 to 53750.", flag1 = INTERRUPT}), -- Heal
          Spell(33152, {desc = "Invokes Holy magic to heal nearby party members for 92500 to 107500.", flag1 = INTERRUPT}), -- Prayer of Healing
          Spell(33147, {desc = "Shielded against Physical and magical damage, absorbs up to 25000 damage for 30 seconds. Immune to Spell Interrupt and Stun effects, as long as the shield lasts.", flag1 = IMPORTANT}), -- Greater Power Word: Shield
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 18835,
        display = 12472,
        name = "Kiggler the Crazed (Shaman)",
        sections = {
          Spell(36152, {desc = "Blasts an enemy with lightning, inflicting 1488 to 2012 Nature damage."}), -- Lightning Bolt
          Spell(33175, {desc = "Shocks an enemy with concussive force, inflicting 657 to 843 Nature damage and interrupting the spell being cast for 5 seconds."}), -- Arcane Shock
          Spell(33237, {desc = "Sends out a blast wave of magic, inflicting 1750 to 2250 Arcane damage to enemies within 30 yards, also knocking away."}), -- Arcane Explosion
          Spell(33173, {desc = "Transforms an enemy into a sheep, forcing it to wander around for 10 seconds. While wandering, the sheep can cannot attack or cast spells, but regenerates very quickly. Any damage will transform the target back into its normal form."}), -- Greater Polymorph
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 18832,
        display = 20194,
        name = "Krosh Firehand (Mage)",
        sections = {
          Spell(33051, {desc = "Inflicts 8550 to 9450 Fire damage to an enemy."}), -- Greater Fireball
          Spell(33054, {desc = "Reduces magic damage taken by 75% for 30 seconds.", flag1 = MAGIC}), -- Spell Shield
          Spell(33061, {desc = "Unleashes a wave of flame, inflicting 6013 to 6987 Fire damage to enemies within 15 yards, and reducing their movement speed by 70% for 6 seconds.", flag1 = IMPORTANT}), -- Blast Wave
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 18834,
        display = 20195,
        name = "Olm the Summoner (Warlock)",
        sections = {
          Spell(33129, {desc = "Deals 500 Shadow damage every 2 seconds for 10 seconds. Stacks maximum 99 times."}), -- Dark Decay
          Spell(33130), -- Death Coil
          Spell(33131, {so = true, icon = "Interface\\Icons\\Spell_Shadow_SummonFelhunter", name = "Summon Wild Fel Stalker", desc = "Summons a Wild Fel Stalker to assist Olm.", sections = {
            Stage({
              stype = CREATURE,
              creature = 18847,
              display = 7972,
              name = "Wild Fel Stalker",
              sections = {
                Spell(33086, {so = true}), -- Wild Bite
              },
            }),
          }}, 1), -- Summon Wild Felhunter
        },
      }),
    },
  },
  {
    name = "Gruul the Dragonkiller",
    desc = "Gruul the Dragonkiller is the father of the seven gronn lords of the ogres, and the most powerful of them. Although he seems to be nothing but a cruel brute, he possesses intelligence.\n\nAfter Deathwing invaded Gruuls home, he was met by the other lost heroes of the Second War: Khadgar, Turalyon, and Alleria Windrunner. They were after the Skull of Gul'dan which Deathwing possessed. After that, Gruul and his ogre minions, along with the heroes, challenged Deathwing from his perch in Blade's Edge Mountains - killing his eggs and impaling his lesser black drakes on the mountain spikes.\n\nInfuriated by this act, Deathwing landed on top of them and attacked Gruul. Although clearly no match for the mad Aspect's power, Gruul was saved by Khadgar's miraculuous spell when he disassembled some of the adamantium plates that were holding Deathwing's unstable body together resulting in Deathwing's retreat. This led to a clear devastation for the black dragonflight in Outland.\n\nThe results can still be seen as impaled black dragon corpses all over Blade's Edge Mountains.",
    --icon = true,
    creature = 19044,
    display = 18698,
    coords = {0.202, 0.286, 1},
    loot = {28825,29765,28826,28804,29767,28823,28810,28827,28794,},
    sections = {
      Spell(33813, {icon = "Interface\\Icons\\Ability_GhoulFrenzy", flag1 = TANK}, 1), -- Hurtful Strike
      Spell(36240, {desc = "Cause a shower of rocks and debris to pelt the targetted area for 15 seconds. Anyone standing in it will take 2700 damage every 3 seconds."}), -- Cave In
      Spell(36297, {desc = "Silences enemies, preventing them from casting spells for 4 seconds. The longer the fight lasts, the more often he casts this spell."}), -- Reverberation
      Spell(36300, {desc = "Increases damage dealt by 15%. Gruul applies one application to himself every 30 seconds in combat. Stacks maximum to 30 stacks. This servers as an enrage timer.", flag1 = IMPORTANT}), -- Growth
      Stage({
        so = true,
        name = "Ground Slam and Shatter",
        desc = "With an interval between 74 and 80 seconds, Gruul will Ground Slam then Shatter once everyone have been turned into stone.",
        flag1 = DEADLY,
        sections = {
          Spell(33525, {so = true, desc = "Slams the ground, causing all enemies to slowly start loosing movement speed, after the 5th second they will have turned into stone.", flag1 = IMPORTANT}), -- Ground Slam (triggers 39187, that again triggers 33572 each second)
          Spell(33654, {so = true, desc = "Gruul shatters all the encasing stone on his enemies, causing them to hit their own allies with shrapnel. The damage varies by range.\n\nOver 20 yards range between will cause no damage to other allies. If the ally is closer than 20 yards, it will wary from 2000 up to 9000 damage if they are next to each other. This damage will buypass impervious effects like Divine Shield or Ice Block.", flag1 = DEADLY}), -- Shatter
        },
      }),
    },
  },
})

table.insert(db, GRUULS_LAIR)
