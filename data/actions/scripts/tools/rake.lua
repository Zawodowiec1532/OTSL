	-- Made by Leon Zawodowiec --
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.itemid == 6094 and itemEx.actionid == 6094 and getPlayerStorageValue(cid, 42825) == 1) then
		doPlayerAddItem(cid, 6093, 1)
		setPlayerStorageValue(cid, 42825, 2)
		doCreatureSay(cid, 'You have found a ring.', TALKTYPE_ORANGE_1)
	end
return true
end