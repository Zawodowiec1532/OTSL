	-- Made by Leon Zawodowiec --
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(not npcHandler:isFocused(cid)) then
		return false
	elseif msgcontains(msg, "spider silk yarn") then
		if getPlayerItemCount(cid, 5879) >= 10 then
			npcHandler:say("Do you want to exchange 10 giant spider silks ?", cid)
			talkState[talkUser] = 1
		else
			npcHandler:say("I need {10 giant spider silks}, to give you spider silk yarn. Come back when you will have them.", cid)
			talkState[talkUser] = 0
		end
	elseif msgcontains(msg, 'yes') and talkState[talkUser] == 1 then
		talkState[talkUser] = 0
		if getPlayerItemCount(cid, 5879) >= 10 then
			if doPlayerRemoveItem(cid, 5879, 10) == TRUE then
				doPlayerAddItem(cid, 5886, 1)
				npcHandler:say("Here you are.", cid)
			end
		else
			npcHandler:say("You do not have the required items.", cid)
		end

	elseif msgcontains(msg, "warrior\'s sweat") then
		if getPlayerItemCount(cid, 2475) >= 4 then
			npcHandler:say("Do you want to exchange 4 warrior helmets ?", cid)
			talkState[talkUser] = 2
		else
			npcHandler:say("I need a {4 warrior helmet\'s}, to give you the warrior sweat. Come back when you have them.", cid)
			talkState[talkUser] = 0
		end
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 2 then
		talkState[talkUser] = 0
		if getPlayerItemCount(cid, 2475) >= 4 then
			if doPlayerRemoveItem(cid, 2475, 4) == TRUE then
				doPlayerAddItem(cid, 5885, 1)
				npcHandler:say("Here you are.", cid)
			end
		else
			npcHandler:say("You do not have the required items.", cid)
		end
	elseif msgcontains(msg, "magic sulphur") then
		if getPlayerItemCount(cid, 2392) >= 3 then
			npcHandler:say("Do you want to exchange 3 fire swords ?", cid)
			talkState[talkUser] = 3
		else
			npcHandler:say("I need {3 fire sword\'s}, to give you the magic sulphur. Come back when you have them.", cid)
			talkState[talkUser] = 0
		end
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 3 then
		talkState[talkUser] = 0
		if getPlayerItemCount(cid, 2392) >= 3 then
			if doPlayerRemoveItem(cid, 2392, 3) == TRUE then
				doPlayerAddItem(cid, 5904, 1)
				npcHandler:say("Here you are.", cid)
			end
		else
			npcHandler:say("You do not have the required items.", cid)
		end
	elseif msgcontains(msg, "enchanted chicken wing") then
			if getPlayerItemCount(cid, 2195) >= 1 then
				npcHandler:say("Do you want to exchange boots of haste ?", cid)
				talkState[talkUser] = 4
			else
				npcHandler:say("I need {boots of haste}, to give you the enchanted chicken wing. Come back when you have them.", cid)
				talkState[talkUser] = 0
			end
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 4 then
		talkState[talkUser] = 0
		if getPlayerItemCount(cid, 2195) >= 1 then
			if doPlayerRemoveItem(cid, 2195, 1) == TRUE then
				doPlayerAddItem(cid, 5891, 1)
				npcHandler:say("Here you are.", cid)
			end
		else
			npcHandler:say("You do not have the required items.", cid)
		end
	elseif msgcontains(msg, "fighting spirit") then
			if getPlayerItemCount(cid, 2498) >= 2 then
				npcHandler:say("Do you want to exchange 2 Royal Helmets ?", cid)
				talkState[talkUser] = 5
			else
				npcHandler:say("I need a {2 Royal Helmet\'s}, to give you the Fighting Spirit. Come back when you have them.", cid)
				talkState[talkUser] = 0
			end
	elseif msgcontains(msg, 'yes') and talkState[talkUser] == 5 then
		talkState[talkUser] = 0
		if getPlayerItemCount(cid,2498) >= 2 then
			if doPlayerRemoveItem(cid, 2498, 2) == TRUE then
				doPlayerAddItem(cid, 5884, 1)
				npcHandler:say("Here you are.", cid)
			end
		else
			npcHandler:say("You do not have the required items.", cid)
		end
	elseif msgcontains(msg, "no") then 
		if (talkState[talkUser] >= 1 and talkState[talkUser] <= 5) then -- test ;/
			npcHandler:say("So Leave, LEAVE ME NOW!", cid)
			talkState[talkUser] = 0
		end
	end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())