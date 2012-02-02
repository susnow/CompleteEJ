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
  name = "The Oculus",
  desc = "The Nexus, a dungeon hub, is an ancient ice fortress found in the center of Coldarra, in Northrend's Borean Tundra. It is a column of magical energy surrounded by levitating earth-covered rings with ice caves underneath. The Nexus is an extensive series of caves and tunnels under Coldarra, containing wings leading to two 5 man dungeons and one 25 man raid. The Oculus is a high level 5 man dungeon located within the Nexus. It is unique because it allows each player to control flying drakes with specific roles (tanking, healing, damage dealing) to complete the dungeon.",
  --texture = "TheOculus",
  area = 528,
}, {
  {
    name = "Drakos the Interrogator",
    desc = "Drakos the Interrogator is the first boss located in The Oculus. After killing him, players are able to access the drakes and fly around.",
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
    name = "Varos Cloudstrider",
    desc = "Varos Cloudstrider is the second boss in located in The Oculus. Players access the boss by flying to his platform after killing three platforms of trash.",
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
    name = "Mage-Lord Urom",
    desc = "Mage-Lord Urom, a powerful human mage who serves Malygos is the third boss of The Oculus. He's located at first on a little platform, but he quickly ports away and summons a series of (beasts, elementals or humanoids); he do this 3 times until going on the central ring, where the real fight starts.",
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
    name = "Ley-Guardian Eregos",
    desc = "Ley-Guardian Eregos is the final boss in The Oculus. There are several achievements linked to him: Amber Void, Emerald Void, Make It Count, Ruby Void.",
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
