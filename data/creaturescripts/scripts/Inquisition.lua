local config = {
        timeToRemove = 180, -- seconds
		message = "You now have 3 minutes to enter the Teleport, please hurry. It will bring you to the next room only during this time or the teleporter will disappear",
        teleportId = 9773,
        bosses = { -- Monster Name,  Teleport Position
                ["Ushuriel"] = {  pos={ x=33175, y=31728, z=11, stackpos=1 }, aid=1001 },
				["Zugurosh"] = {  pos={ x=33143, y=31693, z=11, stackpos=1 }, aid=1002},
				["Madareth"] = {  pos={ x=33197, y=31754, z=11, stackpos=1 }, aid=1003},
                ["Annihilon"] = {  pos={ x=33198, y=31686, z=11, stackpos=1 }, aid=1005},
                ["Hellgorak"] = {  pos={ x=33105, y=31717, z=11, stackpos=1 }, aid=1006}
				},
		brothers ={
        ["Golgordan"] = {pos={ x=33232, y=31722, z=11, stackpos=1 },aid=1004, brother = "Latrivan"},
        ["Latrivan"] = {pos={ x=33232, y=31722, z=11, stackpos=1 },aid=1004, brother = "Golgordan"},
        brothersArea ={
                fromPos = {x = 33224, y = 31722, z = 11},
                toPos = {x = 33240, y = 31734, z = 11}	}	}
}
local function removal(position)
	doRemoveThing(getTileItemById(position, config.teleportId).uid, 1)
    return TRUE
end

function onKill(cid, target, lastHit)
    if(config.bosses[getCreatureName(target)]) then
		local t = config.bosses[getCreatureName(target)]
	    local teleport = doCreateItem(config.teleportId, t.pos)
		local position = t.pos
		doItemSetAttribute(teleport, "aid", t.aid)
        doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
		addEvent(removal, config.timeToRemove * 1000, position)
	elseif(config.brothers[getCreatureName(target)]) then
		local t = config.brothers[getCreatureName(target)]
        local brother = getCreatureByName(t.brother)
		if(isMonster(brother) == true) then
            if(isInRange(getCreaturePosition(brother), config.brothers.brothersArea.fromPos, config.brothers.brothersArea.toPos) == true) then
                return TRUE
			end
        else
			local teleport = doCreateItem(config.teleportId, t.pos)
			local position = t.pos
			doItemSetAttribute(teleport, "aid", t.aid)
			doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
			addEvent(removal, config.timeToRemove * 1000, position)
		end
	end
	return TRUE
end
