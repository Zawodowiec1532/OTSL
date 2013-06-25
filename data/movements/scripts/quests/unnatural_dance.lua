	-- Made by Leon Zawodowiec --
		--TODO: Change storages, make other way to check this shit, check order, add missing texts and effects.
local quest_storage = 17935
local dancing = 17999
local center_pos = {x = 32991, y = 31497, z = 1}
--[[
		[1][2][3]
		[4][5][6]
		[7][8][9]
--]]
local p = {}
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
	--[0] = {5},
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

function dance(cid, set, t)
	if not t then
		p[cid] = 1
		return doPlayerSendCancel(cid, "You failed, Krunus is sad. :(")
	end
return doComparePositions(positions[sets[set][1]], getCreaturePosition(cid)) and t = addEvent(dance, 2000, cid, set) or false
end

function onStepIn(cid, item, position, fromPosition)
	if getPlayerStorageValue(cid, quest_storage) ~= 9 then
		return true
	end
	if not isPlayer(cid) or getGlobalStorageValue(dancing) ~= getPlayerName(cid) then -- test: (getGlobalStorageValue(dancing) ~= getPlayerName(cid) and false or setGlobalStorageValue(dancing, getPlayerName(cid)))
		doCreatureSay(cid, "Dance for the mighty Krunus", TALKTYPE_ORANGE_1)
		setGlobalStorageValue(dancing, getPlayerName(cid))
		local set = not p[cid] and 1 or p[cid]
		addEvent(dance, 1200, cid, set, t = true)

		local pos = positions[sets[set + 1]]
		for i = 1, 10 do
			addEvent(doSendMagicEffect, i * 200, pos, CONST_ME_BIGPLANTS)
		end
		p[cid] = set + 1
		if (p[cid] == #sets) then
		--	doPlayerSetStorageValue(cid, quest_storage, 10)	-- completed
			doCreatureSay(cid, "Krunus should be pleased.", TALKTYPE_ORANGE_1)
		end
	else
		return doPlayerSendCancel(cid, "Sorry, another player has already started a dance for Krunus.. please wait.")
	end
return true
end
