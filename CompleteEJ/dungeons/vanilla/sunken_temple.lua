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

local SUNKEN_TEMPLE = CreateInstance({
  name = "沉没的神庙",
  desc = "阿塔哈卡神庙，沉没的神庙，是阿塔莱巨魔为血神哈卡建立的。它坐落于悲伤沼泽。",
  texture = "SunkenTemple",
  area = 687,
  dflag = N5,
}, {
  {
    name = "预言者迦玛兰",
    desc = "迦玛兰是哈卡莱部族的精神领袖,他认为,召唤血神哈卡会为哈卡莱部族带来不朽的永生",
    --icon = true,
    creature = 5710,
    display = 6708,
    coords = {0.760, 0.458, 1},
    loot = {10807,10808,10806,},
    sections = {
      Spell(12480, {so = true, desc = "对目标施放妖术,扭曲其外形,使其造成的伤害增加400%,并且背叛其盟友,持续15秒.", flag1 = CURSE}), -- Hex of Jammal'an
      Spell(12468, {so = true, desc = "召唤一根火柱，灼烧指定区域内的所有敌人,对其造成74~87点火焰伤害，并对它们每2秒造成一次额外的4点火焰伤害，持续8秒."}), -- Flamestrike
      Spell(12492, {so = true, desc = "使用自然的力量治疗盟友,为其恢复217~252点生命值.", flag1 = INTERRUPT}), -- Healing Wave
      --Spell(8376), -- Earthgrab Totem
      Stage({
        so = true,
        stype = CREATURE,
        creature = 8179,
        display = 2030,
        name = "强效治疗结界",
        desc = "召唤一根图腾,使附近30码内的敌人无法移动.",
      }),
    },
  },
  {
    name = "哈卡的化身", -- Shade of Hakkar #8440 7690
    desc = "哈卡的化身,是血神哈卡盘踞在阿塔哈卡神庙的灵魂意识形态.",
    --icon = true,
    creature = 8443,
    display = 8053,
    coords = {0.241, 0.458, 1},
    loot = {10842,10838,10843,10845,10846,10844,12462,},
    sections = {
      Spell(12888, {so = true, flag1 = MAGIC}), -- Cause Insanity
      Spell(12889, {so = true, desc = "强迫目标使用恶魔语，使其所有法术的施放时间延长50%，持续15秒.", flag1 = CURSE}), -- Curse of Tongues
      Spell(6607, {so = true, desc = "击倒一个敌人,有一定几率将其缴械5秒."}), -- Lash (triggers 33126 and 11920)
    },
  },
  {
    name = "德姆塞卡尔",
    desc = "预言者迦玛兰和哈卡的化身一旦被击败,德姆塞卡尔将出现在神殿中央..",
    --icon = true,
    creature = 5721,
    display = 7553,
    coords = {0.500, 0.868, 1},
    loot = {10795,10796,10797,12243,12463,12464,12465,12466,},
    sections = {
      Spell(12884, {so = true, flag1 = TANK}), -- Acid Breath
      Spell(12882, {so = true, flag1 = TANK}), -- Wing Flap
    },
  },
  {
    name = "伊兰尼库斯的阴影",
    desc = "伊兰尼库斯原本是翡翠梦境的一头绿龙,被血神哈卡抓获并腐蚀她的心智,她现在为哈卡效命.",
    --icon = true,
    creature = 5709,
    display = 7806,
    coords = {0.664, 0.873, 1},
    loot = {10829,10833,10837,10828,10835,10836,10847,},
    sections = {
      Spell(12890, {so = true, desc = "使目标沉睡，无法行动，但也无法被攻击。持续8秒.", flag1 = IMPORTANT}), -- Deep Slumber
      Spell(12891, {so = true, flag1 = TANK}), -- Acid Breath
      Spell(11876, {so = true, desc = "对附近的敌人造成伤害，并使其昏迷，持续4秒."}), -- War Stomp
      Spell(3391, {so = true, flag1 = HEALER}), -- Thrash
    },
  },
})

table.insert(db, SUNKEN_TEMPLE)
