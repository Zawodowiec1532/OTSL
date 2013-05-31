  local tasks =
{
        [1] = {questStarted = 1510, questStorage = 65000, killsRequired = 150, raceName = "Carniphilas", rewards = {first = {enable = true, type = "exp", values = 50000}, second = {enable = true, type = "money", values = 20000}, third = {enable = true, type = "storage", values = {16693, 1}}}},

        [2] = {questStarted = 1511, questStorage = 65001, killsRequired = 2000, raceName = "Minotaurs", rewards = {first = {enable = true, type = "exp", values = 100000}, second = {enable = true, type = "money", values = 40000}, third = {enable = true, type = "storage", values = {16696, 1}}}},

        [3] = {questStarted = 1512, questStorage = 65002, killsRequired = 1500, raceName = "Pirates", rewards = {first = {enable = true, type = "exp", values = 200000}, second = {enable = true, type = "money", values = 50000}, third = {enable = true, type = "storage", values = {16710, 1}}}},

        [4] = {questStarted = 1513, questStorage = 65003, killsRequired = 1000, raceName = "Magicians", rewards = {first = {enable = true, type = "exp", values = 500000}, second = {enable = true, type = "money", values = 60000}, third = {enable = true, type = "storage", values = {16721, 1}}}},

        [5] = {questStarted = 1514, questStorage = 65004, killsRequired = 1000, raceName = "Dragons", rewards = {first = {enable = true, type = "exp", values = 800000}, second = {enable = true, type = "money", values = 80000}, third = {enable = true, type = "storage", values = {16730, 1}}}},

        [6] = {questStarted = 1515, questStorage = 65005, killsRequired = 1000, raceName = "Serpents", rewards = {first = {enable = true, type = "exp", values = 1000000}, second = {enable = true, type = "money", values = 100000}, third = {enable = true, type = "storage", values = {16751, 1}}}},

        [7] = {questStarted = 1516, questStorage = 65006, killsRequired = 6666, raceName = "Demons", rewards = {first = {enable = true, type = "exp", values = 2000000}, second = {enable = true, type = "money", values = 200000}, third = {enable = false, type = nil, values = {nil, nil}}}}
}

local storage = 64521

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local voc = {}

function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end

function creatureSayCallback(cid, type, msg)

        local s = getPlayerStorageValue(cid, storage)

        if(not npcHandler:isFocused(cid)) then
                return false
        end
        local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_PRIVATE and 0 or cid
        if msgcontains(msg, 'task') then
        if(s < 0) then
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
                        end
                end

        elseif msgcontains(msg, 'report') then
        if(s < 0) then
                doPlayerSetStorageValue(cid, storage, 1)
        end
                if tasks[s].questStarted > 0 then
                        if(getPlayerStorageValue(cid, tasks[s].creatureStorage) < 0) then
                                doPlayerSetStorageValue(cid, tasks[s].creatureStorage, 0)
                        end
                        if(getPlayerStorageValue(cid, tasks[s].questStorage) < 0) then
                                doPlayerSetStorageValue(cid, tasks[s].questStorage, 0)
                        end
                        if(getPlayerStorageValue(cid, tasks[s].questStorage) >= tasks[s].killsRequired) then
                                selfSay('Great!... you have finished the task number ' .. s .. '. Good job.', cid)
                                doPlayerSetStorageValue(cid, storage, s + 1)
                                        if(tasks[s].rewards.first.enable) then
                                                if(tasks[s].rewards.first.type == "boss") then
                                                        doTeleportThing(cid, tasks[s].rewards.first.values[1], tasks[s].rewards.first.values[2])
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
                                                        doTeleportThing(cid, tasks[s].rewards.second.values[1], tasks[s].rewards.second.values[2])
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
                                                        doTeleportThing(cid, tasks[s].rewards.third.values[1], tasks[s].rewards.third.values[2])
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
                        selfSay('You do not have started any task.', cid)
                        talkState[talkUser] = 0
                end
        end
        return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 