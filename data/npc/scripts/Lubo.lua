local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --

fcitizen     = 22001 
scitizen     = 22002 

newaddon    = 'Ah, right! The citizen backpack! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function CitizenFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,fcitizen)
    if addon == -1 then
        if getPlayerItemCount(cid,5878) >= 100 then
        if doPlayerRemoveItem(cid,5878,100) then
            npcHandler:say('Ah, right! The citizen backpack! Here you go.')
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,fcitizen,1)
			if getPlayerSex(cid) == 1 then
            doPlayerAddOutfit(cid, 128, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 136, 1)
        end    
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end
----------------------------------PARADOX--------------------------
function creatureSayCallback(cid, type, msg)
if (not npcHandler:isFocused(cid)) then
        return false
    end

		local queststate = getPlayerStorageValue(cid,6666)
		
		if msgcontains(msg, 'crunor\'s cottage') and queststate == 1 then
			npcHandler:say('Ah yes, I remember my grandfather talking about that name. This house used to be an inn a long time ago. My family bought it from some of these flower', cid)
        talk_state = 1
		elseif msgcontains(msg, 'flower guys') and talk_state == 1 then
			npcHandler:say('Oh, I mean druids of course. They sold the cottage to my family after some of them died in an accident or something like that.', cid)
                talk_state = 2
		elseif msgcontains(msg, 'accident') and talk_state == 2 then
			npcHandler:say('As far as I can remember the story, a pet escaped its stable behind the inn. It got somehow involved with powerfull magic at a ritual and was transformed in some way.', cid)
                talk_state = 3
		elseif msgcontains(msg, 'stable') and talk_state == 3 then
			npcHandler:say('My grandpa told me, in the old days there were some behind this cottage. Nothing big though, just small ones, for chicken or rabbits.', cid)
                setPlayerStorageValue(cid,6667,1)
				talk_state = 4
		elseif msgcontains(msg, 'bye') and (talk_state >= 1 and talk_state <= 4) then
			npcHandler:say('Farewell.', cid)

			talk_state = 0
		end
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	return true
end




node1 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get citizen backpack you need give me 100 minotaur leathers. Do you have them with you?'})
    node1:addChildKeyword({'yes'}, CitizenFirst, {})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())