	-- Made by Leon Zawodowiec --
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talkState = {}
local quest = 7265

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	if(not npcHandler:isFocused(cid)) then
		return false
		
	elseif msgcontains(msg, "newspaper") and getPlayerStorageValue(cid, quest) ~= 1 then
		npcHandler:say("Okey, here you go. Have fun on Revolution OTS!", cid)
		local newspaper = doPlayerAddItem(cid, 2160, 1)
		doSetItemActionId(newspaper, 5715)
		setPlayerStorageValue(cid, quest, 1)
	else
		npcHandler:say("I have already gave you a newcomer newspaper.", cid)
	end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())