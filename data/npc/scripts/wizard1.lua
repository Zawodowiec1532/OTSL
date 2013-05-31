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

	local outfit = {
			[1] = {2536}, -- Medusa Shield
			[2] = {2492}, -- Dragon Scale Mail
			[3] = {2488}, -- Crown Legs
			[4] = {2123} -- Ring of The Sky
				   }

	if msgcontains(msg, "outfit") and getPlayerStorageValue(cid, 10222) ~= 1 then
		npcHandler:say("This skull shows that you are a true follower of Zathroth and the glorious gods of darkness. Are you willing to prove your loyalty ?", cid)
		talkState[talkUser] = 1

	elseif msgcontains(msg, "yes") and getPlayerStorageValue(cid, 10222) ~= 1 and talkState[talkUser] == 1 then
		npcHandler:say("It will be a hard task which requires many sacrifices. Do you still want to proceed ?", cid)
		talkState[talkUser] = 2

	elseif msgcontains(msg, "yes") and getPlayerStorageValue(cid, 10222) ~= 1 and talkState[talkUser] == 2 then
		npcHandler:say("Good decision, ".. getPlayerName(cid) ..". Your first sacrifice will be a {medusa shield}. Bring it to me and do give it happily.", cid)
		setPlayerStorageValue(cid, 10222, 1)
		setPlayerStorageValue(cid, 10223, 1)
		talkState[talkUser] = 0		

	elseif msgcontains(msg, "medusa shield") and getPlayerStorageValue(cid, 10223) == 1 then
		if getPlayerItemCount(cid, 2536) >= 1 then
			npcHandler:say("Is it your true wish to sacrifice a medusa shield to Zathroth ?", cid)
			talkState[talkUser] = 1
		else
			npcHandler:say("Sorry, but You don\'t have {Medusa Shield} !", cid)
			talkState[talkUser] = 0
		end

	elseif msgcontains(msg, "yes") and getPlayerStorageValue(cid, 10223) == 1 and talkState[talkUser] == 1 then
		if (doPlayerRemoveItem(cid, 2536, 1) == TRUE) then
			npcHandler:say("Good. I accept your sacrifice. The second sacrifice I require from you is a {dragon scale mail}. Bring it to me and do give it happily.", cid)
			setPlayerStorageValue(cid, 10223, 2)
			talkState[talkUser] = 0
		else
			npcHandler:say("Sorry, but you don\'t have {Medusa Shield} !", cid)
			talkState[talkUser] = 0
		end

	elseif msgcontains(msg, "dragon scale mail") and getPlayerStorageValue(cid, 10223) == 2 then
		if getPlayerItemCount(cid, 2492) >= 1 then
			npcHandler:say("Is it your true wish to sacrifice a dragon scale mail to Zathroth ?", cid)
			talkState[talkUser] = 1
		else
			npcHandler:say("Sorry, but You don\'t have {Dragon Scale Mail} !", cid)
			talkState[talkUser] = 0
		end

	elseif msgcontains(msg, "yes") and getPlayerStorageValue(cid, 10223) == 2 and talkState[talkUser] == 1 then
		if (doPlayerRemoveItem(cid, 2492, 1) == TRUE) then
			npcHandler:say("Good. I accept your sacrifice. The third sacrifice I require from you are {crown legs}. Bring them to me and do give them happily.", cid)
			setPlayerStorageValue(cid, 10223, 3)
			talkState[talkUser] = 0
		else
			npcHandler:say("Sorry, but you don\'t have {Dragon Scale Mail} !", cid)
			talkState[talkUser] = 0
		end

	elseif msgcontains(msg, "crown legs") and getPlayerStorageValue(cid, 10223) == 3 then
		if getPlayerItemCount(cid, 2488) >= 1 then
			npcHandler:say("Is it your true wish to sacrifice crown legs to Zathroth ?", cid)
			talkState[talkUser] = 1
		else
			npcHandler:say("Sorry, but you don\'t have {Crown Legs} !", cid)
			talkState[talkUser] = 0
		end

	elseif msgcontains(msg, "yes") and getPlayerStorageValue(cid, 10223) == 3 and talkState[talkUser] == 1 then
		if (doPlayerRemoveItem(cid, 2488, 1) == TRUE) then
			npcHandler:say("Good. I accept your sacrifice. The last sacrifice I require from you is a {ring of the sky}. Bring it to me and do give it happily.", cid)
			setPlayerStorageValue(cid, 10223, 4)
			talkState[talkUser] = 0
		else
			npcHandler:say("Sorry, but you don\'t have {Crown Legs} !", cid)
			talkState[talkUser] = 0
		end

	elseif msgcontains(msg, "ring of the sky") and getPlayerStorageValue(cid, 10223) == 4 then
		if getPlayerItemCount(cid, 2123) >= 1 then
			npcHandler:say("Is it your true wish to sacrifice a ring of the sky to Zathroth ?", cid)
			talkState[talkUser] = 1
		else
			npcHandler:say("Sorry, but you don\'t have {Ring of The Sky} !", cid)
			talkState[talkUser] = 0
		end

	elseif msgcontains(msg, "yes") and getPlayerStorageValue(cid, 10223) == 4 and talkState[talkUser] == 1 then
		if (doPlayerRemoveItem(cid, 2123, 1) == TRUE) then
			npcHandler:say("Good. I accept your sacrifice. You have proven that you are a true follower of Zathroth and do not hesitate to sacrificeworldly goods. Thus, I will reward you with this headgear.", cid)
				if getPlayerSex(cid) == 0 then
					doPlayerAddOutfit(cid, 149, 1)
				else
					doPlayerAddOutfit(cid, 145, 1)
				end
			setPlayerStorageValue(cid, 10223, 5)
			talkState[talkUser] = 0
		else
			npcHandler:say("Sorry, but you don\'t have {Ring of The Sky} !", cid)
			talkState[talkUser] = 0
		end
	else
		if msgcontains(msg, "outfit") then
			if getPlayerStorageValue(cid, 10223) <= 4 then
				item = getItemNameById(outfit[getPlayerStorageValue(cid, 10223)][1])
				npcHandler:say("Bring me ".. item .." !", cid)
			else
				npcHandler:say("You have already this outfit !", cid)
			end
		end
	end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
