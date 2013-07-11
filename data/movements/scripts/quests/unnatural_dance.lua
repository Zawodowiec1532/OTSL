	-- Made by Leon Zawodowiec --
		--TODO: Change storages, add support for carniphila stepin
local quest_storage = 17935
local dancing = 17999
local center_pos = {x = 32991, y = 31497, z = 1}
local positions =	{
	[1] = {x = center_pos.x - 1, y = center_pos.y - 1, z = center_pos.z},
	[2] = {x = center_pos.x, y = center_pos.y - 1, z = center_pos.z},
	[3] = {x = center_pos.x + 1, y = center_pos.y - 1, z = center_pos.z},
	[4] = {x = center_pos.x - 1, y = center_pos.y, z = center_pos.z},
	[5] = {x = center_pos.x, y = center_pos.y, z = center_pos.z},
	[6] = {x = center_pos.x + 1, y = center_pos.y, z = center_pos.z},
	[7] = {x = center_pos.x - 1, y = center_pos.y + 1, z = center_pos.z},
	[8] = {x = center_pos.x, y = center_pos.y + 1, z = center_pos.z},
	[9] = {x = center_pos.x + 1, y = center_pos.y + 1, z = center_pos.z}
}

local sets =	{
	[1] = {7, 1, 3, 9},
	[2] = {5, 4, 6},
	[3] = {9, 7, 1, 3},
	[4] = {5, 8, 2},
	[5] = {8, 4, 2, 6},
	[6] = {4, 7, 5, 9},
	[7] = {2, 1, 5, 7},
	[8] = {6, 1, 5, 3},
	[9] = {2, 5, 8, 9},
	[10] = {5, 1, 3, 8},
	[11] = {1, 4, 8, 6},
	[12] = {5, 2, 4, 9},
	[13] = {3, 2, 4, 8},
	[14] = {5, 2, 6 ,7},
	[15] = {2, 4, 6, 8},
	[16] = {4, 6}
}
function dance(cid, set)
	--doSendMagicEffect(positions[sets[set][1]], 36)
	local lz = doComparePositions(positions[sets[set][1]], getCreaturePosition(cid))
	if (lz == false) then
		setGlobalStorageValue(dancing, "")
		doCreatureSay(cid, "You failed, Krunus is sad. :(", TALKTYPE_ORANGE_1)
		return setGlobalStorageValue(noob_style, "false")
	end
return true
end

function plant(cid, set)
	if (getBooleanFromString(getGlobalStorageValue(noob_style)) == false) then
		return true
	end
	local z = sets[set]
	for i = 1, #z do
		doSendMagicEffect(positions[sets[set][i]], (i > 1 and CONST_ME_CARNIPHILA or CONST_ME_SMALLPLANTS))
	end
	addEvent(dance, 1200, cid, set)
return set < #sets - 1 and addEvent(plant, 2000, cid, set + 1) or addEvent(done, 400, cid)
end

function done(cid)
	for i = 1, #sets[#sets] do
		doSendMagicEffect(positions[sets[#sets][i]], CONST_ME_BIGPLANTS)
	end
	--doPlayerSetStorageValue(cid, quest_storage, 10)
	doCreatureSay(cid, "Krunus should be pleased.", TALKTYPE_ORANGE_1)
	setGlobalStorageValue(dancing, "") --:DEBUG
return true
end

function onStepIn(cid, item, position, fromPosition)
	if getPlayerStorageValue(cid, quest_storage) ~= 9 or getGlobalStorageValue(dancing) == getPlayerName(cid) then
		return true
	end
	if not isPlayer(cid) or getGlobalStorageValue(dancing) ~= getPlayerName(cid) then -- test: (getGlobalStorageValue(dancing) ~= getPlayerName(cid) and false or setGlobalStorageValue(dancing, getPlayerName(cid)))
		setGlobalStorageValue(noob_style, "true")
		setGlobalStorageValue(dancing, getPlayerName(cid))
		doCreatureSay(cid, "Dance for the mighty Krunus", TALKTYPE_ORANGE_1)
		addEvent(plant, 1000, cid, 1)
	else
		return doPlayerSendCancel(cid, "Sorry, another player has already started a dance for Krunus.. please wait.")
	end
return true
end
