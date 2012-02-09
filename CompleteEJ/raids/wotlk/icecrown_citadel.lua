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

local ICECROWN_CITADEL = CreateInstance({
  name = "冰冠堡垒",
  desc = "冰冠堡垒是巫妖王之怒中最主题的团队副本,最终BOSS是巫妖王-米奈希尔.阿尔萨斯.与黑暗神殿,海加尔圣战相同,玩家同样可以获得一个声望的提升:灰烬裁决军.",
  --texture = "IcecrownCitadel",
  area = 604,
}, {
  {
    name = "玛洛加尔领主",
    desc = "玛洛加尔领主是一个独特的只有骨骼的怪物",
    --icon = true,
    creature = 36612,
    display = 31119,
    coords = {0.389, 0.598, 1},
    loot = {{50610,H25},49908,{51930,H10},{50612,H25},{50615,H25},{51931,H10},{50617,H25},{51937,H10},{50607,H25},{50774,N10},{51935,H10},{50605,H25},{50606,H25},{50759,N10},{50611,H25},{50763,N10},{51938,H10},{51929,H10},{51934,H10},{50773,N10},{51928,H10},{49977,N25},{50762,N10},{49951,N25},{49975,N25},{49960,N25},{49949,N25},{50775,N10},{50274,N25},{50274,H25},{49976,N25},{50772,N10},{49950,N25},{50760,N10},{49967,N25},{49979,N25},{49980,N25},{50764,N10},{49952,N25},{51936,H10},{49964,N25},{50771,N10},{50608,H25},{50709,H25},{51933,H10},{50415,N25},{50346,H10},{50339,N10},{50614,H25},{50609,H25},{49978,N25},{50761,N10},{50616,H25},{49968,N25},{50604,H25},{51932,H10},{50613,H25},},
    sections = {
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(70814, {fbd = N25}), -- Bone Slice
      Spell(70814, {fbd = H25}), -- Bone Slice
      Spell(69055), -- Bone Slice
      Spell(70826, {fbd = N25}), -- Bone Spike Graveyard
      Spell(72088, {fbd = H10}), -- Bone Spike Graveyard
      Spell(73144, {fbd = H10}), -- Bone Spike Graveyard
      Spell(69057, {fbd = N10}), -- Bone Spike Graveyard
      Spell(72089, {fbd = H25}), -- Bone Spike Graveyard
      Spell(73145, {fbd = H25}), -- Bone Spike Graveyard
      Spell(70836, {fbd = H25}), -- Bone Storm
      Spell(70834, {fbd = N25}), -- Bone Storm
      Spell(69075, {fbd = N10}), -- Bone Storm
      Spell(70835, {fbd = H10}), -- Bone Storm
      Spell(69076), -- Bone Storm
      Spell(71203), -- Soul Feast
    },
  },
  {
    name = "亡语者女士",
    desc = "亡语者女士是一名女性巫妖,同时也是诅咒神教的领导人之一",
    --icon = true,
    creature = 36855,
    display = 30893,
    coords = {0.391, 0.867, 1},
    loot = {{51923,H10},{51919,H10},{49988,N25},{49987,N25},{51918,H10},{49989,N25},{49982,N25},{49990,N25},49908,{50638,H25},{49983,N25},{51920,H10},{51917,H10},{51924,H10},{49995,N25},{49991,N25},{51921,H10},{49986,N25},{49996,N25},{49985,N25},{50648,H25},{49993,N25},{51925,H10},{50639,H25},{50786,N10},{50640,H25},{50777,N10},{50642,H25},{50652,H25},{50785,N10},{49992,N25},{50649,H25},{50650,H25},{50274,N25},{50274,H25},{50644,H25},{51922,H10},{50783,N10},{51926,H10},{50779,N10},{50784,N10},{50343,H10},{50342,N10},{50646,H25},{50641,H25},{50778,N10},{49994,N25},{50780,N10},{50647,H25},{50782,N10},{50781,N10},{50651,H25},{50034,N25},{51927,H10},{50776,N10},{50643,H25},{50645,H25},},
    sections = {
      Spell(26662), -- Berserk
      Spell(77616, {fbd = H25}), -- Dark Simulacrum
      Spell(72108, {fbd = N25}), -- Death and Decay
      Spell(71001, {fbd = N10}), -- Death and Decay
      Spell(72110, {fbd = H25}), -- Death and Decay
      Spell(72109, {fbd = H10}), -- Death and Decay
      Spell(71289), -- Dominate Mind
      Spell(72007, {fbd = N25, flag1 = MAGIC}), -- Frostbolt
      Spell(72502, {fbd = H25, flag1 = MAGIC}), -- Frostbolt
      Spell(72501, {fbd = H10, flag1 = MAGIC}), -- Frostbolt
      Spell(71420, {fbd = N10, flag1 = MAGIC}), -- Frostbolt
      Spell(72908, {fbd = H25, flag1 = MAGIC}), -- Frostbolt Volley
      Spell(72905, {fbd = N10, flag1 = MAGIC}), -- Frostbolt Volley
      Spell(72906, {fbd = N25, flag1 = MAGIC}), -- Frostbolt Volley
      Spell(72907, {fbd = H10, flag1 = MAGIC}), -- Frostbolt Volley
      Spell(70842), -- Mana Barrier
      Spell(72008, {fbd = N25, flag1 = MAGIC}), -- Shadow Bolt
      Spell(72503, {fbd = H10, flag1 = MAGIC}), -- Shadow Bolt
      Spell(72504, {fbd = H25, flag1 = MAGIC}), -- Shadow Bolt
      Spell(71254, {fbd = N10, flag1 = MAGIC}), -- Shadow Bolt
      Spell(31589, {fbd = H25, flag1 = MAGIC}), -- Slow
      Spell(71203), -- Soul Feast
      Spell(71204), -- Touch of Insignificance
      Spell(31117, {fbd = H25, flag1 = MAGIC}), -- Unstable Affliction
      Spell(24131, {fbd = H25, flag1 = POISON}), -- Wyvern Sting
    },
  },
  {
    name = "死亡使者萨鲁法尔",
    desc = "死亡使者萨鲁法尔,是兽人萨鲁法尔大王的儿子.在击败他之后,玩家便可以进入冰冠堡垒之后的区域(天灾大厅,鲜血大厅,霜翼大厅)",
    --icon = true,
    creature = 37813,
    display = 30790,
    coords = {0.514, 0.217, 3},
    loot = {{51904,H10},52025,{51897,H10},{52028,H25},{51895,H10},{51902,H10},{52029,H25},{50802,N10},{50808,N10},{51896,H10},{50806,N10},{50362,N25},{50412,N25},{51901,H10},{50801,N10},{50015,N25},{50014,N25},{50807,N10},{50333,N25},{52030,H25},{51900,H10},{50668,H25},{50670,H25},{51903,H10},{50671,H25},{50798,N10},{51899,H10},52026,{50805,N10},49908,52027,{51894,H10},{51905,H10},{50363,H25},{51898,H10},{50809,N10},{50799,N10},{50274,N25},{50274,H25},{50803,N10},{50804,N10},{50672,H25},{50800,N10},},
    sections = {
      Spell(26662), -- Berserk
      Spell(73058, {fbd = N25}), -- Blood Nova
      Spell(73058, {fbd = H25}), -- Blood Nova
      Spell(72378), -- Blood Nova
      Spell(72371, {fbd = H10}), -- Blood Power
      Spell(72371, {fbd = H25}), -- Blood Power
      Spell(72442, {fbd = H10}), -- Boiling Blood
      Spell(72385, {fbd = N10}), -- Boiling Blood
      Spell(72441, {fbd = N25}), -- Boiling Blood
      Spell(72443, {fbd = H25}), -- Boiling Blood
      Spell(72358, {fbd = N25}), -- Call Blood Beast
      Spell(72358, {fbd = H25}), -- Call Blood Beast
      Spell(72357, {fbd = N25}), -- Call Blood Beast
      Spell(72357, {fbd = H25}), -- Call Blood Beast
      Spell(72172), -- Call Blood Beast
      Spell(72356, {fbd = N25}), -- Call Blood Beast
      Spell(72356, {fbd = H25}), -- Call Blood Beast
      Spell(72173), -- Call Blood Beast
      Spell(72737), -- Frenzy
      Spell(72293), -- Mark of the Fallen Champion
      Spell(72410), -- Rune of Blood
      Spell(101406), -- Saurfang's Revenge
      Spell(72769, {fbd = H10}), -- Scent of Blood
      Spell(72769, {fbd = H25}), -- Scent of Blood
    },
  },
  {
    name = "烂肠",
    desc = "位于天灾大厅的烂肠是解锁普崔希德教授战斗的首领之一",
    --icon = true,
    creature = 36626,
    display = 31006,
    coords = {0.198, 0.654, 5},
    loot = {{50042,N25},{51884,H10},{50859,N10},{50060,N25},{51886,H10},{50413,N25},{51883,H10},{50038,N25},{50056,N25},{50696,H25},{51885,H10},{50688,H25},{50701,H25},{50061,N25},{50041,N25},{50059,N25},{50692,H25},{50414,N25},{50035,N25},{50064,N25},{50037,N25},{50967,N10},{50036,N25},{50690,H25},{50063,N25},{50699,H25},{50702,H25},{50695,H25},{50697,H25},{51892,H10},{51888,H10},{50700,H25},{50689,H25},{50693,H25},{50694,H25},{50703,H25},{51882,H10},{51887,H10},{51891,H10},{51893,H10},{50274,N25},{50274,H25},{50988,N10},49908,{51890,H10},{50985,N10},{50698,H25},{50691,H25},{50966,N10},{50990,N10},{50062,N25},{50810,N10},{50852,N10},{50226,N25},{50226,H25},{50040,N25},{50858,N10},{50986,N10},{50812,N10},{50811,N10},{51889,H10},},
    sections = {
      Spell(47008, {fbd = N25}), -- Berserk
      Spell(47008, {fbd = H25}), -- Berserk
      Spell(71221, {fbd = N25}), -- Gas Spore
      Spell(71221, {fbd = H25}), -- Gas Spore
      Spell(69278), -- Gas Spore
      Spell(72552, {fbd = H10}), -- Gastric Bloat
      Spell(72219, {fbd = N10}), -- Gastric Bloat
      Spell(72551, {fbd = N25}), -- Gastric Bloat
      Spell(72553, {fbd = H25}), -- Gastric Bloat
      Spell(69165), -- Inhale Blight
      Spell(69166), -- Inhaled Blight
      Spell(71912, {fbd = N25}), -- Inhaled Blight
      Spell(71912, {fbd = H25}), -- Inhaled Blight
      Spell(69195, {fbd = N10}), -- Pungent Blight
      Spell(71219, {fbd = N25}), -- Pungent Blight
      Spell(73031, {fbd = H10}), -- Pungent Blight
      Spell(73032, {fbd = H25}), -- Pungent Blight
      Spell(71203), -- Soul Feast
      Spell(73020, {fbd = H25}), -- Vile Gas
      Spell(69240, {fbd = N10}), -- Vile Gas
      Spell(73019, {fbd = H10}), -- Vile Gas
      Spell(71218, {fbd = N25}), -- Vile Gas
    },
  },
  {
    name = "腐面",
    desc = "位于天灾大厅的腐面是解锁普崔希德教授战斗的首领之一",
    --icon = true,
    creature = 36627,
    display = 31005,
    coords = {0.198, 0.419, 5},
    loot = {{51880,H10},{50674,H25},{50022,N25},{50020,N25},{50677,H25},{50016,N25},{51871,H10},{51873,H10},{50027,N25},{51870,H10},{50026,N25},{50030,N25},{51879,H10},{50024,N25},{51876,H10},{50032,N25},{51874,H10},{50021,N25},{50019,N25},{50685,H25},{50682,H25},{50033,N25},{50348,H25},{50023,N25},{50684,H25},{50678,H25},{50353,N25},{50673,H25},{51877,H10},{50675,H25},{50676,H25},{50680,H25},{51881,H10},{51875,H10},{50686,H25},{50274,N25},{50274,H25},{50998,N10},{50679,H25},{51003,N10},{51000,N10},{50999,N10},49908,{51004,N10},{50681,H25},{51007,N10},{51001,N10},{50687,H25},{51872,H10},{50231,N25},{50231,H25},{50025,N25},{51009,N10},{51008,N10},{51878,H10},{50028,N25},{51006,N10},{51002,N10},{51005,N10},},
    sections = {
      Spell(73023, {fbd = H25, flag1 = DISEASE}), -- Mutated Infection
      Spell(69674, {fbd = N10, flag1 = DISEASE}), -- Mutated Infection
      Spell(71224, {fbd = N25, flag1 = DISEASE}), -- Mutated Infection
      Spell(73022, {fbd = H10, flag1 = DISEASE}), -- Mutated Infection
      Spell(69508), -- Slime Spray
      Spell(71203), -- Soul Feast
    },
  },
  {
    name = "普崔希德教授",
    desc = "普崔希德教授是天灾军团中研究瘟疫,软泥,缝补构造体,死灵契约的天才.玩家需要击败烂肠和腐面才能打开他所在的天灾实验室的大门",
    --icon = true,
    creature = 36678,
    display = 30881,
    coords = {0.133, 0.535, 5},
    loot = {{51859,H10},{51017,N10},{51862,H10},{51869,H10},{51012,N10},{51868,H10},{51020,N10},{51864,H10},{50344,H10},{50341,N10},{51016,N10},{51867,H10},{51013,N10},{51866,H10},{51015,N10},{51860,H10},{50705,H25},{50068,N25},{51861,H10},{51018,N10},{50067,N25},{50069,N25},{51010,N10},{51011,N10},{51865,H10},{51014,N10},{51019,N10},52027,{52030,H25},{50708,H25},{50274,N25},{50274,H25},52026,49908,{52029,H25},{50704,H25},{50707,H25},{50706,H25},{50179,N25},{51863,H10},52025,{50351,N25},{52028,H25},},
    sections = {
      Spell(47008), -- Berserk
      Spell(71255), -- Choking Gas Bomb
      Spell(72851, {fbd = H10}), -- Create Concoction
      Spell(72852, {fbd = H25}), -- Create Concoction
      Spell(72850, {fbd = N25}), -- Create Concoction
      Spell(71621, {fbd = N10}), -- Create Concoction
      Spell(73121, {fbd = H10}), -- Guzzle Potions
      Spell(71893, {fbd = N10}), -- Guzzle Potions
      Spell(73120, {fbd = N25}), -- Guzzle Potions
      Spell(73122, {fbd = H25}), -- Guzzle Potions
      Spell(72615, {fbd = N25}), -- Malleable Goo
      Spell(74281, {fbd = H25}), -- Malleable Goo
      Spell(70853, {fbd = N10}), -- Malleable Goo
      Spell(72549, {fbd = H10}), -- Malleable Goo
      Spell(72874, {fbd = H25}), -- Malleable Goo
      Spell(72873, {fbd = H10}), -- Malleable Goo
      Spell(72550, {fbd = H25}), -- Malleable Goo
      Spell(74280, {fbd = H10}), -- Malleable Goo
      Spell(72458, {fbd = N25}), -- Malleable Goo
      Spell(72295, {fbd = N10}), -- Malleable Goo
      Spell(72463, {fbd = N25}), -- Mutated Plague
      Spell(72672, {fbd = H25}), -- Mutated Plague
      Spell(72671, {fbd = H10}), -- Mutated Plague
      Spell(72451, {fbd = N10}), -- Mutated Plague
      Spell(72461, {fbd = N25}), -- Mutated Strength
      Spell(72461, {fbd = H25}), -- Mutated Strength
      Spell(71603), -- Mutated Strength
      Spell(70341), -- Slime Puddle
      Spell(71203), -- Soul Feast
      Spell(71617, {fbd = N10}), -- Tear Gas
      Spell(71617, {fbd = N25}), -- Tear Gas
      Spell(71615, {fbd = N10}), -- Tear Gas
      Spell(71615, {fbd = N25}), -- Tear Gas
      Spell(72856, {fbd = H25}), -- Unbound Plague
      Spell(72855, {fbd = H10}), -- Unbound Plague
      Spell(71968, {fbd = H25}), -- Unstable Experiment
      Spell(71967, {fbd = H10}), -- Unstable Experiment
      Spell(71966, {fbd = N25}), -- Unstable Experiment
      Spell(70351, {fbd = N10}), -- Unstable Experiment
      Spell(72272, {fbd = H10}), -- Vile Gas
      Spell(72273, {fbd = H25}), -- Vile Gas
      Spell(72843, {fbd = H25}), -- Volatile Experiment
      Spell(72842, {fbd = H10}), -- Volatile Experiment
    },
  },
  {
    name = "鲜血女王兰娜瑟尔",
    desc = "鲜血女王兰纳瑟尔曾经是一名高等精灵,在讨伐巫妖王的战争中不幸丧生,被巫妖王复活为萨莱茵一族.鲜血女王兰娜瑟尔目前作为萨莱茵一族的领袖,镇守冰冠堡垒鲜血大厅",
    --icon = true,
    creature = 37955,
    display = 31165,
    --coords = {x, y, level},
    loot = {{51556,N10},{51548,N10},{51551,N10},{50727,H25},{51552,N10},{51555,N10},{50181,N25},{50724,H25},{51846,H10},{51841,H10},{52029,H25},{50180,N25},{51842,H10},{52030,H25},{51839,H10},{50354,N25},{50065,N25},{52028,H25},{50182,N25},{51844,H10},{50178,N25},{51835,H10},{51840,H10},{50725,H25},{51845,H10},{51843,H10},{51553,N10},{50728,H25},{51838,H10},{51554,N10},{50274,N25},{50274,H25},{50729,H25},49908,{51836,H10},52027,52026,{51837,H10},52025,{51386,N10},{51384,N10},{51385,N10},{51387,N10},{50726,H25},{51550,N10},},
    sections = {
      Spell(26662), -- Berserk
      Spell(71772), -- Bloodbolt Whirl
      Spell(72266, {fbd = H10}), -- Delirious Slash
      Spell(71623, {fbd = N10}), -- Delirious Slash
      Spell(71625, {fbd = H10}), -- Delirious Slash
      Spell(72264, {fbd = N10}), -- Delirious Slash
      Spell(71626, {fbd = H25}), -- Delirious Slash
      Spell(72265, {fbd = N25}), -- Delirious Slash
      Spell(72267, {fbd = H25}), -- Delirious Slash
      Spell(71624, {fbd = N25}), -- Delirious Slash
      Spell(71532, {fbd = H10}), -- Essence of the Blood Queen
      Spell(71533, {fbd = H25}), -- Essence of the Blood Queen
      Spell(71473, {fbd = N25}), -- Essence of the Blood Queen
      Spell(70867, {fbd = N10}), -- Essence of the Blood Queen
      Spell(73070, {flag1 = MAGIC}), -- Incite Terror
      Spell(71336), -- Pact of the Darkfallen
      Spell(71340), -- Pact of the Darkfallen
      Spell(72981, {fbd = N25}), -- Shroud of Sorrow
      Spell(72983, {fbd = H25}), -- Shroud of Sorrow
      Spell(70986, {fbd = N10}), -- Shroud of Sorrow
      Spell(72982, {fbd = H10}), -- Shroud of Sorrow
      Spell(71203), -- Soul Feast
      Spell(71861), -- Swarming Shadows
      Spell(70923), -- Uncontrollable Frenzy
    },
  },
  {
    name = "踏梦者瓦莉瑟瑞娅",
    desc = "踏梦者瓦莉瑟瑞娅是霜翼大厅的第一个BOSS,是一头被天灾捕获的绿龙,巫妖王想利用她进行翡翠梦魇的实验",
    --icon = true,
    creature = 36789,
    display = 30318,
    coords = {0.766, 0.737, 5},
    loot = {{50192,N25},{51562,N10},{50195,N25},{50418,N25},{50187,N25},{50202,N25},{50183,N25},{50186,N25},{51824,H10},{50185,N25},{51831,H10},{50199,N25},{50417,N25},{51827,H10},{50416,N25},{51823,H10},{51830,H10},{50190,N25},{50188,N25},{50472,N25},{51825,H10},{50620,H25},{51585,N10},{50621,H25},{51566,N10},{51583,N10},{50627,H25},{50623,H25},{51563,N10},{50632,H25},{51833,H10},{51826,H10},49908,{50626,H25},{51586,N10},{50622,H25},{51777,N10},{51564,N10},{50631,H25},{51828,H10},{50630,H25},{51561,N10},{51582,N10},{50629,H25},{51834,H10},{50628,H25},{50625,H25},{51584,N10},{51829,H10},{50618,H25},{50619,H25},{50274,N25},{50274,H25},{51565,N10},{51832,H10},{50205,N25},{50624,H25},},
    sections = {
      Spell(70904), -- Corruption
      Spell(71196), -- Dream Slip
      Spell(71189), -- Dreamwalker's Rage
      Spell(57723), -- Exhaustion
      Spell(57724), -- Sated
      Spell(80354), -- Temporal Displacement
      Spell(72232), -- Weakened Spirit
    },
  },
  {
    name = "辛达苟萨",
    desc = "辛达苟萨,生前是蓝龙女王,在讨伐耐萨里奥的战争中负伤,后由于没有得到玛利苟斯的救援丧生,临死前被对所有一切的仇恨所覆蔽,导致被巫妖王复活后,她的心中也只有复仇的存在",
    --icon = true,
    creature = 36853,
    display = 30362,
    coords = {0.366, 0.234, 4},
    loot = {{51783,N10},{51811,H10},{50361,N25},{51817,H10},{51819,H10},{50635,H25},{51789,N10},{50633,H25},{50424,N25},{51786,N10},{51812,H10},{51820,H10},{51792,N10},{50423,N25},{51779,N10},{51788,N10},{50364,H25},{51816,H10},{50636,H25},{51821,H10},{51814,H10},{51790,N10},{51782,N10},{51791,N10},{51784,N10},{51785,N10},{50274,N25},{50274,H25},{52028,H25},49908,{51818,H10},52027,52026,{50365,H25},{51813,H10},{51822,H10},{50421,N25},{50360,N25},{52030,H25},52025,{52029,H25},{51787,N10},{51815,H10},},
    sections = {
      Spell(26662, {fbd = N10}), -- Berserk
      Spell(26662, {fbd = N25}), -- Berserk
      Spell(71048, {fbd = H10}), -- Blistering Cold
      Spell(70123, {fbd = N10}), -- Blistering Cold
      Spell(71049, {fbd = H25}), -- Blistering Cold
      Spell(71047, {fbd = N25}), -- Blistering Cold
      Spell(19983), -- Cleave
      Spell(71050, {fbd = N25}), -- Frost Aura
      Spell(70084, {fbd = N10}), -- Frost Aura
      Spell(71051, {fbd = H10}), -- Frost Aura
      Spell(71052, {fbd = H25}), -- Frost Aura
      Spell(70126), -- Frost Beacon
      Spell(71056, {fbd = N25}), -- Frost Breath
      Spell(71058, {fbd = H25}), -- Frost Breath
      Spell(73061, {fbd = N10}), -- Frost Breath
      Spell(73063, {fbd = H10}), -- Frost Breath
      Spell(69649, {fbd = N10}), -- Frost Breath
      Spell(73064, {fbd = H25}), -- Frost Breath
      Spell(73062, {fbd = N25}), -- Frost Breath
      Spell(71057, {fbd = H10}), -- Frost Breath
      Spell(70157), -- Ice Tomb
      Spell(69712), -- Ice Tomb
      Spell(70117), -- Icy Grip
      Spell(72530, {fbd = H25}), -- Mystic Buffet
      Spell(72528, {fbd = N25}), -- Mystic Buffet
      Spell(72529, {fbd = H10}), -- Mystic Buffet
      Spell(70127, {fbd = N10}), -- Mystic Buffet
      Spell(70109), -- Permeating Chill
      Spell(71203), -- Soul Feast
      Spell(71077), -- Tail Smash
      Spell(69762), -- Unchained Magic
    },
  },
  {
    name = "巫妖王",
    desc = "巫妖王:阿尔萨斯.米奈希尔,霜之哀伤的主人.曾经是洛丹伦的王子,后因耐奥祖的巫蛊,最终成为了新的巫妖王.冰冠堡垒的最终BOSS",
    --icon = true,
    creature = 36597,
    display = 30721,
    coords = {0.498, 0.528, 7},
    loot = {{52028,H25},{51942,H10},{51947,H10},{51941,H10},{51945,H10},{51939,H10},{50425,N25},{51940,H10},{51943,H10},52025,{50428,N25},{51946,H10},{51944,H10},{49997,N25},{50426,N25},{50427,N25},{49981,N25},{50730,H25},49908,{51803,N10},{50737,H25},{51802,N10},{50734,H25},{50731,H25},{50735,H25},{50274,N25},{50274,H25},{51799,N10},52026,{52030,H25},{51796,N10},{52029,H25},52027,{50733,H25},{50736,H25},{50818,H25},{51795,N10},{51800,N10},{50429,N25},{51801,N10},{50070,N25},{50012,N25},{50738,H25},{51798,N10},{50732,H25},{51797,N10},},
    sections = {
      Spell(47008), -- Berserk
      Spell(72762), -- Defile
      Spell(72350), -- Fury of Frostmourne
      Spell(68980, {fbd = N10}), -- Harvest Soul
      Spell(74325, {fbd = N25}), -- Harvest Soul
      Spell(74297, {fbd = H25}), -- Harvest Souls
      Spell(74296, {fbd = H10}), -- Harvest Souls
      Spell(71614), -- Ice Lock
      Spell(73780, {fbd = H10}), -- Infest
      Spell(73781, {fbd = H25}), -- Infest
      Spell(70541, {fbd = N10}), -- Infest
      Spell(73779, {fbd = N25}), -- Infest
      Spell(70337, {fbd = N10, flag1 = DISEASE}), -- Necrotic Plague
      Spell(73913, {fbd = H10, flag1 = DISEASE}), -- Necrotic Plague
      Spell(73914, {fbd = H25, flag1 = DISEASE}), -- Necrotic Plague
      Spell(73912, {fbd = N25, flag1 = DISEASE}), -- Necrotic Plague
      Spell(73788, {fbd = N25}), -- Pain and Suffering
      Spell(73790, {fbd = H25}), -- Pain and Suffering
      Spell(73789, {fbd = H10}), -- Pain and Suffering
      Spell(72133, {fbd = N10}), -- Pain and Suffering
      Spell(72262), -- Quake
      Spell(69200), -- Raging Spirit
      Spell(71769), -- Raise Dead
      Spell(72259, {fbd = N10}), -- Remorseless Winter
      Spell(74272, {fbd = H25}), -- Remorseless Winter
      Spell(74270, {fbd = N25}), -- Remorseless Winter
      Spell(74275, {fbd = H25}), -- Remorseless Winter
      Spell(74274, {fbd = H10}), -- Remorseless Winter
      Spell(74273, {fbd = N25}), -- Remorseless Winter
      Spell(68981, {fbd = N10}), -- Remorseless Winter
      Spell(74271, {fbd = H10}), -- Remorseless Winter
      Spell(73799, {fbd = H25}), -- Soul Reaper
      Spell(73797, {fbd = N25}), -- Soul Reaper
      Spell(69409, {fbd = N10}), -- Soul Reaper
      Spell(73798, {fbd = H10}), -- Soul Reaper
      Spell(70358), -- Summon Drudge Ghouls
      Spell(73539, {fbd = H10}), -- Summon Shadow Trap
      Spell(73539, {fbd = H25}), -- Summon Shadow Trap
      Spell(70372), -- Summon Shambling Horror
      Spell(69037), -- Summon Val'kyr
      Spell(70498), -- Vile Spirits
    },
  },
  -- {
    -- name = "Alchemist Finklestein",
    --desc = "",
    --icon = true,
    -- creature = 37687,
    -- display = 25934,
    --coords = {x, y, level},
    -- loot = {},
    -- sections = {
    -- },
  -- },
})

table.insert(db, ICECROWN_CITADEL)
