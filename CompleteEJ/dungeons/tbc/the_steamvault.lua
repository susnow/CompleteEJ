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

local THE_STEAMVAULT = CreateInstance({
  name = "�����ؿ�",
  desc = "�����ؿ�������ˮ����³ǵĵ�����5�˸���. ��ṹ�������һ������ˮ��վ, ���Ⱥ���ͳ��������. ��˹��Ůʿ���ĵ����˶�������ɪ��˹�����������»�еʦ˹������ˮ��ʦɪ˹����פ���������ؿ������ƺ����о�һ�ֽ��ˮ�ͻ�е�ķ��������ַ����ܴ�������սʿ�޼᲻�ݵ��������������Դ�Ϊ�ݵ㲻����ȡ�޼�����ĺ�ˮ,���¶��ߺ���ˮλ�½�,������һϵ����̬����,���������������⵽�ƻ�.",
  --texture = "TheSteamvault",
  area = 727,
}, {
  {
    name = "ˮ��ʦɪ˿���",
    desc = "ˮ��ʦɪ˿���������ˮ���������ؿߵĵ�һ��boss.",
    --icon = true,
    creature = 17797,
    display = 11268,
    coords = {0.542, 0.124, 1},
    loot = {27508,{30551,H5},27783,27787,{30549,H5},27789,27784,{30550,H5},},
    sections = {
      Spell(31718, {flag1 = MAGIC}), -- Enveloping Winds
      Spell(25033), -- Lightning Cloud
      Spell(31481, {flag1 = MAGIC}), -- Lung Burst
    },
  },
  {
    name = "��еʦ˹�����",
    desc = "��еʦ˹�����������ˮ���������ؿߵĵڶ���boss. ����������ǰ��������������ɪ��˹����Ҫɱ����.",
    --icon = true,
    creature = 17796,
    display = 18638,
    coords = {0.324, 0.826, 1},
    loot = {27793,{30551,H5},27794,27791,{30550,H5},27790,27792,23887,{30549,H5},},
    sections = {
      Spell(35107), -- Electrified Net
      Spell(31486), -- Saw Blade
      Spell(31485), -- Super Shrink Ray
    },
  },
  {
    name = "��������ɪ��˹",
    desc = "��������ɪ��˹������ˮ���������ؿߵĵ�����boss.",
    --icon = true,
    creature = 17798,
    display = 20235,
    coords = {0.806, 0.434, 1},
    loot = {{30550,H5},27805,27738,27799,27806,27737,27804,{30549,H5},27795,27475,{30551,H5},27801,{29351,H5},27510,28203,27874,24313,{29463,H5},{30543,H5},{29243,H5},{23572,H5},},
    sections = {
      Spell(55095, {flag1 = DISEASE}), -- Frost Fever
      Spell(16172), -- Head Crack
      Spell(31589, {flag1 = MAGIC}), -- Slow
      Spell(31534), -- Spell Reflection
      Spell(37081), -- Warlord's Rage
      Spell(36453), -- Warlord's Rage
    },
  },
})

table.insert(db, THE_STEAMVAULT)
