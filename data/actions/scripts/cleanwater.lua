local waterPos = {
    {x=33282, y=31037, z=10}, 
	{x=33283, y=31037, z=10}, 
	{x=33283, y=31038, z=10},
	{x=33282, y=31036, z=10},
	{x=33283, y=31035, z=10},
	{x=33283, y=31036, z=10}
}
local waterPos2 = {
    {x=33282, y=31037, z=10}, 
	{x=33283, y=31037, z=10}, 
	{x=33282, y=31036, z=10},
	{x=33283, y=31036, z=10}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.actionid == 11450) and (itemEx.itemid == 11450) or (itemEx.itemid == 6381) then
		for _, v in ipairs(waterPos) do
		doTransformItem(getTileItemById(v, 11450).uid, 12304)
		doRemoveItem(item.uid, 1)
		setPlayerStorageValue(cid, 42830, 1)
		addEvent(reOpen, 20000)
		end
		for _, x in ipairs(waterPos2) do
		doSendMagicEffect(x, CONST_ME_YELLOW_RINGS, TRUE)
	end
	end
end
	
function reOpen()
	for _, v in ipairs(waterPos) do
	doTransformItem(getTileItemById(v, 12304).uid, 11450)
	end
end