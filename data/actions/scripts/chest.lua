function onUse(cid, item, fromPosition, ItemEx, toPosition)
if getPlayerStorageValue(cid,storage) == -1 then
doItemSetAttribute(doPlayerAddItem(cid,writing,1), 'uid', 15880)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a writing")
else
doPlayerSendCancel(cid, "It is empty")
return true
end