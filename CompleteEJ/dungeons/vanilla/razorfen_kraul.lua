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

local RAZORFEN_KRAUL = CreateInstance({
  name = "剃刀沼泽",
  desc = "一万年前的上古之战中,强大不朽的野猪之神 - 阿迦玛甘,因为塞纳留斯的求助而和燃烧军团展开了战斗.虽然阿迦玛甘最终倒在了燃烧军团之前,但是他的贡献是不可磨灭的.他的牺牲为玛法里奥和其他人赢得了冲进艾萨拉要塞到达永恒之井的时间,最终拯救了艾泽拉斯.然而随着时间的推移,在阿迦玛甘死去的地方,野猪人相信阿迦玛甘之血洒落的地方会生长出粗壮的荆棘藤蔓.阿迦玛甘洒落的血液形成了一种叫做血岩的矿物,野猪人用它来获得力.剃刀高地入口为阿迦玛甘的嘴，传说中阿迦玛甘将获得再生，野猪人们正等待这一天的到来.生活在这里的野猪人全部都是上古之时半神阿迦玛甘的后裔,阿迦玛甘曾经和塞纳留斯一起对抗过燃烧军团的入侵,为此他甚至付出了生命的代价,可是他们二者的后代却是有着两种截然不同的命运.",
  texture = "RazorfenKraul",
  area = 761,
  dflag = N5,
}, {
  {
    name = "鲁古格",
    desc = "鲁古格和他的小弟就在左边第一个分岔路口.",
    --icon = true,
    creature = 6168,
    display = 6110,
    coords = {0.644, 0.427, 1},
    loot = {},
    sections = {
      Spell(20824, {so = true, desc = "用闪电攻击目标，对其造成69~81点自然伤害."}), -- Lightning Bolt
      --Spell(8270), -- Summon Earth Rumbler
      Stage({
        so = true,
        stype = CREATURE,
        creature = 4528,
        display = 9589,
        name = "石行者",
        desc = "没有特殊能力.",
      }),
    },
  },
  {
    name = "阿格姆",
    desc = "野猪人先知,能在战斗中召唤大量的野猪之魂来协同作战.",
    --icon = true,
    creature = 4424,
    display = 6097,
    coords = {0.807, 0.515, 1},
    loot = {6681,},
    sections = {
      Spell(14900, {so = true, desc = "运用治疗的能量为一个受伤的盟友恢复生命值，这股能量会继续治疗附近的其它盟友，最多影响3个目标，但每次治疗的效果都降低50%.", flag1 = INTERRUPT}), -- Chain Heal
      Spell(30931, {so = true}), -- Battle Shout
      Spell(8286, {so = true, desc = "Summons a Boar Spirit to aid Aggem Thorncurse for 1 minute.", sections = {
        Stage({
          so = true,
          stype = CREATURE,
          creature = 6021,
          display = 4716,
          name = "野猪之魂",
          desc = "没有特殊能力.",
        }),
      }}), -- Summon Boar Spirit
    },
  },
  {
    name = "亡语者贾格巴",
    desc = "具备牧师与战士能力于一体的先知.",
    --icon = true,
    creature = 4428,
    display = 4644,
    coords = {0.874, 0.416, 1},
    loot = {6685,6682,2816,},
    sections = {
      Spell(7645, {so = true, desc = "控制一个等级不高于25级的敌对人型生物，持续10秒。使其攻击间隔延长100%.", flag1 = MAGIC}), -- Dominate Mind
      Spell(20825, {so = true, desc = "向目标射出一支暗影箭，对其造成69~81点暗影伤害."}), -- Shadow Bolt
    },
  },
  {
    name = "主宰拉姆塔斯",
    desc = "主宰拉姆塔斯身边有二个60级的精英守卫.",
    --icon = true,
    creature = 4420,
    display = 4652,
    coords = {0.573, 0.309, 1},
    loot = {6679,6686,6687,},
    sections = {
      Spell(15548, {so = true, desc = "对附近的敌人造成35~39点自然伤害，使其攻击间隔延长33%，移动速度降低40%，持续6秒.", flag1 = MAGIC}), -- Thunderclap
      Spell(9128, {so = true, desc = "使附近所有小队成员的近战攻击强度提高，持续2分钟."}), -- Battle Shout
      --Spell(7165), -- Battle Stance
      Stage({
        so = true,
        stype = CREATURE,
        creature = 4438,
        display = 6078,
        name = "剃刀沼泽刺鬃守卫",
        sections = {
          Spell(8148, {desc = "对近战攻击者造成20点自然伤害."}), -- Thorns Aura
          Spell(8259, {desc = "对附近的敌人造成普通武器伤害再加上50点额外伤害."}), -- Whirling Barrage
        },
      }),
    },
  },
  {
    name = "唤地者哈穆加 (稀有)",
    desc = "在平台上的第一座桥梁会随机出现一种罕见的怪",
    --icon = true,
    creature = 4842,
    display = 6102,
    coords = {0.487, 0.458, 1},
    loot = {6688,6689,},
    sections = {
      Spell(20824, {so = true, desc = "用闪电攻击目标，对其造成69~81点自然伤害."}), -- Lightning Bolt
      --Spell(8270), -- Summon Earth Rumbler
      Stage({
        so = true,
        stype = CREATURE,
        creature = 4528,
        display = 9589,
        name = "奔岩碾压者",
        desc = "没有什么特殊能力.",
      }),
      --Spell(2484, {so = true, desc = "Summons an Earthbind Totem with 5 health at the feet of the caster for 45 seconds."}), -- Earthbind Totem
      Stage({
        so = true,
        stype = CREATURE,
        creature = 2630,
        display = 4588,
        name = "地缚图腾",
        desc = "召唤一支5点生命值的地缚图腾,持续45秒.",
        sections = {
          Spell(3600, {desc = "使所有邻近敌人的移动速度降低50%,持续5秒.", flag1 = MAGIC}), -- Earthbind
          Spell(64695, {desc = "地缚图腾在生效时有一定几率使目标定身,持续5秒.", flag1 = MAGIC}), -- Earthgrab
        },
      }),
    },
  },
  {
    name = "暴怒的阿迦赛罗斯",
    desc = "巨大的野猪,是野猪人所信仰的神.",
    --icon = true,
    creature = 4422,
    display = 2450,
    coords = {0.080, 0.683, 1},
    loot = {6691,6690,},
    sections = {
      Spell(8555, {so = true, desc = "对敌人造成200点伤害，并强制其装死，最多持续5分钟.", flag1 = TANK}), -- Left for Dead
      Spell(8285, {so = true}), -- Rampage
      Spell(8260, {desc = "使施法者的移动速度提高60%，持续4秒，并使其在第一次攻击时所造成的伤害提高10点."}), -- Rushing Charge
      Spell(8269), -- Frenzy
    },
  },
  {
    name = "盲眼猎手 (稀有)",
    desc = "稀有精英 蝙蝠.",
    --icon = true,
    creature = 4425,
    display = 4735,
    coords = {0.112, 0.316, 1},
    loot = {6695,6696,6697,},
    sections = {
      Stage({
        so = true,
        name = "自动攻击",
        desc = "没有特殊能力.",
      }),
    },
  },
  {
    name = "卡尔加·刺肋",
    desc = "野猪人的首领,非常强势的萨满祭司",
    --icon = true,
    creature = 4421,
    display = 31042,
    coords = {0.219, 0.309, 1},
    loot = {5793,6693,6694,6692,},
    sections = {
      Spell(8292, {so = true}), -- Chain Bolt
      Spell(25058, {so = true, desc = "每3秒为一个盟友回复一次生命值，持续15秒.", flag1 = MAGIC}), -- Renew
      Spell(8361, {so = true}), -- Purity
      Spell(8358, {desc = "恢复施法者的法力值."}), -- Mana Spike
    },
  },
})

table.insert(db, RAZORFEN_KRAUL)
