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

local RAGEFIRE_CHASM = CreateInstance({
  name = "怒焰裂谷",
  desc = "怒焰裂谷的地理位置十分特殊,位于奥格瑞玛城中.副本入口在奥格瑞玛主城的暗影区,从该区一扇泛光的大门进入即可.怒炎裂谷由一系列火山洞穴组成,一个忠于影子议会的邪教正藏身在裂谷深处,怒炎裂谷里散发出了黑暗力量足以毁灭兽人已经取得的一切.",
  texture = "RagefireChasm",
  area = 680,
  dflag = N5,
}, {
  {
    name = "奥格弗林特",
    desc = "Oggleflint and the troggs once ruled unchallenged in the depths of Ragefire Chasm until the Searing Blade cultists moved in. Too weak to drive away the Searing Blade, Oggleflint and the troggs retreated near the entrance of Ragefire Chasm where they now wait patiently for their unwelcome guests to depart.",
    --icon = true,
    creature = 11517,
    display = 32731,
    coords = {0.696, 0.649, 1},
    loot = {68194,},
    sections = {
      Spell(40505, {so = true}), -- Cleave
    },
  },
  {
    name = "饥饿者塔拉加曼",
    desc = "Thought to be the leader of the Searing Blade, he hides within the fiery depths of Ragefire Chasm, using his demonic influence to corrupt the citizens of Orgrimmar. In reality, the leaders of the Searing Blade are Bazzalan and Jergosh, this felguard is expendable bait to lure young adventurers in to their death.",
    --icon = true,
    creature = 11520,
    display = 14152,
    coords = {0.408, 0.578, 1},
    loot = {14148,14149,14145,},
    sections = {
      Spell(11970, {so = true, desc = "Inflicts 33 to 38 Fire damage to enemies within 10 yards."}), -- Fire Nova
      Spell(18072, {so = true}), -- Uppercut
    },
  },
  {
    name = "祈求者耶戈什",
    desc = "Jergosh the Invoker has rejected the ideals of the orcs and practices the dark and demonic arts of the warlock. A leader of the Searing Blade Cultists, Jergosh dwells within Ragefire Chasm, concocting a scheme dangerous enough to draw the attention of Thrall himself. He's guarding the Blood Filled Orb, which is needed to summon Zelemar the Wrathful if you have the quest The Path of the Adept.",
    --icon = true,
    creature = 11518,
    display = 11429,
    coords = {0.343, 0.816, 1},
    loot = {14150,14147,14151,},
    sections = {
      Spell(11980, {so = true, desc = "Reduces the Physical damage of an enemy by 10% for 15 seconds.", flag1 = CURSE}), -- Curse of Weakness
      Spell(20800, {so = true, desc = "Burns an enemy for 38 to 44 Fire damage, then inflicts additional 5 Fire damage every 3 seconds for 15 seconds.", flag1 = MAGIC}), -- Immolate
    },
  },
  {
    name = "巴扎兰",
    desc = "Bazzalan leads the Searing Blade cultists along with Jergosh the Invoker. His motives are unclear, but like all satyr, he is a swift and cunning foe. Bazzalan is a bit tougher than the other bosses you will encounter in Ragefire Chasm. He swings fast and hits hard. However, with careful pulling, you can fight him without engaging the two Searing Blade Cultists that are standing in front of him.",
    --icon = true,
    creature = 11519,
    display = 2007,
    coords = {0.419, 0.863, 1},
    loot = {68195,},
    sections = {
      Spell(744, {so = true, desc = "Inflicts 4 Nature damage to an enemy every 3 seconds for 15 seconds.", flag1 = POISON}), -- Poison
      Spell(14873, {so = true}), -- Sinister Strike
    },
  },
})

table.insert(db, RAGEFIRE_CHASM)
