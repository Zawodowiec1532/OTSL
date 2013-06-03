	-- Made by Leon Zawodowiec --
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local storages = {
	FIRST_TALK = 6800,
	QUEST_UPSTAIRS_ACCEPTED = 6801,
	QUEST_EQUIP_COAT = 6801,
	TUTORIAL_CANCELED = 6866
}

local positions = {
	cancel_pos = {x = 0, y = 0, z = 0}, -- @TODO: get real positions
	stairs_pos = {x = 32033, y = 32277, z = 6}
}

local items - {
	coat = 2651,
	club = 2382,
	branch = 8600
}

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if (msgcontains(msg, "hi") or msgcontains(msg, "hello")) and getPlayerStorageValue(cid, storages.FIRST_TALK) ~= 1 and talkState[talkUser] == 0 then
		npcHandler:say("Hello ".. getPlayerName(cid) ..", nice to see you on Rookgaard! I saw you walking by and wondered if you could help me. Could you? Please, say {yes}!", cid)
		setPlayerStorageValue(cid, storages.FIRST_TALK, 1)
		talkState[talkUser] = 1
		
	elseif (msgcontains(msg, "hi") or msgcontains(msg, "hello")) and getPlayerStorageValue(cid, storages.FIRST_TALK) == 1 and talkState[talkUser] == 0 then
		npcHandler:say("Oh, ".. getPlayerName(cid) ..", it's you again! It's probably impolite to disturb a busy adventurer like you, but I really need help. Please, say {yes}!", cid)
		talkState[talkUser] = 1

	elseif (msgcontains(msg, "no") or msgcontains(msg, "yes")) and getPlayerStorageValue(cid, storages.QUEST_UPSTAIRS_ACCEPTED) ~= 1 and talkState[talkUser] == 1 then	
		if (msgcontains(msg, "yes")) then
			npcHandler:say("Ah, thank you so much. To keep talking to me, either use the {highlighted} keywords or answer with '{yes}' or '{no}'. Listen, I have a little cockroach problem, but I think you need some proper equipment first, {right}?", cid)
			talkState[talkUser] = 2
		else
			npcHandler:say("That's quite sad. You won't have to do it for free though. You'll get a nice reward and even a weapon. Come on, say {yes}!", cid)
		end
	elseif (msgcontains(msg, "highlighted") or msgcontains(msg, "yes") or msgcontains(msg, "no") or msgcontains(msg, "right")) and getPlayerStorageValue(cid, storages.QUEST_UPSTAIRS_ACCEPTED) ~= 1 and talkState[talkUser] == 2 then	
		if (msgcontains(msg, "yes"))then
			npcHandler:say("Great, please go to my house, just a few steps south of here. Upstairs in my room, you'll find a chest. You can keep what you find inside of it! Come back after you got it and greet me to talk to me again. {Alright}?", cid)
			talkState[talkUser] = 3
			doSendMagicEffect(positions.stairs_pos, 55)
		elseif (msgcontains(msg, "right")) then
			npcHandler:say("Great, please go to my house, just a few steps south of here. Upstairs in my room, you'll find a chest. You can keep what you find inside of it! Come back after you got it and greet me to talk to me again. {Yes}?", cid)
			talkState[talkUser] = 3
			doSendMagicEffect(positions.stairs_pos, 55)
		elseif (msgcontains(msg, "no")) then
			npcHandler:say("Oh, but look at yourself. You can't fight like that! Go to my house. Upstairs, you'll find a chest. You can keep what you find inside of it! Come back after you got it. {Yes}?", cid)
		else
			npcHandler:say("Yes, you got it. So, about that equipment - we need to get you dressed, {right}?", cid)
		end
	elseif (msgcontains(msg, "yes") or msgcontains(msg, "alright")) and getPlayerStorageValue(cid, storages.QUEST_UPSTAIRS_ACCEPTED) ~= 1 and talkState[talkUser] == 3 then	
		npcHandler:say("Alright! Do you see the button called 'Quest Log'? There you can check the status of quests, like this one. Bye for now!", cid)
		setPlayerStorageValue(cid, storages.QUEST_UPSTAIRS_ACCEPTED, 1)
		talkState[talkUser] = 0
		-- @tutorial hint - pomaranczowa ramka na Quests --
		return false
	elseif (msgcontains(msg, "no") or msgcontains(msg, "yes")) and talkState[talkUser] == 666 then
		if (msgcontains(msg, "yes")) then
			setPlayerStorageValue(cid, storages.TUTORIAL_CANCELED, 1)
			doTeleportThing(cid, cancel_pos, true)
		else
			npcHandler:say("Nie, nie nie gogusiu.. już nie można się wycofać.. :D", cid)
		end
	else
		if (talkState[talkUser] ~= 0) then
			npcHandler:say("I'll give you a hint. Those highlighted words are keywords that will always keep a conversation going. Usually you can also answer with {yes} or {no}.", cid)
		elseif (msgcontains(msg, "skip tutorial")) and talkState[talkUser] ~= 0 then
			npcHandler:say("Chyba Cię pojebało ziom.. Leoś tyle się napracował, żeby zrobić to gówno a ty chcesz to skipnąć? TU SIĘ JEBNIJ!.. Dobra kurwa wpisz {yes}.. -.- (Ale pamiętaj, że nie dostaniesz nagrody).", cid)
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
