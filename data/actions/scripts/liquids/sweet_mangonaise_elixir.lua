	-- Made by Leon Zawodowiec --
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local ring = getPlayerSlotItem(cid, CONST_SLOT_RING).itemid
	if(ring > 0 and getItemInfo(ring).showDuration and (getItemWeightById(ring, 10) + 18) <= getPlayerFreeCap(cid)) then
		if(doPlayerGiveItemContainer(cid, 2596, ring, 1)) then
			doSendMagicEffect(fromPosition, CONST_ME_MAGIC_GREEN)
			doCreatureSay(cid, "Slurp!", TALKTYPE_ORANGE_1)
			doRemoveItem(item.uid, 1)
		end
	else
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
	end
return true
end
