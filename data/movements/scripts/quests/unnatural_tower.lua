	-- Made by Leon Zawodowiec --
		--TODO: "".. .." Lazaran". or var + str ^.^
local quest_storage = 17001
local towers =
	{
		[12000] = {txt = "You hold the skull up high. You can resist the urge to have it look through a telescope though."}, -- Edron
		[12001] = {txt = "You hold up the skull and let it take a peek over the beautiful elven town through the dense leaves."}, -- Ab'Dendriel
		[12002] = {txt = "Thanita gives you a really strange look as you hold up the skull, but oh well."}, -- Femor Hills
		[12003] = {txt = "That was a real easy one. And you're used to getting strange looks now, so whatever!"}, -- Darashia
		[12004] = {txt = "Wow, it's hot up here. Luckily the skull can't get a sunburn anymore, but you can, so you better descend again!"}, -- Ankrahmun
		[12005] = {txt = "Considering that higher places around here aren't that easy to reach, you think the view from here is tolerably good."}, -- Port Hope
		[12006] = {txt = "Yep, that's a pretty high spot. If Lazaran ever sees what the skull sees, he'd be pretty satisfied with that nice view."}, -- Liberty Bay
		[12007] = {txt = "Well, there are higher spots around here, but none of them is as easily reachable as this one. It just has to suffice."}, -- Yalahar
		[12008] = {txt = "Nice! White in white as far as the eye can see. Time to leave before your fingers turn into icicles."}, -- Svargrond
		[12009] = {txt = "That's definitely one of the highest spots in whole Tibia. If that's not simply perfect you don't know what it is."}, -- Thais
		[12010] = {txt = "What a beautiful view. Worthy of a Queen indeed!"} -- Carlin
	}

function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) or (getPlayerStorageValue(cid, quest_storage) == 11) then
		return true
	end
	if getPlayerStorageValue(cid, quest_storage) == -1 then
		setPlayerStorageValue(cid, quest_storage, 0)
	end
	
	if (isInArray(towers, item.uid) then
		if getPlayerStorageValue(cid, towers[item.uid]) == -1 then
			setPlayerStorageValue(cid, towers[item.uid], 1)
			setPlayerStorageValue(cid, quest_storage, getPlayerStorageValue(cid, quest_storage) + 1)
			return (getPlayerStorageValue(cid, towers[item.uid]) == 11) and doCreatureSay(cid, towers[item.uid].txt + " Time to head back to Lazaran and show him what you got.", TALKTYPE_ORANGE_1) or doCreatureSay(cid, towers[item.uid].txt, TALKTYPE_ORANGE_1)
		end
	end
return true
end 
