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

local AHNKAHET_THE_OLD_KINGDOM = CreateInstance({
  name = "安卡赫特：古代王国",
  desc = "艾卓-尼鲁布帝国，一个由在冰冷的大陆地下延伸的通道和洞穴构成的庞大网络。这个王国的高智商的创造者是蛛魔，在大灾变撕裂大陆之前就在古卡利姆多大陆的北部建立了他们的地下巢穴。当巫妖王来到诺森德时，为了让诺森德的居民臣服于他的一直，他派出了天灾军团与蛛魔之间发生了一场残酷的战争。最终亡灵大军占了上风，在保卫艾卓-尼鲁布的战斗中死去的蛛魔被复活为亡灵，被迫为巫妖王而战。而安卡赫特：古代王国正是艾卓-尼鲁布帝国曾经的一部分。",
  --texture = "AhnkahetTheOldKingdom",
  area = 522,
}, {
  {
    name = "纳多克斯长老",
    desc = "纳多克斯长老是安卡赫特：古代王国中的第一个BOSS。与尊敬长者成就相关。",
    --icon = true,
    creature = 29309,
    display = 27407,
    coords = {0.698, 0.276, 1},
    loot = {{35607,N5},{35608,N5},{37591,H5},{35606,N5},{37594,H5},{37593,H5},{37592,H5},},
    sections = {
		-- normal
		Spell(56130, {so = true, desc = "使敌人生病，在30秒内造成1275点自然伤害。", fbd = N5, flag1 = DISEASE}),
		
		-- heroic
		Spell(59467, {so = true, desc = "使敌人生病，在30秒内造成2550点自然伤害。", fbd = H5, flag1 = DISEASE}),
		Spell(59465, {so = true, desc = "激怒一个虫人, 使其造成的伤害提高200%, 体积增大一倍并且生命值上限提高10000点。", fbd = H5, flag1 = IMPORTANT}),
		
		Stage({
			so = true,
			stype = CREATURE,
			name = "安卡哈守护者",
			desc = "在50%血量时，纳多克斯长老会召唤一名安卡哈守护者，使附近所有的虫群以及纳多克斯长老免疫所有伤害。",
			creature = 30176,
			display = 28079,
			flag1 = DPS, 
			flag2 = IMPORTANT,
			sections = {
				Spell(56153, {desc = "保护施法者身旁很大范围内的虫群，使其免疫一切伤害。"}),
			}
		}),
		
		-- common
		Spell(26662, {desc = "使施法者的攻击和移动速度提高150%，对敌人造成的所有伤害提高500%。并且免疫嘲讽。当纳多克斯长老被拉的太远时使用。"}),
    },
  },
  {
    name = "塔达拉姆王子",
    desc = "塔达拉姆王子，一个吸血鬼王子，是安卡赫特：古代王国的第二个BOSS。",
    --icon = true,
    creature = 29308,
    display = 27406,
    coords = {0.626, 0.494, 1},
    loot = {{35609,N5},{35611,N5},{37614,H5},{35610,N5},{37595,H5},{37613,H5},{37612,H5},},
    sections = {
		-- common
		Spell(55968), -- Bloodthirst
		
		Stage({
			so = true,
			stype = ABILITY,
			name = "制造烈焰之球",
			desc = "塑能纯焰，制造出一颗漂浮在空中的烈焰之珠并向目标移动，沿途对18码内敌人发射灼烧光线。",
			icon = "Interface\\Icons\\spell_fire_sealoffire",
			sections = {
				Spell(57748, {fbd = N5}),
				Spell(58938, {fbd = H5}),
			}
		}),
		
		-- normal
		Spell(59513, {so = true, fbd = H5}), -- Embrace of the Vampyr
		
		-- heroic
		Spell(55959, {so = true, fbd = N5}), -- Embrace of the Vampyr
		
		Spell(55964), -- Vanish
    },
  },
  {
    name = "耶戈达·觅影者",
    desc = "耶戈达·觅影者，一个暮光教徒，是安卡赫特：古代王国的第三个BOSS。与志愿工作成就相关。",
    --icon = true,
    creature = 29310,
    display = 26777,
    coords = {0.486, 0.730, 1},
    loot = {{43277,N5},{43279,N5},{43280,H5},{43278,N5},{43281,H5},{43282,H5},{43283,H5},},
    sections = {
		Spell(56855, {fbd = N5}), -- Cyclone Strike
		Spell(60032, {fbd = H5}), -- Lightning Bolt
		Spell(56891, {fbd = N5}), -- Lightning Bolt
		Spell(60029, {fbd = H5}), -- Thundershock
		Spell(56926, {fbd = N5}), -- Thundershock
		Spell(56219, {flag1 = DPS}), -- Gift of the Herald
    },
  },
  {
    name = "传令官沃拉兹",
    desc = "传令官沃拉兹，一个无面者，是安卡赫特：古代王国中的最后一个BOSS。与沃拉兹的快速死亡成就相关。",
    --icon = true,
    creature = 29311,
    display = 27408,
    coords = {0.236, 0.506, 1},
    loot = {{35614,N5},{35612,N5},{37619,H5},{35613,N5},{37615,H5},{37618,H5},{43102,H5},{37620,H5},{37616,H5},{37622,H5},{37617,H5},{37623,H5},{41790,H5},},
    sections = {
		Spell(59974, {desc = "每秒造成2828 to 3172暗影伤害，持续3秒，并使其移动速度降低50%。", fbd = H5}), -- 精神鞭笞
		Spell(57941, {desc = "每秒造成5655 to 6345暗影伤害，持续3秒，并使其移动速度降低50%。", fbd = N5}), -- 精神鞭笞
		Spell(57942, {desc = "向附近的敌人发射暗影箭雨，对它们造成850到1,150点暗影伤害。", fbd = N5}), -- 暗影箭雨
		Spell(59975, {desc = "向附近的敌人发射暗影箭雨，对它们造成2550 to 3450点暗影伤害。", fbd = H5}), -- 暗影箭雨
		Spell(57949, {so = true, fbd = N5, flag1 = CURSE}), -- 碎裂
		Spell(59978, {so = true, fbd = H5, flag1 = CURSE}), -- 碎裂
		Stage({
			so = true,
			stype = ABILITY,
			name = "疯狂",
			icon = "Interface\\Icons\\spell_shadow_painandsuffering",
			desc = "使在场所有玩家疯狂，并被迫攻击与队友类似外貌的暮光化身。在传令官沃拉兹血量为66%与33%时使用。",
		}),
    },
  },
  {
    name = "埃曼尼塔",
    desc = "埃曼尼塔是安卡赫特：古代王国中的一个可选BOSS，只在英雄模式下出现。",
    --icon = true,
    creature = 30258,
    display = 28133,
    --coords = {x, y, level},
    loot = {{43284,H5},{43287,H5},{43285,H5},{43286,H5},},
    sections = {
		Spell(57094, {fbd = H5}), -- 猛击
		Spell(57088, {fbd = H5}), -- 毒箭之雨
		Spell(57095, {fbd = H5, flag1 = MAGIC}), -- 纠缠根须
		Stage({
			so = true,
			stype = ABILITY,
			fbd = H5,
			name = "迷你",
			desc = "使所有人防御技能降低500点，伤害降低75%。需要在健康的蘑菇附近击杀这个蘑菇，以解除此减益效果",
			icon = "Interface\\Icons\\spell_shadow_antishadow",
		}),
		Stage({
			so = true,
			stype = ABILITY,
			fbd = H5,
			name = "召唤蘑菇",
			desc = "埃曼尼塔随机召唤蘑菇。",
			sections = {
				Stage({
					stype = CREATURE,
					fbd = H5,
					creature = 30435,
					display = 23870,
					name = "毒云",
					desc = "死亡时释放毒云，每2秒对附近敌人造成3238~3762点自然伤害，持续8秒。",
					sections = {
						Spell(57061),
					}
				}),
				
				Stage({
					stype = CREATURE,
					fbd = H5,
					creature = 30435,
					display = 23870,
					name = "高能蘑菇",
					desc = "使目标造成的伤害提高100%。移除迷你效果。",
					sections = {
						Spell(56648),
					}
				}),
				}
		})
    },
  },
})

table.insert(db, AHNKAHET_THE_OLD_KINGDOM)
