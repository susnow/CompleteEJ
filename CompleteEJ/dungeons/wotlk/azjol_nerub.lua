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

local AZJOL_NERUB = CreateInstance({
  name = "艾卓-尼鲁布",
  desc = "艾卓-尼鲁布，现在位于龙骨荒野之下，是曾经的艾卓-尼鲁布帝国的一部分，当蛛魔在与巫妖王的战争中败退后，在战争中死去的蛛魔被复活，被迫为巫妖王而战。",
  --texture = "AzjolNerub",
  area = 533,
}, {
  {
    name = "看门者克里克希尔",
    desc = "看门者克里克希尔是艾卓-尼鲁布的第一个BOSS。他是巫妖王强大的仆从阿努巴拉克的手下一元。与“看着他死”成就相关",
    --icon = true,
    creature = 28684,
    display = 27394,
    --coords = {x, y, level},
    loot = {{35657,N5},{35655,N5},{37219,H5},{35656,N5},{37217,H5},{37218,H5},{37216,H5},},
    sections = {
		Spell(59368, {so = true, fbd = H5, flag1 = CURSE}), -- 疲倦诅咒
		Spell(52592, {so = true, fbd = N5, flag1 = CURSE}), -- 疲倦诅咒

		Spell(52586, {desc = "对一个敌人每秒造成1885至2115点暗影伤害，持续3秒。", fbd = N5}), -- 精神鞭笞
		Spell(59367, {desc = "提高50%攻击速度和100%的物理伤害。", fbd = H5}), -- 精神鞭笞

		Spell(28747), -- Frenzy

		Stage({
			so = true,
			name = "看守者",
			sections = {
				Stage({
					stype = CREATURE,
					name = "看守者加什拉",
					creature = 28730,
					display = 23568,
					sections = {
						Spell(52470),	-- 激怒
						Spell(52469, {fbd = N5}), -- 普通模式感染撕咬
						Spell(59364, {fbd = H5}), -- 英雄模式感染撕咬
						Spell(52086, {flag1 = DPS}), -- 52086
					}
				}),
				Stage({
					stype = CREATURE,
					name = "看守者纳尔伊",
					creature = 28729,
					display = 23984,
					sections = {
						Spell(52524), -- blinding webs
						Spell(52469, {fbd = N5}), -- infected bite normal
						Spell(59364, {fbd = H5}), -- infected bite heroic
						Spell(52086, {flag1 = DPS}), -- web wrap
					}
				}),
				Stage({
					stype = CREATURE,
					name = "看守者希尔希克",
					creature = 28731,
					display = 25729,
					sections = {
						Spell(52493, {desc = "对敌人射出毒箭，造成875至1125点自然伤害，并在接下来的10秒内每3秒造成一次619至881点的额外伤害。", fbd = N5}),
						Spell(59366, {desc = "对敌人射出毒箭，造成3063至3937点自然伤害，并在接下来的10秒内每3秒造成一次1238至1762点的额外伤害。", fbd = H5}),
						Spell(52469, {fbd = N5}), -- infected bite normal
						Spell(59364, {fbd = H5}), -- infected bite heroic
						Spell(52086, {flag1 = DPS}), -- web wrap
					}
				}),
			}
		}),
    },
  },
  {
    name = "哈多诺克斯",
    desc = "哈多诺克斯是艾卓-尼鲁布中的第二个BOSS。它是一个原本生活在诺森德大陆的巨大蜘蛛，它是天灾军团的最初反抗者，最终沦为巫妖王的手下。与“哈多诺克斯的闭门羹”成就相关。",
    --icon = true,
    creature = 28921,
    display = 26776,
    coords = {0.756, 0.468, 3},
    loot = {{35658,N5},{35659,N5},{37220,H5},{35660,N5},{37222,H5},{37230,H5},{37221,H5},},
    sections = {
      Spell(59419, {fbd = H5}), -- Acid Cloud
      Spell(53400, {fbd = N5}), -- Acid Cloud
      Spell(59417, {so = true, fbd = H5, flag1 = POISON}), -- Leech Poison
      Spell(53030, {so = true, fbd = N5, flag1 = POISON}), -- Leech Poison
      Spell(53418), -- Pierce Armor
      Spell(53406, {so = true, fbd = N5}), -- Web Grab
      Spell(59420, {so = true, fbd = H5}), -- Web Grab
    },
  },
  {
    name = "阿努巴拉克",
    desc = "阿努巴拉克是艾卓-尼鲁布的最后BOSS。它是曾经的尼鲁布人首领，现在是一名地穴领主，一个愚蠢的巫妖王仆从。与“速战速决”成就相关",
    --icon = true,
    creature = 29120,
    display = 27856,
    --coords = {x, y, level},
    loot = {{35662,N5},{35663,N5},{37237,H5},{35661,N5},{37238,H5},{43102,H5},{37236,H5},{37240,H5},{37241,H5},{37235,H5},{37232,H5},{37242,H5},},
    sections = {
		-- burrows at 66/33 and 15, summons nerubian darter assasin and guardians
		Stage({
			so = true,
			stype = ABILITY,
			name = "Phase 1: A pestilence upon you!",
			sections = {
				Spell(53520), -- Carrion Beetles
				Spell(53472, {fbd = N5}), -- Pound
				Spell(59433, {fbd = H5}), -- Pound
			}
		}),
		Stage({
			so = true,
			stype = ABILITY,
			name = "Phase 2: Come forth, my brethren!",
			sections = {
				Spell(59446, {fbd = H5}), -- Impale
				Spell(53454, {fbd = N5}), -- Impale
				Spell(53467, {fbd = N5}), -- Leeching Swarm
				Stage({
					stype = ABILITY,
					name = "Call for help",
					desc = "At 66%, 33% and 15%, Anub'Arak will summon adds",
					sections = {
						Stage({
							stype = CREATURE,
							name = "Nerubian Darter",
							creature = 29213,
							display = 26056,
							sections = {
								Spell(53602, {fbd = N5}),
								Spell(59349, {fbd = H5}),
							}
						}),
						Stage({
							stype = CREATURE,
							name = "Nerubian Guardian",
							creature = 29216,
							display = 23561,
							sections = {
								Spell(52532, {desc = "攻击一名敌人，对其造成200%武器伤害。"}),
								Spell(53618, {fbd = N5}),
								Spell(59350, {fbd = H5}),
							}
						}),
						Stage({
							stype = CREATURE,
							name = "Nerubian Assasin",
							creature = 29214,
							display = 23820,
							sections = {
								Spell(52540),
							}
						}),
					}
				}),
			}
		}),
	},
  },
})

table.insert(db, AZJOL_NERUB)
