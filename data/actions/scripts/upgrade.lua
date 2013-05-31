local gain = {
gainArmor='&p+2',loseArmor='&p-1',
gainShield='&s+2',loseShield='&s-(#+1)',
gainAttack='&a+2',loseAttack='&a-(2*(#+1))',
gainDefense='&d+2',loseDefense='&d-(2*(#+1))',
chance='100', 
maxlvl = 7,
blocked_ids = {2488,8881,6132,2640,9933,9932,7367,8857,7417,8925,8927}
}
-- &a = weapon attack
-- &d = weapon defense
-- &s = shield defense
-- &p = armor defense
-- # = nivel do item
-- @ = max level
if not setItemName then
        function setItemName(uid,name)
         return doItemSetAttribute(uid,'name',name)
        end
        function setItemArmor(uid,name)
         return doItemSetAttribute(uid,'armor',name)
        end
        function setItemDefense(uid,name)
         return doItemSetAttribute(uid,'defense',name)
        end
        function setItemAttack(uid,name)
         return doItemSetAttribute(uid,'attack',name)
        end
        function getItemAttack(uid)
           return getItemAttribute(uid,'attack')
        end
        function getItemDefense(uid)
           return getItemAttribute(uid,'defense')
        end
        function getItemArmor(uid)
           if type(uid) == 'number' then
                  return getItemAttribute(uid,'armor')
           else
                  return getItemInfo(uid.itemid).armor
           end
        end
end
function isArmor(uid) -- Function by Mock the bear.
         if (getItemArmor(uid) and getItemArmor(uid) ~= 0 and not getItemInfo(uid.itemid,'attack') and not getItemInfo(uid.itemid,'defense') and getItemWeaponType(uid.uid) == 0) then
            return true
         end
         return false
end
function isWeapon(uid) -- Function by Mock the bear.
         uid = uid or 0
         local f = getItemWeaponType(uid)
         if f == 1 or f == 2 or f == 3 then
             return TRUE
         end
         return FALSE
end
function isShield(uid) -- Function by Mock the bear.
         uid = uid or 0
         if getItemWeaponType(uid) == 4 then
             return TRUE
         end
         return FALSE
end

function getWeaponLevel(uid) -- Function by Mock the bear.
   uid = uid or 0
   local name = getItemName(uid)
   local lvl = string.match(name,'+(%d)')
   return tonumber(lvl) or 0
end
function doTransform(s,i) -- Function by Mock the bear.
    local c = string.gsub(s,'@',gain.maxlvl)
    local c = string.gsub(c,'&a',getItemAttack(i.uid) or getItemInfo(i.itemid).attack)
    local c = string.gsub(c,'&d',getItemDefense(i.uid) or getItemInfo(i.itemid).defense)
    local c = string.gsub(c,'&s',getItemDefense(i.uid) or getItemInfo(i.itemid).defense)
    local c = string.gsub(c,'&p',getItemArmor(i.uid) or getItemInfo(i.itemid).armor)
    local c = string.gsub(c,'#',getWeaponLevel(i.uid))
    local q,err = loadstring('return '..c)
    assert(q,err)
    return assert(q())
end
function onUse(cid, item, fromPosition, itemEx, toPosition)
         toPosition.stackpos = 255
         if isInArray(gain.blocked_ids, itemEx.itemid) == TRUE
          or getItemWeaponType(itemEx.uid) > 4
           or (getItemWeaponType(itemEx.uid) == 0
            and isArmor(itemEx) == FALSE)
             or itemEx.itemid == 0 then
                doPlayerSendTextMessage(cid, 24,"You cant refine this item.")
                return TRUE
         end
         if isCreature(itemEx.uid) == TRUE then
            return FALSE
         end
        local level = getWeaponLevel(itemEx.uid)
        local chance = doTransform(gain.chance,itemEx)
        if chance >= math.random(0,100) or item.actionid >= 1000 or (item.actionid == 500 and math.random(0,100) <= 25) then
           if level+1 > gain.maxlvl then
              doSendMagicEffect(toPosition, 2)
              return doPlayerSendTextMessage(cid, 24,"Your item is on max level, you can't upgrade it.")
           else
              setItemName(itemEx.uid, getItemNameById(itemEx.itemid)..' +'..(level+1))
              doPlayerSendTextMessage(cid, 24,"Your item has been upgrated to +"..(level+1)..".")
              doSendMagicEffect(toPosition, 12)
              if isArmor(itemEx) == TRUE then
                 local get = doTransform(gain.gainArmor,itemEx)
                 setItemArmor(itemEx.uid,get)
              elseif isWeapon(itemEx.uid) == TRUE then
                  setItemAttack(itemEx.uid, doTransform(gain.gainAttack,itemEx))
                  setItemDefense(itemEx.uid, doTransform(gain.gainDefense,itemEx))
              elseif isShield(itemEx.uid) == TRUE then
                  setItemDefense(itemEx.uid, doTransform(gain.gainShield,itemEx))
              end
           end
        else

           if level == 0 then
               doPlayerSendTextMessage(cid, 24,"No effect.")
               doSendMagicEffect(toPosition, 2)
           elseif level == gain.maxlvl then
                  doSendMagicEffect(toPosition, 2)
                  return doPlayerSendTextMessage(cid, 24,"Your item is on max level, you can't upgrade it.")
           elseif level > 0 then
               if level == 1 then
                   setItemName(itemEx.uid, getItemNameById(itemEx.itemid))
                   doPlayerSendTextMessage(cid, 24,"Your item back to normal.")
               else
                   setItemName(itemEx.uid, getItemNameById(itemEx.itemid)..' +'..(level-1))
                   doPlayerSendTextMessage(cid, 24,"Your item back to +"..(level-1)..".")
               end
              if isArmor(itemEx) == TRUE then
                 setItemArmor(itemEx.uid,doTransform(gain.loseArmor  ,itemEx))
              elseif isWeapon(itemEx.uid) == TRUE then
                  setItemAttack(itemEx.uid, doTransform(gain.loseAttack,itemEx))
                  setItemDefense(itemEx.uid, doTransform(gain.loseDefense,itemEx))
              elseif isShield(itemEx.uid) == TRUE then
                  setItemDefense(itemEx.uid, doTransform(gain.loseShield,itemEx))
              end
           end
           doSendMagicEffect(toPosition, 9)
        end
     doRemoveItem(item.uid,1)
     return TRUE
end