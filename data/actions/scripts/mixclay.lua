function onUse(cid, item, fromPosition, itemEx, toPosition)
		if(itemEx.itemid == 12297) then
		doPlayerAddItem(cid, 12300,1)
		doCreatureSay(cid, 'You carefully mix the clay with the sacred earth.', TALKTYPE_ORANGE_1)
		doRemoveItem(item.uid, 1)	
		doPlayerRemoveItem(cid, 12297, 1)
	end
return true
end