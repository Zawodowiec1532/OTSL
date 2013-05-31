function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.itemid == 12302) then
		doPlayerAddItem(cid, 12303, 1)
		doPlayerRemoveItem(cid, 12302, 1)
		doCreatureSay(cid, 'You carefully coat the inside of the wooden bowl with the sacred clay.', TALKTYPE_ORANGE_1)
		doRemoveItem(item.uid, 1)
	end
return true
end