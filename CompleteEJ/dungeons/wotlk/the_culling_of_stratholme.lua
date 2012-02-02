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

local THE_CULLING_OF_STRATHOLME = CreateInstance({
  name = "The Culling of Stratholme",
  desc = "Located in the eastern part of Tanaris, the Caverns of Time contain various portals to different key time periods and events in Warcraft history. The caverns act as a crossroads for the various timelines; through them one can travel back and forth across time. The Caverns of Time are home to the  and the bronze dragonflight. Recently, a mysterious force called the Infinite Dragonflight has begun to meddle with time--the bronze dragonflight is recruiting heroes to make sure that the events that took place in the past remain as they were. The Culling of Stratholme is one of the timeways (\"wings\") accessible in the Caverns of Time. It is centered around helping Prince Arthas purge the city of Stratholme from the grain-infected populace. It is one of the first acts in Arthas' descent into madness and evil.",
  --texture = "TheCullingofStratholme",
  area = 521,
}, {
  {
    name = "Meathook",
    desc = "Meathook is an abomination and the first boss of the Culling of Stratholme, a wing of the Caverns of Time. He spawns after five trash waves have been defeated.",
    --icon = true,
    creature = 26529,
    display = 26579,
    coords = {0.524, 0.622, 2},
    loot = {{37678,H5},{37079,N5},{37675,H5},{37082,N5},{37679,H5},{37680,H5},{37081,N5},{37083,N5},},
    sections = {
      Spell(52696, {fbd = N5}), -- Constricting Chains
      Spell(58823, {fbd = H5}), -- Constricting Chains
      Spell(52666, {fbd = N5}), -- Disease Expulsion
      Spell(58824, {fbd = H5}), -- Disease Expulsion
      Spell(58841, {fbd = H5}), -- Frenzy
    },
  },
  {
    name = "Salramm the Fleshcrafter",
    desc = "Salramm the Fleshcarver, a member of the Cult of the Damned, is the second boss in the Caverns of Time: Culling of Stratholme. He spawns after ten trash waves have been defeated.",
    --icon = true,
    creature = 26530,
    display = 26581,
    coords = {0.602, 0.442, 2},
    loot = {{37681,H5},{37084,N5},{37683,H5},{37095,N5},{37682,H5},{37684,H5},{37086,N5},{37088,N5},},
    sections = {
      Spell(58845, {fbd = H5, flag1 = CURSE}), -- Curse of Twisted Flesh
      Spell(52480, {fbd = N5}), -- Explode Ghoul
      Spell(58825, {fbd = H5}), -- Explode Ghoul
      Spell(57725, {fbd = N5}), -- Shadow Bolt
      Spell(58827, {fbd = H5}), -- Shadow Bolt
      Spell(52712), -- Steal Flesh
      Spell(52711), -- Steal Flesh
      Spell(52708), -- Steal Flesh
      Spell(52451), -- Summon Ghouls
    },
  },
  {
    name = "Chrono-Lord Epoch",
    desc = "Chrono-Lord Epoch is the third boss in The Culling of Stratholme. He is a highly-ranked member of the Infinite Dragonflight.",
    --icon = true,
    creature = 26532,
    display = 26580,
    coords = {0.660, 0.268, 2},
    loot = {{37685,H5},{37099,N5},{37686,H5},{37106,N5},{37688,H5},{37687,H5},{37105,N5},{37096,N5},},
    sections = {
      Spell(52772, {flag1 = CURSE}), -- Curse of Exertion
      Spell(58848, {fbd = H5}), -- Time Stop
      Spell(52766), -- Time Warp
      Spell(52771, {fbd = N5}), -- Wounding Strike
      Spell(58830, {fbd = H5}), -- Wounding Strike
    },
  },
  {
    name = "Mal'Ganis",
    desc = "Mal'Ganis is the final boss of the Culling of Stratholme, a wing of the Caverns of Time.",
    --icon = true,
    creature = 26533,
    display = 26582,
    --coords = {x, y, level},
    loot = {},
    sections = {
      Spell(52720, {fbd = N5}), -- Carrion Swarm
      Spell(58852, {fbd = H5}), -- Carrion Swarm
      Spell(52722, {fbd = N5}), -- Mind Blast
      Spell(58850, {fbd = H5}), -- Mind Blast
      Spell(58849, {fbd = H5}), -- Sleep
      Spell(52721, {fbd = N5, flag1 = MAGIC}), -- Sleep
      Spell(52723, {flag1 = MAGIC}), -- Vampiric Touch
    },
  },
  {
    name = "Infinite Corruptor",
    --desc = "",
    --icon = true,
    creature = 32273,
    display = 19326,
    coords = {0.510, 0.420, 2},
    loot = {{43951,H5},},
    sections = {
      Spell(60588, {fbd = H5}), -- Corrupting Blight
      Spell(60590, {fbd = H5}), -- Void Strike
    },
  },
})

table.insert(db, THE_CULLING_OF_STRATHOLME)
