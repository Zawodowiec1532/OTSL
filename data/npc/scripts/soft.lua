	-- Made by Leon Zawodowiec --
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()							npcHandler:onThink()						end

function creatureSayCallback(cid, type, msg)

	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if (msgcontains(msg, 'soft') or msgcontains(msg, 'soft boots')) then
		selfSay('Do you want to repair your worn soft boots for 20000 gold coins ?', cid)
		talkState[talkUser] = 1
	
	elseif (msgcontains(msg, 'firewalkers') or msgcontains(msg, 'firewalker boots')) then
		selfSay('Do you want to repair your worn firewalker boots for 40000 gold coins ?', cid)
		talkState[talkUser] = 2
		
	elseif (msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		if (getPlayerItemCount(cid, 10021) >= 1) then
			if (doPlayerRemoveMoney(cid, 20000) == TRUE) then
				doPlayerRemoveItem(cid, 10021, 1)
				doPlayerAddItem(cid, 2640)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have soft boots.', cid)
		end
		talkState[talkUser] = 0
		
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
		talkState[talkUser] = 0
		selfSay('Ok then.', cid)
			
	elseif (msgcontains(msg, 'yes') and talkState[talkUser] == 2) then
		if (getPlayerItemCount(cid, 10022) >= 1) then
			if (doPlayerRemoveMoney(cid, 40000) == TRUE) then
				doPlayerRemoveItem(cid, 10022, 1)
				doPlayerAddItem(cid, 9933)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have firewalker boots.', cid)
		end
		talkState[talkUser] = 0
	end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
