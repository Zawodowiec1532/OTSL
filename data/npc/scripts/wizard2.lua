	-- Made by Leon Zawodowiec --
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg) end
function onThink()							npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if msgcontains(msg, "addon") and getPlayerStorageValue(cid, 10223) ~= 5 then
		npcHandler:say("Sorry, but you don\'t have Wizard Outfit !", cid)
		return true
	end

	if msgcontains(msg, "addon") and getPlayerStorageValue(cid, 10224) ~= 1 and getPlayerStorageValue(cid, 10223) == 5 then
		npcHandler:say("Say... I have been longing for something for an eternity now... if you help me retrieve it, I will reward you. Do you consent to this arrangement ?", cid)
		talkState[talkUser] = 1

	elseif msgcontains(msg, "yes") and getPlayerStorageValue(cid, 10224) ~= 1 and getPlayerStorageValue(cid, 10223) == 5 and talkState[talkUser] == 1 then
		npcHandler:say("Listen... there are no blooming flowers down here and the only smell present is that of death and decay. ...", cid)
		npcHandler:say("I wish that I could breathe the lovely smell of beautiful flowers just one more time, especially those which elves cultivate. ...", cid)
		npcHandler:say("Could you please bring me 50 {Holy Orchids} ?", cid)
		talkState[talkUser] = 2		

	elseif msgcontains(msg, "yes") and getPlayerStorageValue(cid, 10224) ~= 1 and getPlayerStorageValue(cid, 10223) == 5 and talkState[talkUser] == 2 then
		npcHandler:say("Thank you. I will wait for your return.", cid)
		setPlayerStorageValue(cid, 10224, 1)
		setPlayerStorageValue(cid, 10225, 1)
		talkState[talkUser] = 0	

	elseif msgcontains(msg, "holy orchid") and getPlayerStorageValue(cid, 10225) == 1 then
		npcHandler:say("Have you really brought me 50 Holy Orchids ?", cid)
		talkState[talkUser] = 1

	elseif msgcontains(msg, "yes") and getPlayerStorageValue(cid, 10225) == 1 and talkState[talkUser] == 1 then
		if (doPlayerRemoveItem(cid, 5922, 50) == TRUE) then
			npcHandler:say("Thank you! You have no idea what that means to me. As promised, here is your reward... as a follower of Zathroth, I hope that you will like this accessory.", cid)
				if getPlayerSex(cid) == 0 then
					doPlayerAddOutfit(cid, 149, 2)
				else
					doPlayerAddOutfit(cid, 145, 2)
				end
			setPlayerStorageValue(cid, 10225, 2)
			talkState[talkUser] = 0
		else
			npcHandler:say("Sorry, but you don\'t have 50 {Holy Orchids} !", cid)
			talkState[talkUser] = 0
		end
	else
		if msgcontains(msg, "addon") then
			if getPlayerStorageValue(cid, 10225) <= 1 then
				npcHandler:say("Bring me 50x {Holy Orchid} !", cid)
			else
				npcHandler:say("You have already this addon !", cid)
			end
		end
	end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())