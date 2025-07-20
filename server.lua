RegisterServerEvent('loadout:giveItem', function(itemName, amount)
    local xPlayer = ESX.GetPlayerFromId(source) -- Assuming ESX is being used
    if xPlayer then
        xPlayer.addInventoryItem(itemName, amount)
    else
        print(('Failed to give item %s x%d to player %d'):format(itemName, amount, source))
    end
end)
