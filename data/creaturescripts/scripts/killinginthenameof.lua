  function onKill(cid, target, lastHit)

local questCreatures =
{
        ["Carniphila"] = {questStarted = 1510, questStorage = 65000, creatureStorage = 15000, killsRequired = 150, raceName = "Carniphilas"},


        ["Minotaur"] = {questStarted = 1511, questStorage = 65001, creatureStorage = 15001, killsRequired = 2000, raceName = "Minotaurs"},
        ["Minotaur Archer"] = {questStarted = 1511, questStorage = 65001, creatureStorage = 15002, killsRequired = 2000, raceName = "Minotaurs"},
        ["Minotaur Mage"] = {questStarted = 1511, questStorage = 65001, creatureStorage = 15003, killsRequired = 2000, raceName = "Minotaurs"},
        ["Minotaur Guard"] = {questStarted = 1511, questStorage = 65001, creatureStorage = 15004, killsRequired = 2000, raceName = "Minotaurs"},

        ["Pirate Buccaneer"] = {questStarted = 1512, questStorage = 65002, creatureStorage = 15005, killsRequired = 1500, raceName = "Pirates"},
        ["Pirate Corsair"] = {questStarted = 1512, questStorage = 65002, creatureStorage = 15006, killsRequired = 1500, raceName = "Pirates"},
		["Pirate Cutthroat"] = {questStarted = 1512, questStorage = 65002, creatureStorage = 15007, killsRequired = 1500, raceName = "Pirates"},
		["Pirate Ghost"] = {questStarted = 1512, questStorage = 65002, creatureStorage = 15008, killsRequired = 1500, raceName = "Pirates"},
		["Pirate Marauder"] = {questStarted = 1512, questStorage = 65002, creatureStorage = 15009, killsRequired = 1500, raceName = "Pirates"},
		["Pirate Skeleton"] = {questStarted = 1512, questStorage = 65002, creatureStorage = 15010, killsRequired = 1500, raceName = "Pirates"},

        ["Necromancer"] = {questStarted = 1513, questStorage = 65003, creatureStorage = 15011, killsRequired = 1000, raceName = "Magicians"},
        ["Priestess"] = {questStarted = 1513, questStorage = 65003, creatureStorage = 15012, killsRequired = 1000, raceName = "Magicians"},


        ["Dragon Lord"] = {questStarted = 1514, questStorage = 65004, creatureStorage = 15013, killsRequired = 1000, raceName = "Dragons"},

        ["Serpent Spawn"] = {questStarted = 1515, questStorage = 65005, creatureStorage = 15014, killsRequired = 1000, raceName = "Serpents"},

        ["Demon"] = {questStarted = 1516, questStorage = 65006, creatureStorage = 15015, killsRequired = 6666, raceName = "Demons"}
}

local creature = questCreatures[getCreatureName(target)]
       
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