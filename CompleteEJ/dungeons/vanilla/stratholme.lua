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

local STRATHOLME = CreateInstance({
  name = "斯坦索姆",
  desc = "斯坦索姆曾经是洛丹伦北部一颗璀璨的明珠，但是就是在这座城市阿尔萨斯王子背叛了他的导师乌瑟尔，并屠杀了数百个被认为感染了可怕瘟疫的臣民。阿尔萨斯不久之后就向巫妖王臣服。这个破碎的城市也被巫妖克尔苏拉德领导的亡灵天灾所占据。而一直由大十字军战士达索汉领导的血色十字军分遣队也占据了这个城市的一部分。这两方力量在城市中进行着激烈的战斗。而那些勇敢（亦或是愚蠢的）的冒险者在进入斯坦索姆之后将不得不面对两方的力量。据说整座城市由三座大型的通灵塔以及无数强大的亡灵巫师，女妖和憎恶所守卫着。据报告，邪恶的死亡骑士瑞文戴尔男爵乘坐在一匹骷髅战马——他会将怒火倾泻在任何胆敢进入亡灵天灾领域的人.",
  texture = "Stratholme",
  area = 765,
  dflag = N5,
}, {
  {
    name = "弗雷斯特恩 (稀有)",
    desc = "如果你的运气够好,你可以在十字军广场上遇到随处游荡的弗雷斯特恩.",
    --icon = true,
    creature = 10558,
    display = 10482,
    coords = {0.598, 0.280, 1},
    loot = {13378,13383,13379,13384,16682,},
    sections = {
      Spell(15620, {so = true, desc = "射击目标，对其造成物理伤害."}), -- Shoot
      Spell(14443, {so = true}), -- Multi-Shot
      Spell(16798, {so = true, flag1 = MAGIC}), -- Enchanting Lullaby
      Spell(16244, {so = true, desc = "使附近敌人的近战攻击强度降低，持续30秒."}), -- Demoralizing Shout
    },
  },
  {
    name = "不可宽恕者",
    desc = "不可宽恕者的存在一直是一个谜团,没有多少人真正了解不可宽恕者.",
    --icon = true,
    creature = 10516,
    display = 10771,
    coords = {0.734, 0.202, 1},
    loot = {13409,13408,13405,13404,},
    sections = {
      Spell(6136, {so = true, desc = "如果敌人攻击施法者，可能会使他们的移动速度降低30%，攻击间隔提高20%，持续5秒。法师在同一时间内只能保有一种魔法护甲效果.", flag1 = MAGIC}), -- Chilled
      Spell(14907, {so = true, desc = "对附近的敌人造成冰霜伤害并将其冻结在原地，冻结效果最多可持续8秒.", flag1 = MAGIC}), -- Frost Nova
    },
  },
  {
    name = "悲惨的提米",
    desc = "这只食尸鬼(在斯坦索姆中他确实已经是一只食尸鬼了),曾经在魔兽争霸混乱之治和冰封王座的多个战役剧情中出现过.提米,曾经是洛丹伦的一名天真无邪的小男孩....",
    --icon = true,
    creature = 10808,
    display = 571,
    coords = {0.496, 0.168, 1},
    loot = {13400,13402,13401,13403,},
    sections = {
      Spell(17470, {so = true}), -- Ravenous Claw
      Spell(8599, {so = true, desc = "激怒,物理伤害提高10%,攻击速度提高30%,持续2分钟.", flag1 = ENRAGE, flag2 = HEALER}), -- Enrage
    },
  },
  {
    name = "狂热的玛洛尔",
    desc = "这名血色十字军将领在斯坦索姆战死,后来被巴纳扎尔复活.",
    --icon = true,
    creature = 11032,
    display = 34463,
    coords = {0.297, 0.408, 1},
    loot = {12845,},
    sections = {
      Spell(16172, {so = true}), -- Head Crack
      Spell(12734, {so = true, desc = "对附近的敌人造成37~43点物理伤害，并使他们昏迷2秒."}), -- Ground Smash
      Spell(15245, {so = true, desc = "向附近的敌人射出多支暗影箭，对它们造成99~116点暗影伤害."}), -- Shadow Bolt Volley
    },
  },
  {
    name = "炮手威利",
    desc = "血色十字军的火炮原本是抵御天灾的武器,不过现在炮手换人了.玩家在与威利作战的时候,可以使用场上的十字军火炮来消灭前来支援的十字军援军.",
    --icon = true,
    creature = 10997,
    display = 34480,
    coords = {0.042, 0.510, 1},
    loot = {22406,13381,13382,22407,18721,22403,13380,22404,22405,12839,},
    sections = {
      Spell(59146, {so = true, desc = "射击敌人，造成99~116点物理伤害."}), -- Shoot
      Spell(15615, {so = true}), -- Pummel
      Spell(10101, {so = true}), -- Knock Away
      --Spell(17279), -- Summon Crimson Rifleman
      Stage({
        so = true,
        stype = CREATURE,
        creature = 11054,
        display = 34481,
        name = "红衣火枪手",
        desc = "炮手威利大声喊叫,3名红衣火枪手加入了战斗.",
        sections = {
          Spell(17353, {desc = "射击目标，对其造成19~22点物理伤害."}), -- Shoot
        },
      }),
    },
  },
  {
    name = "档案管理员加尔福特",
    desc = "血色十字军的档案室管理员,一个强大的人类魔法师,擅长使用火焰魔法.",
    --icon = true,
    creature = 10811,
    display = 34498,
    coords = {0.270, 0.748, 1},
    loot = {18716,13387,13386,13385,},
    sections = {
      Spell(17293, {so = true, flag1 = MAGIC}), -- Burning Winds
      Spell(17366, {so = true, desc = "对附近10码内的敌人造成49~58点火焰伤害."}), -- Fire Nova
      Spell(33975, {so = true, desc = "对敌人造成218~253点火焰伤害，并继续造成每3秒一次额外的9点火焰伤害，持续12秒.", flag1 = INTERRUPT}), -- Pyroblast
    },
  },
  {
    name = "巴纳扎尔",
    desc = "纳斯雷兹姆（Nathrezim）萨尔克顿（Thal'Kituun）的恐惧魔王,燃烧军团安插在斯坦索姆的羽翼.",
    --icon = true,
    creature = 10813,
    display = 34424,
    coords = {0.204, 0.819, 1},
    loot = {18720,13348,13360,18718,14512,13358,13359,13369,12103,18717,13353,},
    sections = {
      Spell(80750, {desc = "对一名敌人造成74~87点暗影伤害."}), -- Mind Blast
      Spell(17399, {desc = "使用暗影魔法攻击附近的敌人，造成49~58点暗影伤害."}), -- Shadow Shock
      Spell(13704, {flag1 = MAGIC}), -- Psychic Scream
      Spell(66290, {desc = "使敌人进入睡眠状态，最多持续6秒。任何对目标造成伤害的行为都会唤醒它.", flag1 = MAGIC}), -- Sleep
      Spell(17405, {flag1 = IMPORTANT}), -- Domination
    },
  },
  {
    name = "安娜丝塔丽男爵夫人",
    desc = "女妖是天谴部队中非常常见的战斗单位,擅长使用精神系的诅咒攻击,而镇守着斯坦索姆第一座通灵塔的安娜丝塔丽男爵夫人则就是女妖中的佼佼者.",
    --icon = true,
    creature = 10436,
    display = 10698,
    coords = {0.744, 0.461, 2},
    loot = {13539,18730,13538,13534,18729,18728,13535,13537,16704,},
    sections = {
      Spell(16867, {so = true, flag1 = CURSE}), -- Banshee Curse
      Spell(18327, {so = true, flag1 = MAGIC}), -- Silence
      Spell(16868, {so = true, desc = "发出刺耳的哀嚎，对敌人造成74~87点暗影伤害."}), -- Banshee Wail
      Spell(17244, {so = true, desc = "控制一个等级不高于100级的敌对人型生物，持续2分钟.使其生命值上限提高2000%.", flag1 = IMPORTANT}), -- Possess
    },
  },
  {
    name = "奈鲁布恩坎",
    desc = "奈鲁布恩坎是一只带有剧毒的蜘蛛,镇守着斯坦索姆的第二座通灵塔.",
    --icon = true,
    creature = 10437,
    display = 9793,
    coords = {0.572, 0.461, 2},
    loot = {18739,18738,18740,13529,16675,},
    sections = {
      Spell(31602, {so = true, desc = "召唤几只墓穴甲虫攻击施法者的目标."}), -- Crypt Scarabs
      Spell(4962, {so = true}), -- Encasing Webs
      Spell(6016, {so = true, flag1 = HEALER}), -- Pierce Armor
      --Spell(17235), -- Raise Undead Scarab
      Stage({
        so = true,
        stype = CREATURE,
        creature = 10876,
        display = 10031,
        name = "亡灵甲虫",
        desc = "被召唤出来的亡灵甲虫开始攻击敌人.",
        sections = {
          Spell(13298, {desc = "每3秒对目标造成一次自然伤害，持续15秒.", flag1 = POISON}), -- Poison
        },
      }),
    },
  },
  {
    name = "苍白的玛勒基",
    desc = "玛勒基,诅咒神教的一名高阶侍僧,擅长使用冰霜魔法和暗影魔法,镇守着斯坦索姆第三座通灵塔",
    --icon = true,
    creature = 10438,
    display = 10546,
    coords = {0.676, 0.215, 2},
    loot = {13525,18737,18735,12833,18734,13527,13524,13528,13526,16691,},
    sections = {
      Spell(6136, {so = true, desc = "如果敌人攻击施法者，可能会使他们的移动速度降低30%，攻击间隔提高20%，持续5秒.", flag1 = MAGIC}), -- Chilled
      Spell(54791, {so = true, desc = "对一个敌人造成99~116点冰霜伤害，并使其移动速度降低50%，持续4秒.", flag1 = MAGIC}), -- Frostbolt
      Spell(16869, {so = true}), -- Ice Tomb
      Spell(17620, {so = true, flag1 = MAGIC, flag2 = INTERRUPT}), -- Drain Life
    },
  },
  {
    name = "巴瑟拉斯镇长",
    desc = "巴瑟拉斯镇长被天灾杀死后,被巫妖王复活并且继续留守在斯坦索姆.",
    --icon = true,
    creature = 10435,
    display = 10433,
    coords = {0.567, 0.158, 2},
    loot = {18725,13376,18722,18726,18727,23198,},
    sections = {
      Spell(10887, {so = true}), -- Crowd Pummel
      Spell(14099, {so = true, desc = "对一名敌人造成25点普通伤害及额外伤害，并将其击退."}), -- Mighty Blow
      Spell(16793, {so = true}), -- Draining Blow
      Spell(16791, {so = true, desc = "造成的物理伤害提高15点,攻击速度提高4%,持续1分钟.这个效果最多可以叠加25次."}), -- Furious Anger
    },
  },
  {
    name = "吞咽者拉姆斯登",
    desc = "和其他的憎恶一样,被尸体缝补而成的拉姆斯登,尽管不具备智慧,但是却能够一直持续不断的战斗.而且,和其他憎恶一样,他十分的贪吃.....",
    --icon = true,
    creature = 10439,
    display = 12818,
    coords = {0.455, 0.205, 2},
    loot = {13375,13374,18723,13515,13372,13373,16737,},
    sections = {
      Spell(17687, {so = true, flag1 = HEALER}), -- Flurry
      Spell(17307, {so = true}), -- Knockout
      Spell(5568, {so = true, desc = "对附近10码内的敌人造成普通武器伤害与附加伤害."}), -- Trample
    },
  },
  {
    name = "瑞文戴尔男爵",
    desc = "瑞文戴尔男爵是一位富裕的洛丹伦地主，并且是克尔苏加德的好友。在通灵师们的影响下，他帮助克尔苏加德创建并组织了诅咒神教。之后，瑞文戴尔取得了死亡骑士的头衔和力量。现在，瑞文戴尔男爵管辖着斯坦索姆。他侍奉克尔苏加德并且狂喜而热衷于他的力量。现在他最大的兴趣就是将腐化的力量灌输给他人，特别是圣骑士，尤其是银色黎明的成员.",
    --icon = true,
    creature = 45412,
    display = 34837,
    coords = {0.390, 0.205, 2},
    loot = {13361,22411,13368,22409,13349,22408,22410,22412,13345,13344,13340,13346,13505,13335,},
    sections = {
      Spell(17467, {so = true, flag1 = IMPORTANT}), -- Unholy Aura
      Spell(15496, {so = true, flag1 = TANK}), -- Cleave
      Spell(16856, {so = true, flag1 = HEALER}), -- Mortal Strike
      Spell(17393, {desc = "向目标射出一支暗影箭，对其造成145~169点暗影伤害."}), -- Shadow Bolt (17434 and 17435 are duplicates?)
    },
  },
})

table.insert(db, STRATHOLME)
