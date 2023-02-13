ESX = nil
local pojazdgps = nil
local uzyty = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent("pk_gps:namierz")
AddEventHandler("pk_gps:namierz", function()
                local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
    pojazdgps = GetClosestVehicle(pos.x, pos.y, pos.z, 5.0, 0, 71)
    uzyty = true
    while uzyty do
      Citizen.Wait(0)
        if uzyty ~= nil then
            if IsEntityAVehicle(pojazdgps) then
                local autopozycja = GetEntityCoords(pojazdgps)
                 auto = AddBlipForCoord(autopozycja.x, autopozycja.y, autopozycja.z)
          SetBlipSprite(auto, 119)
          SetBlipDisplay(auto, 4)
          SetBlipScale(auto, 1.0)
          SetBlipColour(auto, 1)
          SetBlipAsShortRange(auto, true)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString("Localizador adjunto")
          EndTextCommandSetBlipName(auto)
         Citizen.Wait(Config.Odswiezanie * 1000)
          RemoveBlip(auto)
          if Config.ZaznaczGPS then
          SetNewWaypoint(autopozycja.x, autopozycja.y)
end
            end
        else
            uzyty = false
        end
    end
end)

RegisterNetEvent("pk_gps:wylacz")
AddEventHandler("pk_gps:wylacz", function()
    if uzyty == true then
        uzyty = false
    end
end)

RegisterNetEvent("pk_gps:menu")
AddEventHandler("pk_gps:menu", function()
    Menu()
end)

--Citizen.CreateThread(function()
 ---   while true do 
  --      Citizen.Wait(7)
  --    if uzyty then
  --   drawTxt(0.51, 1.25, 1.0,1.0,0.5, '~h~~g~Localizador colocado', 255, 255, 255, 255)
  --    end
 --   end
--end)

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 1,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
        SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function Menu()
	local elements = {}
		table.insert(elements, {label = 'Colocar localizador',  value = 'podloz'})
        table.insert(elements, {label = 'Quitar localizador',  value = 'wylacz'})
    ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'gps',
	{
		title    = 'GPS',
		align    = 'center',
		elements = elements
	},
	function(data, menu)

    if data.current.value == 'podloz' then
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
    pojazdgps = GetClosestVehicle(pos.x, pos.y, pos.z, 5.0, 0, 71)
    local autopozycja = GetEntityCoords(pojazdgps)
    if uzyty == true then 
ESX.ShowNotification("~h~~r~¡Localizador colocado!")
else
     if GetDistanceBetweenCoords(pos, autopozycja,  true) < 2 then
                uzyty = true
                TaskStartScenarioInPlace(ped, "world_human_vehicle_mechanic", 0, true)
                Citizen.Wait(Config.AnimacjaCzas * 1000)
                TriggerEvent("pk_gps:namierz")
                ESX.ShowNotification("~h~Localizador colocado. Modelo: ~g~" ..GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(pojazdgps))))
                ClearPedTasksImmediately(ped)
else 
ESX.ShowNotification("~h~~r~¡No hay vehículos cerca!")
end
end

elseif data.current.value == 'wylacz' then
if uzyty == true then
uzyty = false
ESX.ShowNotification("~h~~y~¡Localizador quitado!")
TriggerEvent("pk_gps:wylacz")
TriggerServerEvent('pk_gps:usun')
else 
ESX.ShowNotification("~h~~r~¡No llevas ningun vehiculo!")
end

      

end
		menu.close()
	end)
end