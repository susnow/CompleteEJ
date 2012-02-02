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
    name = "冰吼",
    desc = "冰吼是诺森德的雪人巨兽,十字军试炼中诺森德兽群的最终BOSS",
    --icon = true,
    creature = 34797,
    display = 21601,
    coords = {0.402, 0.504, 1},
    loot = {{47413,H25},47645,47653,47648,47635,47638,{47636,H10},{47636,H25},{47425,H25},{46973,H25},{47988,H10},{47419,H25},{47611,N10},{47422,H25},{46980,H25},{47421,H25},{47920,H10},{47420,H25},47654,{47426,H25},{47923,H10},47652,{47415,H25},{47418,H25},47630,47651,47556,47641,{46966,H25},{46964,H25},{47412,H25},{46967,H25},47640,{47996,H10},{47424,H25},{47423,H25},{46968,H25},47644,{47414,H25},{46971,H25},{46991,H25},{47417,H25},{46977,H25},{46993,H25},{47416,H25},{47254,N25},{47924,H10},{47612,N10},{47990,H10},{47578,N10},{47613,N10},{47998,H10},{47253,N25},{47614,N10},{47992,H10},{47855,N10},{47991,H10},{47615,N10},{47610,N10},{47921,H10},{46962,N25},{47856,N10},{47609,N10},{47607,N10},{47915,H10},{47255,N25},{47850,N10},{47258,N25},{47989,H10},{47999,H10},{46961,N25},{47851,N10},{47919,H10},{47993,H10},{47858,N10},{47853,N10},{47859,N10},{47918,H10},{47916,H10},{47926,H10},{47852,N10},{47263,N25},{47917,H10},{47252,N25},{47997,H10},{47262,N25},{47616,N10},{47994,H10},{47261,N25},{47849,N10},{47922,H10},{47256,N25},{47857,N10},{47925,H10},{47854,N10},{47265,N25},{47995,H10},{47608,N10},{47617,N10},{47260,N25},{47860,N10},},
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
  },
})

table.insert(db, TRIAL_OF_THE_CRUSADER)
