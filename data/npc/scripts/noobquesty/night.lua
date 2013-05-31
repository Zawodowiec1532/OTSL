local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talkState = {}
local quest = 9015
	
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(not npcHandler:isFocused(cid)) then
		return false
	elseif msgcontains(msg, "help") and talkState[talkUser] == 1 then
		npcHandler:say("They attacked me when I indulged urine! Now they must pay me for it! Kill them all! I count them about 333.", cid)
		setPlayerStorageValue(cid, quest, 2)
		talkState[talkUser] = 0
	elseif msgcontains(msg, "help") then
		local str = getPlayerStorageValue(cid, quest)
		if(str < 2) then
			npcHandler:say("I am from Explorers League, we are trying to learn something about Nightmares but we need {help}.. Do you wanna {help} us ?", cid) 
			talkState[talkUser] = 1
			return true
		elseif(str == 2) then
			npcHandler:say("Back when you will kill them ! I feel terrible !", cid)
		elseif(str == 3) then
			npcHandler:say("Have you killed them all?! Thanks! By the way, I told you I lost my cock ? .. No ?! Okey.. Forget it. Take your reward !", cid)
			doPlayerAddItem(cid, 2160, 10) -- 10cc
			doPlayerAddItem(cid, 11360, 25) -- 25x Undead Hearts
			doPlayerAddItem(cid, 6500, 10) -- Demonic Essence
			doPlayerAddItem(cid, 7901, 1) -- Lightning Headband
			setPlayerStorageValue(cid, quest, 4)
		elseif(str == 4) then
			npcHandler:say("Thanks again !", cid)
		end
		talkState[talkUser] = 0
	end
	return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())