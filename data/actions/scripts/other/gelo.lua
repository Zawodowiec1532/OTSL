	-- Made by Leon Zawodowiec --
function onUse(cid, item, frompos, item2, topos)

local playerpos = getPlayerPosition(cid)

local offPos = getPosByDir(getCreaturePosition(cid),getPlayerLookDir(cid), 1)
        local nha = {x = offPos.x, y = offPos.y - 3, z = offPos.z, stackpos = 255}
        local sha = {x = offPos.x, y = offPos.y + 3, z = offPos.z, stackpos = 255}
        local wha = {x = offPos.x - 3, y = offPos.y, z = offPos.z, stackpos = 255}
        local eha = {x = offPos.x + 3, y = offPos.y, z = offPos.z, stackpos = 255}
        local nwa = {x = offPos.x - 2, y = offPos.y - 2, z = offPos.z, stackpos = 255}
        local nea = {x = offPos.x + 2, y = offPos.y - 2, z = offPos.z, stackpos = 255}
        local sea = {x = offPos.x + 2, y = offPos.y + 2, z = offPos.z, stackpos = 255}
        local swa = {x = offPos.x - 2, y = offPos.y + 2, z = offPos.z, stackpos = 255}
     
	randomizer = math.random(1, 4) 
     
	if item.itemid == 7441 then
		if randomizer == 1 or randomizer == 2 then
			doTransformItem(item.uid, 7442)
		else
			doCreatureSay(cid, "You have broken the sculpture..", TALKTYPE_ORANGE_1)
			doRemoveItem(item.uid)
		end    
	elseif item.itemid == 7442 then
		if randomizer == 1 or randomizer == 2 then
			doTransformItem(item.uid, 7444)
		else
			doCreatureSay(cid, "You have broken the sculpture..", TALKTYPE_ORANGE_1)
			doRemoveItem(item.uid)
		end    
	elseif item.itemid == 7444 then
		if randomizer == 1 or randomizer == 2 then
			doTransformItem(item.uid, 7445)
		else
			doCreatureSay(cid, "You have broken the sculpture..", TALKTYPE_ORANGE_1)
			doRemoveItem(item.uid)
		end
	elseif item.itemid == 7445 then
		if randomizer == 1 or randomizer == 2 then
			doTransformItem(item.uid,7446)
			doSendDistanceShoot(offPos, nha, 35)
            doSendDistanceShoot(offPos, sha, 36)
            doSendDistanceShoot(offPos, wha, 36)
            doSendDistanceShoot(offPos, eha, 36)
            doSendDistanceShoot(offPos, nwa, 36)
            doSendDistanceShoot(offPos, nea, 36)
            doSendDistanceShoot(offPos, sea, 36)
            doSendDistanceShoot(offPos, swa, 36)
            doSendMagicEffect(playerpos, 52)
			doCreatureSay(cid, "You have obtained an small ice mammoth statue !", TALKTYPE_ORANGE_1)        
		else
			doCreatureSay(cid, "You have broken the sculpture..", TALKTYPE_ORANGE_1)
			doRemoveItem(item.uid)   
		end    
	else
        return false
    end  
return true
end