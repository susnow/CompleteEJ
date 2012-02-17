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

local TRIAL_OF_THE_CHAMPION = CreateInstance({
  name = "冠军的试炼",
  desc = "冠军的试炼是位于冰冠冰川的银白联赛场地中的一个副本,为了选拔出与天谴军团作战的勇士,玩家要代表自己的阵营迎接来自银色北伐军及对立阵营的挑战.",
  --texture = "TrialoftheChampion",
  area = 542,
}, {
	{
		name = "阵营勇士",
		desc = "玩家需要挑战对立阵营的三名勇士,击败他们从银白联赛场地中央的宝箱中获取对玩家精湛技艺的嘉奖",
		creature = 35005,
		display = 29893,
		coords = {0.52,0.76,1},
		loot = {{47175,N5},{47171,N5},{47170,N5},{47173,N5},{47174,N5},{47172,N5},{47249,H5},{47243,H5},{47493,H5},{47250,H5},{47244,H5},{47248,H5}},
		sections = {
			Stage({
				so = true,
				name = "联盟勇士",
				desc = "部落玩家遇到的首领",
				sections = {
					Stage({
						stype = CREATURE,
						creature = 34705,
						display = 28560,
						name = "雅克布·奥勒留斯元帅", --warrior
						sections = {
							Spell(67716),
							Spell(67540),
							Spell(67542),
							Spell(67541),
							Spell(67546),
						},
					}), --暴风城
					Stage({
						stype = CREATURE,
						creature = 34703,
						display = 28564,
						name = "拉娜·硬锤", --rogue
						sections = {
							Spell(67710),
							Spell(68317),
							Spell(67594),
							Spell(67706),
						},
					}), --铁炉堡
					Stage({
						stype = CREATURE,
						creature = 34657,
						display = 28735,
						name  = "娅琳·永歌", --hunter
						sections = {
							Spell(66081),
							Spell(65868),
							Spell(66083),
							Spell(68340),
						},
					}), --达纳苏斯
					Stage({
						stype = CREATURE,
						creature = 34701,
						display = 28736,
						name = "克罗索斯", --shaman
						sections = {
							Spell(68318),
							Spell(67529),
							Spell(67534),
							Spell(67530),
						},
					}), --埃索达
					Stage({
						stype = CREATURE,
						creature = 34702,
						display = 28586,
						name = "安布罗斯·雷钉", --mage
						sections = {
							Spell(68311),
							Spell(68310),
							Spell(68312),
							Spell(66045),
						},
					}), --诺莫瑞根
				},
			}),
			Stage({
				so = true,
				name = "部落勇士",
				desc = "联盟玩家遇到的首领",
				sections = {
					Stage({
						stype = CREATURE,
						creature = 35569,
						display = 28637,
						name = "埃蕾希·晨歌",
						sections = {
							Spell(68311),
							Spell(68310),
							Spell(68312),
							Spell(66045),
						},
					}), --银月城
					Stage({
						stype = CREATURE,
						creature = 35617,
						display = 28589,
						name = "死亡猎手维赛里",
						sections = {
							Spell(67710),
							Spell(68317),
							Spell(67594),
							Spell(67706),
						},
					}), --幽暗城
					Stage({
						stype = CREATURE,
						creature = 35572,
						display = 28587,
						name = "碎颅者莫克拉",
						sections = {
							Spell(67716),
							Spell(67540),
							Spell(67542),
							Spell(67541),
							Spell(67546),
						},
					}), --奥格瑞玛
					Stage({
						stype = CREATURE,
						creature = 35570,
						display = 28588,
						name = "祖尔托",
						sections = {
							Spell(66081),
							Spell(65868),
							Spell(66083),
							Spell(68340),
						},
					}), --森金
					Stage({
						stype = CREATURE,
						creature =35571 ,
						display = 28597,
						name = "鲁诺克·蛮鬃",
						sections = {
							Spell(68318),
							Spell(67529),
							Spell(67534),
							Spell(67530),
						},
					}), --雷霆崖
				},
			}),
		},
	},
	{
		name = "总冠军",
		desc = "在击败了阵营勇士之后,在银白联赛中第二轮的对手,玩家将随机面对银白神官帕尔崔丝或者纯洁者耶德瑞克中的一员",
		creature = 34928,
		display = 29490,
		coords = {0.68,0.54,1 },
		loot = {{47212,N5},{47176,N5},{47211,N5},{47178,N5},{47177,N5},{47217,N5},{47181,N5},{47185,N5},{47218,N5},{47219,N5},{47214,N5},{47213,N5},{47500,H5},{47522,H5},{47510,H5},{47511,H5},{47497,H5},{47495,H5},{47514,H5},{47245,H5},{47498,H5},{47496,H5},{47512,H5},{47494,H5}},
		sections = {
			Stage({
				stype = CREATURE,
				creature = 34928,
				display = 29490,
				name = "银白神官帕尔崔丝",
				sections = {
					Stage({
						stype = CREATURE,
						name = "第一阶段:告诫",
						desc = "银白神官帕尔崔丝开始向玩家攻击,直到她的血量降到50%以下",
						sections = {
							Spell(66538),
							Spell(66536),
							Spell(67675),
							Spell(66546),
						},
					}),
					Stage({
						stype = CREATURE,
						name = "第二阶段:忏悔",
						desc = "银白神官帕尔崔丝召唤玩家最黑暗的回忆忏悔,随机召唤出一种昔日的幻象与玩家作战,在此期间,帕尔崔丝将会获得降低伤害100%的护盾,并反弹25%的伤害",
						sections = {
							Stage({
								stype = CREATURE,
								name = "帕尔崔丝",
								sections = {
									Spell(66547),
									Spell(66515),
								},
							}),
							Stage({
								stype = CREATURE,
								name = "往昔的记忆",
								desc = "玩家记忆深处那些可怕的怪物",
								sections = {
									Spell(67677),
									Spell(67679),
									Spell(66619),
								},
							}),
							Stage({
								stype = CREATURE,
								name = "格鲁尔的回忆",
								creature = 35039,
								display = 18698,
							}),
							Stage({
								stype = CREATURE,
								name = "哈卡的回忆",
								creature = 35034,
								display = 15295,
							}),
							Stage({
								stype = CREATURE,
								name = "因格瓦尔的回忆",
								creature = 35045,
								display = 29558,
							}),
							Stage({
								stype = CREATURE,
								name = "玛克扎尔的回忆",
								creature = 35038,
								display = 29543,
							}),
							Stage({
								stype = CREATURE,
								name = "鲁西弗隆的回忆",
								creature = 35031,
								display = 29562,
							}),
							Stage({
								stype = CREATURE,
								name = "范克里夫的回忆",
								creature = 35028,
								display = 29536,
							}),
							Stage({
								stype = CREATURE,
								name = "卡利瑟里斯的回忆",
								creature = 35037,
								display = 29542,
							}),
							Stage({
								stype = CREATURE,
								name = "伊利丹的回忆",
								creature = 35042,
								display = 29547,
							}),		
							Stage({
								stype = CREATURE,
								name = "瓦斯琪的回忆",
								creature = 35040,
								display = 29545,
							}),						
							Stage({
								stype = CREATURE,
								name = "赫洛德的回忆",
								creature = 35030,
								display = 29537,
							}),						
							Stage({
								stype = CREATURE,
								name = "奥妮克希亚的回忆",
								creature = 35048,
								display = 21401,
							}),						
							Stage({
								stype = CREATURE,
								name = "德莉希亚的回忆",
								creature = 35043,
								display = 18699,
							}),
							Stage({
								stype = CREATURE,
								name = "熵魔的回忆",
								creature = 35044,
								display = 23428,
							}),
							Stage({
								stype = CREATURE,
								name = "穆坦努斯的回忆",
								creature = 35029,
								display = 29556,
							}),
							Stage({
								stype = CREATURE,
								name = "克洛玛古斯的回忆",
								creature = 35033,
								display = 14367,
							}),
							Stage({
								stype = CREATURE,
								name = "阿克蒙德的回忆",
								creature = 35041,
								display = 29546,
							}),
							Stage({
								stype = CREATURE,
								name = "伊克的回忆",
								creature = 35047,
								display = 26644,
							}),

						},
					}),
					Stage({
						stype = CREATURE,
						name = "第三阶段:执事",
						desc = "当玩家击败往昔的回忆之后,帕尔崔丝将解除她的护盾继续与玩家作战"
					}),
				},
			}), 
			Stage({
				stype = CREATURE,
				creature = 35119,
				display = 29616,
				name = "纯洁者耶瑞克斯",
				desc = "",
				sections = {
					Spell(66867),
					Spell(66940),
					Spell(66865),
					Spell(66935),
				},
			}), 
		},
		adds = {
			{
				name = "纯洁者耶瑞克斯",
				creature = 35119,
				display = 29616,
			},
		},
	},
  {
    name = "黑骑士",
    desc = "黑骑士是巫妖王的将领,是巫妖王试探银白十字军实力的一名死亡骑士.",
    --icon = true,
    creature = 35451,
    display = 29837,
    coords = {0.490, 0.522, 1},
    loot = {{47220,N5},{47527,H5},{47560,H5},{47529,H5},{47561,H5},{47563,H5},{47565,H5},{47216,N5},{47562,H5},{47567,H5},{47221,N5},{47566,H5},{47564,H5},{47568,H5},{43102,H5},{47569,H5},{47226,N5},{47231,N5},{47232,N5},{49682,H5},{47228,N5},{47229,N5},{47227,N5},{47215,N5},{47230,N5},{47222,N5},},
    sections = {
      Spell(67761, {fbd = N5}), -- Army of the Dead
      Spell(67874, {fbd = H5}), -- Army of the Dead
      Spell(67885, {fbd = H5, flag1 = DISEASE}), -- Blood Plague
      Spell(67722, {fbd = N5, flag1 = DISEASE}), -- Blood Plague
      Spell(67808, {fbd = N5}), -- Death's Bite
      Spell(67875, {fbd = H5}), -- Death's Bite
      Spell(68306, {fbd = H5}), -- Death's Respite
      Spell(67745, {fbd = N5}), -- Death's Respite
      Spell(66798), -- Death's Respite
      Spell(67877, {fbd = H5}), -- Desecration
      Spell(67778, {fbd = N5}), -- Desecration
      Spell(67719, {fbd = N5, flag1 = DISEASE}), -- Frost Fever
      Spell(67878, {fbd = H5, flag1 = DISEASE}), -- Frost Fever
      Spell(67751), -- Ghoul Explode
      Spell(67881, {fbd = H5}), -- Icy Touch
      Spell(67718, {fbd = N5}), -- Icy Touch
      Spell(67882, {fbd = H5}), -- Marked For Death
      Spell(67823, {fbd = N5}), -- Marked For Death
      Spell(67725, {fbd = N5}), -- Obliterate
      Spell(67883, {fbd = H5}), -- Obliterate
      Spell(67884, {fbd = H5, flag1 = DISEASE}), -- Plague Strike
      Spell(67724, {fbd = N5, flag1 = DISEASE}), -- Plague Strike
    },
  },
})

table.insert(db, TRIAL_OF_THE_CHAMPION)
