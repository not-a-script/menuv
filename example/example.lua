--- MenuV Menu
---@type Menu
local menu = MenuV:CreateMenu(false, 'Welcome to MenuV', 'topleft', 255, 0, 0, 'size-125', 'example', 'menuv', 'example_namespace')
local menu2 = MenuV:CreateMenu('Demo 2', 'Open this demo menu in MenuV', 'topleft', 255, 0, 0)

local menu_button = menu:AddButton({ icon = '😃', label = 'Open Demo 2 Menu', value = menu2, description = 'YEA :D from first menu' })
local menu2_button = menu2:AddButton({ icon = '😃', label = 'Open First Menu', value = menu, description = 'YEA :D from second menu' })
local confirm = menu:AddConfirm({ icon = '🔥', label = 'Confirm', value = 'no' })
local range = menu:AddRange({ icon = '⚽', label = 'Range Item', min = 0, max = 10, value = 0, saveOnUpdate = true })
local checkbox = menu:AddCheckbox({ icon = '💡', label = 'Checkbox Item', value = 'n' })
local checkbox_disabled = menu:AddCheckbox({ icon = '💡', label = 'Checkbox Disabled', value = 'n', disabled = true })
local hidden_button = menu:AddButton({ icon = '👻', label = 'Hidden Button', description = 'You should not see this', hidden = true })
local toggle_hidden = menu:AddButton({ icon = '👁️', label = 'Toggle Hidden Item', description = 'Show/hide the hidden button above' })
local slider = menu:AddSlider({ icon = '❤️', label = 'Slider', value = 'demo', values = {
    { label = 'Demo Item', value = 'demo', description = 'Demo Item 1' },
    { label = 'Demo Item 2', value = 'demo2', description = 'Demo Item 2' },
    { label = 'Demo Item 3', value = 'demo3', description = 'Demo Item 3' },
    { label = 'Demo Item 4', value = 'demo4', description = 'Demo Item 4' }
}})

--- Font Size demo menu
local menu3 = MenuV:CreateMenu('Big Font', 'Font Size Demo', 'topleft', 0, 200, 100, 'size-125')
menu3.FontSize = '1.4em'
local menu3_button = menu:AddButton({ icon = '🔤', label = 'Open Font Size Demo', value = menu3, description = 'Opens a menu with a larger font size' })
menu3:AddButton({ icon = '📏', label = 'Large Text Item', description = 'This text is displayed at 1.4em' })
menu3:AddButton({ icon = '🔙', label = 'Back', value = menu, description = 'Go back to main menu' })

--- Item Height demo menu
local menu4 = MenuV:CreateMenu('Tall Items', 'Item Height Demo', 'topleft', 0, 150, 200, 'size-125')
menu4.ItemHeight = '3.5em'
local menu4_button = menu:AddButton({ icon = '📐', label = 'Open Item Height Demo', value = menu4, description = 'Opens a menu with taller items' })
menu4:AddButton({ icon = '📏', label = 'Tall Item 1', description = 'This item has a height of 3.5em' })
menu4:AddButton({ icon = '📏', label = 'Tall Item 2', description = 'Another tall item' })
menu4:AddCheckbox({ icon = '💡', label = 'Tall Checkbox', value = false })
menu4:AddRange({ icon = '⚽', label = 'Tall Range', min = 0, max = 10, value = 5 })
menu4:AddButton({ icon = '🔙', label = 'Back', value = menu, description = 'Go back to main menu' })

--- Custom Colors demo menu
local menu5 = MenuV:CreateMenu('Custom Colors', 'Colors Demo', 'topleft', 0, 0, 255, 'size-125')
menu5.Colors = {
    HeaderBackground = { R = 40, G = 0, B = 60 },
    SubheaderBackground = { R = 120, G = 0, B = 180 },
    ItemsBackground = { R = 20, G = 10, B = 30 },
    ItemText = { R = 220, G = 200, B = 255 },
    ActiveItemBackground = { R = 180, G = 50, B = 255 },
    ActiveItemText = { R = 255, G = 255, B = 255 },
    DescriptionBackground = { R = 30, G = 15, B = 45 },
    DescriptionBorder = { R = 180, G = 50, B = 255 },
    DisabledItemBackground = { R = 50, G = 30, B = 70 }
}
local menu5_button = menu:AddButton({ icon = '🎨', label = 'Open Colors Demo', value = menu5, description = 'Opens a menu with custom colors' })
menu5:AddButton({ icon = '🟣', label = 'Purple Theme Item', description = 'All colors are customized in this menu' })
menu5:AddCheckbox({ icon = '💜', label = 'Purple Checkbox', value = true })
menu5:AddConfirm({ icon = '🔮', label = 'Purple Confirm', value = 'no' })
menu5:AddCheckbox({ icon = '🚫', label = 'Disabled Item', value = false, disabled = true })
menu5:AddButton({ icon = '🔙', label = 'Back', value = menu, description = 'Go back to main menu' })

--- Custom Data demo menu
local menu6 = MenuV:CreateMenu('Data Storage', 'Custom Data Demo', 'topleft', 50, 200, 50, 'size-125')
menu6.Data = { shopId = 'weapon_shop_1', category = 'weapons' }
local menu6_button = menu:AddButton({ icon = '💾', label = 'Open Data Demo', value = menu6, description = 'Opens a menu demonstrating custom data storage' })
local data_pistol = menu6:AddButton({ icon = '🔫', label = 'Pistol', description = 'Price: $500', Data = { weaponHash = 'WEAPON_PISTOL', price = 500 } })
local data_rifle = menu6:AddButton({ icon = '🔫', label = 'Rifle', description = 'Price: $2500', Data = { weaponHash = 'WEAPON_CARBINERIFLE', price = 2500 } })
local data_shotgun = menu6:AddButton({ icon = '🔫', label = 'Shotgun', description = 'Price: $1200', Data = { weaponHash = 'WEAPON_PUMPSHOTGUN', price = 1200 } })
menu6:AddButton({ icon = '🔙', label = 'Back', value = menu, description = 'Go back to main menu' })

menu6:On('select', function(m, item)
    if item.Data and item.Data.price then
        print(('Shop: %s | Buying %s for $%d (hash: %s)'):format(
            m.Data.shopId,
            item.Label,
            item.Data.price,
            item.Data.weaponHash
        ))
    end
end)

--- Right Label demo menu
local menu7 = MenuV:CreateMenu('Weapon Shop', 'Buy Weapons', 'topleft', 255, 150, 0, 'size-125')
local menu7_button = menu:AddButton({ icon = '🏷️', label = 'Open Right Label Demo', value = menu7, description = 'Opens a menu with right-side labels (prices, badges)' })
menu7:AddButton({ icon = '🔫', label = 'Pistol', rightLabel = '$500', description = 'A standard pistol' })
menu7:AddButton({ icon = '🔫', label = 'Carbine Rifle', rightLabel = '$2,500', description = 'An assault rifle' })
menu7:AddButton({ icon = '🔫', label = 'Pump Shotgun', rightLabel = '$1,200', description = 'A pump-action shotgun' })
menu7:AddButton({ icon = '🔫', label = 'RPG', rightLabel = '~r~SOLD OUT', description = 'A rocket launcher' })
menu7:AddCheckbox({ icon = '🛡️', label = 'Body Armor', rightLabel = '$300', value = false })
menu7:AddSlider({ icon = '💊', label = 'Medkits', rightLabel = '$50 each', value = 1, values = {
    { label = '1x', value = 1, description = 'Buy 1 medkit' },
    { label = '5x', value = 5, description = 'Buy 5 medkits' },
    { label = '10x', value = 10, description = 'Buy 10 medkits' }
}})
menu7:AddButton({ icon = '🔙', label = 'Back', value = menu, description = 'Go back to main menu' })

--- Custom CSS demo menu
local menu8 = MenuV:CreateMenu('Styled Menu', 'Custom CSS Demo', 'topleft', 0, 200, 255, 'size-125')
menu8.CustomCSS = [[
    .menuv .menuv-header {
        border-bottom: 3px solid rgba(0, 200, 255, 0.8);
    }
    .menuv .menuv-items .menuv-item {
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }
    .menuv .menuv-items .menuv-item.active {
        text-shadow: 0 0 10px rgba(0, 200, 255, 0.5);
    }
    .menuv .menuv-description {
        border-top: 2px solid rgba(0, 200, 255, 0.5);
    }
]]
local menu8_button = menu:AddButton({ icon = '✨', label = 'Open Custom CSS Demo', value = menu8, description = 'Opens a menu with custom CSS rules' })
menu8:AddButton({ icon = '🎯', label = 'Glowing Item', description = 'Active item has a text glow effect' })
menu8:AddButton({ icon = '📋', label = 'Bordered Item', description = 'Items have subtle bottom borders' })
menu8:AddCheckbox({ icon = '💡', label = 'Toggle Option', value = true })
menu8:AddButton({ icon = '🔙', label = 'Back', value = menu, description = 'Go back to main menu' })

--- Events
confirm:On('confirm', function(item) print('YOU ACCEPTED THE TERMS') end)
confirm:On('deny', function(item) print('YOU DENIED THE TERMS') end)

range:On('select', function(item, value) print(('FROM %s to %s YOU SELECTED %s'):format(item.Min, item.Max, value)) end)
range:On('change', function(item, newValue, oldValue)
    menu.Title = ('MenuV %s'):format(newValue)
end)

slider:On('select', function(item, value) print(('YOU SELECTED %s'):format(value)) end)

confirm:On('enter', function(item) print('YOU HAVE NOW A CONFIRM ACTIVE') end)
confirm:On('leave', function(item) print('YOU LEFT OUR CONFIRM :(') end)

toggle_hidden:On('select', function(item)
    hidden_button.Hidden = not hidden_button.Hidden
    print(('Hidden button is now %s'):format(hidden_button.Hidden and 'hidden' or 'visible'))
end)

menu:On('switch', function(item, currentItem, prevItem) print(('YOU HAVE SWITCH THE ITEMS FROM %s TO %s'):format(prevItem.__type, currentItem.__type)) end)

menu2:On('open', function(m)
    m:ClearItems()

    for i = 1, 10, 1 do
        math.randomseed(GetGameTimer() + i)

        m:AddButton({ ignoreUpdate = i ~= 10, icon = '❤️', label = ('Open Menu %s'):format(math.random(0, 1000)), value = menu, description = ('YEA! ANOTHER RANDOM NUMBER: %s'):format(math.random(0, 1000)), select = function(i) print('YOU CLICKED ON THIS ITEM!!!!') end })
    end
end)

menu:OpenWith('KEYBOARD', 'F1') -- Press F1 to open Menu