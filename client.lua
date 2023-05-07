
AddEventHandler("onResourceStop", function(resource)
    -- Reset to default water.xml
    ResetWater()    
end)

RegisterNetEvent('rkl:statrtsunami')
AddEventHandler('rkl:statrtsunami', function(status)
Citizen.CreateThread(function()
    -- Load the water.xml file    
    if status then
        Wait(60000) -- 60 secs bago mag start ang baha
        local success = LoadWaterFromPath('waterworld', 'water.xml')               
    end    
end)
end)