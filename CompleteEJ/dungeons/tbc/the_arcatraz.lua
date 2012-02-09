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

local THE_ARCATRAZ = CreateInstance({
  name = "��ħ����",
  desc = "�������ϵ���³������λ����շ籩�Ķ��ϱ�. ������������˹���������Ӻ�����Ѫ��������ռ����,��ħ������Ҫͨ��һϵ�е�Կ��������ܴ����Ĵ���.",
  --texture = "TheArcatraz",
  area = 731,
}, {
  {
    name = "���ɵ�ɪ�׿�˹",
    desc = "���ɵ�ɪ�׿�˹�ǽ�ħ�����еĵ�һ��boss.",
    --icon = true,
    creature = 20870,
    display = 19882,
    coords = {0.592, 0.248, 1},
    loot = {28373,{30582,H5},28374,28384,{30581,H5},28372,28375,{30575,H5},},
    sections = {
      Spell(39367, {fbd = H5}), -- Seed of Corruption
      Spell(36123, {fbd = N5}), -- Seed of Corruption
      Spell(36127, {fbd = N5}), -- Shadow Nova
      Spell(39005, {fbd = H5}), -- Shadow Nova
      Spell(36119), -- Void Zone
    },
  },
  {
    name = "ĩ��Ԥ���ߴ����",
    desc = "ĩ��Ԥ���ߴ�����ǽ�ħ�����еĵ�����boss.",
    --icon = true,
    creature = 20885,
    display = 19888,
    coords = {0.358, 0.780, 2},
    loot = {28386,{30582,H5},28391,28387,{30575,H5},28392,28390,24308,{30581,H5},},
    sections = {
      Spell(36173, {fbd = N5}), -- Gift of the Doomsayer
      Spell(39009, {fbd = H5}), -- Gift of the Doomsayer
      Spell(36144, {fbd = N5}), -- Heal
      Spell(39013, {fbd = H5}), -- Heal
      Spell(39016, {fbd = H5}), -- Shadow Wave
      Spell(36142), -- Whirlwind
      Spell(36175), -- Whirlwind
    },
  },
  {
    name = "��ŭԤ�����տ�����",
    desc = "��ŭԤ�����տ������ǽ�ħ�����еĵڶ���boss.",
    --icon = true,
    creature = 20886,
    display = 19977,
    coords = {0.192, 0.784, 2},
    loot = {28398,{30582,H5},28396,28394,{30581,H5},28397,28393,{30575,H5},},
    sections = {
      Spell(36051, {fbd = N5}), -- Fel Immolation
      Spell(39006, {fbd = H5}), -- Felfire Shock
      Spell(35759, {fbd = N5, flag1 = MAGIC}), -- Felfire Shock
      Spell(39007, {fbd = H5}), -- Immolation
      Spell(36512), -- Knock Away
    },
  },
  {
    name = "Ԥ����˹����˹",
    desc = "Ԥ����˹����˹�ǽ�ħ�����е�����boss.",
    --icon = true,
    creature = 20912,
    display = 19943,
    coords = {0.608, 0.294, 3},
    loot = {{30575,H5},28416,{29360,H5},28413,28418,{30582,H5},28403,28414,{30581,H5},28406,28419,28231,28415,28412,28407,{23572,H5},28205,{29241,H5},{29248,H5},{29252,H5},},
    sections = {
      Spell(39019, {fbd = H5}), -- Complete Domination
      Spell(37162, {fbd = N5}), -- Domination
      Spell(39415, {flag1 = MAGIC}), -- Fear
      Spell(39020, {fbd = H5}), -- Mana Burn
      Spell(39017, {fbd = H5}), -- Mind Rend
      Spell(36924, {fbd = N5}), -- Mind Rend
    },
  },
})

table.insert(db, THE_ARCATRAZ)
