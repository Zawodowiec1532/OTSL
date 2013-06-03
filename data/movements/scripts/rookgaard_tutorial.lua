	-- Made by Leon Zawodowiec --
local positions = {
	sign = {x=32007, y=32276, z=7},
	stone_stairs = {x=32023, y=32273, z=7},
	waypoint_bridge = {x=32004, y=32278, z=7},
	santiago_hut = {x=32021, y=32273, z=7},
	santiago_hut_up = {x=32034, y=32276, z=6}
}

local config = {
	COOLDOWN_TUTORIAL = 15,
	[6800] = 6700,
	[6801] = 6701,
	[6802] = 6702,
	[6803] = 6703,
	[6805] = 6705
}

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if isInArray({config}, item.actionid) and getPlayerStorageValue(cid, config.[item.actionid]) < os.time() - config.COOLDOWN_TUTORIAL then
		if item.actionid == 6800 then
			doPlayerSendTutorial(cid, 2)
			doPlayerAddMapMark(cid, positions.waypoint_bridge, 16, "To the Village")
		elseif item.actionid == 6801 then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "To look at objects such as this sign, right-click on them and select 'Look'. Sometimes you have to walk a bit closer to signs.")
			doSendMagicEffect(positions.sign, 55)
			doSendMagicEffect(positions.sign, 56)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Messages like this can be reviewed at a later time by using the 'Server Log' window, located at the bottom of the screen.")

		elseif item.actionid == 6802 then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Now continue to the next mark on your automap to the east. You can point your mouse cursor on a mark to read its name.")
			doPlayerAddMapMark(cid, positions.santiago_hut, 18, "Santiago's Hut")
			doPlayerAddMapMark(cid, positions.santiago_hut_up, 15, "Santiago's Hut")

		elseif item.actionid == 6803 then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "To go up stairs or ramps like this one, simply walk on them.")
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Use the arrow keys to walk on stairs.")
			doSendMagicEffect(positions.stone_stairs, 55)

		elseif item.actionid == 6805 then
			doPlayerSendTutorial(cid, 2)
		end
		setPlayerStorageValue(cid, config.[item.actionid], os.time())
	elseif item.actionid == 6804 then
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "This is Santiago, a Non-Player-Character. You can chat with NPCs by typing 'Hi' or 'Hello'. Walk to Santiago and try it!")
		-- DOKOÑCZYÆ TO.. BALET SAM SIE NIE ZROBI.. :D --
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
