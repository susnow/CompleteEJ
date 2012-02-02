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

local THE_STOCKADE = CreateInstance({
  name = "The Stockade",
  desc = "The Stockade is a high-security prison complex, hidden beneath the canal district of Stormwind City. Presided over by Warden Thelwater, the Stockade is home to petty crooks, political insurgents, murderers and a score of the most dangerous criminals in the land. Recently, a prisoner-led revolt has resulted in a state of pandemonium within the Stockades - where the guards have been overthrown and the convicts roam free.\n\nWarden Thelwater has managed to defend himself, and is currently enlisting brave thrill-seekers to venture into the prison and put down the uprising, thought to have been instigated by some new prisoners - the terrifying menace known only as \"Hogger\" and his violent Riverpaw pack of gnolls.",
  texture = "TheStockade",
  area = 690,
  dflag = N5,
}, {
  {
    name = "Randolph Moloch",
    desc = "Randolph Moloch is the leader of the rebellious human convicts in the Stockade. He is considered the first boss of the dungeon, located at the end of the main tunnel.",
    --icon = true,
    creature = 46383,
    display = 35068,
    coords = {0.500, 0.215, 1},
    loot = {63346,63345,},
    sections = {
      Spell(86729, {so = true}), -- Sweep
      Spell(86726, {so = true}), -- Wildly Stabbing
      Spell(55964, {so = true, desc = "Occasionally vanishes from sight for 2.5 seconds, gaining the element of surprise."}), -- Vanish
    },
  },
  {
    name = "Lord Overheat",
    desc = "Lord Overheat is the leader of the fire elementals emerging in the Stockades after the earthquakes brought by the Shattering. He is considered the second boss of the dungeon, found at the end of its right wing.",
    --icon = true,
    creature = 46264,
    display = 1204,
    coords = {0.783, 0.458, 1},
    loot = {5967,},
    sections = {
      Spell(12466, {so = true, desc = "Inflicts 99 to 116 Fire damage to an enemy."}), -- Fireball
      Spell(86636, {so = true}), -- Rain of Fire
      Spell(86633, {so = true, flag1 = MAGIC}), -- Overheat
    },
  },
  {
    name = "Hogger",
    desc = "Hogger the gnoll king has finally been captured by the forces of Stormwind aided by brave adventurers. He is now the most dangerous prisoner in the Stockades, riling up the other gnolls there, and threatening the peace in Stormwind itself.",
    --icon = true,
    creature = 46254,
    display = 501,
    coords = {0.218, 0.265, 1},
    loot = {1959,},
    sections = {
      Spell(86604, {so = true}), -- Vicious Slice
      Spell(86620, {so = true}), -- Maddening Call
      Spell(86736, {so = true, desc = "After 45% health, Hogger will enrage and attack 30% faster and deal 10% more damage.", flag1 = HEALER}), -- Enrage
    },
  },
})

table.insert(db, THE_STOCKADE)
