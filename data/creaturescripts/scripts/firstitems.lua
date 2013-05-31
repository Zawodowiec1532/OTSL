local firstItems_storage = 30001

local commonItems = {
	{itemid=2554, inContainer = TRUE}, -- shovel
	{itemid=2120, inContainer = TRUE}, -- rope
	{itemid=2160, count=2, inContainer = TRUE}, -- 2 crystal coins
	{itemid=2643} -- leather boots
}
local firstItems = {
	{ -- Sorcerer 
		{itemid=1988, container = TRUE}, -- backpack
		{itemid=2175}, -- spellbook
		{itemid=2190}, -- wand of vortex
		{itemid=8819}, -- magician's robe
		{itemid=8820}, -- mage hat
		{itemid=2468} -- studded legs
	},
	{ -- Druid
		{itemid=1988, container = TRUE}, -- backpack
		{itemid=2175}, -- spellbook
		{itemid=2182}, -- snakebite rod
		{itemid=8819}, -- magician's robe
		{itemid=8820}, -- mage hat
		{itemid=2468} -- studded legs
	},
	{ -- Paladin
		{itemid=1988, container = TRUE}, -- backpack
		{itemid=2456}, -- bow
		{itemid=2544, count = 100}, -- 100 arrows
		{itemid=2660}, -- ranger's cloak
		{itemid=2480}, -- legion helmet
		{itemid=8923} -- ranger legs
	},
	{ -- Knight
		{itemid=1988, container = TRUE}, -- backpack
		{itemid=2439, inContainer = TRUE}, -- daramanian mace
		{itemid=8601, inContainer = TRUE}, -- steel axe
		{itemid=2509}, -- steel shield
		{itemid=8602}, -- jagged sword
		{itemid=2465}, -- brass armor
		{itemid=2481}, -- soldier helmet
		{itemid=2478} -- brass legs
	}
}

for _, items in ipairs(firstItems) do
	for _, item in ipairs(commonItems) do
		table.insert(items, item)
	end
end

function onLogin(cid)
	if getPlayerGroupId(cid) < 2 and getPlayerStorageValue(cid, firstItems_storage) <= 0 then
		local currvoc = getPlayerVocation(cid)
		local vocation = 5 > currvoc and currvoc or currvoc - 4
		local giveItems = firstItems[vocation]
	if giveItems then
		for _, v in ipairs(giveItems) do
	if v.container == TRUE then
		backpack = doPlayerAddItem(cid, v.itemid, 1)
	elseif v.inContainer == TRUE then
		doAddContainerItem(backpack, v.itemid, v.count or 1)
	else
		doPlayerAddItem(cid, v.itemid, v.count or 1)
		end
	end
end
setPlayerStorageValue(cid, firstItems_storage, 1)
end
return TRUE
end