	-- Made by Leon Zawodowiec --
	 --@TODO: Ustalić wiadomości w razie odmówienia oraz wyrzucenia czaszki, sprawdzić ID czaszki oraz upewnić się, że nie jest potrzebny AID. --
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local talkUser = 0
local config = {
	skull_id = 11076,
	reward = 11115,
	quest_storage = 17935,
	frontier_quest = 17000,
	tower_mission = 17001,
	beer_in_pot = 2562
}

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if (getPlayerStorageValue(cid, config.frontier_quest) > 2) then
		if msgcontains(msg, "mission") and talkState[talkUser] == nil and getPlayerStorageValue(cid, config.quest_storage) == -1 then
			msgs = {
				"Big problem we have! Skull of first leader gone. He ancestor of whole tribe but died long ago in war. We have keep his skull on our sacred place. ...",
				"Then one night, green men came with wolves... and one of wolves took skull and ran off chewing on it! We need back - many wisdom and power is in skull. Maybe they took to north fortress. But can be hard getting in. You try get our holy skull back?"
			}
			doNPCTalkALot(msgs, 2500, cid)
			talkState[talkUser] = 1
		elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
			npcHandler:say("You hero of our tribe if bring back holy skull!", cid)
			setPlayerStorageValue(cid, config.quest_storage, 1)
			talkState[talkUser] = 666
		end

		if msgcontains(msg, "mission") and talkState[talkUser] == nil and getPlayerStorageValue(cid, config.quest_storage) == 1 and getPlayerStorageValue(cid, config.skull_id) == 1 then
			if getPlayerItemCount(cid, config.skull_id) >= 1 then
				npcHandler:say("Oh! You found holy skull? In bone pile you found?! Thank Pandor you brought! Me can have it back?", cid)
				talkState[talkUser] = 2
			else
				npcHandler:say("You don't have a holy skull.", cid)
			end
		end

		if msgcontains(msg, "yes") and talkState[talkUser] == 2 then
			if getPlayerItemCount(cid, config.skull_id) >= 1 then
				doPlayerRemoveItem(cid, config.skull_id, 1)
				npcHandler:say("Me thank you much! All wisdom safe again now.", cid)
				setPlayerStorageValue(cid, config.quest_storage, 2)
			else
				npcHandler:say("You don't have a holy skull.", cid)
			end
		end

		if msgcontains(msg, "mission") and talkState[talkUser] == nil and getPlayerStorageValue(cid, config.quest_storage) == 2 then
			msgs = {
				"You brought back skull of first leader. Hero of tribe! But we more missions to do. ...",
				"Me and Ulala talk about land outside. We wanting to see more of land! Land over big water! But us no can leave tribe. No can cross water. Only way is skull of first leader. ...",
				"What holy skull sees, tribe sees. That we believe. Can you bring holy skull over big water and show places?"
			}
			doNPCTalkALot(msgs, 1500, cid)
			talkState[talkUser] = 3
		elseif msgcontains(msg, "yes") and talkState[talkUser] == 3 and getPlayerStorageValue(cid, config.quest_storage) ~= 3 then
			npcHandler:say("Here take holy skull. You bring where you think is good. See as much as possible! See where other people live!", cid)
			doPlayerAddItem(cid, config.skull_id, 1, true)
			setPlayerStorageValue(cid, config.quest_storage, 3)
			talkState[talkUser] = 666
		end

		if msgcontains(msg, "mission") and talkState[talkUser] == nil and getPlayerStorageValue(cid, config.quest_storage) == 3 then
			if getPlayerStorageValue(cid, config.tower_mission) == 11 then
				npcHandler:say("You say you was to where sun is hot and burning? And where trees grow as high as mountain? And where Fasuon cries white tears? Me can't wait to see!! Can have holy skull back?", cid)
				talkState[talkUser] = 4
			else
				npcHandler:say("Back to me when you will take a skull around the world.", cid)
			end
		elseif msgcontains(msg, "yes") and talkState[talkUser] == 4 then
			npcHandler:say("We make big ritual soon and learn much about world outside. Me thank you many times for teaching us world. Very wise and adventurous you are!", cid)
			setPlayerStorageValue(cid, config.quest_storage, 4)
			talkState[talkUser] = 666
		end

		if msgcontains(msg, "mission") and talkState[talkUser] == nil and getPlayerStorageValue(cid, config.quest_storage) == 4 then
			npcHandler:say("We been weak for too long! We prepare for great hunt. But still need many doings! You can help us?", cid)
			talkState[talkUser] = 5
		elseif (msgcontains(msg, "yes") and (talkState[talkUser] == 5 or getPlayerStorageValue(cid, config.quest_storage) == 5)) then
			npcHandler:say("We need to calm and make happy gods. Best go to Ulala. She is priest of us and can tell what needs doing.", cid)
			setPlayerStorageValue(cid, config.quest_storage, 5)
			talkState[talkUser] = 666
		end

		if msgcontains(msg, "mission") and talkState[talkUser] == nil and getPlayerStorageValue(cid, config.quest_storage) == 6 then
			msgs = {
				"You well did! Great hunt is under best signs now. We prepare weapons and paint faces and then go! ...",
				"No no, you no need to help us. But can prepare afterparty! Little men sent us stuff some time ago. Was strange water in there. Brown and stinky! But when we tried all tribe became veeeeeeery happy. ...",
				"Now brown water is gone and we sad! Can you bring POT of brown water for party after great hunt? Just bring to me and me trade for shiny treasure."
			}
			doNPCTalkALot(msgs, 1500, cid)
			setPlayerStorageValue(cid, config.quest_storage, 7)
		end

		if msgcontains(msg, "mission") and talkState[talkUser] == nil and getPlayerStorageValue(cid, config.quest_storage) == 7 then
			npcHandler:say("You bring us big pot of strange water from little men?", cid)
			talkState[talkUser] = 6
		elseif msgcontains(msg, "yes") and talkState[talkUser] == 6 then
			local beer = getPlayerItemById(cid, true, config.beer_in_pot, 3).uid
			if (beer > 0) then
				npcHandler:say("Me thank you much! Party will be great again! Here you have old treasure of tribe for trade. Found in caves. Me hope you can use one day.", cid)
				doRemoveItem(beer)
				doPlayerAddItem(cid, config.reward, 1, true)
				setPlayerStorageValue(cid, config.quest_storage, 8)
			else
				npcHandler:say("Please bring the brown water.", cid)
			end
		end
	elseif msgcontains(msg, "mission") then
		npcHandler:say("You must at least start third part of Frontier Quest!", cid)
	end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
