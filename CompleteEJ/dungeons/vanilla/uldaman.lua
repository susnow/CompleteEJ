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

local ULDAMAN = CreateInstance({
  name = "奥达曼",
  desc = "奥达曼是一座古代泰坦的地下堡垒，在创世完成后便被深埋地底。最近，矮人探险家发掘出了这座被遗忘的城市，放出了泰坦巨人失败的造物：穴居人。传说泰坦用石头造出了穴居人。当他们发现这种实验是失败的以后，泰坦把穴居人关了起来并重新开始尝试——他们最终创造出了矮人种族。创造矮人的秘密记录在传说中的白金圆盘里，这个巨大的泰坦遗物就位于这个远古城市的最深处。最近，黑铁矮人开展了一系列针对奥达曼的入侵，希望能够为他们凶狠的主人拉格纳罗斯夺到圆盘。但有一些守卫保护着这个被掩埋的城市——由活的岩石做出的巨大构造体会将他们能找到的所有倒霉的入侵者碾碎。圆盘本身被一个巨大的，叫做阿扎达斯的石卫士守护着。甚至有消息称，矮人们那拥有岩石皮肤的祖先，土灵，依然居住在这个城市中某些隐蔽的角落里。",
  texture = "Uldaman",
  area = 692,
  dflag = N5,
}, {
  {
    name = "失踪的矮人",
    desc = "巴尔洛戈、埃瑞克和奥拉夫对于联盟是友善的，但是可被部落方攻击。",
    --icon = true,
    creature = 6906,
    display = 5710,
    coords = {0.587, 0.923, 1},
    loot = {9400,9401,7453,9398,9394,9403,9404},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 6906,
        display = 5710,
        name = "巴尔洛戈",
        sections = {
          Spell(15620, {desc = "射击目标，对其造成49到58点物理伤害。"}), -- Shoot
          Spell(14516, {desc = "对敌人造成10%额外的近战伤害。"}), -- Strike
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 6907,
        display = 5708,
        name = "埃瑞克",
        sections = {
          Spell(6268, {desc = "向目标冲锋，使施法者的下一次攻击造成30%额外伤害。"}), -- Rushing Charge
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 6908,
        display = 5709,
        name = "奥拉夫",
        sections = {
          Spell(8242, {desc = "对敌人造成20点物理伤害，并使其昏迷2秒。"}), -- Shield Slam
        },
      }),
    },
  },
  {
    name = "鲁维罗什",
    desc = "鲁维罗什是奥达曼中第一个石腭怪BOSS。",
    --icon = true,
    creature = 6910,
    display = 5945,
    coords = {0.532, 0.727, 1},
    loot = {9389,9390,9387,9388,},
    sections = {
      Spell(16006, {so = true, desc = "向敌人射出一支闪电箭，这支闪电箭会在击中目标后继续攻击它周围最近的敌人，对每个目标都造成99到116点自然伤害，最多可攻击3个目标。"}), -- Chain Lightning
      Spell(15801, {so = true, desc = "用闪电攻击目标，对其造成99到116点自然伤害。"}), -- Lightning Bolt
    },
  },
  {
    name = "艾隆纳亚",
    desc = "艾隆纳亚试图保护奥达曼的秘密不被冒险者发现。",
    --icon = true,
    creature = 7228,
    display = 6089,
    coords = {0.370, 0.740, 1},
    loot = {9409,9408,9407,},
    sections = {
      Spell(8374, {so = true, flag1 = TANK}), -- Arcing Smash
      Spell(10101, {so = true}), -- Knock Away
      Spell(11876, {so = true}), -- War Stomp
    },
  },
  {
    name = "黑曜石哨兵",
    desc = "泰坦制造了这些黑曜石哨兵以防止在阿扎达斯和艾隆尼亚打盹时奥达曼被冒险者入侵。奥伦·日冕和坎德·沙寻者怀疑是一个上古之神导致了这些守护者的堕落。另一个守护者是神殿大厅中的古代的石头看守者，它还没有被腐化。",
    --icon = true,
    creature = 7023,
    display = 5285,
    coords = {0.290, 0.602, 1},
    loot = {62053,},
    sections = {
      Spell(9941, {so = true, desc = "制造魔法护盾，以20%的概率反射对你施放的法术。", flag1 = DPS}), -- Obsidian Reflection
      Spell(10061, {so = true, desc = "10061"}), -- Summon Obsidian Shard
      Spell(10072, {so = true, desc = "每次召唤黑曜石碎片，黑曜石守卫的物理伤害能力都会降低60点。最多叠加4次"}), -- Splintered Obsidian
      Stage({
        stype = CREATURE,
        creature = 7209,
        display = 3731,
        name = "黑曜石碎片",
        sections = {
          Spell(9941, {so = true, desc = "制造魔法护盾，以20%的概率反射对你施放的法术。", flag1 = DPS}), -- Obsidian Reflection
        },
      }),
    },
  },
  {
    name = "古代的石头看守者",
    desc = "泰坦制造了这些黑曜石哨兵以防止在阿扎达斯和艾隆尼亚打盹时奥达曼被冒险者入侵。奥伦·日冕和坎德·沙寻者怀疑是一个上古之神导致了这些守护者的堕落。另一个守护者是黑曜石洞穴中的黑曜石哨兵，它已被腐化。",
    --icon = true,
    creature = 7206,
    display = 10798,
    coords = {0.474, 0.442, 1},
    loot = {9410,9411,62055,},
    sections = {
      Spell(10094, {so = true, desc = "召唤1个沙尘风暴为施法者作战，持续30秒。"}), -- Sand Storms (spawns at ranged enemies, 10132 spawns at melee specifically)
      Stage({
        so = true,
        stype = CREATURE,
        creature = 7226,
        display = 31882, -- not the same NPC but borrowing from 42639
        name = "沙尘风暴",
        sections = {
          Spell(10092, {so = true, desc = "制造一场沙尘风暴，对陷入其中的敌人造成9到10点自然伤害，使其移动速度降低50%。"}), -- Sand Storm (triggers 10093)
        },
      }),
    },
  },
  {
    name = "加加恩·火锤",
    desc = "带领他的暗炉部族手下一同作战。",
    --icon = true,
    creature = 7291,
    display = 6059,
    coords = {0.267, 0.327, 1},
    loot = {9412,9419,11310,11311,},
    sections = {
      Spell(9482, {so = true, flag1 = MAGIC}), -- Amplify Flames
      Spell(3356, {so = true, desc = "使一个敌人燃烧，对其造成火焰伤害，并使其火焰抗性降低，持续20秒。", flag1 = MAGIC}), -- Flame Lash
      Spell(11969, {so = true, desc = "	对附近的敌人造成33到38点火焰伤害。"}), -- Fire Nova
      Stage({
        stype = CREATURE,
        creature = 4849,
        display = 6067,
        name = "暗炉考古学家",
        sections = {
          Spell(6713, {so = true}), -- Disarm
          Spell(11972, {so = true}), -- Shield Bash
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 7030,
        display = 6056,
        name = "暗炉地质学家",
        sections = {
          Spell(3356, {so = true, desc = "使一个敌人燃烧，对其造成火焰伤害，并使其火焰抗性降低，持续20秒。", flag1 = MAGIC}), -- Flame Lash
          Spell(8814, {so = true, desc = "召唤一根火柱，对指定区域内的所有敌人造成93到107点火焰伤害，并对它们每3秒造成50点额外伤害，持续9秒。"}), -- Flame Spike
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 4848,
        display = 6055,
        name = "暗炉暗法师",
        sections = {
          Spell(11981, {so = true, desc = "向敌人射出一支可抽取46到53点法力值的箭，每抽取1点法力值，目标就受到1点伤害。"}), -- Mana Burn
          Spell(9081, {so = true, desc = "向30码内的敌人射出多支暗影箭，对它们造成49到58点暗影伤害。"}), -- Shadow Bolt Volley
        },
      }),
    },
  },
  {
    name = "格瑞姆洛克",
    desc = "与他的宠物玉脊蜥蜴和两个石腭怪一同战斗。",
    --icon = true,
    creature = 4854,
    display = 11165,
    coords = {0.221, 0.262, 1},
    loot = {9415,9414,9416,},
    sections = {
      Spell(12167, {so = true, desc = "用闪电攻击目标，对其造成74到87点自然伤害。"}), -- Lightning Bolt
      Spell(8292, {so = true}), -- Chain Bolt
      Spell(11892, {so = true, flag1 = CURSE}), -- Shrink
      Spell(6742, {so = true, flag1 = MAGIC}), -- Bloodlust
      Stage({
        stype = CREATURE,
        creature = 4863,
        display = 4486,
        name = "玉脊蜥蜴",
        sections = {
          Spell(3636, {so = true, desc = "造成15点奥术伤害，并使目标因昏迷而无法移动或攻击，持续3秒。", flag1 = MAGIC}), -- Crystalline Slumber
          Spell(9906, {so = true, flag1 = DPS}), -- Reflection
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 4855,
        display = 11166,
        name = "石窟争斗者",
        sections = {
          Spell(8599, {so = true, desc = "激怒，物理伤害提高10%，攻击速度提高30%，持续2分钟。", flag1 = ENRAGE}), -- Enrage
          Spell(3391, {so = true}), -- Thrash
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 4853,
        display = 1194,
        name = "石窟地占师",
        sections = {
          Spell(14034, {so = true, desc = "对一个敌人造成74到87点火焰伤害。"}), -- Fireball
          Spell(10452, {so = true, desc = "对一名敌人造成21点火焰伤害，并使其受到的火焰伤害提高20点，持续15秒。最多叠加5次。"}), -- Flame Buffet
        },
      }),
    },
  },
  {
    name = "阿扎达斯",
    desc = "阿扎达斯是远古泰坦的仆从，奥达曼穹殿的石巨人守护者。为确保他能保持警惕，创造者用魔法使他保存在永恒的睡眠中。任何企图打开穹殿的行为都是使他醒来。",
    --icon = true,
    creature = 2748,
    display = 5988,
    coords = {0.552, 0.505, 2},
    loot = {11118,9418,9413,},
    sections = {
      Spell(6524, {so = true, desc = "使附近的敌人昏迷，无法移动或攻击，持续2秒。"}), -- Ground Tremor
      Stage({
        name = "第一阶段",
        sections = {
          Spell(10252, {so = true, name = "唤醒土灵守护者", desc = "随机的唤醒1个在周围围成一圈的土灵守护者。"}, 1), -- Awaken Earthen Guardians
        },
      }),
      Stage({
        name = "第二阶段：血量66%时",
        sections = {
          Spell(10252, {so = true, name = "唤醒6个土灵守护者", desc = "随机的唤醒6个在周围围成一圈的土灵守护者。"}, 1), -- Awaken Earthen Guardians
        },
      }),
      Stage({
        name = "第三阶段：血量33%时",
        sections = {
          Spell(10258, {so = true, name = "唤醒宝库护卫者", desc = "随机的唤醒2个在周围围成一圈的宝库护卫者。"}, 1), -- Awaken Vault Warder
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 7076,
        display = 6026,
        name = "土灵守护者",
        sections = {
          Spell(17207, {so = true, desc = "像旋风一般挥舞手中的武器，攻击周围的所有敌人，造成110%的武器伤害，持续2秒。"}), -- Whirlwind (triggers 15576)
        },
      }),
      Stage({
        stype = CREATURE,
        creature = 10120,
        display = 5989,
        name = "宝库护卫者",
        sections = {
          Spell(5568, {so = true, desc = "对附近的敌人造成普通武器伤害并附加8%额外伤害。"}), -- Trample
        },
      }),
    },
  },
})

table.insert(db, ULDAMAN)
