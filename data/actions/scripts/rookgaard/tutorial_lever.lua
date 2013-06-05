	-- Made by Leon Zawodowiec --
function onUse(cid, item, fromPosition, itemEx, toPosition)
	snake_head_pos = {x = 32034, y = 32272, z = 8, stackpos = 1}
	snake_head = getThingfromPos(snake_head_pos)

	if item.itemid == 1945 and snake_head.itemid == 5058 then
		doTransformItem(snake_head.uid, snake_head.itemid - 1)
		doTransformItem(item.uid, item.itemid + 1)
	elseif item.itemid == 1946 then
		doTransformItem(snake_head.uid, snake_head.itemid + 1)
		doTransformItem(item.uid, item.itemid - 1)
	else
		doPlayerSendCancel(cid, "Sorry, not possible.")
	end
return true
end
