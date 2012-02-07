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

local GRUULS_LAIR = CreateInstance({
  name = "格鲁尔的巢穴",
  desc = "当灭世者死亡之翼发现黑暗之门和藏在其后的德拉诺世界后，他认为德拉诺世界的原住民根本无法对巨龙造成威胁，所以死亡之翼把他的蛋分放到了整个德拉诺世界之中。\n\n 在刀锋山死亡之翼只留下了部分弱小的龙来守护他的蛋，这太愚蠢了。 这些守护龙很快就被刀锋山的戈隆撕裂，并且戈隆一族的王者格鲁尔把这些巨龙钉在了山谷上。\n\n现在屠龙者格鲁尔被刀锋山的食人魔敬为神明。格鲁尔之子也侵入了纳格兰平原。一旦格鲁尔选择进攻外域的部落或联盟，那他的天生神力与丰富的战斗经验将会造成巨大的威胁。",
  texture = "GruulsLair",
  area = 776,
  dflag = N25,
}, {
  {
    name = "莫加尔大王",
    desc = "刀塔氏族曾是戈隆中最弱的一个氏族，无论是数量还是力量都弱于其他氏族。但莫加尔的出生永远改变了这个氏族的命运。他的力量与坚忍的性格同龄中无人可比，因此战斗中迅捷勇猛的他很快得到了前任大王的注意。后来，在莫加尔的努力之下，他改变了刀塔氏族的命运，并最终得到格鲁尔的赏识。",
    --icon = true,
    creature = 18831,
    display = 18649,
    coords = {0.551, 0.576, 1},
    loot = {28797,29763,29764,28801,28799,},
    sections = {
      Stage({
        so = true,
        stype = CREATURE,
        creature = 18831,
        display = 18649,
        name = "莫加尔",
        sections = {
          Spell(39144, {flag1 = TANK}), -- Arcing Smash (28168 old?)
          Spell(33230, {flag1 = TANK}), -- Mighty Blow
          Spell(16508), -- Intimidating Roar
          Spell(33238, {desc = "持续15秒的旋风斩，每两次造成一次伤害，移动速度降低50%。", flag1 = IMPORTANT}), -- Whirlwind (triggers 33239)
          Spell(26561, {desc = "少于50%血量时，莫加尔大王进入狂暴状态，每隔一段时间恐惧40码内的随机目标，并且猛击未被恐惧的目标击退并造成伤害。", flag1 = IMPORTANT}), -- Berserker Charge
          Spell(33232, {desc = "提高攻击速度200%，但降低攻击伤害50%。当处于此状态下，莫加尔大王会受到双持惩罚的影响，比如更多的未命中。"}), -- Flurry
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 18836,
        display = 11585,
        name = "先知盲眼 (牧师)",
        sections = {
          Spell(33144, {desc = "单体治疗46250—53750血量。", flag1 = INTERRUPT}), -- Heal
          Spell(33152, {desc = "群体治疗，治疗附近目标92500—107500血量。", flag1 = INTERRUPT}), -- Prayer of Healing
          Spell(33147, {desc = "释放一个30秒内吸收25000伤害的盾，免疫打断和眩晕。", flag1 = IMPORTANT}), -- Greater Power Word: Shield
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 18835,
        display = 12472,
        name = "疯癫者奇克勒 (萨满)",
        sections = {
          Spell(36152, {desc = "闪电箭，造成1488 — 2012自然伤害。"}), -- Lightning Bolt
          Spell(33175, {desc = "冲击一名敌人，造成657 — 843自然伤害并沉默5秒。"}), -- Arcane Shock
          Spell(33237, {desc = "施放冲击波，对30码内目标造成1750 — 2250奥术伤害并击退。"}), -- Arcane Explosion
          Spell(33173, {desc = "频繁的施放变羊术，持续10秒。"}), -- Greater Polymorph
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 18832,
        display = 20194,
        name = "克罗斯·火手 (法师)",
        sections = {
          Spell(33051, {desc = "对一名敌人造成8550 — 9450火焰伤害。"}), -- Greater Fireball
          Spell(33054, {desc = "自身BUFF，减少75%的魔法伤害，持续30秒。", flag1 = MAGIC}), -- Spell Shield
          Spell(33061, {desc = "对15码内所有目标造成6013 to 6987火焰伤害，并减少70%的移动速度6秒。", flag1 = IMPORTANT}), -- Blast Wave
        },
      }),
      Stage({
        so = true,
        stype = CREATURE,
        creature = 18834,
        display = 20195,
        name = "召唤者欧莫 (术士)",
        sections = {
          Spell(33129, {desc = "2秒一跳，一跳500伤害，持续10秒，可叠加至99层。"}), -- Dark Decay
          Spell(33130), -- Death Coil
          Spell(33131, {so = true, icon = "Interface\\Icons\\Spell_Shadow_SummonFelhunter", name = "死亡缠绕", desc = "对仇恨最高的目标使用，对目标造成2000伤害，给自己回4000血。", sections = {
            Stage({
              stype = CREATURE,
              creature = 18847,
              display = 7972,
              name = "死亡缠绕",
              sections = {
                Spell(33086, {so = true}), -- Wild Bite
              },
            }),
          }}, 1), -- Summon Wild Felhunter
        },
      }),
    },
  },
  {
    name = "屠龙者格鲁尔",
    desc = "屠龙者格鲁尔是七个戈隆的父亲，并且是他们中最强的。尽管他看似一无所知，但他不仅是脾气暴躁而且富有智慧。\n\n当死亡之翼进犯格鲁尔的家时，他正与第二次兽人之战中那些失落的英雄们会面：卡德加、图拉杨和奥蕾莉亚·风行者。他们是在死亡之翼拥有古尔丹之颅后来的。自那之后，格鲁尔联合他的氏族勇士与联盟英雄一起奋战，挑战意图占领刀锋山的死亡之翼——打碎死亡之翼的蛋并把黑龙钉到山谷之上。\n\n这些举动激怒了死亡之翼，因此死亡之翼直接攻击格鲁尔，尽管格鲁尔富有智慧但这不能弥补实力的差距，最后卡德加的魔法救了格鲁尔并击退了死亡之翼。\n\n现在在外域刀锋上的山谷上依旧能看到当年他们战斗的痕迹。",
    --icon = true,
    creature = 19044,
    display = 18698,
    coords = {0.202, 0.286, 1},
    loot = {28825,29765,28826,28804,29767,28823,28810,28827,28794,},
    sections = {
      Spell(33813, {icon = "Interface\\Icons\\Ability_GhoulFrenzy", flag1 = TANK}, 1), -- Hurtful Strike
      Spell(36240, {desc = "持续15秒的落石，每三秒2700伤害。"}), -- Cave In
      Spell(36297, {desc = "沉默4秒，随着战斗时间的增长，格鲁尔会愈加频繁的施放此技能。"}), -- Reverberation
      Spell(36300, {desc = "自身BUFF，每层提高15%伤害，每30秒叠一层，最高叠30层。", flag1 = IMPORTANT}), -- Growth
      Stage({
        so = true,
        name = "石化猛击",
        desc = "每隔74-80秒，格鲁尔将会击飞所有目标，并石化所有目标。",
        flag1 = DEADLY,
        sections = {
          Spell(33525, {so = true, desc = "落地以后,玩家会得到一个每s降低20%移动速度的'巨人领主的扣握'debuff。", flag1 = IMPORTANT}), -- Ground Slam (triggers 39187, that again triggers 33572 each second)
          Spell(33654, {so = true, desc = "一个玩家的粉碎效果会对周围20码内的其他玩家造成伤害，当两个玩家站在同一点时,这个伤害最高而达到9000，当两人的距离越远时,这个伤害会越小,到20码时,只会造成70-100的伤害。", flag1 = DEADLY}), -- Shatter
        },
      }),
    },
  },
})

table.insert(db, GRUULS_LAIR)
