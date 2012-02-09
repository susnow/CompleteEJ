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

local ZULFARRAK = CreateInstance({
  name = "祖尔法拉克",
  desc = "日光暴晒下的这座城市是沙怒巨魔的家园，他们一向以来都以其无情和黑暗魔法而闻名。巨魔传说中有一把强大的名叫鞭笞者苏萨斯的武器能够让最弱小的人可以击败最强大的敌人。很久以前，这把武器被分成了两半。然而，有传言说这两半可以在祖尔法拉克任何地方找到。据说还有一批加基森派来的雇佣兵进入了城市并被困住。他们的命运还不得而知。但是也许最让人感到不安的是一头远古生物正沉睡在城市中心的一个神圣的水池中——它是一个半神，它会摧毁任何胆敢唤醒它的人。.",
  texture = "ZulFarrak",
  area = 686,
  dflag = N5,
}, {
  {
    name = "泽雷利斯(稀有)",
    desc = "如果你运气够好的话你可能会在祖尔法拉克遇到泽雷利斯",
    --icon = true,
    creature = 10082,
    display = 9293,
    coords = {0.522, 0.424, 0},
    loot = {12470,},
    sections = {
      Spell(12551, {so = true, desc = "射击敌人，造成冰霜伤害并使其移动速度降低60%，持续10秒.", flag1 = MAGIC}), -- Frost Shot
      Spell(15547, {so = true, desc = "射击目标，对其造成37~43点物理伤害."}), -- Shoot
      Spell(6533, {so = true}), -- Net
    },
  },
  {
    name = "杉达尔·沙掠者(稀有)",
    desc = "如果你运气够好的话你可能会在祖尔法拉克遇到杉达尔·沙掠者.",
    --icon = true,
    creature = 10080,
    display = 9291,
    coords = {0.459, 0.562, 0},
    loot = {862,2040,5616,6440,9243,9480,9481,9482,9483,9484,9511,9512,},
    sections = {
      Spell(15615, {so = true, flag1 = HEALER}), -- Pummel
      Spell(13730, {so = true}), -- Demoralizing Shout
      Spell(14516, {so = true, desc = "打击敌人,对敌人造成额外的近战伤害."}), -- Strike
    },
  },
  {
    name = "殉教者塞卡",
    desc = "殉教者塞卡不是真正意义上的Boss",
    --icon = true,
    creature = 7272,
    display = 6696,
    coords = {0.545, 0.267, 0},
    loot = {},
    sections = {
      Spell(8600, {so = true, flag1 = DISEASE}), -- Fevered Plague
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7269,
        display = 7470,
        name = "圣甲虫",
        desc = "当吸引到一只圣甲虫的仇恨之后,附近其他的圣甲虫也会同时攻击敌人.",
        sections = {
          Spell(3256, {so = true, desc = "使指定区域内的所有敌人的力量、敏捷和智力降低4点，持续20秒."}), -- Plague Cloud
        },
      }),
    },
  },
  {
    name = "安图苏尔<苏尔督军>",
    desc = "当安图苏尔的蜥蜴宠物遭到攻击时,安图苏尔会出现并开始与玩家作战",
    --icon = true,
    creature = 8127,
    display = 7353,
    coords = {0.643, 0.275, 0},
    loot = {9639,9641,9640,9379,},
    sections = {
      Spell(16006, {desc = "向敌人射出一支闪电箭，这支闪电箭会在击中目标后继续攻击它周围最近的敌人，对每个目标都造成99~116点自然伤害，最多可攻击3个目标."}), -- Chain Lightning
      Spell(15501, {desc = "以震撼性的力量攻击目标，对其造成37~43点自然伤害，并使其在2秒内不能施法."}), -- Earth Shock
      Spell(12491, {desc = "使用自然的力量治疗盟友,为其恢复148~172点生命值.", flag1 = INTERRUPT}), -- Healing Wave
      Spell(11895, {flag1 = INTERRUPT}), -- Healing Wave of Antu'sul
      --Spell(8376), -- Earthgrab Totem
      Stage({
        stype = CREATURE,
        creature = 8179,
        display = 2030,
        name = "强效治疗图腾",
        desc = "召唤出一支图腾,为安图苏尔和他的宠物恢复生命值.",
      }),
      --Spell(32062), -- Fire Nova Totem
      Stage({
        stype = CREATURE,
        creature = 8179,
        display = 2030,
        name = "火焰新星图腾",
        desc = "召唤出一支5点生命值的火焰新星图腾,持续6秒.6秒之后,这支图腾将释放火焰新星.",
        sections = {
          Spell(96004, {so = true, desc = "对附近所有的敌人造成33~38点火焰伤害."}), -- Fire Nova
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 8179,
        display = 2030,
        name = "强效治疗图腾",
        desc = "召唤出一支图腾,为安图苏尔和他的宠物恢复生命值..",
      }),
      --Spell(11894), -- Antu'sul's Minion
      Stage({
        stype = CREATURE,
        creature = 8156,
        display = 601,
        name = "安图苏尔的仆从",
        desc = "召唤出4只蜥蜴,并且开始与玩家作战.",
        sections = {
          Spell(11020, {so = true, flag1 = MAGIC}), -- Petrify
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 8138,
        display = 1075,
        name = "苏利萨斯幼崽",
        desc = "当安图苏尔血量垂危的时候将召唤出8~10只蜥蜴幼崽与玩家作战.",
      }),
    },
  },
  {
    name = "巫医祖穆拉恩",
    desc = "与其对话之后,激活和祖穆拉恩的战斗.",
    --icon = true,
    creature = 7271,
    display = 6434,
    coords = {0.441, 0.176, 0},
    loot = {18082,18083,},
    sections = {
      Spell(12739, {so = true, desc = "向目标射出一支暗影箭，对其造成99~116点暗影伤害."}), -- Shadow Bolt
      Spell(15245, {so = true, desc = "向附近的敌人射出多支暗影箭，对它们造成99~116点暗影伤害."}), -- Shadow Bolt Volley
      Spell(12491, {so = true, desc = "使用自然的力量治疗盟友,为其恢复148~172点生命值.", flag1 = INTERRUPT}), -- Healing Wave
      --Spell(11086, {so = true, desc = "Casts a Ward of Zum'rah totem, which lasts 20 seconds and periodically summons a Skeleton of Zum'rah. Each Skeleton lasts 20 seconds."}), -- Ward of Zum'rah
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7785,
        display = 2418,
        name = "祖穆拉恩结界",
        desc = "召唤出一根图腾,每20秒将召唤出一只祖穆拉恩骷髅,每只祖穆拉恩骷髅持续20秒.",
        sections = {
          Stage({
            stype = CREATURE,
            creature = 7786,
            display = 200,
            name = "祖穆拉恩骷髅",
            desc = "没有什么特殊的能力.",
          }),
        },
      }),
    },
  },
  {
    name = "沙怒刽子手",
    desc = "击败沙怒刽子手能从他身上找到牢笼的钥匙,并且触发百人斩的战斗剧情.",
    --icon = true,
    creature = 7274,
    display = 6440,
    coords = {0.237, 0.178, 0},
    loot = {8444},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7274,
        display = 6440,
        name = "沙怒刽子手",
        sections = {
          Spell(15496, {so = true}), -- Cleave
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 8876,
        display = 6411,
        name = "沙怒侍僧",
        sections = {
          Spell(11981, {flag1 = IMPORTANT}), -- Mana Burn
          Spell(11980, {flag1 = CURSE}), -- Curse of Weakness
          Spell(11639, {desc = "黑暗的咒语，每3秒对敌人造成一次暗影伤害，持续15秒.", flag1 = MAGIC}), -- Shadow Word: Pain
          Spell(9613, {desc = "向目标射出一支暗影箭，对其造成37~43点暗影伤害."}), -- Shadow Bolt
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 7789,
        display = 6682,
        name = "沙怒智障者",
        sections = {
          Spell(20798, {desc = "护甲值提高40点,生命值回复速度提高,持续30分钟.", flag1 = MAGIC}), -- Demon Skin
          Spell(14032, {desc = "黑暗的咒语，每3秒对敌人造成一次暗影伤害，持续15秒.", flag1 = MAGIC}), -- Shadow Word: Pain
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 7788,
        display = 6680,
        name = "沙怒苦工",
        desc = "没有什么特殊的能力.",
      }),
      Stage({
        stype = CREATURE,
        creature = 7787,
        display = 6678,
        name = "沙怒奴隶",
        desc = "没有什么特殊的能力.",
      }),
      Stage({
        stype = CREATURE,
        creature = 8877,
        display = 6423,
        name = "沙怒狂热者",
        sections = {
          Spell(8599, {so = true, desc = "激怒,物理伤害提高10%,攻击速度提高30%,持续2分钟.", flag1 = ENRAGE}), -- Enrage
        },
      }),
    },
  },
  {
    name = "耐克鲁姆",
    desc = "当玩家完成百人斩战斗剧情之后,就会遇上这名沙怒部族的首领.",
    --icon = true,
    creature = 7796,
    display = 6690,
    coords = {0.300, 0.124, 0},
    loot = {9474,9470,9473,9475,},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7796,
        display = 6690,
        name = "耐克鲁姆",
        sections = {
          Spell(8600, {flag1 = DISEASE}), -- Fevered Plague
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7275,
        display = 6441,
        name = "暗影祭司塞瑟斯",
        sections = {
          Spell(12739, {desc = "向目标射出一支暗影箭，对其造成99~116点暗影伤害."}), -- Shadow Bolt
          Spell(13704, {flag1 = MAGIC}), -- Psychic Scream
          Spell(12039, {desc = "使用神圣的力量治疗盟友,为其恢复186~217点生命值.", flag1 = INTERRUPT}), -- Heal
          Spell(8362, {desc = "为一名盟友每3秒治疗恢复一次生命值，持续15秒.", flag1 = MAGIC}), -- Renew
        },
      }),
    },
  },
  {
    name = "布莱中士.",
    desc = "这个臭名昭著的雇佣兵首领可不会乖乖的听由你摆布,尽管玩家将他们从沙怒部族的手里救了出来,这个忘恩负义的家伙却自大的认为,隐藏在祖尔法拉克的财宝是属于他的?!现在是时间来给他和他的雇佣兵们一点苦头吃吃的时候了!.",
    --icon = true,
    creature = 7604,
    display = 6433,
    coords = {0.300, 0.228, 0},
    loot = {8548,},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7604,
        display = 6433,
        name = "布莱中士(战士)",
        sections = {
          Spell(11972, {flag1 = HEALER}), -- Shield Bash
          Spell(12170, {desc = "立即反击敌人，对其造成伤害。复仇只有在成功格挡、躲闪或招架之后才能使用."}), -- Revenge
          Spell(3639, {desc = "使施法者的格挡几率提高85%，持续6秒."}), -- Improved Blocking
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7605,
        display = 6435,
        name = "拉文(盗贼)",
        sections = {
          Spell(12540), -- Gouge
          Spell(7159, {desc = "对一名敌人造成额外10点伤害，在目标背后发动."}), -- Backstab
          Spell(744, {desc = "每3秒对目标造成一次自然伤害，持续15秒,这个效果最多可以叠加5次.", flag1 = POISON}), -- Poison
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7608,
        display = 6438,
        name = "穆尔塔 (牧师)",
        sections = {
          Spell(11642, {desc = "使用神圣的力量治疗盟友,为其恢复124~145点生命值.", flag1 = INTERRUPT}), -- Heal
          Spell(11640, {desc = "治疗一个友方目标，每3秒回复一次生命值。持续15秒.", flag1 = MAGIC}), -- Renew
          Spell(11974, {desc = "为盟友加上魔法护盾，可吸收137点伤害，持续30秒.", flag1 = MAGIC}), -- Power Word: Shield
          Spell(9734, {desc = "对敌人造成41~48点神圣伤害."}), -- Holy Smite
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7606,
        display = 6432,
        name = "欧罗·血眼 (术士)",
        sections = {
          Spell(12741, {desc = "降低附近敌人造成的物理伤害，持续20秒", flag1 = CURSE}), -- Curse of Weakness
          Spell(11990, {desc = "召唤熔岩之雨灼烧敌人，对指定区域中的敌人每3秒造成火焰伤害，持续9秒."}), -- Rain of Fire
          Spell(11962, {desc = "灼烧敌人,造成33~38点火焰伤害，并对其每3秒造成一次额外的4点火焰伤害，持续15秒.", flag1 = MAGIC}), -- Immolate
          Spell(9613, {desc = "向目标射出一支暗影箭，对其造成37~43点暗影伤害."}), -- Shadow Bolt
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7607,
        display = 7222,
        name = "维格利(地精工程师)",
        sections = {
          Spell(6660, {desc = "射击目标，对其造成24~29点物理伤害."}), -- Shoot
          Spell(8858, {desc = "对指定区域内的所有敌人造成火焰伤害."}), -- Bomb
          Spell(21688, {flag1 = IMPORTANT}), -- Goblin Land Mine
          --Spell(10772), -- Plant explosives
        },
      }),
    },
  },
  {
    name = "水占师维蕾萨",
    desc = "沙怒巨魔祭司,他和他的祭司似乎一直在从事召唤半神加兹瑞拉的仪式的研究工作.",
    --icon = true,
    creature = 7795,
    display = 6685,
    coords = {0.250, 0.361, 0},
    loot = {9234,10661,71637,},
    sections = {
      Spell(78802, {so = true}), -- Crashing Wave
      Spell(78801, {so = true, desc = "向一个敌人发射水箭，造成83~96点的冰霜伤害."}), -- Water Bolt
      Spell(12491, {so = true, desc = "使用自然的力量治疗盟友,为其恢复148~172点生命值.", flag1 = INTERRUPT}), -- Healing Wave
    },
  },
  {
    name = "加兹瑞拉",
    desc = "很久很久以前,巨魔在祖尔法拉克建造了一个巨大的水池.这个水池是半神加兹瑞拉召唤仪式的必备品.",
    --icon = true,
    creature = 7273,
    display = 7271,
    coords = {0.312, 0.411, 0},
    loot = {8707,9467,9469,71636,},
    sections = {
      Spell(11131, {so = true}), -- Icicle
      Spell(11836, {so = true, desc = "使敌人昏迷并每2秒造成93~107点冰霜伤害，持续6秒.", flag1 = MAGIC}), -- Freeze Solid
      Spell(11902, {so = true, desc = "对附近的敌人造成普通武器伤害再加上50点额外伤害，并将它们击退.", flag1 = DEADLY}), -- Gahz'rilla Slam
    },
  },
  {
    name = "乌克兹·沙顶",
    desc = "乌克兹·沙顶,祖尔法拉克的行政官.",
    --icon = true,
    creature = 7267,
    display = 6439,
    coords = {0.423, 0.338, 0},
    loot = {9243,9477,9479,9478,11086,9476,},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7267,
        display = 6439,
        name = "乌克兹·沙顶",
        sections = {
          Spell(15496, {flag1 = TANK}), -- Cleave
          Spell(11837, {flag1 = TANK}), -- Wide Slash
          Spell(8269, {desc = "乌克兹·沙顶的攻击速度提高60%，持续2分钟."}), -- Frenzy
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7797,
        display = 6687,
        name = "卢兹鲁",
        sections = {
          Spell(15496, {flag1 = TANK}), -- Cleave
          Spell(77720, {flag1 = HEALER}), -- Execute
        },
      }),
    },
  },
})

table.insert(db, ZULFARRAK)
