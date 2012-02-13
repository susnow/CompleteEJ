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
  desc = "通灵学院位于凯尔达隆废弃的城堡中的地下室中。那里曾经是高贵的巴罗夫家族的，但是在第二次大战中凯尔达隆变成了一块废墟。法师克尔苏加德经常向他的诅咒神教信徒承诺可以用对于巫妖王的效忠来换取永恒的生命。巴罗克家族受到克尔苏加德的魅惑而将城堡和其地下室献给了亡灵天灾。那些信徒然后将巴罗夫家族的人杀死并把地下室变成了通灵学院。虽然克尔苏加德不再住在这个地下室中，但是狂热的信徒和讲师都还留在那里。强大的巫妖莱斯·霜语以亡灵天灾的名义控制了这里---而凡人亡灵巫师黑暗院长加丁则是这个学校邪恶的校长.",
  texture = "Scholomance",
  area = 763,
  dflag = N5,
}, {
  {
    name = "传令官基尔图诺斯",
    desc = "基尔图诺斯通过活人的鲜血为天灾贡献大量的石像鬼.",
    --icon = true,
    creature = 10506,
    display = 7534,
    coords = {0.495, 0.106, 2},
    loot = {13956,13967,13983,13955,14024,13960,13969,13957,},
    sections = {
      Stage({
        so = true,
        name = "第一阶段:石像鬼",
        sections = {
          Spell(6016, {flag1 = HEALER}), -- Pierce Armor
          Spell(18144, {flag1 = TANK}), -- Swoop
          Spell(12882, {desc = "攻击施法者面前一个锥形区域内的敌人，将他们击退.", flag1 = IMPORTANT}), -- Wing Flap
          --Spell(16467), -- Kirtonos Transform
        },
      }),
      Stage({
        so = true,
        name = "第二阶段:吸血鬼",
        sections = {
          Spell(8379), -- Disarm
          Spell(17228, {desc = "向附近的敌人射出多支暗影箭，对它们造成暗影伤害."}), -- Shadow Bolt Volley
          Spell(12889, {desc = "强迫目标使用恶魔语，使其所有法术的施放时间延长50%，持续15秒.", flag1 = CURSE}), -- Curse of Tongues
          Spell(14515, {desc = "控制一个等级不高于25级的敌对人型生物，持续15秒.", flag1 = MAGIC}), -- Dominate Mind
        },
      }),
    },
    adds = {
      {
        name = "基尔图诺斯的卫士",
        creature = 10579,
        display = 9943,
      },
    },
  },
  {
    name = "詹迪斯·巴罗夫",
    desc = "曾经的大法师詹迪斯·巴罗夫 - 愿她的灵魂安息 - 就是一个幻术师极好的榜样。她生前曾发明了一个法术，能分出几个和自身难以区别的幻象。这些幻象能在不同地方同步她的行为，让她的敌人几乎不可能确定她的位置。这几乎无懈可击。不过这也让我得到了一个经验教训：“几乎”其实就是不够完美的另一种说法.",
    --icon = true,
    creature = 10503,
    display = 11073,
    coords = {0.542, 0.148, 3},
    loot = {14548,22394,14545,18689,18690,14541,},
    sections = {
      Spell(8994, {so = true, desc = "放逐敌对目标，使其完全无法行动，但也不会受到任何伤害，最多持续5秒。在同一时间内只能放逐一个目标.", flag1 = MAGIC}), -- Banish
      Spell(16098, {so = true, desc = "在受到附近敌人的物理攻击时所承受的伤害提高2点，持续20秒.", flag1 = CURSE}), -- Curse of Blood
      Spell(17773, {so = true, desc = "召唤15个幻象为施法者作战并吸引敌人，持续30秒."}), -- Summon Illusions (creature 11439)
    },
  },
  {
    name = "血骨傀儡",
    desc = "白骨组成的傀儡,镇守在停尸房的战斗兵器.",
    --icon = true,
    creature = 11622,
    display = 12073,
    coords = {0.316, 0.647, 3},
    loot = {18782,18686,14538,14531,14537,14528,14539,16711,},
    sections = {
      Spell(10101, {so = true}), -- Knock Away
      Spell(18368, {so = true, desc = "对敌人造成额外的近战伤害."}), -- Strike
      Spell(16727, {so = true, desc = "对附近的敌人造成你的武器伤害再加50点伤害，使它们昏迷4秒."}), -- War Stomp
    },
  },
  {
    name = "马杜克·布莱克波尔",
    desc = "在达隆郡的战役中,他滥用符文剑的力量,造成了许多洛丹伦军队人员的死亡",
    --icon = true,
    creature = 10433,
    display = 10248,
    coords = {0.432, 0.642, 2},
    loot = {14576,18692,},
    sections = {
      Spell(15284, {so = true, flag1 = TANK}), -- Cleave
      Spell(17228, {so = true, desc = "向附近的敌人射出多支暗影箭，对它们造成暗影伤害."}), -- Shadow Bolt Volley
      Spell(12040, {so = true, desc = "使施法者被一层由暗影魔法编织而成的护盾所包围。该护盾持续30秒，可以吸收伤害.", flag1 = MAGIC}), -- Shadow Shield
      Spell(17695, {so = true, desc = "施法者被光环包围，周期性地使附近敌方的暗影抗性降低100点."}), -- Defiling Aura (triggers 17697)
    },
  },
  {
    name = "维克图斯",
    desc = "通灵巫术的教师,主修课程是唤灵术.",
    --icon = true,
    creature = 10432,
    display = 2606,
    coords = {0.499, 0.642, 2},
    loot = {14577,18691,},
    sections = {
      Spell(16046, {so = true, desc = "施法者放出一道火焰冲击波，所有被冲击波触及的敌人都会受到火焰伤害，同时降低移动速度，持续6秒."}), -- Blast Wave
      Spell(18399, {so = true, desc = "召唤一根火柱，灼烧指定区域内的所有敌人，并对它们每2秒造成一次额外伤害，持续8秒."}), -- Flamestrike
    },
  },
  {
    name = "莱斯·霜语",
    desc = "巫妖头目莱斯-霜语(Frostwhisper)(克尔苏加德最得意的学生).",
    --icon = true,
    creature = 10508,
    display = 7919,
    coords = {0.404, 0.811, 4},
    loot = {14487,14502,14522,18693,14340,14503,13952,18694,14525,18695,18696,13314,},
    sections = {
      Spell(18100, {desc = "一层寒冰包裹施法者，持续30分钟。这层厚重的寒冰能提高护甲值，并且使近战攻击者的移动速度降低，攻击间隔增加5秒.", flag1 = MAGIC}), -- Frost Armor (triggers 18101)
      Spell(18099, {desc = "对附近的敌人造成冰霜伤害，并使其被击退，移动速度降低，最多持续5秒.", flag1 = MAGIC}), -- Chill Nova
      Spell(18763, {desc = "击晕敌人，每2秒造成冰霜伤害。持续8秒.", flag1 = MAGIC}), -- Freeze
      Spell(8398, {desc = "对附近的敌人造成冰霜伤害，并使其移动速度降低50%，持续4秒.", flag1 = MAGIC}), -- Frostbolt Volley
      Spell(22678, {desc = "使敌人因为极度的恐惧而奔逃，最多持续6秒。在同一时间内，只有1个敌人会被你的恐惧术影响.", flag1 = MAGIC}), -- Fear
    },
  },
  {
    name = "讲师玛丽希亚",
    desc = "如果你想要挑战黑暗院长加丁,你必须击败讲师玛丽希亚.",
    --icon = true,
    creature = 10505,
    display = 20981,
    coords = {0.726, 0.704, 3},
    loot = {14636,14637,14623,18680,14621,18684,23201,18682,14641,18681,14616,14611,14620,18683,14638,23200,14640,14624,14614,14632,14612,14626,14631,14633,14629,14615,14622,},
    sections = {
      Spell(78535, {flag1 = CURSE}), -- Call of the Grave
      Spell(41988, {desc = "腐蚀附近的敌人，每3秒造成一次暗影伤害。持续15秒.", flag1 = MAGIC}), -- Corruption
      Spell(13747, {desc = "使一名敌人的攻击间隔和施法时间延长50%，并使其移动速度降低60%，持续6秒.", flag1 = MAGIC}), -- Slow
      Spell(15586, {desc = "使用神圣的力量治疗盟友.", flag1 = INTERRUPT}), -- Heal
      Spell(17843, {desc = "使用神圣的力量治疗盟友.", flag1 = INTERRUPT}), -- Flash Heal
      Spell(8362, {desc = "为一名盟友每3秒治疗恢复一次生命值，持续15秒.", flag1 = MAGIC}), -- Renew
    },
  },
  {
    name = "瑟尔林·卡斯迪诺夫教授<屠夫>",
    desc = "如果你想要挑战黑暗院长加丁,你必须击败残暴的屠夫瑟尔林·卡斯迪诺夫教授.",
    --icon = true,
    creature = 11261,
    display = 10901,
    coords = {0.888, 0.459, 3},
    loot = {14629,14614,18682,14621,18683,14612,18680,14633,18684,14616,23200,14622,14637,18681,23201,14636,14626,14615,14624,14631,14611,14638,14641,14623,14640,14620,14632,16684,},
    sections = {
      Spell(18103, {so = true}), -- Backhand
      Spell(16509, {so = true, desc = "每3秒对敌人造成一次物理伤害，持续15秒."}), -- Rend
      Spell(8269, {so = true, desc = "使施放者的攻击速度提高60%，持续2分钟."}), -- Frenzy
    },
  },
  {
    name = "博学者普克尔特",
    desc = "这个曾经的博学者,现在已经是一个怪物了,如果你想要挑战黑暗院长加丁,你必须击败博学者普科尔特.",
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
    name = "拉文尼亚",
    desc = "如果你想要挑战黑暗院长加丁,你必须击败拉文尼亚.",
    --icon = true,
    creature = 10507,
    display = 10433,
    coords = {0.675, 0.485, 4},
    loot = {14641,14622,18681,14629,18682,14620,18683,14632,18684,14615,14637,14616,23201,18680,14624,14640,23200,14623,14626,14612,14611,14621,14636,14631,14633,14614,14638,16716,},
    sections = {
      Spell(40504, {so = true, flag1 = TANK}), -- Cleave
      Spell(18670, {so = true, flag1 = TANK}), -- Knock Away
      Spell(17963, {so = true, desc = "击破敌人及其附近盟友的护甲，最多影响3个目标。每次破甲顺劈可以使敌人的护甲值降低。最多可叠加5次。持续30秒.", flag1 = HEALER}), -- Sundering Cleave
      Spell(15550, {so = true, desc = "对附近的敌人造成物理伤害."}), -- Trample
    },
  },
  {
    name = "阿雷克斯·巴罗夫",
    desc = ",阿雷克斯·巴罗夫,固执的徘徊在墓室中,他看着手中印有巴罗夫家族徽记的长剑,他已经成为了巫妖王的奴隶.他知道他中了克尔苏加德的圈套,但是他并不能做出任何有违巫妖王意愿的事情,也许有一天,有一个人可以把他从这深渊中解救出来.",
    --icon = true,
    creature = 10504,
    display = 11072,
    coords = {0.792, 0.299, 4},
    loot = {14614,18683,14612,18684,14631,18681,18682,18680,14621,14637,14641,14626,14622,23200,14623,23201,14640,14611,14629,14624,14638,14632,14615,14636,14616,14633,14620,},
    sections = {
      Spell(17467, {so = true}), -- Unholy Aura
      Spell(15732, {so = true, desc = "灼烧敌人，并对其每3秒造成一次额外火焰伤害，持续15秒.", flag1 = MAGIC}), -- Immolate
      Spell(17820, {so = true, desc = "使附近的敌人在受到治疗时的治疗效果降低60%，持续15秒.", flag1 = CURSE}), -- Veil of Shadow
    },
  },
  {
    name = "伊露希亚·巴罗夫",
    desc = "伊露希亚·巴罗夫,孤独的矗立在一堆亡灵法师之间,或许只有她的父亲才能够明白她苍白的双手已经不再像以前一样了,她已经成为了一名亡灵巫师,她正在等待着巫妖王的召唤,去召唤她前往亡灵天灾的圣地.",
    --icon = true,
    creature = 10502,
    display = 11835,
    coords = {0.675, 0.153, 4},
    loot = {14615,14637,14640,23201,14622,18683,18684,23200,14631,18680,14633,14624,14614,18681,14623,14611,14629,14626,14621,18682,14612,14632,14641,14620,14636,14616,14638,},
    sections = {
      Spell(17234, {desc = "使用暗影魔法攻击敌人，对其造成暗影伤害."}), -- Shadow Shock
      Spell(12542, {so = true, desc = "使敌人因为极度的恐惧而奔逃，最多持续4秒。在同一时间内，只有1个敌人会被你的恐惧术影响.", flag1 = MAGIC}), -- Fear
      Spell(18671, {so = true, desc = "诅咒附近的敌人，每3秒对其造成一次暗影伤害，持续15秒。对于一个目标，每个术士只能施加一种诅咒.", flag1 = CURSE}), -- Curse of Agony
      Spell(12528, {so = true, desc = "使附近的敌人因沉默而不能施法，持续5秒.", flag1 = MAGIC}), -- Silence
      Spell(7645, {so = true, desc = "控制一个等级不高于25级的敌对人型生物，持续10秒。使其攻击间隔延长100%.", flag1 = MAGIC}), -- Dominate Mind
    },
  },
  {
    name = "黑暗院长加丁",
    desc = "天灾军团的大量亡灵学者，还有那些追求黑暗力量的人类、兽人和高等精灵，纷纷来到通灵学院中，向巫妖王奉献出了自己的灵魂。他们在通灵学院中整日研习，其中的佼佼者会被莱斯·霜语提拔，负责管理学院中的某个研究领域，这些高阶的亡灵学者被称为黑暗院长。而在所有的黑暗院长中，加丁是知识最渊博、力量最强大的一个。他漫步在成堆的白骨和饱经折磨的骷髅僵尸中，看着自己的学生一批批地从通灵学院走向瘟疫之地的各个角落，走向艾泽拉斯的战场.",
    --icon = true,
    creature = 1853,
    display = 11070,
    coords = {0.675, 0.299, 4},
    loot = {13944,13938,13953,19276,13398,13951,13964,14514,22433,13937,},
    sections = {
      Spell(15791, {so = true, desc = "向目标射出魔法箭，对其造成奥术伤害."}), -- Arcane Missiles
      Spell(12040, {so = true, desc = "使施法者被一层由暗影魔法编织而成的护盾所包围。该护盾持续30秒，可以吸收伤害.", flag1 = MAGIC}), -- Shadow Shield
      Spell(18702, {so = true, flag1 = CURSE}), -- Curse of the Darkmaster
      Spell(17950, {so = true, desc = "将一名敌人传送到通灵学院内6处位置中的其中1处."}), -- Shadow Portal
    },
  },
})

table.insert(db, SCHOLOMANCE)
