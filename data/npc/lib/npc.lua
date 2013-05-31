function selfIdle()
	following = false
	attacking = false

	selfAttackCreature(0)
	target = 0
end
function selfSayChannel(cid, message)
	return selfSay(message, cid, false)
end

function selfMoveToThing(id)
	errors(false)
	local thing = getThing(id)

	errors(true)
	if(thing.uid == 0) then
		return
	end

	local t = getThingPosition(id)
	selfMoveTo(t.x, t.y, t.z)
	return
end

function selfMoveTo(x, y, z)
	local position = {x = 0, y = 0, z = 0}
	if(type(x) ~= "table") then
		position = Position(x, y, z)
	else
		position = x
	end

	if(isValidPosition(position)) then
		doSteerCreature(getNpcId(), position)
	end
end

function selfMove(direction, flags)
	local flags = flags or 0
	doMoveCreature(getNpcId(), direction, flags)
end

function selfTurn(direction)
	doCreatureSetLookDirection(getNpcId(), direction)
end

function getNpcDistanceTo(id)
	errors(false)
	local thing = getThing(id)

	errors(true)
	if(thing.uid == 0) then
		return nil
	end

	local c = getCreaturePosition(id)
	if(not isValidPosition(c)) then
		return nil
	end

	local s = getCreaturePosition(getNpcId())
	if(not isValidPosition(s) or s.z ~= c.z) then
		return nil
	end

	return math.max(math.abs(s.x - c.x), math.abs(s.y - c.y))
end

function doMessageCheck(message, keyword)
	if(type(keyword) == "table") then
		return table.isStrIn(keyword, message)
	end

	local a, b = message:lower():find(keyword:lower())
	if(a ~= nil and b ~= nil) then
		return true
	end

	return false
end

function doNpcSellItem(cid, itemid, amount, subType, ignoreCap, inBackpacks, backpack)
	local amount, subType, ignoreCap, item = amount or 1, subType or 1, ignoreCap and true or false, 0
	local exhaustionInSeconds = 2 
	local storage = 34231 
	if(exhaustion.check(cid, storage) == true) then 
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You cant buy it so fast.") 
		return 0 
	end
	exhaustion.set(cid, storage, exhaustionInSeconds) 
	if(isItemStackable(itemid)) then
		if(isItemRune(itemid)) then
			amount = amount * subType
		end

		local count = amount
		repeat
			item = doCreateItemEx(itemid, math.min(100, count))
			if(doPlayerAddItemEx(cid, item, ignoreCap) ~= RETURNVALUE_NOERROR) then
				exhaustion.set(cid, storage, exhaustionInSeconds)
				return 0, 0
			end

			count = count - math.min(100, count)
		until count == 0
			return amount, 0
		end
		local a = 0
		if(inBackpacks) then
			local container, b = doCreateItemEx(backpack, 1), 1
		for i = 1, amount do
			item = doAddContainerItem(container, itemid, subType)
			if(itemid == ITEM_PARCEL) then
				doAddContainerItem(item, ITEM_LABEL)
				exhaustion.set(cid, storage, exhaustionInSeconds)
			end

			if(isInArray({(getContainerCapById(backpack) * b), amount}, i)) then
				if(doPlayerAddItemEx(cid, container, ignoreCap) ~= RETURNVALUE_NOERROR) then
					exhaustion.set(cid, storage, exhaustionInSeconds)
					b = b - 1
					break
				end

				a = i
				if(amount > i) then
					container = doCreateItemEx(backpack, 1)
					exhaustion.set(cid, storage, exhaustionInSeconds)
					b = b + 1
				end
			end
		end
		return a, b
	end

	for i = 1, amount do
		item = doCreateItemEx(itemid, subType)
		if(itemid == ITEM_PARCEL) then
			doAddContainerItem(item, ITEM_LABEL)
			exhaustion.set(cid, storage, exhaustionInSeconds)
		end

		if(doPlayerAddItemEx(cid, item, ignoreCap) ~= RETURNVALUE_NOERROR) then
			break
		end

		a = i
	end

	return a, 0
end

function doRemoveItemIdFromPosition(id, n, position)
	local thing = getThingFromPos({x = position.x, y = position.y, z = position.z, stackpos = 1})
	if(thing.itemid ~= id) then
		return false
	end

	doRemoveItem(thing.uid, n)
	return true
end

function getNpcName()
	return getCreatureName(getNpcId())
end

function getNpcPos()
	return getThingPosition(getNpcId())
end

function selfGetPosition()
	local t = getThingPosition(getNpcId())
	return t.x, t.y, t.z
end

msgcontains = doMessageCheck
moveToPosition = selfMoveTo
moveToCreature = selfMoveToThing
selfMoveToCreature = selfMoveToThing
selfMoveToPosition = selfMoveTo
isPlayerPremiumCallback = isPremium
doPosRemoveItem = doRemoveItemIdFromPosition
doRemoveItemIdFromPos = doRemoveItemIdFromPosition
doNpcBuyItem = doPlayerRemoveItem
doNpcSetCreatureFocus = selfFocus
getNpcCid = getNpcId
getDistanceTo = getNpcDistanceTo
getDistanceToCreature = getNpcDistanceTo
getNpcDistanceToCreature = getNpcDistanceTo
if not eventDelayedSay then eventDelayedSay = {} end
 
local func = function(pars)
        if isCreature(pars.cid) == TRUE and isPlayer(pars.pcid) == TRUE then
                doCreatureSay(pars.cid, pars.text, pars.type, false, pars.pcid, getCreaturePosition(pars.cid))
        end
end
 
function doCreatureSayWithDelay(cid, text, type, delay, e, pcid)
        if isCreature(cid) == TRUE and isPlayer(pcid) == TRUE then
                e.event = addEvent(func, delay < 1 and 1000 or delay, {cid=cid, text=text, type=type, e=e, pcid=pcid})
        end
end
 
function cancelNPCTalk(events)
        for i = 1, #events do
                stopEvent(events[i].event)
        end
        events = nil
end
 
function doNPCTalkALot(msgs, interval, pcid)
        if eventDelayedSay[pcid] then
                cancelNPCTalk(eventDelayedSay[pcid])
        end
        if isPlayer(pcid) == TRUE then
                eventDelayedSay[pcid] = {}
                local ret = {}
                for i = 1, #msgs do
                        eventDelayedSay[pcid][i] = {}
                        doCreatureSayWithDelay(getNpcCid(), msgs[i], TALKTYPE_PRIVATE_NP, ((i-1) * (interval or 10000)) + 1000, eventDelayedSay[pcid][i], pcid)
                        table.insert(ret, eventDelayedSay[pcid][i])
                end
                return(ret)
        end
end
        function customCallbackOnBuy(cid, itemid, subType, amount, ignoreCap, inBackpacks, shopWindow)
                local shopItem, npcHandler = nil, NpcHandler
                for _, item in ipairs(shopWindow) do
                        if not item.subType then
                                item.subType = (isItemFluidContainer(item.id) == TRUE or isItemStackable(item.id) == TRUE) and 0 or 1
                        end
                        if(item.id == itemid and (item.subType == subType)) then
                                shopItem = item
                                break
                        end
                end
 
                if(shopItem == nil) then
                        error("[ShopModule.onBuy]", "Item not found on shopItems list")
                        return false
                end
 
                if(shopItem.buy < 0) then
                        error("[ShopModule.onSell]", "Attempt to purchase an item which is only sellable")
                        return false
                end
 
                local backpack, totalCost = 1988, amount * shopItem.buy
                if(inBackpacks) then
                        totalCost = isItemStackable(itemid) == TRUE and totalCost + 20 or totalCost + (math.max(1, math.floor(amount / getContainerCapById(backpack))) * 20)
                end
 
                if(getPlayerMoney(cid) < totalCost) then
                        doPlayerSendCancel(cid, npcHandler:parseMessage(npcHandler:getMessage(MESSAGE_NEEDMONEY), {[TAG_PLAYERNAME] = getPlayerName(cid), [TAG_ITEMCOUNT] = amount, [TAG_TOTALCOST] = totalCost, [TAG_ITEMNAME] = shopItem.name}))
                        return false
                end
 
                local subType = shopItem.subType or isItemFluidContainer(itemid) == TRUE and 0 or 1
                local a, b = doNpcSellItem(cid, itemid, amount, subType, ignoreCap, inBackpacks, backpack)
                if(a < amount) then
                        local msgId = MESSAGE_NEEDMORESPACE
                        if(a == 0) then
                                msgId = MESSAGE_NEEDSPACE
                        end
 
                        doPlayerSendCancel(cid, npcHandler:parseMessage(npcHandler:getMessage(msgId), {[TAG_PLAYERNAME] = getPlayerName(cid), [TAG_ITEMCOUNT] = amount, [TAG_TOTALCOST] = totalCost, [TAG_ITEMNAME] = shopItem.name, [TAG_ITEMCOUNT] = a}))
 
                        if(a > 0) then
                                doPlayerRemoveMoney(cid, ((a * shopItem.buy) + (b * 20)))
                                return true
                        end
 
                        return false
                end
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, npcHandler:parseMessage(npcHandler:getMessage(MESSAGE_BOUGHT), {[TAG_PLAYERNAME] = getPlayerName(cid), [TAG_ITEMCOUNT] = amount, [TAG_TOTALCOST] = totalCost, [TAG_ITEMNAME] = shopItem.name}))
                doPlayerRemoveMoney(cid, totalCost)
 
                return true
        end
       
        function customCallbackOnSell(cid, itemid, subType, amount, ignoreCap, inBackpacks, shopWindow)
                local shopItem, npcHandler, subType = nil, NpcHandler, subType or 0
                for _, item in ipairs(shopWindow) do
                        item.subType = not item.subType and 0 or item.subType
                        if(item.id == itemid and (isItemFluidContainer(itemid) == FALSE or isItemFluidContainer(itemid) == TRUE and item.subType == subType)) then
                                shopItem = item
                                break
                        end
                end
 
                if(shopItem == nil) then
                        error("[ShopModule.onBuy]", "Item not found on shopItems list")
                        return false
                end
 
                if(shopItem.sell < 0) then
                        error("[ShopModule.onSell]", "Attempt to sell an item which is only buyable")
                        return false
                end
 
                if(doPlayerRemoveItem(cid, itemid, amount, isItemFluidContainer(itemid) == TRUE and subType or isItemStackable(itemid) == TRUE and amount or 1) == TRUE) then
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, npcHandler:parseMessage(npcHandler:getMessage(MESSAGE_SOLD), {[TAG_PLAYERNAME] = getPlayerName(cid), [TAG_ITEMCOUNT] = amount, [TAG_TOTALCOST] = amount * shopItem.sell, [TAG_ITEMNAME] = shopItem.name}))
                        doPlayerAddMoney(cid, amount * shopItem.sell)
 
                        return true
                end
                doPlayerSendCancel(cid, npcHandler:parseMessage(npcHandler:getMessage(MESSAGE_NEEDITEM), {[TAG_PLAYERNAME] = getPlayerName(cid), [TAG_ITEMCOUNT] = amount, [TAG_TOTALCOST] = amount * shopItem.sell, [TAG_ITEMNAME] = shopItem.name}))
 
                return false
        end