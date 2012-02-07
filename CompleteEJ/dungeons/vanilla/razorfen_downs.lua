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

local RAZORFEN_DOWNS = CreateInstance({
  name = "剃刀高地",
  desc = "在那错综复杂的荆棘迷宫中居住着大群忠诚的野猪人军 队以及他们的高等牧师——亡首部族。  剃刀高地然而最近，一股阴影力量笼罩了这个原始的洞穴。亡灵天灾的人在巫妖寒冰之王亚门纳尔的带领下控制了野猪部族并将荆棘迷宫变成了亡灵力量的堡垒。现在野猪人正奋力战斗来重新夺回他们的城市，并阻止亚门纳尔继续控制贫瘠之地。",
  texture = "RazorfenDowns",
  area = 760,
  dflag = N5,
}, {
  {
    name = "图特卡什",
    desc = "这个首领会在玩家敲响召唤者之室的铜锣后刷新，在你面对他之前，你需要面对2波其爪牙。",
    --icon = true,
    creature = 7355,
    display = 7845,
    coords = {0.591, 0.340, 1},
    loot = {10775,10776,10777,},
    sections = {
      Spell(12255, {so = true, flag1 = CURSE}), -- Curse of Tuten'kash
      Spell(12251, {so = true, desc = "每3秒造成4点自然伤害，最多叠加3次。持续15秒。", flag1 = POISON}), -- Virulent Poison恶性毒药
      Spell(12252, {so = true}), -- Web Spray
    },
  },
  {
    name = "火眼莫德莱斯",
    desc = "这个首领被很多跳舞的骷髅所环绕。这些骷髅并不直接参与战斗，但会在首领遭到攻击时会对你进行反击。",
    --icon = true,
    creature = 7357,
    display = 8055,
    coords = {0.858, 0.468, 1},
    loot = {10771,10770,10769,},
    sections = {
      Spell(12466, {so = true, desc = "对敌人造成99到116点火焰伤害。"}), -- Fireball火球术
      Spell(12470, {so = true, desc = "对附近的敌人造成49到58点火焰伤害。"}), -- Fire Nova火焰新星
    },
  },
  {
    name = "暴食者",
    desc = "暴食者是用最强憎恶之一——暴怒的塔尔泰克的残骸制造的。他是一个强力近战者，而且会在战斗中周期性的狂暴，攻击更加凶猛。",
    --icon = true,
    creature = 8567,
    display = 25730,
    coords = {0.345, 0.667, 1},
    loot = {10774,10772,},
    sections = {
      Spell(77978, {so = true, desc = "一片疫病之云包围疫病携带者，每3秒对半径5码内所有敌人造成27~32点自然伤害。"}), -- Disease Cloud疾病之云
      Spell(12795, {so = true, desc = "暴食者变得狂暴，提高其100%攻击伤害和30%攻击速度，持续2分钟。"}), -- Frenzy狂乱
    },
  },
  {
    name = "寒冰之王亚门纳尔",
    desc = "寒冰之王亚门纳尔领导着亡首军团，一个由不死野猪人与亡灵天灾组成的部队。显然，他也是这一切的创造者。根据英雄纲要的记载，他制造了屠杀了1200多只野猪人后死去的憎恶，暴怒的塔尔泰克。然后亚门纳尔将其复活，并在卡利姆多建立了第一个天灾前哨重地。他现在用它巨大的精神力统治着亡首军团的每一步行动。",
    --icon = true,
    creature = 7358,
    display = 32610,
    coords = {0.443, 0.604, 1},
    loot = {10762,10764,10765,10761,10763,},
    sections = {
      Spell(77977, {desc = "一层寒冰包裹施法者。这层厚重的寒冰能提高12点护甲值，并且使近战攻击者的移动速度降低30%，攻击间隔增加20%。"}), -- Frost Armor 霜甲术(triggers 6136)
      Spell(15530, {desc = "对敌人造成74到203点冰霜伤害，并使其移动速度降低50%，持续4秒。", flag1 = MAGIC}), -- Frostbolt寒冰箭
      Spell(15531, {desc = "对附近的敌人造成99到116点冰霜伤害并将其冻结在原地，冻结效果最多可持续8秒。", flag1 = MAGIC}), -- Frost Nova冰霜新星
      Spell(13009, {desc = "将一个敌人击退并打断正在施放的法术"}), -- Amnennar's Wrath亚门纳尔之怒
      Spell(12642, {so = true, desc = "召唤三 个冰霜亡魂。", sections = {
        Stage({
          stype = CREATURE,
          creature = 8585,
          display = 146,
          name = "冰霜亡魂",
          desc = "没有特殊技能。",
        }),
      }}), -- Summon Frost Spectres
    },
  },
})

table.insert(db, RAZORFEN_DOWNS)
