	-- Made by Leon Zawodowiec --
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talkState = {}
local quest = 9014
	
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(not npcHandler:isFocused(cid)) then
		return false
	elseif msgcontains(msg, "help") and talkState[talkUser] == 1 then
		npcHandler:say("Okey, thanks, I think if you will kill 389 Frost Dragons then they will never again attack us !", cid)
		setPlayerStorageValue(cid, quest, 2)
		talkState[talkUser] = 0
	elseif msgcontains(msg, "help") then
		local str = getPlayerStorageValue(cid, quest)
		if(str < 2) then
			npcHandler:say("I am comming from undergrounds where living Dragons and Demons.. Im looking for hero because Frost Dragons attacking us.. Can you {help} us ?", cid) 
			talkState[talkUser] = 1
			return true
		elseif(str == 2) then
			npcHandler:say("Back when you will kill them ! I feel terrible !", cid)
		elseif(str == 3) then
			npcHandler:say("Have you killed them all ?! Thanks ! Thanks ! Thanks ! Here is your reward !", cid)
			doPlayerAddItem(cid, 2160, 6) -- 6cc
			doPlayerAddItem(cid, 2187, 1) -- Wand of Inferno
			doPlayerAddItem(cid, 2451, 1) -- Djinn Blade
			doPlayerAddItem(cid, 5919, 1) -- Dragon Claw
			doPlayerAddItem(cid, 5953, 1) -- 1 Marychy
			setPlayerStorageValue(cid, quest, 4)
		elseif(str == 4) then
			npcHandler:say("Thanks again, now they can suck us dicks !", cid)
		end
		talkState[talkUser] = 0
	end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())