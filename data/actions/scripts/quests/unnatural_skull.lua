	-- Made by Leon Zawodowiec --
function onUse(cid, item, frompos, item2, topos)
	local config = {
		quest_storage = 17935,
		skull_id = 11076
	}
	if getPlayerStorageValue(cid, config.quest_storage) == 1 and getPlayerStorageValue(cid, config.skull_id) ~= 1 then
		setPlayerStorageValue(cid, config.skull_id, 1)
		doCreatureSay(cid, "You dig out a skull from the pile of bones. That must be skull Lazaran talked about.", TALKTYPE_MONSTER)
		doPlayerAddItem(cid, config.skull_id, 1)
	else
		doCreatureSay(cid, "The pile of bones is empty.", TALKTYPE_MONSTER)
	end
return true
end
