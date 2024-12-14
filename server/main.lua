ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent("WEX_wineyard:addi", item, count)
AddEventHandler("WEX_wineyard:addi", function(item, count)
    --red_wine_grapes
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(item, count)
end)

RegisterServerEvent("WEX_wineyard:removei", item, count)
AddEventHandler("WEX_wineyard:removei", function(item, count)
    --red_wine_grapes
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(item, count)
end)


RegisterServerEvent('WEX_wineyard:crafti')
AddEventHandler('WEX_wineyard:crafti', function(item1, item2, need, get)
    local xPlayer = ESX.GetPlayerFromId(source)

    -- Zkontroluj, zda má hráč požadovaný předmět (item1)
    local count = xPlayer.getInventoryItem(item1).count

    if count >= need then
        -- Pokud má alespoň 1 kus item1, odstraníme ho a přidáme item2
        xPlayer.removeInventoryItem(item1, need)  -- Odstranění 1 kusu item1
        xPlayer.addInventoryItem(item2, get)     -- Přidání 1 kusu item2

    else
        -- Pokud nemá požadovaný předmět, informuj ho
        print( "Nemáš dostatek " .. item1)
    end
end)