local function ShowNotification(text, msgType, length)
    msgType = msgType or 'info'
    
    if msgType == 'primary' then msgType = 'info' end
    if msgType == 'success' then msgType = 'success' end
    if msgType == 'error' then msgType = 'error' end
    if msgType == 'warning' then msgType = 'warning' end
    
    local title = msgType:gsub("^%l", string.upper)
    local message = text
    
    if type(text) == "table" then
        title = text.caption or title
        message = text.text or 'Placeholder'
    end

    SendNUIMessage({
        action = 'notify',
        type = msgType,
        title = title,
        message = message,
        duration = length or 5000
    })
end

RegisterNetEvent('QBCore:Notify', ShowNotification)


RegisterCommand('notify', function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openSettings'
    })
end, false)

RegisterNUICallback('closeSettings', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

exports('SendNotification', function(msgType, title, message, duration)
    SendNUIMessage({
        action = 'notify',
        type = msgType or 'info',
        title = title or '',
        message = message or '',
        duration = duration or 5000
    })
end)