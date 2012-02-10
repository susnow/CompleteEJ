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
  name = "玛拉顿",
  desc = "玛拉顿被狂暴的玛拉顿半人马所保护，那是凄凉之地最神圣的地方.月神爱露恩与白鹿玛洛恩结合生下了塞纳留斯,塞纳留斯的两个儿子,一个成为了月光林地和塞纳里奥议会的新主人,另一个却和土元素公主瑟莱德丝结合,结果他们的子嗣没有继承自然的力量,反而继承了土元素狂暴的力量,并杀死了自己的父亲,这一分支被成为半人马,只留下土元素公主独子一人带着自己丈夫的尸体,停留在玛拉顿.玛拉顿被分成不同层次、区域;自从灾难过后,这里已经重新成为一个冒险家来探险的地方.",
  texture = "Maraudon",
  area = 750,
  dflag = N5,
}, {
  {
    name = "诺克赛恩",
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
        name = "诺克赛恩产物",
        desc = "Does not perform any special abilities.",
      }),
    },
  },
  {
    name = "锐刺鞭笞者",
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
    name = "维利塔恩",
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
    name = "被诅咒的塞雷布拉斯",
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
        name = "腐化的自然之力",
        desc = "Does not perform any special abilities.",
      }),
    },
  },
  {
    name = "兰斯利德",
    desc = "这是玛拉顿内部圣地中的第一个boss.",
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
        name = "瑟莱德丝碎片",
        sections = {
          Spell(13584, {so = true, desc = "Strikes at an enemy, inflicting normal damage plus additional 5% damage."}), -- Strike
        },
      }),
    },
  },
  {
    name = "工匠吉兹洛克",
    desc = "这是玛拉顿内部圣地中的第二个boss.",
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
    name = "洛特格里普",
    desc = "玛拉顿内部圣地的第三个boss,通常会在杀了瑟莱德丝公主后才解决他,以便节约时间.他生活在瑟莱德丝公主平台下面的水域中,是一只巨大的鳄鱼",
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
    name = "瑟莱德丝公主",
    desc = "在玛拉顿的深处居住着一个邪恶的混乱生物——瑟莱德丝公主,她是一个和上古之神相关的地元素.是四大元素的土领主.又名石母 瑟拉塞恩的第三个女儿.很早以前,她和塞纳留斯的长子扎尔塔结合,他们的后代……被称为半人马.那些半人马杀掉了扎尔塔,并保留了他的遗体.",
    --icon = true,
    creature = 12201,
    display = 12292,
    coords = {0.261, 0.787, 2},
    loot = {17715,17766,17714,17713,17707,17710,17711,17780,},
    sections = {
      Spell(3391, {so = true}), -- Thrash
      Spell(21832, {so = true, icon = "Interface\\Icons\\INV_Stone_10", desc = "Hurls a boulder at an enemy, inflicting 280 to 360 Physical damage and knocking it down for 2 seconds."}, 1), -- Boulder (triggers 22592)
      Spell(21869, {so = true}), -- Repulsive Gaze
      Spell(21909, {so = true, desc = "震动20码内附近的地面,对敌人造成103-135点伤害，并将他们击退."}), -- Dust Field
    },
  },
})

table.insert(db, MARAUDON)
