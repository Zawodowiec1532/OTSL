function onKill(cid, target, lastHit)
 
local questCreatures =
{
	["pirate buccaneer"] = {questStarted = 2531, questStorage = 55024, creatureStorage = 25058, killsRequired = 200, raceName = "Pirates"},
	["pirate corsair"] = {questStarted = 2531, questStorage = 55024, creatureStorage = 25059, killsRequired = 200, raceName = "Pirates"},
	["pirate cutthroat"] = {questStarted = 2531, questStorage = 55024, creatureStorage = 25060, killsRequired = 200, raceName = "Pirates"},
	["pirate ghost"] = {questStarted = 2531, questStorage = 55024, creatureStorage = 25061, killsRequired = 200, raceName = "Pirates"},
	["pirate marauder"] = {questStarted = 2531, questStorage = 55024, creatureStorage = 25062, killsRequired = 200, raceName = "Pirates"},
	["pirate skeleton"] = {questStarted = 2531, questStorage = 55024, creatureStorage = 25063, killsRequired = 200, raceName = "Pirates"},

	["black knight"] = {questStarted = 2532, questStorage = 55025, creatureStorage = 25064, killsRequired = 165, raceName = "Black Knights"},
	
	["lizard dragon priest"] = {questStarted = 2533, questStorage = 55026, creatureStorage = 25065, killsRequired = 300, raceName = "Lizards"},
	["lizard high guard"] = {questStarted = 2533, questStorage = 55026, creatureStorage = 25066, killsRequired = 300, raceName = "Lizards"},
	["lizard zaogun"] = {questStarted = 2533, questStorage = 55026, creatureStorage = 25067, killsRequired = 300, raceName = "Lizards"},
	["lizard chosen"] = {questStarted = 2533, questStorage = 55026, creatureStorage = 25068, killsRequired = 300, raceName = "Lizards"},
	
	["grim reaper"] = {questStarted = 2534, questStorage = 55027, creatureStorage = 25069, killsRequired = 200, raceName = "Grim Reapers"},
	
	["fury"] = {questStarted = 2535, questStorage = 55028, creatureStorage = 25070, killsRequired = 265, raceName = "Fury"}
}
 
local creature = questCreatures[getCreatureName(target):lower()]
 
	if creature then
		if(isPlayer(target) == true) then
			return true
		end
		if getPlayerStorageValue(cid, creature.questStarted) > 0 then
			if getPlayerStorageValue(cid, creature.questStorage) < creature.killsRequired then
				if getPlayerStorageValue(cid, creature.questStorage) < 0 then
					doPlayerSetStorageValue(cid, creature.questStorage, 0)
				end
 
				if getPlayerStorageValue(cid, creature.creatureStorage) < 0 then
					doPlayerSetStorageValue(cid, creature.creatureStorage, 0)
				end
				doPlayerSetStorageValue(cid, creature.questStorage, getPlayerStorageValue(cid, creature.questStorage) + 1)
				doPlayerSetStorageValue(cid, creature.creatureStorage, getPlayerStorageValue(cid, creature.creatureStorage) + 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "" .. getPlayerStorageValue(cid, creature.creatureStorage) .. " " .. getCreatureName(target) .. " defeated. Total [" .. getPlayerStorageValue(cid, creature.questStorage) .. "/" .. creature.killsRequired .. "] " .. creature.raceName .. ".")
			end
		end
	end
	return true
end