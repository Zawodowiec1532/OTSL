local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talkState = {}
local quest = 9013
	
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(not npcHandler:isFocused(cid)) then
		return false
	elseif msgcontains(msg, "ok") and talkState[talkUser] == 1 then
		npcHandler:say("Thanks very much !! Back after for your reward !", cid)
		setPlayerStorageValue(cid, quest, 2)
		talkState[talkUser] = 0
	elseif msgcontains(msg, "help") then
		local str = getPlayerStorageValue(cid, quest)
		if(str < 2) then
			npcHandler:say("I had dream about spiders !! I hate them ! I have feeling they are moving on me.. ! Please kill them.. maybe around 220 then I will feel better.. {ok} ?", cid) 
			talkState[talkUser] = 1
			return true
		elseif(str == 2) then
			npcHandler:say("Back when you will kill them ! I feel terrible !", cid)
		elseif(str == 3) then
			npcHandler:say("Have you killed them all ? Thanks ! Thanks ! Thanks ! There is your reward !", cid)
			doPlayerAddItem(cid, 2160, 15)
			doPlayerAddItem(cid, 2533, 1)
			doPlayerAddItem(cid, 7497, 1)
			setPlayerStorageValue(cid, quest, 4)
		elseif(str == 4) then
			npcHandler:say("You helped me alot ! Thanks very much !", cid)
		end
		talkState[talkUser] = 0
	end
	return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())