local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --

fwizard        = 22013 
swizard        = 22014 

newaddon    = 'Ah, right! The wizard skull mask or wizard snake tiara! Here you go.'
noitemss        = 'You do not have all the required items.'
noitemss2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function WizardSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,swizard)
    if addon == -1 then
        if getPlayerItemCount(cid,2488) >= 1 and getPlayerItemCount(cid,2123) >= 1 and getPlayerItemCount(cid,2492) >= 1 and getPlayerItemCount(cid,2536) >= 1 then
        if doPlayerRemoveItem(cid,2488,1) and doPlayerRemoveItem(cid,2123,1) and doPlayerRemoveItem(cid,2492,1) and doPlayerRemoveItem(cid,2536,1) then
            npcHandler:say('Ah, right! The wizard skull mask or wizard snake tiara! Here you go.')
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,swizard,1)
			if getPlayerSex(cid) == 1 then
            doPlayerAddOutfit(cid, 145, 2)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 149, 2)
        end    
        end
        else
            selfSay(noitemss)
        end
    else
        selfSay(already)
    end
    end

end


node1 = keywordHandler:addKeyword({'skull mask'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get wizard skull mask you need give me a dragon scale mail, a pair of crown legs, a medusa shield and a ring of the sky. Do you have them with you?'})
node1:addChildKeyword({'yes'}, WizardSecond, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'snake tiara'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get wizard snake tiara you need give me a dragon scale mail, a pair of crown legs, a medusa shield and a ring of the sky. Do you have them with you?'})
node2:addChildKeyword({'yes'}, WizardSecond, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node3 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get wizard snake tiara you need give me a dragon scale mail, a pair of crown legs, a medusa shield and a ring of the sky. Do you have them with you?'})
node3:addChildKeyword({'yes'}, WizardSecond, {})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})


npcHandler:addModule(FocusModule:new())