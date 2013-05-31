function onDeath(cid, corpse, killer)
	local aol = getPlayerSlotItem(cid, 2)
	if (aol.itemid == 2173) then
		doRemoveItem(aol.uid, 1)
	end
return true
end