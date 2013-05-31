	-- Made by Leon Zawodowiec --
local keywordHandler = KeywordHandler:new()																	
local npcHandler = NpcHandler:new(keywordHandler)															
NpcSystem.parseParameters(npcHandler)																	
local talkState = {}																				
																									
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end					
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end					
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end			
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end	
	
	local maxmissions = 10 -- ustawiasz maksymalna ilosc questow
	local mistat = getPlayerStorageValue(cid, 32099)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local tabgreg = 								-- tabela z questami 1,2,3 itd.. oznacza kolejnosc questow
	{										
	[1] = {2328, 32100, 2160, 5, "I lost one near Casino Royal."}, 			-- Phoenix Egg
	[2] = {"Dragon Lord", 32101, 2160, 10, "Don\'t use fire spells !"},
	[3] = {2195, 32102, 2160, 13, "These boots incrases your speed by +20 !"}, -- Low Experience Ring
	[4] = {"Fury", 32103, 2160, 15, "They are under The Flu Lake."},
	[5] = {"Grim Reaper", 32104, 2160, 15, "Don\'t forget about Ghostland Quest !"},
	[6] = {"Demon", 32105, 2160, 15, "Demons are dangerous monsters, be carefull !"},
	[7] = {"Orshabaal", 32106, 2160, 70, "He is near entrace to Onyxia Lair."},
	[8] = {5903, 32107, 2160, 100, "Ferumbras wearning it."},
	[9] = {5943, 32108, 7895, 1, "Take a knife."},				-- Morgaroth Heart
	[maxmissions] = {"Koniec", 32199, 0, 0, ""}
	}
	
	local revard = tabgreg[mistat][3]
	local revardcount = tabgreg[mistat][4]
	local storagreg = tabgreg[mistat][2]
	local namegreg = tabgreg[mistat][1]
	
	if(msgcontains(msg, 'mission') or msgcontains(msg, 'adventure')) then
		if maxmissions == mistat then
			selfSay('Nice to see you.. but I dont have more missions for you.', cid)
		else
			if getPlayerStorageValue(cid, storagreg) == 2 or(doPlayerRemoveItem(cid, namegreg, 1) == true) then
				talkState[talkUser] = 0
				if (not tonumber(namegreg)) then
					setPlayerStorageValue(cid, 32099, mistat + 1)
					setPlayerStorageValue(cid, storagreg, 0)
					doPlayerAddItem(cid, revard, revardcount)
					selfSay('There is your reward: '.. revardcount .. 'x '.. getItemNameById(revard) ..'.', cid)
				else
					setPlayerStorageValue(cid, 32099, mistat+1)
					setPlayerStorageValue(cid, storagreg, 0)
					doPlayerAddItem(cid, revard, revardcount)
					selfSay('There is your reward.', cid)
				end
			elseif getPlayerStorageValue(cid, storagreg) == 1 then
				if (not tonumber(namegreg)) then
					selfSay('First kill ' .. namegreg .. ' for me !', cid)
				else
					selfSay('First bring for me ' .. getItemNameById(namegreg) .. ' !', cid)
				end
			else
				selfSay('Do you want to take a mission ?', cid)
				talkState[talkUser] = 1
			end
		end	
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		setPlayerStorageValue(cid, storagreg, 1)
		if (not tonumber(namegreg)) then
			selfSay('So, let kill ' .. namegreg .. '. Greg Hint: ' .. tabgreg[mistat][5] .. '', cid)
		else
			selfSay('So, bring me ' .. getItemNameById(namegreg) .. '. Greg Hint: ' .. tabgreg[mistat][5] .. '', cid)
		end
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		talkState[talkUser] = 0
		selfSay('Then why are you wasting my time ?', cid)
	end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())