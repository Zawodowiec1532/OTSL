	-- made by Leon Zawodowiec --
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local Topic = {}
local storage = 89647

function onCreatureAppear(cid)        	npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid)       npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()             			npcHandler:onThink() 						end

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
  
	if msgcontains(msg, "yes") and Topic[talkUser] == 1 and getPlayerStorageValue(cid, storage) < 1 then
		npcHandler:say("Obtain this mission from him and learn what he needs as a proof. Then return to me and report to me about your mission so we can formulate an appropriate plan.", cid)
		setPlayerStorageValue(cid, storage, 1)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "mission") and getPlayerStorageValue(cid, storage) < 1 then
		npcHandler:say("Well done, my friend. That will help us a lot. Of course there are other things to be done though ...", cid)
		npcHandler:say("I learned that Klaus, the owner of the tavern, wants me dead. He is offering any of those pirates a mission to kill me ...", cid)
		npcHandler:say("If we could convince him that you fulfilled that mission, the pirates will have the party of their lives. This would be our chance for a sneak attack to damage their boats and steal their plunder! Are you willing to do that?", cid)
		Topic[talkUser] = 1
	elseif getPlayerStorageValue(cid, storage) == 2 then
		npcHandler:say("My pillow?? They know me all too well... <sigh> I own it since my childhood. However. Here, take it and convince him that I am dead.", cid)
		setPlayerStorageValue(cid, storage, 3)
		Topic[talkUser] = 0
	elseif getPlayerStorageValue(cid, storage) == 4 then
		npcHandler:say("Incredible! You did what no other did even dare to think about! You are indeed a true hero to our cause ...", cid)
		npcHandler:say("Sadly I have no ship that lacks a captain, else you would of course be our first choice. I am still true to my word as good as I am able to ...", cid)
		npcHandler:say("So take this as your very own ship. Oh, and remind me about the pirate outfit sometime.", cid)
		setPlayerStorageValue(cid, storage, 5)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "pirate outfit") and Topic[talkUser] == 1 and getPlayerStorageValue(cid, storage) >= 5 then
		npcHandler:say("Ah, right! The pirate outfit! Here you go, now you are truly one of us.", cid)
		if getPlayerSex(cid) == 1 then 
			doPlayerAddOutfit(cid, 278, 2)
		elseif getPlayerSex(cid) == 0 then
			doPlayerAddOutfit(cid, 279, 2)
			Topic[talkUser] = 0
		end
	end
return true
end

npcHandler:setMessage(MESSAGE_GREET, "May there always be wind in your sails.")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())