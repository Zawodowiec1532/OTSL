	-- Made by Leon Zawodowiec --
		-- @TODO: Turn off hints when complete quest. --
local positions = {
	sign = {x=32007, y=32276, z=7},
	stone_stairs = {x=32023, y=32273, z=7},
	waypoint_bridge = {x=32004, y=32278, z=7},
	santiago_hut = {x=32021, y=32273, z=7},
	santiago_hut_up = {x=32034, y=32276, z=6},
	troch_chest = {x = 32033, y = 32278, z = 8},
	sewer_grate = {x = 32035, y = 32285, z = 8},
	coat_chest = {x = 32032, y = 32276, z = 5}
}

local config = {
	COOLDOWN_TUTORIAL = 10,
	BLOCK_BRIDGE = 6704,
	BLOCK_STAIRS = 6801,
	BLOCK_CELLAR = 6708,
	BLOCK_GRATE = 6814,
	hints = {6800, 6801, 6802, 6803, 6805, 6813, 6815, 6817}
}

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if isInArray(config.hints, item.actionid) and getPlayerStorageValue(cid, config.hints[item.actionid]) < os.time() - config.COOLDOWN_TUTORIAL then
		if item.actionid == 6800 then
			doPlayerSendTutorial(cid, 2)
		elseif item.actionid == 6801 then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "To look at objects such as this sign, right-click on them and select 'Look'. Sometimes you have to walk a bit closer to signs.")
			doSendMagicEffect(positions.sign, 55)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Messages like this can be reviewed at a later time by using the 'Server Log' window, located at the bottom of the screen.")

		elseif item.actionid == 6802 then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Now continue to the next mark on your automap to the east. You can point your mouse cursor on a mark to read its name.")
			doPlayerAddMapMark(cid, positions.santiago_hut, 18, "Santiago's Hut")
			doPlayerAddMapMark(cid, positions.santiago_hut_up, 15, "Santiago's Hut")

		elseif item.actionid == 6803 then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "To go up stairs or ramps like this one, simply walk on them.")
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Use the arrow keys to walk on stairs.")
			doSendMagicEffect(positions.stone_stairs, 55)

		elseif item.actionid == 6805 then
			doPlayerPopupFYI(cid, "This is Santiago, a Non-Player-Character. You can chat with NPCs by typing 'Hi' or 'Hello'. Walk to Santiago and try it!")

		elseif item.actionid == 6813 then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You can't see any cockroaches here. 'Open' this chest and see if you can find something to light the room better.")
			doSendMagicEffect(positions.troch_chest, 55)
			doSendMagicEffect(positions.troch_chest, 56)

		elseif item.actionid == 6815 and getPlayerStorageValue(cid, config.BLOCK_GRATE) then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Look at the metallic object on the floor - this is a sewer grate. Right-click on it and select 'Use' to climb down.")
			doSendMagicEffect(positions.sewer_grate, 55)
			doSendMagicEffect(positions.sewer_grate, 56)

		elseif item.actionid == 6817 then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You smell stinky cockroaches around here. When you see one, walk to it and attack it by left-clicking it in your battle list!")
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Click on the chase opponent icon in the combat controls, then click on a cockroach in the battle list. ")
			doPlayerSendTutorial(cid, 7)
		end
		setPlayerStorageValue(cid, config.hints[item.actionid], os.time())
	elseif item.actionid == 6804 then
		setPlayerStorageValue(cid, config.BLOCK_BRIDGE, 1)

	elseif item.actionid == 6806 and getPlayerStorageValue(cid, config.BLOCK_BRIDGE) then
		doTeleportThing(cid, {x = toPosition.x + 2, y = toPosition.y, z = fromPosition.z}, true)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have no business in this part of the island anymore. Continue by solving Santiago's quest!")

	elseif item.actionid == 6807 then
		if getPlayerStorageValue(cid, config.BLOCK_STAIRS) ~= 1 then
			doTeleportThing(cid, {x = toPosition.x + 2, y = toPosition.y, z = fromPosition.z}, true)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "This is Santiago's room. Maybe you should talk to him before sniffing around in his house.")
		else
			doPlayerSendTutorial(cid, 4)
			doSendMagicEffect(positions.coat_chest, 55)
			doSendMagicEffect(positions.coat_chest, 56)
		end
	elseif item.actionid == 6808 and getPlayerStorageValue(cid, config.BLOCK_CELLAR) ~= 1 then
		doTeleportThing(cid, {x = toPosition.x - 2, y = toPosition.y, z = fromPosition.z}, true)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "This is Santiago's cellar. You have no business there yet.")

	elseif item.actionid == 6809 and getPlayerStorageValue(cid, config.BLOCK_BRIDGE) ~= 2 then
		doTeleportThing(cid, {x = toPosition.x - 2, y = toPosition.y, z = fromPosition.z}, true)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Santiago really needs help, maybe you should have a look. Talk to him by typing 'Hi' or 'Hello'.")
	end
end

--[[
http://www19.speedyshare.com/GTuHH/download/Untitled.jpg
enum MapMarks_t
{
	MAPMARK_TICK		= 0x00,
	MAPMARK_QUESTION	= 0x01,
	MAPMARK_EXCLAMATION	= 0x02,
	MAPMARK_STAR		= 0x03,
	MAPMARK_CROSS		= 0x04,
	MAPMARK_TEMPLE		= 0x05,
	MAPMARK_KISS		= 0x06,
	MAPMARK_SHOVEL		= 0x07,
	MAPMARK_SWORD		= 0x08,
	MAPMARK_FLAG		= 0x09,
	MAPMARK_LOCK		= 0x0A,
	MAPMARK_BAG			= 0x0B,
	MAPMARK_SKULL		= 0x0C,
	MAPMARK_DOLLAR		= 0x0D,
	MAPMARK_REDNORTH	= 0x0E,
	MAPMARK_REDSOUTH	= 0x0F,
	MAPMARK_REDEAST		= 0x10,
	MAPMARK_REDWEST		= 0x11,
	MAPMARK_GREENNORTH	= 0x12,
	MAPMARK_GREENSOUTH	= 0x13
};
--]]
