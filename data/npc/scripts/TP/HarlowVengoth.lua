	-- Made by Leon Zawodowiec --
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
        
function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink() 						npcHandler:onThink()						end
        
local travelNode1 = keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can bring you back to Trade Quarter for 0 gold. Agreed?'})
	travelNode1:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32837, y=31365, z=7}, msg = 'Okay. Enjoy!' })
	travelNode1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Come back anytime.'})
			
local travelNode2 = keywordHandler:addKeyword({'yalahar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can bring you back to Trade Quarter for 0 gold. Agreed?'})
	travelNode2:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32837, y=31365, z=7}, msg = 'Okay. Enjoy!' })
	travelNode2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Come back anytime.'})
			
local travelNode3 = keywordHandler:addKeyword({'trade quarter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can bring you back to Trade Quarter for 0 gold. Agreed?'})
	travelNode3:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32837, y=31365, z=7}, msg = 'Okay. Enjoy!' })
	travelNode3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Come back anytime.'})
			
local travelNode4 = keywordHandler:addKeyword({'back'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can bring you back to Trade Quarter for 0 gold. Agreed?'})
	travelNode4:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32837, y=31365, z=7}, msg = 'Okay. Enjoy!' })
	travelNode4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Come back anytime.'})
	
local travelNode5 = keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can bring you back to Thais for 0 gold. Agreed?'})
	travelNode5:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32310, y=32210, z=6}, msg = 'Okay. Enjoy!' })
	travelNode5:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Come back anytime.'})
	
npcHandler:addModule(FocusModule:new())