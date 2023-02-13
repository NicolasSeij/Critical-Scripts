ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('gps', function(source)
TriggerClientEvent('pk_gps:menu', source)
end)

RegisterServerEvent('pk_gps:usun')
AddEventHandler('pk_gps:usun', function()
        local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeInventoryItem('gps', 1)
end)