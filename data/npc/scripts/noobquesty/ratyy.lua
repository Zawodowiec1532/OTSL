local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talkState = {}
local quest = 9012
	
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(not npcHandler:isFocused(cid)) then
		return false
	elseif msgcontains(msg, "ok") and talkState[talkUser] == 1 then
		npcHandler:say("Thanks, after that come back for your candies !", cid)
		setPlayerStorageValue(cid, quest, 2)
		talkState[talkUser] = 0
	elseif msgcontains(msg, "help") then
		local str = getPlayerStorageValue(cid, quest)
		if(str < 2) then
			npcHandler:say("Great, take this shovel. Just hit this fucking rat. He should look like this near barrels.. I counted them about a 150. Go and kill as rambo.. Kids like it.., {ok} ?", cid) 
			talkState[talkUser] = 1
			return true
		elseif(str == 2) then
			npcHandler:say("Back when you will kill them all !", cid)
		elseif(str == 3) then
			npcHandler:say("Have you killed them all ? Good boy.. take that candies.", cid)
			doPlayerAddItem(cid, 2160, 15)
			doPlayerAddItem(cid, 6569, 26)
			doPlayerAddItem(cid, 6574, 1)
			setPlayerStorageValue(cid, quest, 4)
		elseif(str == 4) then
			npcHandler:say("Boy.. you have done enough for me.. Thanks very much.", cid)
		end
		talkState[talkUser] = 0
	end
	return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())