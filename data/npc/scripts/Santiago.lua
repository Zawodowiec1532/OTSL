	-- Made by Leon Zawodowiec --
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local talkUser = 0
local storages = {
	FIRST_TALK = 6900,
	QUEST_UPSTAIRS_ACCEPTED = 6801,
	QUEST_EQUIP_COAT = 6902,
	TUTORIAL_CANCELED = 6866
}

local positions = {
	cancel_pos = {x = 32097, y = 32219, z = 7},
	stairs_pos = {x = 32033, y = 32277, z = 6}
}

local items = {
	coat = 2651,
	club = 2382,
	branch = 8600
}

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onThink()						npcHandler:onThink()						end
function onCreatureSay(cid, type, msg)
    if (not isPlayer(cid)) then 
        return false 
    end 
    talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye traveller, and enjoy your stay on Rookgaard.")
	if getPlayerStorageValue(cid, storages.FIRST_TALK) ~= 1 then
		npcHandler:setMessage(MESSAGE_GREET, "Hello ".. getPlayerName(cid) ..", nice to see you on Rookgaard! I saw you walking by and wondered if you could help me. Could you? Please, say {yes}!")
		setPlayerStorageValue(cid, storages.FIRST_TALK, 1)
	elseif getPlayerStorageValue(cid, storages.FIRST_TALK) == 1 then
		npcHandler:setMessage(MESSAGE_GREET, "Oh, ".. getPlayerName(cid) ..", it's you again! It's probably impolite to disturb a busy adventurer like you, but I really need help. Please, say {yes}!")
	end
	npcHandler:onCreatureSay(cid, type, msg)
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if ((msgcontains(msg, "no") or msgcontains(msg, "yes")) and getPlayerStorageValue(cid, storages.QUEST_UPSTAIRS_ACCEPTED) ~= 1 and talkState[talkUser] == nil) then	
		if (msgcontains(msg, "yes")) then
			npcHandler:say("Ah, thank you so much. To keep talking to me, either use the {highlighted} keywords or answer with '{yes}' or '{no}'. Listen, I have a little cockroach problem, but I think you need some proper equipment first, {right}?", cid)
			talkState[talkUser] = 1
		else
			npcHandler:say("That's quite sad. You won't have to do it for free though. You'll get a nice reward and even a weapon. Come on, say {yes}!", cid)
		end
	elseif (msgcontains(msg, "highlighted") or msgcontains(msg, "yes") or msgcontains(msg, "no") or msgcontains(msg, "right")) and getPlayerStorageValue(cid, storages.QUEST_UPSTAIRS_ACCEPTED) ~= 1 and talkState[talkUser] == 1 then	
		if (msgcontains(msg, "yes"))then
			npcHandler:say("Great, please go to my house, just a few steps south of here. Upstairs in my room, you'll find a chest. You can keep what you find inside of it! Come back after you got it and greet me to talk to me again. {Alright}?", cid)
			talkState[talkUser] = 2
			doSendMagicEffect(positions.stairs_pos, 55)
			setPlayerStorageValue(cid, 6707, 1)
		elseif (msgcontains(msg, "right")) then
			npcHandler:say("Great, please go to my house, just a few steps south of here. Upstairs in my room, you'll find a chest. You can keep what you find inside of it! Come back after you got it and greet me to talk to me again. {Yes}?", cid)
			talkState[talkUser] = 2
			doSendMagicEffect(positions.stairs_pos, 55)
			setPlayerStorageValue(cid, 6707, 1)
		elseif (msgcontains(msg, "no")) then
			npcHandler:say("Oh, but look at yourself. You can't fight like that! Go to my house. Upstairs, you'll find a chest. You can keep what you find inside of it! Come back after you got it. {Yes}?", cid)
		else
			npcHandler:say("Yes, you got it. So, about that equipment - we need to get you dressed, {right}?", cid)
		end
	elseif (msgcontains(msg, "yes") or msgcontains(msg, "alright")) and getPlayerStorageValue(cid, storages.QUEST_UPSTAIRS_ACCEPTED) ~= 1 and talkState[talkUser] == 2 then	
		npcHandler:say("Alright! Do you see the button called 'Quest Log'? There you can check the status of quests, like this one. Bye for now!", cid)
		setPlayerStorageValue(cid, storages.QUEST_UPSTAIRS_ACCEPTED, 1)
		talkState[talkUser] = 0
		doPlayerSendTutorial(cid, 3)
		return false -- Nie dziala.
	elseif (msgcontains(msg, "no") or msgcontains(msg, "yes")) and talkState[talkUser] == 666 then
		if (msgcontains(msg, "yes")) then
			npcHandler:say("Well, then good luck and take care!", cid)
			setPlayerStorageValue(cid, storages.TUTORIAL_CANCELED, 1)
			doTeleportThing(cid, cancel_pos, true)
		else
			npcHandler:say("@MISSING MESSAGE", cid)
		end
	else
		if (talkState[talkUser] ~= nil) then
			npcHandler:say("I'll give you a hint. Those highlighted words are keywords that will always keep a conversation going. Usually you can also answer with {yes} or {no}.", cid)
		elseif (msgcontains(msg, "skip tutorial")) and talkState[talkUser] == nil then
			npcHandler:say("Oh, so you know everything about Tibia already? Do you really want to skip the tutorial?", cid)
			talkState[talkUser] = 666
		end
	end
	
	--[[
	if (msgcontains(msg, "hi") or msgcontains(msg, "hello")) and getPlayerStorageValue(cid, storages.QUEST_EQUIP_COAT) ~= 1 and talkState[talkUser] == 0 then
		npcHandler:say("Hello ".. getPlayerName(cid) ..", nice to see you on Rookgaard! I saw you walking by and wondered if you could help me. Could you? Please, say {yes}!", cid)
		setPlayerStorageValue(cid, storages.FIRST_TALK, 1)
		talkState[talkUser] = 1
	end --]]
	
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
