-- Made by Leon Zawodowiec --
     -- Rusty Remover --     
function onUse(cid, item, frompos, item2, topos)
 
    local effect_broke = 3
    local effect_renew = 28
    local wylosowany = 0
    local const = item2.itemid
    local pos = getCreaturePosition(cid)
    local itemy = {
 
                    [9808] = {
                                [1] = {id = 2464, name = "Chain Armor", szansa = 33},
                                [2] = {id = 2483, name = "Scale Armor", szansa = 25},
                                [3] = {id = 2465, name = "Brass Armor", szansa = 10},
                                [4] = {id = 2463, name = "Plate Armor", szansa = 2}
                             },
 
                    [9809] = {
                                [1] = {id = 2464, name = "Chain Armor", szansa = 16},
                                [2] = {id = 2465, name = "Brass Armor", szansa = 14},
                                [3] = {id = 2483, name = "Scale Armor", szansa = 13},
                                [4] = {id = 2463, name = "Plate Armor", szansa = 10},
                                [5] = {id = 2476, name = "Knight Armor", szansa = 6},
                                [6] = {id = 8891, name = "Paladin Armor", szansa = 3},
                                [7] = {id = 2487, name = "Crown Armor", szansa = 1}
                             },
 
                    [9810] = {
                                [1] = {id = 2464, name = "Chain Armor", szansa = 20},
                                [2] = {id = 2465, name = "Brass Armor", szansa = 17},
                                [3] = {id = 2483, name = "Scale Armor", szansa = 15},
                                [4] = {id = 2463, name = "Plate Armor", szansa = 12},
                                [5] = {id = 2476, name = "Knight Armor", szansa = 10},
                                [6] = {id = 8891, name = "Paladin Armor", szansa = 5},
                                [7] = {id = 2487, name = "Crown Armor", szansa = 4},
                                [8] = {id = 2466, name = "Golden Armor", szansa = 2},
                                [9] = {id = 2472, name = "Magic Plate Armor", szansa = 1}
                             },
 
                    [9811] = {
                                [1] = {id = 2468, name = "Studded Legs", szansa = 33},
                                [2] = {id = 2648, name = "Chain Legs", szansa = 25},
                                [3] = {id = 2478, name = "Brass Legs", szansa = 10},
                                [4] = {id = 2647, name = "Plate Legs", szansa = 2}
                             },
 
                    [9812] = {
                                [1] = {id = 2468, name = "Studded Legs", szansa = 16},
                                [2] = {id = 2648, name = "Chain Legs", szansa = 14},
                                [3] = {id = 2478, name = "Brass Legs", szansa = 13},
                                [4] = {id = 2647, name = "Plate Legs", szansa = 10},
                                [5] = {id = 2477, name = "Knight Legs", szansa = 6},
                                [7] = {id = 2488, name = "Crown Legs", szansa = 1}
                             },
 
                    [9813] = {
                                [1] = {id = 2478, name = "Brass Legs", szansa = 17},
                                [2] = {id = 2647, name = "Plate Legs", szansa = 12},
                                [3] = {id = 2477, name = "Knight Legs", szansa = 10},
                                [4] = {id = 2488, name = "Crown Legs", szansa = 4},
                                [5] = {id = 2470, name = "Golden Legs", szansa = 2}
                             }
 
                }  
 
    if itemy[const] then
        local random_item = math.random(1, 100)
 
        for i = 1, #itemy[const] do
            if random_item <= itemy[const][i].szansa then
                wylosowany = i
            end
        end    
 
        if wylosowany > 0 then
            doSendMagicEffect(topos, effect_renew)
            doTransformItem(item2.uid, itemy[const][wylosowany].id)
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have renewed the ".. itemy[const][wylosowany].name .." !")
            doRemoveItem(item.uid, 1)
        else
            doSendMagicEffect(topos, effect_broke)
            doRemoveItem(item2.uid, 1)
            doRemoveItem(item.uid, 1)
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your Rusty Remover has broken.")
            return 0
        end
    else
          doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Use it on Rusty Items (Common, Semi-Rare or Rare: Armors or Legs).")
        return 0
    end
return true
end