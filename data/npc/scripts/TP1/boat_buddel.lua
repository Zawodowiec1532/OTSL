	-- Made by Leon Zawodowiec --
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
    NpcSystem.parseParameters(npcHandler)
        
        function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
        function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
        function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
        function onThink() 							npcHandler:onThink() 						end


    local travelNode = keywordHandler:addKeyword({'raider'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to go to Raider Camp for 0 cold pieces ?'})
        travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, level = 0, cost = 0, destination = {x=32243, y=31429, z=7}})
        travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Then stay here !'})
        
	local travelNode = keywordHandler:addKeyword({'helheim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to go to Helheim for 0 cold pieces ?'})
        travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, level = 0, cost = 0, destination = {x=32552, y=31228, z=7}})
        travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Then stay here !'})
        
	local travelNode = keywordHandler:addKeyword({'tyrsung'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to go to Tyrsung for 0 cold pieces ?'})
        travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, level = 0, cost = 0, destination = {x=32423, y=31281, z=7}})
        travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Then stay here !'})

	local travelNode = keywordHandler:addKeyword({'okolnir'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to go to Okolnir for 0 cold pieces ?'})
        travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, level = 0, cost = 0, destination = {x=32315, y=31435, z=7} })
        travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Then stay here !'})

	local travelNode = keywordHandler:addKeyword({'svargrond'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to go to Svargrond for 0 cold pieces ?'})
        travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, level = 0, cost = 0, destination = {x=32346, y=31251, z=7} })
        travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Then stay here !'})

    local travelNode = keywordHandler:addKeyword({'barbarian'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to go to Raider Camp for 0 cold pieces ?'})
        travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, level = 0, cost = 0, destination = {x=32243, y=31429, z=7} })
        travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Then stay here !'})

    keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can take you to Eremo, Ab\'dendriel, Darashia, Venore, Ankrahmun, Port Hope, Thais, Liberty Bay and Carlin.'})
    keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the captain of this ship.'})
    keywordHandler:addKeyword({'travel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can take you to Eremo, Carlin, Ab\'dendriel, Darashia, Venore, Ankrahmun, Port Hope, Thais, Liberty Bay and Carlin.'})

    npcHandler:addModule(FocusModule:new())