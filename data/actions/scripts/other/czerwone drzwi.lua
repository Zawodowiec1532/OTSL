local id = 42261 -- WTF? Sherlock Leon wkracza do akcji.. misja: Odszukaæ czerwone drzwi. :D
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local cidPosition = getCreaturePosition(cid)
	if (item.actionid == id) then
		if cidPosition.x < toPosition.x then
			doTransformItem(item.uid, item.itemid + 1)
			doTeleportThing(cid, toPosition, true)
		else
			if cidPosition.x > toPosition.x then
				doTransformItem(item.uid, item.itemid + 1)
				doTeleportThing(cid, toPosition, true)
			end
		end
	end
return true
end
