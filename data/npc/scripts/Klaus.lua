local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local Topic = {}
local storage = 89647 -- Storage number --

function onCreatureAppear(cid)        npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg) end
function onThink()             npcHandler:onThink() end

function greetCallback(cid)
  local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  Topic[talkUser] = 0
    return true
end

function creatureSayCallback(cid, type, msg)

  if(not npcHandler:isFocused(cid)) then
    return false
  end

  local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  if msgcontains(msg, "yes") and Topic[talkUser] == 1 and getPlayerStorageValue(cid, storage) == 3 then
    npcHandler:say("You DID it!!! Incredible! Boys, lets have a PAAAAAARTY!!!!", cid)
	setPlayerStorageValue(cid, storage, 4)
    Topic[talkUser] = 0
  elseif msgcontains(msg, "mission") and getPlayerStorageValue(cid, storage) == 1 then
    npcHandler:say("Hmm, you look like a seasoned seadog. Kill Captain Ray Striker, bring me his lucky pillow as a proof and you are our hero!", cid)
	setPlayerStorageValue(cid, storage, 2)
	Topic[talkUser] = 1
  elseif getPlayerStorageValue(cid, storage) == 3 then
    npcHandler:say("Do you have Strikers pillow?", cid)
    Topic[talkUser] = 0
  end
  return TRUE
end

npcHandler:setMessage(MESSAGE_GREET, "Whenever your throat is dry, you know where to find my tavern.")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())