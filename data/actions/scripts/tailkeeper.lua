	-- Made by Leon Zawodowiec --
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 6787) == -1 then
		doSendMagicEffect(toPosition, CONST_ME_SOUND_GREEN)
		doPlayerAddItem(cid,12323,1)
		setPlayerStorageValue(cid, 6787, 1)
		setPlayerStorageValue(cid, 42324, 3)
	end
return true
end