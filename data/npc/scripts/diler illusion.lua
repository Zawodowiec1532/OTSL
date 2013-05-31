local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'small health'}, 8704, 20, 1, 'small health potion')
shopModule:addBuyableItem({'health potion'}, 7618, 45, 1, 'health potion')
shopModule:addBuyableItem({'mana potion'}, 7620, 50, 1, 'mana potion')
shopModule:addBuyableItem({'strong health'}, 7588, 100, 1, 'strong health potion')
shopModule:addBuyableItem({'strong mana'}, 7589, 80, 1, 'strong mana potion')
shopModule:addBuyableItem({'great health'}, 7591, 190, 1, 'great health potion')
shopModule:addBuyableItem({'great mana'}, 7590, 120, 1, 'great mana potion')
shopModule:addBuyableItem({'great spirit'}, 8472, 190, 1, 'great spirit potion')
shopModule:addBuyableItem({'ultimate health'}, 8473, 310, 1, 'ultimate health potion')

shopModule:addBuyableItem({'instense healing'}, 2265, 95, 1, 'intense healing rune')
shopModule:addBuyableItem({'ultimate healing'}, 2273, 175, 1, 'ultimate healing rune')
shopModule:addBuyableItem({'fire bomb'}, 2305, 117, 1, 'fire bomb')
shopModule:addBuyableItem({'destroy field'}, 2261, 15, 1, 'destroy field rune')
shopModule:addBuyableItem({'light magic missile'}, 2287, 4, 1, 'light magic missile rune')
shopModule:addBuyableItem({'heavy magic missile'}, 2311, 12, 1, 'heavy magic missile rune')
shopModule:addBuyableItem({'great fireball'}, 2304, 45, 1, 'great fireball rune')
shopModule:addBuyableItem({'explosion'}, 2313, 31, 1, 'explosion rune')
shopModule:addBuyableItem({'sudden death'}, 2268, 108, 1, 'sudden death rune')
shopModule:addBuyableItem({'animate dead'}, 2316, 375, 1, 'animate dead rune')
shopModule:addBuyableItem({'animate dead'}, 2288, 37, 1, 'stone shower rune')

shopModule:addBuyableItem({'convince creature'}, 2290, 80, 1, 'convince creature rune')
shopModule:addBuyableItem({'chameleon'}, 2291, 210, 1, 'chameleon rune')
shopModule:addBuyableItem({'desintegrate'}, 2310, 80,  1, 'desintegreate rune')
shopModule:addBuyableItem({'fire field'}, 2301, 28,  1, 'fire field rune')
shopModule:addBuyableItem({'fire wall'}, 2303, 61,  1, 'fire wall rune')
shopModule:addBuyableItem({'energy field'}, 2301, 38,  1, 'energy field rune')
shopModule:addBuyableItem({'avalanche rune'}, 2274, 45,  1, 'avalanche rune')
shopModule:addBuyableItem({'antidote rune'}, 2266, 65,  1, 'antidote rune')
shopModule:addBuyableItem({'energy wall'}, 2279, 85,  1, 'energy wall rune')
shopModule:addBuyableItem({'stalagmite rune'}, 2292, 12,  1, 'stalagmite rune')
shopModule:addBuyableItem({'fire ball'}, 2302, 30,  1, 'fire ball rune')
shopModule:addBuyableItem({'icicle'}, 2271, 30,  1, 'icicle rune')
shopModule:addBuyableItem({'magic wall'}, 2293, 116,  1, 'magic wall rune')
shopModule:addBuyableItem({'paralyze'}, 2278, 700,  1, 'paralyze rune')
shopModule:addBuyableItem({'poison field'}, 2285, 21,  1, 'poison field rune')
shopModule:addBuyableItem({'poison wall'}, 2289, 52,  1, 'poison wall rune')
shopModule:addBuyableItem({'blank'}, 2260, 10,  1, 'blank rune')

shopModule:addBuyableItemContainer({'bp blank'},     1998, 2260, 220, 1, 'bp blank rune')

shopModule:addBuyableItemContainer({'bp animate dead'},     1998, 2316, 7520, 1, 'bp animate dead rune')
shopModule:addBuyableItemContainer({'bp antidote'},         2003, 2266, 1320, 1, 'bp antidote rune')
shopModule:addBuyableItemContainer({'bp magic wall'},         1988, 2293, 1320, 1, 'bp magic wall')
shopModule:addBuyableItemContainer({'bp avalanche'},         2002, 2274, 3600,4, 'bp avalanche rune')
shopModule:addBuyableItemContainer({'bp chameleon'},         1998, 2291, 4220,1, 'bp chameleon rune')
shopModule:addBuyableItemContainer({'bp convince creature'},     1998, 2290, 1620,1, 'bp convince creature rune')
shopModule:addBuyableItemContainer({'bp desintegrate'},     2001, 2310, 1620,3, 'bp desintegrate rune')
shopModule:addBuyableItemContainer({'bp destroy field'},     2003, 2261, 920,3,  'bp destroy field')
shopModule:addBuyableItemContainer({'bp energy bomb'},         2003, 2262, 6520,2, 'bp energy bomb rune')
shopModule:addBuyableItemContainer({'bp energy field'},     1998, 2277, 2320,3, 'bp energy field')
shopModule:addBuyableItemContainer({'bp energy wall'},         2002, 2279, 6820,4, 'bp energy wall rune')
shopModule:addBuyableItemContainer({'bp explosion'},         2001, 2313, 3820,6, 'bp explosion rune')
shopModule:addBuyableItemContainer({'bp fire bomb'},         2000, 2305, 4720,2, 'bp fire bomb rune')
shopModule:addBuyableItemContainer({'bp fire field'},         2000, 2301, 1720,3,  'bp fire field rune')
shopModule:addBuyableItemContainer({'bp fireball'},         2000, 2302, 3020,5,  'bp fire ball')
shopModule:addBuyableItemContainer({'bp gfb'},     2000, 2304, 3620,4, 'bp gfb')
shopModule:addBuyableItemContainer({'bp hmm'},     2001, 2311, 2420,10, 'bp hmm')
shopModule:addBuyableItemContainer({'bp icicle'},         2002, 2271, 3020,5, 'bp icicle')
shopModule:addBuyableItemContainer({'bp ih'},     2003, 2265, 1920,1, 'bp ih')
shopModule:addBuyableItemContainer({'bp lmm'},     1998, 2287, 820,10, 'bp lmm')
shopModule:addBuyableItemContainer({'bp poison field'},     1998, 2285, 1320,3,  'bp poison field')
shopModule:addBuyableItemContainer({'bp poison wall'},         1998, 2289, 4220,4, 'bp poison wall rune')
shopModule:addBuyableItemContainer({'bp sd'},     2003, 2268, 6500 ,10, 'bp sd')
shopModule:addBuyableItemContainer({'bp uh'},     2002, 2273, 3520,3, 'bp uh')

shopModule:addBuyableItemContainer({'bp shp'}, 2000, 8704, 400, 1, 'backpack of small health potions')
shopModule:addBuyableItemContainer({'bp hp'}, 2000, 7618, 900, 1, 'backpack of health potions')
shopModule:addBuyableItemContainer({'bp mp'}, 2001, 7620, 1000, 1, 'backpack of mana potions')
shopModule:addBuyableItemContainer({'bp shp'}, 2000, 7588, 2000, 1, 'backpack of strong health potions')
shopModule:addBuyableItemContainer({'bp smp'}, 2001, 7589, 1600, 1, 'backpack of strong mana potions')
shopModule:addBuyableItemContainer({'bp ghp'}, 2000, 7591, 3800, 1, 'backpack of great health potions')
shopModule:addBuyableItemContainer({'bp gmp'}, 2001, 7590, 2400, 1, 'backpack of great mana potions')
shopModule:addBuyableItemContainer({'bp gsp'}, 1999, 8472, 3820, 1, 'backpack of great spirit potions')
shopModule:addBuyableItemContainer({'bp uhp'}, 2000, 8473, 6200, 1, 'backpack of ultimate health potions')

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if msgcontains(msg, 'ganja') then
		npcHandler:say('Hhahah, dependence.. If you want more info just go on our webpage: http://trojaots.pl/index.php&subtopic=ganja', cid)
	end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())