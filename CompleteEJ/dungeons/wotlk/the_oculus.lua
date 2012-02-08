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

local THE_OCULUS = CreateInstance({
  name = "ħ��",
  desc = "ħ��λ�ڱ���̦ԭ�������Ŀ������ߵص����ģ����������ŵ��ϳ���ħ�����������ſ���ħ������Ҫ����������Ҳ��������λ���������Ľ��졣����֮��������˹������֮�󣬺������������������������ħ�������ָ�ӹ���ħ���ػ��߰��׹�˹�����ڰ��׹�˹������ħ�����Ͽգ�ð�����Ǳ���Ҫ�ȴ���Ѷ�ߴ��˹���Ͼȳ���λ�����������죬�ٽ��þ�����������ܰ��׹�˹.",
  --texture = "TheOculus",
  area = 528,
}, {
  {
    name = "��Ѷ�ߴ��˹",
    desc = "������Ѷ�ߴ��˹��,��ҾͿ��Խ�ȳ�����Ѻ������������������,����ʹ�ò�ͬ�ķ�����������ɽ�������ս��.",
    --icon = true,
    creature = 27654,
    display = 27032,
    coords = {0.494, 0.780, 1},
    loot = {{37258,H5},{36946,N5},{37255,H5},{36945,N5},{37256,H5},{37257,H5},{36943,N5},{36944,N5},},
    sections = {
      Spell(51336), -- Magic Pull
      Spell(50774, {fbd = N5}), -- Thundering Stomp
      Spell(59370, {fbd = H5, flag1 = MAGIC}), -- Thundering Stomp
    },
  },
  {
    name = "�߶���˹���ƻ�",
    desc = "�߶���˹���ƻ� �������ŵ�����,��������ħ�������Ĳ�,����������ҽ�һ�����ƽ�.",
    --icon = true,
    creature = 27447,
    display = 27033,
    coords = {0.462, 0.212, 2},
    loot = {{37261,H5},{36947,N5},{37260,H5},{36949,N5},{37262,H5},{37263,H5},{36948,N5},{36950,N5},},
    sections = {
      Spell(59371, {fbd = H5, flag1 = MAGIC}), -- Amplify Magic
      Spell(51054, {fbd = N5, flag1 = MAGIC}), -- Amplify Magic
      Spell(51008), -- Call Azure Ring Captain
      Spell(51007), -- Call Azure Ring Captain
      Spell(51002), -- Call Azure Ring Captain
      Spell(51006), -- Call Azure Ring Captain
      Spell(50053), -- Centrifuge Shield
      Spell(50785, {fbd = N5}), -- Energize Cores
      Spell(59372, {fbd = H5}), -- Energize Cores
    },
  },
  {
    name = "��ʦ��������ķ",
    desc = "��Ȼ��������Ϊ�����ǰ���ħ��,��ô��������һ���Է�������Ϊ����BOSS���־Ͳ���ʲô��ֵ�������.��ʦ��������ķ,������ħ��ǰ�������ͨ��.",
    --icon = true,
    creature = 27655,
    display = 25010,
    coords = {0.372, 0.342, 4},
    loot = {{37289,H5},{36953,N5},{37195,H5},{36954,N5},{37288,H5},{37264,H5},{36951,N5},{36952,N5},},
    sections = {
      Spell(53813), -- Arcane Shield
      Spell(59377, {fbd = H5, flag1 = MAGIC}), -- Empowered Arcane Explosion
      Spell(51110, {fbd = N5, flag1 = MAGIC}), -- Empowered Arcane Explosion
      Spell(58025, {fbd = H5}), -- Frost Buffet
      Spell(51103), -- Frostbomb
      Spell(50495), -- Summon Menagerie
      Spell(50496), -- Summon Menagerie
      Spell(50476), -- Summon Menagerie
      Spell(51112), -- Teleport
      Spell(59376, {fbd = H5}), -- Time Bomb
      Spell(51121, {fbd = N5}), -- Time Bomb
    },
  },
  {
    name = "ħ���ػ��߰��׹�˹",
    desc = "�ڻ�����ʦ��������ķ֮��ħ���ػ��߰��׹�˹�ͻ���ֲ�����ħ��������з��У������Ҫʹ�÷��������������ʹ�÷�������������ȥ������.",
    --icon = true,
    creature = 27656,
    display = 27034,
    coords = {0.404, 0.188, 4},
    loot = {{37292,H5},{36971,N5},{37291,H5},{37294,H5},{36973,N5},{37360,H5},{37363,H5},{37362,H5},{36972,N5},{43102,H5},{37293,H5},{36961,N5},{36962,N5},{37361,H5},41798,{36975,N5},{36969,N5},{36974,N5},},
    sections = {
      Spell(50804, {fbd = N5}), -- Arcane Barrage
      Spell(59381, {fbd = H5}), -- Arcane Barrage
      Spell(59382, {fbd = H5}), -- Arcane Volley
      Spell(51153, {fbd = N5}), -- Arcane Volley
      Spell(51170), -- Enraged Assault
      Spell(57959, {fbd = H5}), -- Planar Anomalies
      Spell(51162, {fbd = H5}), -- Planar Shift
    },
  },
})

table.insert(db, THE_OCULUS)
