local addonName, databank = ...
databank[1] = {} -- dungeons
databank[2] = {} -- raids

-- Read from the DBC files (must keep updated to avoid overlapping with Blizzards own indexes)
local LAST_DUNGEON_INDEX = 14
local LAST_RAID_INDEX = 6
local LAST_INSTANCE = 187
local LAST_ENCOUNTER = 342
local LAST_CREATURE = 914
local LAST_SECTION = 4507
local LAST_ITEM = 6302
local OFFSET = 1
local START_INDEX = OFFSET + LAST_DUNGEON_INDEX
local START_INSTANCE = OFFSET + LAST_INSTANCE
local START_ENCOUNTER = OFFSET + LAST_ENCOUNTER
local START_CREATURE = OFFSET + LAST_CREATURE
local START_SECTION = OFFSET + LAST_SECTION
local START_ITEM = OFFSET + LAST_ITEM

-- Custom texture base location
local BACK_TEX = "Interface\\Addons\\"..addonName.."\\textures\\BACK-%s"
local DBTN_TEX = "Interface\\Addons\\"..addonName.."\\textures\\DBTN-%s"
local LORE_TEX = "Interface\\Addons\\"..addonName.."\\textures\\LORE-%s"
local BOSS_TEX = "Interface\\Addons\\"..addonName.."\\textures\\BOSS-%s"

-- Difficulty indexes and names
local N5, H5 = 1, 2
local N10, N25 = 1, 2
local H10, H25 = 3, 4
local RF = 5

local modeNames = {
  [0] = "",
  [N5] = "Normal",
  [H5] = "Heroic",
  [N10] = "Normal",
  [N25] = "Normal",
  [H10] = "Heroic",
  [H25] = "Heroic",
  [RF] = "Raid Finder",
}

-- Setting the EJ difficulty options
local EJ_DIFF_DUNGEON_TBL = {
	[1] = {enumValue = N5, size = 5, prefix = PLAYER_DIFFICULTY1},
	[2] = {enumValue = H5, size = 5, prefix = PLAYER_DIFFICULTY2},
}

local EJ_DIFF_RAID_TBL = {
	[1] = {enumValue = RF, size = 25, prefix = PLAYER_DIFFICULTY3},
	[2] = {enumValue = N10, size = 10, prefix = PLAYER_DIFFICULTY1},
	[3] = {enumValue = H10, size = 10, prefix = PLAYER_DIFFICULTY2},
	[4] = {enumValue = N25, size = 25, prefix = PLAYER_DIFFICULTY1},
	[5] = {enumValue = H25, size = 25, prefix = PLAYER_DIFFICULTY2},
}

local EJ_DIFF_DUNGEON_CUSTOM_TBL = {
  [1] = {
    [1] = {enumValue = N5, size = 5, prefix = PLAYER_DIFFICULTY1},
  },
  [2] = {
    [1] = {enumValue = N5, size = 5, prefix = PLAYER_DIFFICULTY1},
    [2] = {enumValue = H5, size = 5, prefix = PLAYER_DIFFICULTY2},
  },
  [3] = {
    [1] = {enumValue = N5, size = 5, prefix = PLAYER_DIFFICULTY1},
    [2] = {enumValue = H5, size = 5, prefix = PLAYER_DIFFICULTY2},
  },
}

local EJ_DIFF_RAID_CUSTOM_TBL = {
  [1] = {
    [1] = {enumValue = N10, size = 10, prefix = PLAYER_DIFFICULTY1},
  },
  [2] = {
    [1] = {enumValue = N25, size = 25, prefix = PLAYER_DIFFICULTY1},
  },
  [3] = {
    [1] = {enumValue = N10, size = 10, prefix = PLAYER_DIFFICULTY1},
    [2] = {enumValue = N25, size = 25, prefix = PLAYER_DIFFICULTY1},
  },
}

-- Tooltip spell scanning
local tips = {}
do
  local skippableLines = {
    MELEE_RANGE,
    SPELL_CAST_CHANNELED,
    SPELL_CAST_TIME_INSTANT,
    SPELL_CAST_TIME_INSTANT_NO_MANA,
    SPELL_ON_NEXT_SWING,
    SPELL_RANGE_UNLIMITED,

    BALANCE_NEGATIVE_ENERGY_COST,
    BALANCE_POSITIVE_ENERGY_COST,
    ENERGY_COST,
    ENERGY_COST_PER_TIME,
    FOCUS_COST,
    FOCUS_COST_PER_TIME,
    HEALTH_COST,
    HEALTH_COST_PER_TIME,
    HOLY_POWER_COST,
    MANA_COST,
    MANA_COST_PER_TIME,
    RAGE_COST,
    RAGE_COST_PER_TIME,
    RUNIC_POWER_COST,
    RUNIC_POWER_COST_PER_TIME,
    SPELL_CAST_TIME_MIN,
    SPELL_CAST_TIME_SEC,
    SPELL_EQUIPPED_ITEM,
    SPELL_RANGE,
    SPELL_REAGENTS.."%s",
    SPELL_TOTEMS.."%s",
  }
  for i = 1, #skippableLines do
    skippableLines[i] = "^"..skippableLines[i]:gsub("%%s", "%(%.+%)"):gsub("%%d", "%(%%d+%)"):gsub("%%%.3g", "%(%.+%)").."$"
  end
  local spellCache = {}
  local function spellCheck(tt, spellID)
    if spellCache[spellID] then
      tt.busy = nil
      return spellCache[spellID]
    end
    tt:SetHyperlink("spell:"..spellID)
    local labels, label, temp, skip = tt.labels, ""
    for i = 2, tt:NumLines() do -- skip title of the spell, we already know it!
      temp = labels[i]:GetText()
      if temp then
        skip = nil
        for j = 1, #skippableLines do
          if temp:match(skippableLines[j]) then
            skip = 1
            break
          end
        end
        if not skip then
          label = label .. temp .. "\n"
        end
      end
    end
    if label:len() > 1 then
      label = label:trim()
      spellCache[spellID] = label
      tt.busy = nil
      return label
    else
      tt.busy = nil
    end
  end
  local tipStack = {}
  function tips.GetTooltip()
    for _, tt in pairs(tipStack) do
      if not tt.busy then
        tt.busy = 1
        tt:SetOwner(WorldFrame, "ANCHOR_NONE")
        tt:ClearLines()
        return tt
      end
    end
    local tip = CreateFrame("GameTooltip")
    tip.busy = 1
    tip:SetOwner(WorldFrame, "ANCHOR_NONE")
    tip.labels = {}
    for i = 1, 32 do
      tip.labels[i] = tip:CreateFontString()
      tip:AddFontStrings(tip.labels[i], tip:CreateFontString())
    end
    tip.Spell = function(spellID) return spellCheck(tip, spellID) end
    table.insert(tipStack, tip)
    return tip
  end
end

-- Load item from server
local function ReloadItem(item)
  local name, link, quality, _, _, _, subclass, _, _, texture = GetItemInfo(item[5])
  if name then
    item[1] = "|c"..select(4, GetItemQualityColor(quality))..name.."|r"
    item[2] = texture
    item[4] = subclass
    item[6] = link
    item.load = nil
  end
  return item
end

-- Get data structure for a stage/phase/creature
function databank.Stage(fields)
  return {
    texture = fields.icon or "",
    name = fields.name or "",
    desc = fields.desc or "",
    stype = fields.stype or 0, -- 0: phase, 1: creature, 2: ability
    display = fields.display or 0,
    firstchild = fields.fc or nil,
    filterbydiff = fields.fbd or 0,
    link = fields.stype == 1 and tostring(fields.name) or "", -- "|cff71d5ff|H"..("unit:0xF53%05X00000000"):format(tonumber(fields.creature) or 0).."|h["..tostring(fields.name).."]|h|r"
    startopen = fields.so and true or false,
    flag1 = fields.flag1 or nil, -- 0: tank, 1: dps, 2: healer, 3: heroic, 4: deadly, 5: important, 6: interruptable, 7: magic, 8: curse, 9: poison, 10: disease, 11: enrage, 12: enrage
    flag2 = fields.flag2 or nil,
    flag3 = fields.flag3 or nil,
    flag4 = fields.flag4 or nil,
    sections = fields.sections or nil,
  }
end

-- Get spell information and create a section out from it (i.e. boss ability)
function databank.Spell(spellID, fields, override, inherit)
  assert(tonumber(spellID), "Invalid spellID specified, expected number but got \""..tostring(spellID).."\"")
  local name, _, icon, _, chan, _, ctime, _, range = GetSpellInfo(spellID)
  assert(name, "Invalid spellID specified because GetSpellInfo("..tostring(spellID)..") returned nil. Is the spellID correct?")
  local extra = ""
  if ctime and ctime > 1000 then extra = extra..format("%.1f sec cast, ", ctime/1000) end -- miliseconds
  if chan then extra = extra.."Channeled, " end
  local spell = {
    texture = (type(fields) == "table" and fields.icon) or icon or "",
    name = format("%s%s", name, extra:len() > 0 and " |cff999999("..extra:sub(1, extra:len()-2)..")|r" or ""),
  }
  if type(fields) == "table" then
    for k, v in pairs(fields) do
      if not spell[k] then
        spell[k] = v
      elseif spell[k] and override then
        spell[k] = v
      end
    end
  end
  spell.stype = spell.stype or 2
  spell.display = spell.display or 0
  spell.filterbydiff = (fields and fields.fbd) or spell.filterbydiff or 0
  spell.link = (spell.link or ""):len() > 0 or (name and "|cff71d5ff|Hspell:"..spellID.."|h["..name.."]|h|r") or ""
  spell.startopen = (fields and fields.so and true) or spell.startopen or false
  spell.flag1 = spell.flag1 or nil
  spell.flag2 = spell.flag2 or nil
  spell.flag3 = spell.flag3 or nil
  spell.flag4 = spell.flag4 or nil
  if type(inherit) == "table" then
    for k, v in pairs(inherit) do
      spell[k] = v
    end
  end
  if not spell.desc then
    spell.desc = tips.GetTooltip().Spell(spellID)
  end
  if (spell.desc or ""):len() == 0 then
    spell.load, spell.spellID, spell.fields, spell.override = 1, spellID, fields, override
    return spell
  else
    spell.load, spell.spellID, spell.fields, spell.override = nil
  end
  return spell
end

-- Pointers for quicker access and better performance
local CustomInstanceAreaIDs = {}
local CustomMapEncountersByAreaID = {}
local CustomInstanceByID = {}
local CustomEncounterByID = {}

-- Recursively parses sections and their subsections
local function RecursiveSectionParse(storage, sections, level, parentId)
  if type(sections) ~= "table" then return end
  local sec
  for i = 1, #sections do
    sec = sections[i]
    sec.id = START_SECTION
    START_SECTION = START_SECTION + 1
    sec.level = level + 1
    sec.parentId = parentId
    table.insert(storage, sec)
    RecursiveSectionParse(storage, sec.sections, level + 1, sec.id)
  end
end

-- Create a new instance with supplied information
function databank.CreateInstance(i, b)
  local areaId = tonumber(tostring(i.area)) or 0
  local inst = {
    name = i.name or "",
    desc = i.desc or "",
    area = areaId,
    dflag = i.dflag or nil,
    link = tostring(i.name) or "",
    back_tex = format(BACK_TEX, i.texture or i.back_tex or "Default"),
    dbtn_tex = format(DBTN_TEX, i.texture or i.dbtn_tex or "Default"),
    lore_tex = format(LORE_TEX, i.texture or i.lore_tex or "Default"),
    bosses = {
    },
  }
  inst.index = START_INDEX
  START_INDEX = START_INDEX + 1
  inst.id = START_INSTANCE
  START_INSTANCE = START_INSTANCE + 1
  local t, e, s
  for j = 1, #b do
    t = b[j]
    e = {
      name = t.name or "",
      desc = t.desc or "",
      link = t.link or tostring(t.name) or "",
      creature = t.creature or 0,
      display = t.display or 38562, -- present as fallback
      icon = t.icon and (t.icon == true and format(BOSS_TEX, t.name) or t.icon) or nil,
      coords = t.coords or nil,
      adds = {
      },
      loot = {
      },
      sections = {
      },
    }
    if type(t.adds) == "table" then
      local a
      for k = 1, #t.adds do
        a = t.adds[k]
        table.insert(e.adds, {
          name = a.name or "",
          desc = a.desc or "",
          creature = a.creature or 0,
          display = a.display or 38562, -- present as fallback
          icon = a.icon and (a.icon == true and format(BOSS_TEX, a.name) or a.icon) or nil,
        })
      end
    end
    if type(t.loot) == "table" then
      local name, link, quality, subclass, texture, mode
      for k = 1, #t.loot do
        s = t.loot[k]
        if type(s) == "table" then
          s, mode = unpack(s)
        else
          mode = nil
        end
        name, link, quality, _, _, _, subclass, _, _, texture = GetItemInfo(s)
        if name then
          table.insert(e.loot, {
            "|c"..select(4, GetItemQualityColor(quality))..name.."|r",
            texture,
            modeNames[mode or 0],
            subclass,
            s,
            link,
            START_ENCOUNTER,
            id = START_ITEM,
          })
        else
          table.insert(e.loot, {
            "|cff999999Loading item "..s.."...|r",
            "Interface\\Icon\\Temp",
            modeNames[mode or 0],
            "",
            s,
            "",
            START_ENCOUNTER,
            id = START_ITEM,
            load = 1,
          })
        end
        START_ITEM = START_ITEM + 1
      end
    end
    if type(t.sections) == "table" then
      local sections = {}
      RecursiveSectionParse(sections, t.sections, 0)
      local refers = {}
      local plevel, clevel = 1
      for l = 1, #sections do
        sec = sections[l]
        clevel = sec.level
        for m = l+1, #sections do
          ssec = sections[m]
          if (not sections[l].firstchild) then
            if ssec.level == clevel + 1 then
              if sec.id == ssec.parentId then -- attempt to fix children nodes, to only display under their correct parents (spellA, stage, spellB, spellB would show as a sub-spell for spellA, with this fix it won't)
                sections[l].firstchild = ssec.id -- child node
              end
            end
          end
          if ssec.level < clevel then
            break -- not on our level anymore
          elseif (not refers[l]) and ssec.level == clevel then
            refers[l] = ssec.id or nil -- next node in line
          end
        end
        plevel = clevel
      end
      for x, y in pairs(refers) do
        sections[x].nextIndex = y
      end
      for i = 1, #sections do
        table.insert(e.sections, sections[i])
      end
    end
    e.index = START_ENCOUNTER
    e.id = START_ENCOUNTER
    START_ENCOUNTER = START_ENCOUNTER + 1
    table.insert(inst.bosses, e)
    CustomEncounterByID[e.id] = e
    if areaId > 0 and type(e.coords) == "table" then
      local x, y, level = unpack(e.coords)
      x, y, level = tonumber(x) or 0, tonumber(y) or 0, tonumber(level) or 1
      if x > 0 and y > 0 then
        CustomMapEncountersByAreaID[areaId] = CustomMapEncountersByAreaID[areaId] or {}
        table.insert(CustomMapEncountersByAreaID[areaId], {
          x = x,
          y = y,
          instId = inst.id,
          name = e.name,
          desc = e.desc,
          encId = e.id,
          sectId = e.sections[1] and e.sections[1].id or 0,
          link = e.link,
          level = level,
        })
      end
    end
  end
  if areaId > 0 then
    CustomInstanceAreaIDs[areaId] = inst.id
  end
  CustomInstanceByID[inst.id] = inst
  return inst
end

-- Backup original API and create our own to handle custom instances
local oEJ_InstanceIsRaid = EJ_InstanceIsRaid
local oEJ_GetInstanceByIndex = EJ_GetInstanceByIndex
local oEJ_SelectInstance = EJ_SelectInstance
local oEJ_GetInstanceInfo = EJ_GetInstanceInfo
local oEJ_GetEncounterInfoByIndex = EJ_GetEncounterInfoByIndex
local oEJ_GetCreatureInfo = EJ_GetCreatureInfo
local oEJ_SelectEncounter = EJ_SelectEncounter
local oEJ_GetEncounterInfo = EJ_GetEncounterInfo
local oEJ_GetSectionInfo = EJ_GetSectionInfo
local oEJ_GetNumLoot = EJ_GetNumLoot
local oEJ_GetLootInfoByIndex = EJ_GetLootInfoByIndex
--local oEJ_GetLootInfo = EJ_GetLootInfo
local oEJ_GetCurrentInstance = EJ_GetCurrentInstance
local oEJ_GetMapEncounter = EJ_GetMapEncounter
--local oEJ_GetSectionPath = EJ_GetSectionPath
--local oEJ_GetTierInfo = EJ_GetTierInfo
local oEJ_IsValidInstanceDifficulty = EJ_IsValidInstanceDifficulty

-- Keeps track of where we are
local selectedInstance, selectedEncounter
local selectedInstanceId, selectedEncounterId
local selectedInstanceIsRaid, selectedInstanceDFlag

local function SetEncounterJournalDifficulties(newDifficulty, onlyLabel)
  local diffList
  if selectedInstanceDFlag then
    diffList = EJ_InstanceIsRaid() and EJ_DIFF_RAID_CUSTOM_TBL[selectedInstanceDFlag] or EJ_DIFF_DUNGEON_CUSTOM_TBL[selectedInstanceDFlag] or {}
  else
    diffList = EJ_InstanceIsRaid() and EJ_DIFF_RAID_TBL or EJ_DIFF_DUNGEON_TBL
  end
  for _, entry in pairs(diffList) do
    if entry.enumValue == newDifficulty then
      EncounterJournal.encounter.info.difficulty:SetFormattedText(ENCOUNTER_JOURNAL_DIFF_TEXT, entry.size, entry.prefix)
      if not onlyLabel then
        --print("updateDropdown") -- TODO: update dropdown
      end
      break
    end
  end
end

local function GetInstanceByIndex(index)
  for catId, categories in pairs(databank) do
    if type(categories) == "table" then
      for _, instance in pairs(categories) do
        if instance.id == index then
          return instance, catId == 2, catId == 2 and N10 or N5, instance.dflag
        end
      end
    end
  end
end

local function GetInstanceById(id)
  return CustomInstanceByID[id]
end

local function GetEncounterByIndex(index)
  for _, categories in pairs(databank) do
    if type(categories) == "table" then
      for _, instance in pairs(categories) do
        for _, encounter in pairs(instance.bosses) do
          if encounter.id == index then
            return encounter
          end
        end
      end
    end
  end
end

local function GetEncounterById(id)
  return CustomEncounterByID[id]
end

function EJ_InstanceIsRaid()
  if type(selectedInstanceIsRaid) == "boolean" then
    return selectedInstanceIsRaid
  end
  return oEJ_InstanceIsRaid()
end

function EJ_GetInstanceByIndex(index, isRaid)
  local temp = {oEJ_GetInstanceByIndex(index, isRaid)}
  if #temp > 0 then return unpack(temp) end
  local catIndex = isRaid and 2 or 1
  local category = databank[catIndex]
  local insIndex = index - (isRaid and LAST_RAID_INDEX or LAST_DUNGEON_INDEX)
  local instance = category[insIndex]
  if type(instance) ~= "table" then return end
  return 
    instance.id,
    instance.name,
    instance.desc,
    instance.back_tex,
    instance.dbtn_tex,
    instance.lore_tex,
    instance.area,
    instance.link
end

function EJ_SelectInstance(index)
  selectedInstance = nil
  selectedInstanceId = nil
  selectedInstanceIsRaid = nil
  selectedInstanceDFlag = nil
  if not index then return end
  local instance, isRaid, diffFlag, dFlag = GetInstanceByIndex(index)
  if instance then
    selectedInstance = index
    selectedInstanceId = instance.id
    selectedInstanceIsRaid = isRaid
    selectedInstanceDFlag = dFlag
    SetEncounterJournalDifficulties(diffFlag, diffFlag == EJ_GetDifficulty())
  elseif index and index <= LAST_INSTANCE then
    oEJ_SelectInstance(index)
  end
end

function EJ_GetInstanceInfo(index)
  if not selectedInstance then return oEJ_GetInstanceInfo(index) end
  local instance = GetInstanceById(selectedInstanceId)
  if type(instance) ~= "table" then return end
  return 
    instance.name,
    instance.desc,
    instance.back_tex,
    instance.dbtn_tex,
    instance.lore_tex,
    instance.area,
    instance.link
end

function EJ_GetEncounterInfoByIndex(index)
  if not selectedInstance then return oEJ_GetEncounterInfoByIndex(index) end
  local instance = GetInstanceById(selectedInstanceId)
  if type(instance) ~= "table" then return end
  local boss = instance.bosses[index]
  if type(boss) ~= "table" then return end
  return 
    boss.name,
    boss.desc,
    boss.id,
    boss.sections[1] and boss.sections[1].id or nil,
    boss.link
end

function EJ_GetCreatureInfo(index, bossIndex)
  if not selectedInstance then return oEJ_GetCreatureInfo(index, bossIndex) end
  local instance = GetInstanceById(selectedInstanceId)
  if type(instance) ~= "table" then return end
  bossIndex = bossIndex or selectedEncounter
  local boss = GetEncounterByIndex(bossIndex)
  if type(boss) ~= "table" then return end
  if index > 1 then
    if type(boss.adds) == "table" then
      local add = boss.adds[index - 1] -- index offset (minus boss himself)
      if type(add) == "table" then
        return add.creature, add.name, add.desc, add.display, add.icon
      end
    end
    return
  end
  return
    boss.creature,
    boss.name,
    boss.desc,
    boss.display,
    boss.icon
end

function EJ_SelectEncounter(index)
  selectedEncounter = nil
  selectedEncounterId = nil
  if type(index) ~= "number" then return end
  if not selectedInstance then
    if index and index <= LAST_ENCOUNTER then
      return oEJ_SelectEncounter(index)
    end
  else
    local boss = GetEncounterByIndex(index)
    if boss then
      selectedEncounter = index
      selectedEncounterId = boss.id
    elseif index and index <= LAST_ENCOUNTER then
      return oEJ_SelectEncounter(index)
    end
  end
end

function EJ_GetEncounterInfo(id)
  if not selectedInstance then return oEJ_GetEncounterInfo(id) end
  local boss
  if id then
    boss = GetEncounterById(id)
  elseif selectedEncounter then
    boss = GetEncounterById(selectedEncounterId)
  end
  if type(boss) ~= "table" then return "" end
  return
    boss.name,
    boss.desc,
    boss.id,
    boss.sections[1] and boss.sections[1].id or nil,
    boss.link
end

function EJ_GetSectionInfo(id)
  if (not selectedInstance) or (not selectedEncounter) then return oEJ_GetSectionInfo(id) end
  local boss = GetEncounterById(selectedEncounterId)
  if type(boss) ~= "table" or type(boss.sections) ~= "table" then return end
  local current, section, curIndex
  for i = 1, #boss.sections do
    current = boss.sections[i]
    if current.id == id then
      section = current
      curIndex = i
      break
    end
  end
  if type(section) ~= "table" then return end
  if section.load then
    local spellID = section.spellID
    section = databank.Spell(spellID, section.fields, section.override, section)
    if section.load then
      section.name = "Loading spell "..spellID..", refresh to update..."
    else
      --for k, v in pairs(section) do boss.sections[curIndex][k] = v end
      boss.sections[curIndex] = section
    end
  end
  local filter
  if section.filterbydiff > 0 then
    filter = section.filterbydiff ~= EJ_GetDifficulty() -- expected one difficulty, got another (meaning we hide this section)
  else
    filter = false
  end
  return 
    section.name,
    section.desc,
    section.stype,
    section.texture,
    section.display,
    section.nextIndex,
    section.firstchild,
    filter,
    section.link,
    section.startopen,
    section.flag1,
    section.flag2,
    section.flag3,
    section.flag4
end

function EJ_GetNumLoot()
  if (not selectedInstance) then return oEJ_GetNumLoot() end
  local count = 0
  if selectedEncounter then
    local boss = GetEncounterById(selectedEncounterId)
    if type(boss) ~= "table" or type(boss.loot) ~= "table" then return count end
    for _, _ in pairs(boss.loot) do
      count = count + 1
    end
  else
    local instance = GetInstanceById(selectedInstanceId)
    if type(instance) == "table" and type(instance.bosses) == "table" then
      local boss
      for i = 1, #instance.bosses do
        boss = instance.bosses[i]
        if type(boss) == "table" and type(boss.loot) == "table" then
          for _, _ in pairs(boss.loot) do
            count = count + 1
          end
        end
      end
    end
  end
  return count
end

function EJ_GetLootInfoByIndex(index)
  if (not selectedInstance) then return oEJ_GetLootInfoByIndex(index) end
  if selectedEncounter then
    local boss = GetEncounterById(selectedEncounterId)
    local item
    if type(boss) == "table" and type(boss.loot) == "table" then
      for i = 1, #boss.loot do
        if i == index then
          item = boss.loot[i]
          if item.load then
            item = ReloadItem(item)
          end
          return unpack(item)
        end
      end
    end
  else
    local instance = GetInstanceById(selectedInstanceId)
    if type(instance) == "table" and type(instance.bosses) == "table" then
      local realIndex, boss, item = 1
      for i = 1, #instance.bosses do
        boss = instance.bosses[i]
        if type(boss) == "table" and type(boss.loot) == "table" then
          for j = 1, #boss.loot do
            if realIndex == index then
              item = boss.loot[j]
              if item.load then
                item = ReloadItem(item)
              end
              return unpack(item)
            end
            realIndex = realIndex + 1
          end
        end
      end
    end
  end
end

--function EJ_GetLootInfo(id) end

function EJ_GetCurrentInstance()
  local instId = CustomInstanceAreaIDs[GetCurrentMapAreaID()]
  if instId then
    selectedInstance = instId -- TODO: shouldn't this be index?
    selectedInstanceId = instId
    return instId
  end
  return oEJ_GetCurrentInstance()
end

function EJ_GetMapEncounter(index)
  local bosses = CustomMapEncountersByAreaID[GetCurrentMapAreaID()]
  local temp = {}
  if type(bosses) == "table" then
    local level, x1, y1, x2, y2 = GetCurrentMapDungeonLevel()
    local boss
    local scale = WORLDMAP_SETTINGS.size == WORLDMAP_WINDOWED_SIZE and WORLDMAP_WINDOWED_SIZE or (WORLDMAP_SETTINGS.size == WORLDMAP_QUESTLIST_SIZE and WORLDMAP_QUESTLIST_SIZE or 1)
    for i = 1, #bosses do
      boss = bosses[i]
      if type(boss) == "table" then
        if boss.level == level then
          table.insert(temp, {
            x = boss.x,
            y = 1 - boss.y,
            instId = boss.instId,
            name = boss.name,
            desc = boss.desc,
            encId = boss.encId,
            sectId = boss.sectId,
            link = boss.link,
          })
        end
      end
    end
  end
  if #temp > 0 then
    temp = temp[index]
    if type(temp) == "table" then
      return 
        temp.x,
        temp.y,
        temp.instId,
        temp.name,
        temp.desc,
        temp.encId,
        temp.sectId,
        temp.link
    end
  end
  return oEJ_GetMapEncounter(index)
end

--function EJ_GetSectionPath(sectionId) end

--function EJ_GetTierInfo() end

function EJ_IsValidInstanceDifficulty(thisFlag)
  if not selectedInstance then return oEJ_IsValidInstanceDifficulty(thisFlag) end
  if selectedInstanceDFlag then
    local diffList
    if selectedInstanceIsRaid then
      diffList = EJ_DIFF_RAID_CUSTOM_TBL[selectedInstanceDFlag]
    else
      diffList = EJ_DIFF_DUNGEON_CUSTOM_TBL[selectedInstanceDFlag]
    end
    if type(diffList) == "table" then
      for _, entry in pairs(diffList) do
        if entry.enumValue == thisFlag then
          return true
        end
      end
      return false
    end
  end
  if selectedInstanceIsRaid then
    return thisFlag == N10 or thisFlag == N25 or thisFlag == H10 or thisFlag == H25
  else
    return thisFlag == N5 or thisFlag == H5
  end
end

local function EJ_Hijack()

  local oEncounterJournal_DisplayInstance = EncounterJournal_DisplayInstance
  local oEncounterJournal_DisplayEncounter = EncounterJournal_DisplayEncounter

  function EncounterJournal_DisplayInstance(instanceID, ...)
    selectedEncounter = nil
    selectedEncounterId = nil
    EJ_SelectInstance(instanceID)
    return oEncounterJournal_DisplayInstance(instanceID, ...)
  end

  function EncounterJournal_DisplayEncounter(encounterID, ...)
    EJ_SelectEncounter(encounterID)
    return oEncounterJournal_DisplayEncounter(encounterID, ...)
  end

end

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(f, event, name)
  if event == "ADDON_LOADED" and name == "Blizzard_EncounterJournal" then
    f:SetScript("OnEvent", nil)
    f:UnregisterEvent(event)
    EJ_Hijack()
  end
end)
