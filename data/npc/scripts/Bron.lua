local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --

fbarbarian    = 22015
sbarbarian    = 22016

newaddon    = 'Ah, right! The axe or wig! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function BarbarianFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,fbarbarian)
    if addon == -1 then
                if getPlayerItemCount(cid,5884) >= 1 and getPlayerItemCount(cid,5885) >= 1 and getPlayerItemCount(cid,5911) >= 50 and getPlayerItemCount(cid,5910) >= 50 and getPlayerItemCount(cid,5886) >= 10 then
        if doPlayerRemoveItem(cid,5884,1) and doPlayerRemoveItem(cid,5885,1) and doPlayerRemoveItem(cid,5911,50) and doPlayerRemoveItem(cid,5910,50) and doPlayerRemoveItem(cid,5886,10) then
            npcHandler:say('Ah, right! The wig! Here you go.')
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,fbarbarian,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 143, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 147, 2)
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

function BarbarianSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,sbarbarian)
    if addon == -1 then
        if getPlayerItemCount(cid,5880) >= 100 and getPlayerItemCount(cid,5892) >= 1 and getPlayerItemCount(cid,5893) >= 50 and getPlayerItemCount(cid,5876) >= 50 then
        if getPlayerItemCount(cid,5880) >= 100 and getPlayerItemCount(cid,5892) >= 1 and getPlayerItemCount(cid,5893) >= 50 and getPlayerItemCount(cid,5876) >= 50 then
            npcHandler:say('Ah, right! The axe! Here you go.')
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,sbarbarian,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 143, 2)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 147, 1)
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


node1 = keywordHandler:addKeyword({'wig'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get wig, you need to bring me, 1 fighting spirit, warrior\'s sweat, 50 pieces of red cloth, 50 pieces of green cloth, 10 spider silk yarn. Do you have them with you?'})
node1:addChildKeyword({'yes'}, BarbarianFirst, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'first'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get winged tiara you need give me an engraved crossbow, 100 lizard leathers, 100 red dragon leather, 5 enchanted chicken wings, royal steel, hell steel and draconian steel. Do you have them with you?'})
node2:addChildKeyword({'yes'}, BarbarianFirst, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node3 = keywordHandler:addKeyword({'axe'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get wig, ou need to bring me, 100 iron ore, 50 lizard leather, 1 huge chuck of crude iron, 50 perfect behemoth fang. Do you have them with you?'})
node3:addChildKeyword({'yes'}, BarbarianSecond, {})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node4 = keywordHandler:addKeyword({'second'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get wig, ou need to bring me, 100 iron ore, 50 lizard leather, 1 huge chuck of crude iron, 50 perfect behemoth fang. Do you have them with you?'})
node4:addChildKeyword({'yes'}, BarbarianSecond, {})
node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())