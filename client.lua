local function giveLoadout(loadout)
    -- Give weapons
    for _, weapon in pairs(loadout.weapons) do
        GiveWeaponToPed(PlayerPedId(), GetHashKey(weapon.name), weapon.ammo, false, true)
    end

    -- Give items (example assumes you have an inventory system integrated with ox_inventory)
    for _, item in pairs(loadout.items) do
        TriggerServerEvent('loadout:giveItem', item.name, item.amount)
    end

    lib.notify({
        title = 'Loadout Applied',
        description = ('You received the %s loadout.'):format(loadout.name),
        type = 'success'
    })
end

local function openLoadoutMenu()
    local options = {}

    for _, loadout in ipairs(Config.Loadouts) do
        table.insert(options, {
            title = loadout.name,
            description = loadout.description,
            event = 'loadout:select',
            args = loadout
        })
    end

    -- Add a footer note at the bottom
    table.insert(options, {
        title = ' ',
        description = 'Made by Louie Wick',
        disabled = false -- prevents interaction
    })

    lib.registerContext({
        id = 'loadout_menu',
        title = 'Select a Loadout',
        options = options
    })

    lib.showContext('loadout_menu')
end

RegisterNetEvent('loadout:select', function(loadout)
    giveLoadout(loadout)
end)

RegisterCommand('loadout', function()
    openLoadoutMenu()
end)
