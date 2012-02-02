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

local AUCHENAI_CRYPTS = CreateInstance({
  name = "Auchenai Crypts",
  desc = "Auchindoun is a former draenei holy site and Horde fortress in the middle of the Bone Wastes in Outland's Terokkar Forest. It was a hallowed ground until the Shadow Council took over, summoned an extremely powerful demon as old as time itself, and destroyed half of Terokkar Forest in the process. Different factions now vie for power in this magical spot: Ethereals suck the arcane energy from the Mana-Tombs, the Burning Legion harvests souls inside the Auchenai Crypts, arakkoa zealots work dark magic in the Sethekk Halls, and the Shadow Council plots its domination of Outland from within the Shadow Labyrinth. Auchenai Crypts is a wing of Auchindoun and its entrance can be found to the west of the Ring of Observance.",
  --texture = "AuchenaiCrypts",
  area = 722,
}, {
  {
    name = "Shirrak the Dead Watcher",
    desc = "Shirrak the Dead Watcher is the first boss found in Auchenai Crypts.",
    --icon = true,
    creature = 18371,
    display = 18916,
    coords = {0.462, 0.644, 2},
    loot = {{27409,N5},{27408,N5},{25964,N5},{27493,H5},{27866,H5},{27410,N5},{27846,H5},{26055,N5},{27865,H5},{30586,H5},{27845,H5},{27847,H5},{30588,H5},{30587,H5},},
    sections = {
      Spell(32265), -- Attract Magic
      Spell(39382, {fbd = H5}), -- Carnivorous Bite
      Spell(36383, {fbd = N5}), -- Carnivorous Bite
      Spell(32264), -- Inhibit Magic
    },
  },
  {
    name = "Exarch Maladaar",
    desc = "Exarch Maladaar, the leader of the Auchenai Death Cult is the second and final boss found in Auchenai Crypts.",
    --icon = true,
    creature = 18373,
    display = 17715,
    coords = {0.738, 0.500, 2},
    loot = {{27413,N5},{29257,H5},{27414,N5},{27411,N5},{29354,H5},{27416,N5},{27412,N5},{27523,H5},{23572,H5},{27415,N5},{27871,H5},{29244,H5},{27869,H5},{27870,H5},{30588,H5},{27867,H5},{27872,H5},{30586,H5},{30587,H5},},
    sections = {
      Spell(88735, {fbd = H5}), -- Ribbon of Souls
      Spell(32422, {fbd = N5}), -- Ribbon of Souls
      Spell(32421), -- Soul Scream
      Spell(32346), -- Stolen Soul
      Spell(32424), -- Summon Avatar
    },
  },
})

table.insert(db, AUCHENAI_CRYPTS)
