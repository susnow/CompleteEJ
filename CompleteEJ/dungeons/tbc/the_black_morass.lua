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

local THE_BLACK_MORASS = CreateInstance({
  name = "The Black Morass",
  desc = "Located in the eastern part of Tanaris, the Caverns of Time (CoT) contain various portals to different key time periods and events in Warcraft history. The caverns act as a crossroads for the various timelines--through them one can travel back and forth along the ebb and flow of time. The Caverns of Time are home to the Brood of Nozdormu and the bronze dragonflight. It is their sacred charge to guard the caverns against the intrusion of mortals, whose interference would assuredly disrupt the flow of time. Recently, a mysterious force called the Infinite Dragonflight has begun to meddle with time. The Black Morass is one of the timeways accessible in the Caverns of Time. In this wing, a group of players must defend the last Guardian Medivh, in a swamp known as The Black Morass. The Guardian Medivh, possessed by Sargeras, attempts to open the Dark Portal to Draenor, while wave upon wave of dragonkin of the Infinite Dragonflight attempt to defeat Medivh in order to alter time and halt the invasion of Azeroth from Draenor. In 4.2, its attunement process was removed and it no longer requires you to run a prior CoT instance.",
  --texture = "TheBlackMorass",
  area = 733,
}, {
  {
    name = "Chrono Lord Deja",
    desc = "Chrono Lord Deja is the first boss of the Caverns of Time: The Black Morass encounter. He spawns upon the opening of the sixth portal. He is a drakonid of the Infinite Dragonflight.",
    --icon = true,
    creature = 17879,
    display = 20513,
    coords = {0.438, 0.612, 1},
    loot = {{30558,H5},27993,27988,27995,27996,{30556,H5},27994,27987,{30555,H5},},
    sections = {
      Spell(31457, {fbd = N5}), -- Arcane Blast
      Spell(38538, {fbd = H5}), -- Arcane Blast
      Spell(38539, {fbd = H5}), -- Arcane Discharge
      Spell(31472, {fbd = N5}), -- Arcane Discharge
      Spell(38540, {fbd = H5}), -- Attraction
      Spell(31550), -- Banish Dragon Helper
      Spell(31467, {flag1 = MAGIC}), -- Time Lapse
    },
  },
  {
    name = "Temporus",
    desc = "Temporus is the second boss of the Caverns of Time: The Black Morass encounter. He is a drake of the Infinite Dragonflight that spawns upon the opening of the 12th portal.",
    --icon = true,
    creature = 17880,
    display = 19066,
    coords = {0.500, 0.540, 1},
    loot = {{30556,H5},28034,28033,28185,28186,{30558,H5},28187,28184,{30555,H5},},
    sections = {
      Spell(31550), -- Banish Dragon Helper
      Spell(55095, {fbd = H5, flag1 = DISEASE}), -- Frost Fever
      Spell(31458, {flag1 = MAGIC}), -- Hasten
      Spell(31464), -- Mortal Wound
      Spell(31589, {fbd = H5, flag1 = MAGIC}), -- Slow
      Spell(38592, {fbd = H5}), -- Spell Reflection
      Spell(38593, {fbd = H5}), -- Wing Buffet
      Spell(31475, {fbd = N5}), -- Wing Buffet
    },
  },
  {
    name = "Aeonus",
    desc = "Aeonus is a dragon of the Infinite Dragonflight, and the final boss of Caverns of Time: The Black Morass. He spawns from the 18th and final portal.",
    --icon = true,
    creature = 17881,
    display = 20510,
    coords = {0.448, 0.626, 1},
    loot = {{30555,H5},27509,27839,28206,28192,28190,{30558,H5},28194,28193,{30556,H5},28189,{29356,H5},28188,28207,27873,27977,{23572,H5},{30531,H5},{29253,H5},{29247,H5},},
    sections = {
      Spell(31550), -- Banish Dragon Helper
      Spell(40504), -- Cleave
      Spell(37853), -- Corrupt Medivh
      Spell(37605), -- Enrage
      Spell(39049, {fbd = H5}), -- Sand Breath
      Spell(31473, {fbd = N5}), -- Sand Breath
      Spell(31422), -- Time Stop
    },
  },
})

table.insert(db, THE_BLACK_MORASS)
