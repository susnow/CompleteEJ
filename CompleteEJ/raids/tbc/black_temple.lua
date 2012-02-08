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

local BLACK_TEMPLE = CreateInstance({
  name = "黑暗神殿",
  desc = "黑暗神庙，在暴雪的线上网络游戏“魔兽世界”中，位于影月谷。为70级25人最终挑战副本。里面包含9个首领，而传奇的暗夜精灵、伊利丹、怒风会在最后迎接玩家的挑战.",
  --texture = "BlackTemple",
  area = 796,
}, {
  {
    name = "高阶督军纳因图斯",
    desc = "高阶督军纳因图斯,娜迦的变异体,是黑暗神殿的第一名BOSS.",
    --icon = true,
    creature = 22887,
    display = 21174,
    --coords = {x, y, level},
    loot = {32744,32377,32234,32238,32754,32247,32242,32240,32750,32243,32747,},
    sections = {
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(39837, {fbd = N10}), -- Impaling Spine
      Spell(39878, {fbd = N10}), -- Tidal Burst
      Spell(39872, {fbd = N10}), -- Tidal Shield
    },
  },
  {
    name = "苏普雷姆斯",
    desc = "巨大的地狱火,苏普雷姆斯是玛瑟里顿制造地狱火恶魔,但是真正让它能够'动'起来的是伊利丹,在接受了伊利丹为它注入的恶魔能量之后,苏普雷姆斯为伊利丹守卫着正殿的广场大门.",
    --icon = true,
    creature = 22898,
    display = 21145,
    coords = {0.640, 0.474, 1},
    loot = {32259,32260,32251,32750,32257,32255,32253,32744,32262,32749,},
    sections = {
      Spell(41581, {fbd = N10}), -- Charge
      Spell(20477, {fbd = N10}), -- Summon Player
      Spell(40276, {fbd = N10}), -- Volcanic Eruption
    },
  },
  {
    name = "阿卡玛之影",
    desc = "阿卡玛之影是阿卡玛灵魂的黑暗意识形态.",
    --icon = true,
    creature = 22841,
    display = 21357,
    coords = {0.406, 0.800, 2},
    loot = {32754,32266,32264,32263,32737,32268,32279,32270,32753,32361,32744,},
    sections = {
    },
  },
  {
    name = "塔隆·血魔",
    desc = "在生前,塔隆血魔曾经是暗影议会的一名术士,在被奥格瑞姆毁灭之锤杀死之后,被古尔丹复活成为死亡骑士,并且在之后成为了伊利丹的部下.",
    --icon = true,
    creature = 22871,
    display = 21254,
    coords = {0.392, 0.136, 4},
    loot = {32750,32512,32329,32747,32510,32330,32280,32737,32323,32749,},
    sections = {
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(40243, {fbd = N10}), -- Crushing Shadows
      Spell(44659, {fbd = N10}), -- Destroy All Spirits
      Spell(41626, {fbd = N10}), -- Destroy Spirit
      Spell(40239, {fbd = N10, flag1 = MAGIC}), -- Incinerate
      Spell(40251, {fbd = N10}), -- Shadow of Death
    },
  },
  {
    name = "古尔图格·血沸",
    desc = "曾经是兽人苦工的古尔图格·血沸,一次偶然的机会误服了恶魔的鲜血之后,成为了一名狂暴亢奋和嗜杀的邪兽人百夫长.",
    --icon = true,
    creature = 22948,
    display = 21443,
    coords = {0.534, 0.474, 3},
    loot = {32342,32501,32334,32738,32337,32338,32341,32750,32333,32749,},
    sections = {
      Spell(40481, {fbd = N10}), -- Acidic Wound
      Spell(40599, {fbd = N10}), -- Arcing Smash
      Spell(40457, {fbd = N10}), -- Arcing Smash
      Spell(40491, {fbd = N10}), -- Bewildering Strike
      Spell(42005, {fbd = N10}), -- Bloodboil
      Spell(40602, {fbd = N10}), -- Charge
      Spell(40486, {fbd = N10}), -- Eject
      Spell(40597, {fbd = N10}), -- Eject
      Spell(40594, {fbd = N10}), -- Fel Rage
      Spell(40604, {fbd = N10}), -- Fel Rage
      Spell(40595, {fbd = N10}), -- Fel-Acid Breath
      Spell(40508, {fbd = N10}), -- Fel-Acid Breath
      Spell(40601, {fbd = N10}), -- Fury
      Spell(40618, {fbd = N10}), -- Insignificance
    },
  },
  {
    name = "灵魂之匣",
    desc = "灵魂之匣曾经是德莱尼人供奉在卡拉波神殿中侍奉先祖灵魂的容器,兽人入侵之后,古尔丹将它腐化成了怨魂的吸纳容器,现在,任何胆敢接近灵魂之匣的人,都会和无数飘荡于此的灵魂一样,被灵魂之匣吸收.",
    --icon = true,
    creature = 23418,
    display = 21483,
    coords = {0.702, 0.850, 3},
    loot = {},
    sections = {
      Spell(41292, {fbd = N10}), -- Aura of Suffering
      Spell(42017, {fbd = N10}), -- Aura of Suffering
      Spell(41294, {fbd = N10}), -- Fixate
      Spell(41305, {fbd = N10}), -- Frenzy
      Spell(41303, {fbd = N10, flag1 = MAGIC}), -- Soul Drain
    },
  },
  {
    name = "莎赫拉丝主母",
    desc = "相对于男性恶魔，女性恶魔更为狡诈恶毒，心狠手辣。而莎赫拉丝主母则更是女性恶魔中的佼佼者,她出卖了原本的主人玛瑟里顿,并且投靠了伊利丹.",
    --icon = true,
    creature = 22947,
    display = 21252,
    coords = {0.650, 0.368, 5},
    loot = {32750,32370,31101,31103,32366,32753,32365,32747,},
    sections = {
      Spell(41001, {fbd = N10}), -- Fatal Attraction
      Spell(40823, {fbd = N10}), -- Silencing Shriek
      Spell(40827, {fbd = N10}), -- Sinful Beam
      Spell(40859, {fbd = N10}), -- Sinister Beam
      Spell(40860, {fbd = N10}), -- Vile Beam
      Spell(40861, {fbd = N10}), -- Wicked Beam
    },
  },
  {
    name = "伊利达雷议会",
    desc = "高阶灵术师塞勒沃尔,击碎者加西奥斯,维尔莱斯·深影,女公爵玛兰德,这4名血精灵族的伊利丹的顾问,把守着背叛者平台的最终入口.",
    --icon = true,
    creature = 23426,
    display = Array,
    --coords = {x, y, level},
    loot = {},
    sections = {
      Spell(41499, {fbd = N10}), -- Empyreal Balance
    },
  },
  {
    name = "伊利丹·怒风",
    desc = "恶魔猎手伊利丹·怒风,玛法里奥·怒风的孪生兄弟,伊利丹在故事中是一位正反评价两极的人物，游走在亲情、爱情当中，情势与环境的改变让他的一生有着传奇的变化.",
    --icon = true,
    creature = 22917,
    display = 21135,
    coords = {0.540, 0.576, 7},
    loot = {32235,32754,31089,32837,32521,31091,32524,32375,32374,32753,32500,32749,},
    sections = {
      Spell(40932, {fbd = N10}), -- Agonizing Flames
      Spell(41142, {fbd = N10}), -- Aura of Dread
      Spell(40585, {fbd = N10}), -- Dark Barrage
      Spell(40904, {fbd = N10}), -- Draw Soul
      Spell(40598, {fbd = N10}), -- Fireball
      Spell(41126, {fbd = N10}), -- Flame Burst
      Spell(40832, {fbd = N10}), -- Flame Crash
      Spell(40683, {fbd = N10}), -- Frenzy
      Spell(41917, {fbd = N10}), -- Parasitic Shadowfiend
      Spell(41078, {fbd = N10}), -- Shadow Blast
      Spell(40647, {fbd = N10}), -- Shadow Prison
      Spell(41117, {fbd = N10}), -- Summon Shadow Demons
      Spell(39849, {fbd = N10}), -- Throw Glaive
      Spell(39635, {fbd = N10}), -- Throw Glaive
    },
  },
})

table.insert(db, BLACK_TEMPLE)
