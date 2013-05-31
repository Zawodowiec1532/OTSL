local t = {
	newPos = {x=33062, y=31029, z=7},
	msg = "You have won! As new champion take the ancient armor as reward before you leave.",
	area = {
		fromX = 33054, toX = 33073,
		fromY = 31026, toY = 32356,
		z = 3
	}
}
local spheres = {
	['energy overlord'] = 8568,
	['fire overlord'] = 8569,
	['ice overlord'] = 8570,
	['earth overlord'] = 8578
}

function getCreaturesInRange(position, radiusx, radiusy, showMonsters, showPlayers, showSummons)
	local creaturesList = {}
	for x = -radiusx, radiusx do
		for y = -radiusy, radiusy do
			if not (x == 0 and y == 0) then
				creature = getTopCreature({x = position.x+x, y = position.y+y, z = position.z, stackpos = 253})
				if (creature.type == 1 and showPlayers == TRUE) or (creature.type == 2 and showMonsters == TRUE and (showSummons == FALSE or (showSummons == TRUE and getCreatureMaster(creature.uid) == (creature.uid)))) then
				table.insert(creaturesList, creature.uid)
				end
			end
		end
	end

	local creature = getTopCreature(position)
	if(creature.type == 1 and showPlayers == TRUE) or (creature.type == 2 and showMonsters == TRUE and (showSummons == FALSE or (showSummons == TRUE and getCreatureMaster(creature.uid) == (creature.uid)))) then
              if not(table.find(creaturesList, creature.uid)) then
			table.insert(creaturesList, creature.uid)
		end
	end
	return creaturesList
end
function onKill(cid, target, damage, flags)
	if isPlayer(target) or not isInArray({1, 3}, flags) or getCreatureMaster(target) then
		return true
	end

	local name = getCreatureName(target):lower()
	if name == 'tirecz' then
		local players = getCreaturesInRange({x=33063, y=31035,z=3}, 10, 9, FALSE, TRUE)
		for i = 1, #players do
			doTeleportThing(players[i], t.newPos)
			doCreatureSay(players[i], t.msg, TALKTYPE_ORANGE_1, false, players[i], getCreaturePosition(players[i]))
		end
		return true
	end

	if spheres[name] then
		setGlobalStorageValue(spheres[name], -1)
		return true
	end

	local now = tasks[name]
	if (now) then
		if isInArray({-1, now.amount}, getPlayerStorageValue(cid, now.storage)) or (not isInArray({14003, 14004, 14005}, now.storage) and getPlayerStorageValue(cid, 14500) ~= now.storage) then
			return true
		end

		local newValue = getPlayerStorageValue(cid, now.storage) + 1
		setPlayerStorageValue(cid, now.storage, newValue)
	end

	local room = getArenaMonsterIdByName(getCreatureName(target))
	if room > 0 then
		setPlayerStorageValue(cid, room, 1)
		doPlayerSendTextMessage(cid,MESSAGE_EVENT_DEFAULT,'You can enter next room!')
	end
	return true
end