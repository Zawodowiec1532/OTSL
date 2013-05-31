function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.itemid == 11450) then
		doPlayerAddItem(cid, 12289, 1)
		doCreatureSay(cid, 'Filling the corrupted water into the sacred bowl completly .', TALKTYPE_ORANGE_1)
		doRemoveItem(item.uid, 1)		
	end
return true
end