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

local MARAUDON = CreateInstance({
  name = "Maraudon",
  desc = "Maraudon is a system of caverns located in the Valley of Spears, east of Shadowprey Village, in Desolace. It is a combination of ancient centaur burial grounds and a temple dedicated to the elemental earth. Maraudon is broken up into different levels and zones; since Cataclysm, these have been remodeled and retooled to be a smoother experience for adventurers.",
  texture = "Maraudon",
  area = 750,
  dflag = N5,
}, {
  {
    name = "Noxxion",
    desc = "The first boss of the orange wing. Noxxion is a living symbol of the corruption of Maraudon, created by Lord Vyletongue.",
    --icon = true,
    creature = 13282,
    display = 11172,
    coords = {0.360, 0.097, 1},
    loot = {17745,17746,17744,},
    sections = {
      Spell(10966, {so = true}), -- Uppercut
      Spell(21687, {so = true, desc = "Inflicts 37 to 43 Nature damage to enemies within 45 yards, then additional 25 Nature damage over 15 seconds.", flag1 = POISON}), -- Toxic Volley
      Spell(21707, {so = true, desc = "Occasionally spawns five elementals and disappears from sight. He will re-materialize once they are defeated."}), -- Summon Noxxion's Spawns
      Stage({
        stype = CREATURE,
        creature = 13456,
        display = 5492,
        name = "Noxxion's Spawn",
        desc = "Does not perform any special abilities.",
      }),
    },
  },
  {
    name = "Razorlash",
    desc = "The final boss of the orange wing, a giant thorny lasher.",
    --icon = true,
    creature = 12258,
    display = 12389,
    coords = {0.163, 0.340, 1},
    loot = {17748,17750,17749,17751,},
    sections = {
      Spell(40504, {so = true, flag1 = TANK}), -- Cleave
      Spell(15976, {so = true, desc = "Inflicts 15 Physical damage to an enemy over 10 seconds, stacks maximum 20 times. At max stacks will deal 300 Physical damage over 10 seconds."}), -- Puncture
    },
  },
  {
    name = "Lord Vyletongue",
    desc = "The only boss in the purple wing. He is the head of the Putridus clan of satyrs. He has corrupted parts of Maraudon, stunting the growth of many of the plants inside. He also created the elemental Noxxion.",
    --icon = true,
    creature = 12236,
    display = 12334,
    coords = {0.378, 0.711, 1},
    loot = {17754,17755,17752,},
    sections = {
      Spell(16100, {so = true, desc = "Shoots at an enemy, inflicting 74 to 87 Physical damage."}), -- Shoot
      Spell(21390, {so = true}), -- Multi-Shot
      Spell(21655, {so = true, desc = "Teleports him 20 yards forward, unless something is in the way."}), -- Blink
      Spell(7964, {so = true, desc = "Casts a smoke bomb, stunning enemies within 5 yards for 3 seconds.", flag1 = MAGIC}), -- Smoke Bomb
    },
  },
  {
    name = "Celebras the Cursed",
    desc = "The only boss in the Poison Falls wing. Celebras is the son of Remulos and is a Keeper of the Grove, like his father. Cavindra calls Celebras her brother.\n\nAfter Celebras's uncle Zaetar was killed by his centaur offspring, Zaetar's spirit was held prisoner by his mate, Theradras. In an attempt to free his uncle's spirit, Celebras and his dryad sisters entered Maraudon. However, the corruption that had spread through the caverns soon overcame them. Celebras the Cursed now wanders blindly inside, cursed by corruption.",
    --icon = true,
    creature = 12225,
    display = 12350,
    coords = {0.246, 0.139, 2},
    loot = {17739,17740,17738,},
    sections = {
      Spell(21807, {so = true, desc = "Hurls a bolt of lightning at an enemy, inflicting 66 to 77 Nature damage."}), -- Wrath
      Spell(12747, {so = true, desc = "Entangles an enemy in roots, inflicting 4 Nature damage every 3 seconds, and immobilizing it for up to 5 seconds.", flag1 = MAGIC}), -- Entangling Roots
      Spell(21793, {so = true, desc = "Deals 36 Nature damage to enemies within 45 yards every 2 seconds for 8 seconds, also reducing movement speed by 70% and time between attacks is increased by 300%.", flag1 = INTERRUPT}), -- Twisted Tranquility
      Spell(21968, {so = true, desc = "Summons three Force of Nature to aid Celebras in battle for 1 minute."}), -- Corrupt Forces of Nature
      Stage({
        stype = CREATURE,
        creature = 13743,
        display = 9593,
        name = "Corrupt Force of Nature",
        desc = "Does not perform any special abilities.",
      }),
    },
  },
  {
    name = "Landslide",
    desc = "The first boss of the inner sanctum.",
    --icon = true,
    creature = 12203,
    display = 12293,
    coords = {0.411, 0.489, 2},
    loot = {17943,17734,17736,17737,},
    sections = {
      Spell(5568, {so = true, desc = "Inflicts normal damage plus additional 8% damage to enemies within 8 yards."}), -- Trample
      Spell(18670, {so = true, flag1 = TANK}), -- Knock Away
      Spell(21808, {so = true, desc = "Stuns all enemies for 8 seconds and spawns four Theradrim Shardlings."}), -- Landslide
      Stage({
        stype = CREATURE,
        creature = 11783,
        display = 12310,
        name = "Theradrim Shardling",
        sections = {
          Spell(13584, {so = true, desc = "Strikes at an enemy, inflicting normal damage plus additional 5% damage."}), -- Strike
        },
      }),
    },
  },
  {
    name = "Tinkerer Gizlock",
    desc = "The second boss of the inner sanctum.",
    --icon = true,
    creature = 13601,
    display = 7125,
    coords = {0.505, 0.526, 1},
    loot = {17718,17719,17717,},
    sections = {
      Spell(16100, {so = true, desc = "Shoots at an enemy, inflicting 74 to 87 Physical damage."}), -- Shoot
      Spell(21833, {so = true, desc = "Deals 126 to 154 Fire damage for 8 seconds to all targets in a cone in front of Gizlock. This ability is channeled and has a 10 yards range."}), -- Goblin Dragon Gun
      Spell(9143, {so = true}), -- Bomb
      Spell(29419, {so = true, desc = "Causes all enemies in a 5 yard radius to run away for 10 seconds."}), -- Flash Bomb
    },
  },
  {
    name = "Rotgrip",
    desc = "The third boss of the inner sanctum, usually treated as the last to save time running all the way back up after the final boss.\n\nRotgrip is a giant crocolisk that lives in the waters below Princess Theradras' platform.",
    --icon = true,
    creature = 13596,
    display = 13589,
    coords = {0.413, 0.816, 2},
    loot = {17730,17732,17728,},
    sections = {
      Spell(16495, {so = true}), -- Fatal Bite
      Spell(15976, {so = true, desc = "Inflicts 15 Physical damage to an enemy over 10 seconds, stacks maximum 20 times. At max stacks will deal 300 Physical damage over 10 seconds."}), -- Puncture
    },
  },
  {
    name = "Princess Theradras",
    desc = "Princess Theradras is an elemental force of earth related to the Old Gods, the only daughter of Therazane the Stonemother. Ages ago, Theradras and Zaetar, first son of Cenarius, began a relationship. The offspring of their time together became known to the people of Kalimdor as centaurs, who promptly slew their father for his part in their misbegotten creation. Fearful of Cenarius' wrath, the grief-stricken Theradras sequestered her dead lover's body in her secret sanctuary, the Crystal Caverns of Terramok, where she watches over him to this day.\n\nTravelers who come to Desolace have little trouble spotting Zaetar's tomb, for the blessing of nature that permeates his being transformed his resting place into a verdant paradise of flora and tranquil pools. Today, this tomb is now trodden by the hooves of Zaetar's children, who have claimed this great cavern as their sacred stronghold Maraudon. The subterranean tunnels are populated by the vicious, long-dead ghosts of the centaur Khans, as well as Theradras' own raging, elemental minions.",
    --icon = true,
    creature = 12201,
    display = 12292,
    coords = {0.261, 0.787, 2},
    loot = {17715,17766,17714,17713,17707,17710,17711,17780,},
    sections = {
      Spell(3391, {so = true}), -- Thrash
      Spell(21832, {so = true, icon = "Interface\\Icons\\INV_Stone_10", desc = "Hurls a boulder at an enemy, inflicting 280 to 360 Physical damage and knocking it down for 2 seconds."}, 1), -- Boulder (triggers 22592)
      Spell(21869, {so = true}), -- Repulsive Gaze
      Spell(21909, {so = true, desc = "Shakes the ground within 20 yards, damaging enemies for 105 to 135 Nature damage and knocking them slightly back each second for 8 seconds."}), -- Dust Field
    },
  },
})

table.insert(db, MARAUDON)
