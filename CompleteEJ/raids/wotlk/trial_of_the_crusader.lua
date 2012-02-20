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

local TRIAL_OF_THE_CRUSADER = CreateInstance({
  name = "十字军试炼",
  desc = "十字军试炼位于冰冠冰川东北角落的银白联赛场地处.该副本的入口处设有T9套装和凯旋散件的兑换商",
  --texture = "TrialoftheCrusader",
  area = 543,
}, {
	{
		name = "诺森德兽群",
		desc = "诺森德兽群是一群诺森德奇特而又凶猛的野兽,被抓获后关押在银白联赛场地外,用来考验玩家的格斗技艺.玩家需要在分别击败三种不同的兽群来证明自己的实力,在英雄模式下,每种兽群的限定击杀时间为150秒,当超过限定时间之后,下一种兽群将直接出现在场上并且与上一种兽群一起战斗.",
		creature = 34797,
		display = 21601,
		coords = {0.68,0.54,1},
		loot = {{47413,H25},47645,47653,47648,47635,47638,{47636,H10},{47636,H25},{47425,H25},{46973,H25},{47988,H10},{47419,H25},{47611,N10},{47422,H25},{46980,H25},{47421,H25},{47920,H10},{47420,H25},47654,{47426,H25},{47923,H10},47652,{47415,H25},{47418,H25},47630,47651,47556,47641,{46966,H25},{46964,H25},{47412,H25},{46967,H25},47640,{47996,H10},{47424,H25},{47423,H25},{46968,H25},47644,{47414,H25},{46971,H25},{46991,H25},{47417,H25},{46977,H25},{46993,H25},{47416,H25},{47254,N25},{47924,H10},{47612,N10},{47990,H10},{47578,N10},{47613,N10},{47998,H10},{47253,N25},{47614,N10},{47992,H10},{47855,N10},{47991,H10},{47615,N10},{47610,N10},{47921,H10},{46962,N25},{47856,N10},{47609,N10},{47607,N10},{47915,H10},{47255,N25},{47850,N10},{47258,N25},{47989,H10},{47999,H10},{46961,N25},{47851,N10},{47919,H10},{47993,H10},{47858,N10},{47853,N10},{47859,N10},{47918,H10},{47916,H10},{47926,H10},{47852,N10},{47263,N25},{47917,H10},{47252,N25},{47997,H10},{47262,N25},{47616,N10},{47994,H10},{47261,N25},{47849,N10},{47922,H10},{47256,N25},{47857,N10},{47925,H10},{47854,N10},{47265,N25},{47995,H10},{47608,N10},{47617,N10},{47260,N25},{47860,N10},},
		sections = {
			Stage({
				stype = CREATURE,
				creature = 34796,
				display = 29614,
				name = "穿刺者戈莫克",
				desc = "来自祖达克的猛犸巨人,穿刺者戈莫克",
				sections = {
					Stage({
						stype = CREATURE,
						creature = 34796,
						display = 29614,
						name = "穿刺者戈莫克",
						sections = {
							Spell(67647,{fbd = N10}),
							Spell(67649,{fbd = H10}),
							Spell(66330,{fbd = N25}),
							Spell(67648,{fbd = H25}),
							Spell(66331,{fbd = N10}),
							Spell(67478,{fbd = H10}),
							Spell(67477,{fbd = N25}),
							Spell(67479,{fbd = H25}),
						},
					}),
					Stage({
						stype = CREATURE,
						creature = 34800,
						display = 27172,
						name = "狗头人奴隶",
						sections = {
							Spell(66313),
							Spell(66408),
							Spell(66407),
							Spell(66636),
						},
					}),
				},
			}),
			Stage({ --第二阶段
				stype = CREATURE,
				creature = 34799,
				display = 24564,
				name = "双虫",
				desc = "酸喉和恐鳞是来自风暴峭壁的两条巨大的岩孔虫,分别使用毒系和火系攻击",
				sections = {
					Stage({
						stype = CREATURE,
						name = "共有技能",
						desc = "当酸喉和恐鳞中有一只的生命值降到30%以下时,两只虫将会钻入地下,5秒后重新出现.",
						sections = {
							Spell(68335,{so = true,desc = "激怒,所有伤害提高50%,并且继承上一只死亡的钻孔虫的技能"})
						},
					}),
					Stage({
						stype = CREATURE,
						creature = 34799,
						display = 24564,
						name = "恐鳞",
						desc = "擅长使用火系进攻的恐鳞",
						sections = {
							Spell(67624,{fbd = N10}),
							Spell(67626,{fbd = H10}),
							Spell(66879,{fbd = N25}),
							Spell(67625,{fbd = H25}),
							Spell(66794,{fbd = N10}),
							Spell(67644,{fbd = H10}),
							Spell(67645,{fbd = N25}),
							Spell(67646,{fbd = H25}),
							Spell(67629,{fbd = N10}),
							Spell(66902,{fbd = H10}),
							Spell(67627,{fbd = N25}),
							Spell(67628,{fbd = H25}),
							Spell(66883,{fbd = N10}),
							Spell(67641,{fbd = H10}),
							Spell(67643,{fbd = N25}),
							Spell(67642,{fbd = H25}),
							Spell(66796,{fbd = N10}),
							Spell(67632,{fbd = H10}),
							Spell(67633,{fbd = N25}),
							Spell(67634,{fbd = H25}),
							Spell(66821),
							Spell(66869),
						},
					}),
					Stage({
						stype = CREATURE,
						creature = 35144,
						display = 29815,
						name = "酸喉",
						desc = "擅长使用毒系进攻的酸喉",
						sections = {
							Spell(67645,{fbd = N10}),
							Spell(66794,{fbd = H10}),
							Spell(67644,{fbd = N25}),
							Spell(67646,{fbd = H25}),
							Spell(66883,{fbd = N10}),
							Spell(67643,{fbd = H10}),
							Spell(67642,{fbd = N25}),
							Spell(67641,{fbd = H25}),
							Spell(67606,{fbd = N10}),
							Spell(67608,{fbd = H10}),
							Spell(67607,{fbd = N25}),
							Spell(66880,{fbd = H25}),
							Spell(67618,{fbd = N10}),
							Spell(67620,{fbd = H10}),
							Spell(67619,{fbd = N25}),
							Spell(66823,{fbd = H25}),
							Spell(67614,{fbd = N10}),
							Spell(67613,{fbd = H10}),
							Spell(67612,{fbd = N25}),
							Spell(66824,{fbd = H25}),
							Spell(67616,{fbd = N10}),
							Spell(67615,{fbd = H10}),
							Spell(66901,{fbd = N25}),
							Spell(67617,{fbd = H25}),
						},
					}),
				},
			}),
			Stage({ --第三阶段
				stype = CREATURE,
				creature = 34797,
				display = 21601,
				name = "冰吼",
				desc = "来自风暴群山的冰雪巨人",
				sections = {
					Spell(67651, {fbd = H10}), -- Arctic Breath
		      Spell(66689, {fbd = N10}), -- Arctic Breath
		      Spell(67652, {fbd = H25}), -- Arctic Breath
		      Spell(67650, {fbd = N25}), -- Arctic Breath
		      Spell(26662, {fbd = H10}), -- Berserk
		      Spell(26662, {fbd = H25}), -- Berserk
		      Spell(67654, {fbd = N25}), -- Ferocious Butt
		      Spell(67656, {fbd = H25}), -- Ferocious Butt
		      Spell(67655, {fbd = H10}), -- Ferocious Butt
		      Spell(66770, {fbd = N10}), -- Ferocious Butt
		      Spell(67659, {fbd = H25}), -- Frothing Rage
		      Spell(67657, {fbd = N25}), -- Frothing Rage
		      Spell(66759, {fbd = N10}), -- Frothing Rage
		      Spell(67658, {fbd = H10}), -- Frothing Rage
		      Spell(67661, {fbd = H10}), -- Massive Crash
		      Spell(66683, {fbd = N10}), -- Massive Crash
		      Spell(67662, {fbd = H25}), -- Massive Crash
		      Spell(67660, {fbd = N25}), -- Massive Crash
		      Spell(66758), -- Staggered Daze
		      Spell(66734), -- Trample
		      Spell(67663, {fbd = N25}), -- Whirl
		      Spell(67345, {fbd = N10}), -- Whirl
		      Spell(67664, {fbd = H10}), -- Whirl
		      Spell(67665, {fbd = H25}), -- Whirl
				},
			}),
		},
		adds = {
			{
				name = "穿刺者莫戈克",
				creature = 34796,
				display = 29614,
			},
			{
				name = "恐鳞",
				creature = 34799,
				display = 24564,
			},
			{
				name = "酸喉",
				creature = 35144,
				display = 29815,
			},
			{
				name = "冰吼",
				creature = 34797,
				display = 21601,
			},
		},
	},
	{
		name = "加拉克苏斯大王",
		desc = "来自虚空位面的艾瑞达恶魔领主,使用各种邪能魔焰,以及虚空传送门的各种召唤恶魔来和玩家作战",
		creature = 34780,
		display = 29615,
		coords = {0.52,0.76,1},
		loot = {{47669,N10},{47703,N10},{47866,N10},{47865,N10},{47621,N10},{47870,N10},{47679,N10},{47867,N10},{47620,N10},{47619,N10},{47862,N10},{47871,N10},{47663,N10},{47872,N10},{49236,N10},{49235,N10},{47861,N10},{47676,N10},{47618,N10},{47863,N10},{47711,N10},{47864,N10},{47683,N10},{47680,N10},{47868,N10},{47869,N10},{48000,H10},{47932,H10},{47935,H10},{47931,H10},{48010,H10},{47934,H10},{48002,H10},{47929,H10},{47927,H10},{48005,H10},{48003,H10},{47928,H10},{48009,H10},{48001,H10},{49237,H10},{48011,H10},{47938,H10},{47930,H10},{47937,H10},{48007,H10},{49238,H10},{47933,H10},{48008,H10},{48004,H10},{48006,H10},{47939,H10},47556,47648,47630,47650,47647,47653,47623,47628,47644,47636,47629,47635,47656,47643,47657,47633,47622,47634,47638,47652,47646,47649,47626,47642,47624,47641,47632,47645,47640,47627,47654,47625,47655,47631,47651,47637,47639,{47277,N25},{47266,N25},{47272,N25},{47276,N25},{47053,N25},{47267,N25},{47041,N25},{47274,N25},{47273,N25},{47056,N25},{47279,N25},{47269,N25},{47270,N25},{46994,N25},{47278,N25},{46997,N25},{47052,N25},{47057,N25},{47275,N25},{47271,N25},{46996,N25},{46999,N25},{47051,N25},{47280,N25},{47042,N25},{47268,N25},{47223,N25},{47043,N25},{47055,N25},{47000,N25},{47432,H25},{47438,H25},{47431,H25},{47439,H25},{47430,H25},{47433,H25},{47437,H25},{47436,H25},{47064,H25},{47435,H25},{47428,H25},{47063,H25},{47440,H25},{47004,H25},{47060,H25},{47067,H25},{46995,H25},{47059,H25},{47002,H25},{47427,H25},{47068,H25},{47434,H25},{47429,H25},{47001,H25},{47062,H25},{47441,H25},{47003,H25},{47224,H25},{47066,H25},{47061,H25,},{47453,H25},{47447,H25},},
 sections = {
	  Stage({
			name = "加拉克苏斯大王",
			creature = 34780,
			display = 29615,
			sections = {
				Spell(66269),
				Spell(67030),
				Spell(67903),
				Spell(66228),
				Spell(66197),

				Spell(66532,{fbd = N10}),
				Spell(66964,{fbd = H10}),
				Spell(66963,{fbd = N25}),
				Spell(66965,{fbd = H25}),

				Spell(66237,{fbd = N10}),
				Spell(67050,{fbd = H10}),
				Spell(67049,{fbd = N25}),
				Spell(67051,{fbd = H25}),
			},
		}),
		Stage({ 
			name = "痛苦女王",
			creature = 34826,
			display = 29442,
			sections = {
				Spell(67078),
				Spell(66283),
				Spell(67099),
			},
		}), 
		Stage({ 
			name = "虚空传送门",	
			desc = "在普通模式中,虚空传送门在召唤痛苦女王之后消失,而英雄模式中,需要玩家优先摧毁虚空传送门,否则,传送门将源源不断的召唤恶魔",
			creature = 34825,
			display = 27735,
		}), 
		Stage({ 
			name = "魔焰地狱火",
			desc = "地狱火山将召唤出魔焰地狱火攻击玩家",
			creature = 34815,
			display = 10906,
			sections = {
				Spell(66495),
				Spell(66494),
			},
		}), 
		Stage({ 
			name = "地狱火山",
			desc = "在普通模式中,地狱火山在召唤出魔焰地狱火之后消失,而英雄模式中,需要玩家优先摧毁地狱火山,否则,地狱火山将会源源不断的召唤地狱火",
			creature = 34813,
			display = 29441,
		}), 
 },
 adds = {
	 {
	 	name = "痛苦女王",
		creature = 34826,
		display = 29442
	 },
	 {
	 	name = "虚空传送门",
		creature = 34825,
		display = 27735,
	 },
	 {
	 	name = "魔焰地狱火",
		creature = 34815,
		display = 10906,
	 },
	 {
	 	name = "地狱火山",
		creature = 34813,
		display = 29441,
	 },
 },
},
{
	name = "阵营冠军",
	desc = "",
},
{
	name = "瓦格里双子",
	desc = "作为被巫妖王转化的女性维库人,瓦格里一直是巫妖王的得力助手,瓦格里双子就是巫妖王安部在十字军试炼中的镇守者",
	creature = 34497,
	display = 29240,
	coords = {0.58,0.44,1 },
	loot = {},
	sections = {
		Stage({
			name = "光明邪使菲奥拉",
			creature = 34497,
			display = 29240,
			sections = {
					
			},
		}),
		Stage({
			name = "黑暗邪使艾蒂斯",
			creature = 34496,
			display = 29267,
		}),
		Stage({
			name = "光明精粹",
			creature = 34568,
			display = 29286,
		}),
		Stage({
			name = "黑暗精粹",
			creature = 34567,
			display = 29270,
		}),
	},
},
{
	name = "阿努巴拉克",

},
})

table.insert(db, TRIAL_OF_THE_CRUSADER)
