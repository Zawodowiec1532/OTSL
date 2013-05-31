local tasks =
{
	[1] = {questStarted = 2531, questStorage = 55024, killsRequired = 200, raceName = "Pirates", rewards = {first = {enable = true, type = "item", values = {11302, 1}}, second = {enable = true, type = "money", values = 100000}, third = {enable = false, type = nil, values = {nil, nil}}}},
 
	[2] = {questStarted = 2532, questStorage = 55025, killsRequired = 165, raceName = "Balack Knights", rewards = {first = {enable = true, type = "item", values = {2429, 1}}, second = {enable = true, type = "money", values = 100000}, third = {enable = true, type = "item", values = {7967, 1}}}},
 
	[3] = {questStarted = 2533, questStorage = 55026, killsRequired = 265, raceName = "Lizards", rewards = {first = {enable = true, type = "item", values = {7379, 1}}, second = {enable = true, type = "money", values = 150000}, third = {enable = true, type = "item", values = {11329, 1}}}},
 
	[4] = {questStarted = 2534, questStorage = 55027, killsRequired = 200, raceName = "Grim Reapers", rewards = {first = {enable = true, type = "item", values = {2539, 1}}, second = {enable = true, type = "item", values = {2500, 1}}, third = {enable = true, type = "item", values = {8903, 1}}}},
 
	[5] = {questStarted = 2535, questStorage = 55028, killsRequired = 265, raceName = "Fury", rewards = {first = {enable = true, type = "item", values = {2499, 1}}, second = {enable = true, type = "money", values = 250000}, third = {enable = true, type = "item", values = {7388, 1}}}},
 
}
 
local storage = 44521
 
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local voc = {}
 
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                                      npcHandler:onThink() end
 
function creatureSayCallback(cid, type, msg)
 
	local s = getPlayerStorageValue(cid, storage)
 
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_PRIVATE and 0 or cid
	if msgcontains(msg, 'task') then
 
		if(s < 1) then
			doPlayerSetStorageValue(cid, storage, 1)
		end
 
		if tasks[s] then
			if(getPlayerStorageValue(cid, tasks[s].questStarted) < 1) then
				if(getPlayerStorageValue(cid, tasks[s].creatureStorage) < 0) then
					doPlayerSetStorageValue(cid, tasks[s].creatureStorage, 0)
				end
 
				if(getPlayerStorageValue(cid, tasks[s].questStorage) < 0) then
					doPlayerSetStorageValue(cid, tasks[s].questStorage, 0)
				end
 
				doPlayerSetStorageValue(cid, tasks[s].questStarted, 1)
				selfSay('You have started the task number ' .. getPlayerStorageValue(cid, storage) .. ', in this task you need to kill ' .. tasks[s].killsRequired .. ' ' .. tasks[s].raceName .. '.', cid)
			else
				selfSay('You are currently making task about ' .. tasks[s].raceName .. '.', cid)
			end
		else
			selfSay('If you are starting first task type again {task}, else you have finished all taks, congratulations !', cid)
		end
 
	elseif msgcontains(msg, 'report') then
		if tasks[s] and tasks[s].questStarted > 0 then
			if(getPlayerStorageValue(cid, tasks[s].creatureStorage) < 0) then
				doPlayerSetStorageValue(cid, tasks[s].creatureStorage, 0)
			end
 
			if(getPlayerStorageValue(cid, tasks[s].questStorage) < 0) then
				doPlayerSetStorageValue(cid, tasks[s].questStorage, 0)
			end
 
			if(getPlayerStorageValue(cid, tasks[s].questStorage) >= tasks[s].killsRequired) then
				selfSay('Great!... you have finished the task number ' .. s .. '. Good job.', cid)
										if s == 5 then
                                             doPlayerSetStorageValue(cid, 87347, 1)
										end
				doPlayerSetStorageValue(cid, storage, s + 1)
				if(tasks[s].rewards.first.enable) then
					if(tasks[s].rewards.first.type == "boss") then
						doTeleportThing(cid, tasks[s].rewards.first.values)
					elseif(tasks[s].rewards.first.type == "exp") then
						doPlayerAddExperience(cid, tasks[s].rewards.first.values)
					elseif(tasks[s].rewards.first.type == "item") then
						doPlayerAddItem(cid, tasks[s].rewards.first.values[1], tasks[s].rewards.first.values[2])
					elseif(tasks[s].rewards.first.type == "money") then
						doPlayerAddMoney(cid, tasks[s].rewards.first.values)
					elseif(tasks[s].rewards.first.type == "storage") then
						doPlayerSetStorageValue(cid, tasks[s].rewards.first.values[1], tasks[s].rewards.first.values[2])
					end
				end
				if(tasks[s].rewards.second.enable) then
					if(tasks[s].rewards.second.type == "boss") then
						doTeleportThing(cid, tasks[s].rewards.second.values)
					elseif(tasks[s].rewards.second.type == "exp") then
						doPlayerAddExperience(cid, tasks[s].rewards.second.values)
					elseif(tasks[s].rewards.second.type == "item") then
						doPlayerAddItem(cid, tasks[s].rewards.second.values[1], tasks[s].rewards.second.values[2])
					elseif(tasks[s].rewards.second.type == "money") then
						doPlayerAddMoney(cid, tasks[s].rewards.second.values)
					elseif(tasks[s].rewards.second.type == "storage") then
						doPlayerSetStorageValue(cid, tasks[s].rewards.second.values[1], tasks[s].rewards.second.values[2])
					end
				end
				if(tasks[s].rewards.third.enable) then
					if(tasks[s].rewards.third.type == "boss") then
						doTeleportThing(cid, tasks[s].rewards.third.values)
					elseif(tasks[s].rewards.third.type == "exp") then
						doPlayerAddExperience(cid, tasks[s].rewards.third.values)
					elseif(tasks[s].rewards.third.type == "item") then
						doPlayerAddItem(cid, tasks[s].rewards.third.values[1], tasks[s].rewards.third.values[2])
					elseif(tasks[s].rewards.third.type == "money") then
						doPlayerAddMoney(cid, tasks[s].rewards.third.values)
					elseif(tasks[s].rewards.third.type == "storage") then
						doPlayerSetStorageValue(cid, tasks[s].rewards.third.values[1], tasks[s].rewards.third.values[2])
					end
				end                           
			else
				selfSay('Current ' .. getPlayerStorageValue(cid, tasks[s].questStorage) .. ' ' .. tasks[s].raceName .. ' killed, you need to kill ' .. tasks[s].killsRequired .. '.', cid)
			end
		else
			selfSay('You do not have started any mission.', cid)
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())