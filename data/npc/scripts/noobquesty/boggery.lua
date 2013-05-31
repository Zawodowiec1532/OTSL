	-- Made by Leon Zawodowiec --
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talkState = {}
local quest = 9017
	
function onCreatureAppear(cid) 			npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 		npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 						npcHandler:onThink() 						end

function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	if(not npcHandler:isFocused(cid)) then
		return false
	elseif msgcontains(msg, "ok") and talkState[talkUser] == 1 then
		npcHandler:say("Thanks, after that come back for your reward !", cid)
		setPlayerStorageValue(cid, quest, 2)
		talkState[talkUser] = 0
	elseif msgcontains(msg, "mission") then
		local str = getPlayerStorageValue(cid, quest)
		if(str < 2) then
			npcHandler:say("Please kill 130 Bog Raider for me, {ok} ?", cid) 
			talkState[talkUser] = 1
			return true
		elseif(str == 2) then
			npcHandler:say("Back when you will kill them all !", cid)
		elseif(str == 3) then
			npcHandler:say("Have you killed them all ? Okey, here is you reward !", cid)
			doPlayerAddItem(cid, 2160, 6)
			doPlayerAddItem(cid, 2072, 1)
			doPlayerAddItem(cid, 2323, 1)
			doPlayerAddItem(cid, 7460, 1)
			doPlayerAddItem(cid, 7456, 1)
			setPlayerStorageValue(cid, quest, 4)
		elseif(str == 4) then
			npcHandler:say("You already done too much for me, thanks.", cid)
		end
		talkState[talkUser] = 0
	end
	return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())