function onDeath(cid, corpse, deathList)
	if getCreatureName(cid):lower() == "pythius the rotten" then
		for i = 1, #deathList do
			if isPlayer(deathList[i]) then
				doCreatureSay(deathList[i], "NICE FIGHTING LITTLE WORM, YOUR VICTORY SHALL BE REWARDED!", TALKTYPE_ORANGE_1, nil, nil, {x=32577, y=31402, z=15})
				doSendMagicEffect(getCreaturePosition(deathList[i]), CONST_ME_TELEPORT)
				doTeleportThing(deathList[i], {x=32577, y=31402, z=15})
				doSendMagicEffect({x=32577, y=31402, z=15}, CONST_ME_TELEPORT)
				break
			end
		end
	end
	return true
end

--[[ local time, pos = 200, {x=329, y=841, z=15}
 
local function remove()
	local v = getTileItemById(pos, 5023).uid
	if v > 0 then
		doRemoveItem(v)
		doSendMagicEffect(pos, CONST_ME_POFF)
	end
end
 
function onDeath(cid, corpse, deathList)
	if getCreatureName(cid):lower() == 'pythius the rotten' then
		doCreateTeleport(5023, {x=342, y=839, z=15}, pos)
		doSendMagicEffect(pos, CONST_ME_ENERGYHIT)
		doCreatureSay(cid, 'GOOO! You have less than ' .. time ..' seconds to enter the teleport!', TALKTYPE_ORANGE_1)
		addEvent(remove, time * 1000)
	end
	return true
end --]]