local cfg = {}
cfg.autoAttach = false

function GetNearestTrailer(veh_l)
    local coords = GetEntityCoords(veh_l)
    local femaleCoords = GetEntityBonePosition_2(veh_l, GetEntityBoneIndexByName(veh_l, 'attach_female'))
    local nearest = 0
    local dist = 50.0
    
    if not IsVehicleAttachedToTrailer(veh_l) then
        for k, v in pairs(GetGamePool("CVehicle")) do
            if v ~= veh_l then
                if GetEntityBoneIndexByName(v, 'attach_male') ~= -1 then
                    local newDist = #(femaleCoords - GetEntityBonePosition_2(v, GetEntityBoneIndexByName(v, 'attach_male')))
                    if newDist < dist then
                        dist = newDist
                        nearest = v
                    end
                end
            end
        end
    end
    
    if dist < 1.2 then
        return nearest
    end
end

local wait = 3000
CreateThread(function()
    AddTextEntry("NSQRD_TRLAT_HELP", "Preciona ~INPUT_DETONATE~ Para enganchar el trailer.")
    while true do
        local veh_l = GetVehiclePedIsIn(PlayerPedId(), false)
        if veh_l ~= 0 then
            if GetEntityBoneIndexByName(veh_l, 'attach_female') ~= -1 then
                local nearest = GetNearestTrailer(veh_l)
                if nearest ~= nil and nearest ~= 0 then
                    if cfg.autoAttach then
                        AttachVehicleToTrailer(veh_l, nearest, 1.2)
                    else
                        wait = 0
                        BeginTextCommandDisplayHelp("NSQRD_TRLAT_HELP")
                        DisplayHelpTextFromStringLabel(0, 0, 0, 0)
                        if IsControlJustPressed(0, 47) then
                            AttachVehicleToTrailer(veh_l, nearest, 1.2)
                        end
                    end
                else
                    wait = 3000
                end
            end
        end
        Wait(wait)
    end
end)