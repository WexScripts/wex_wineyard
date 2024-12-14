ESX = exports["es_extended"]:getSharedObject()



exports.ox_target:addBoxZone({
    coords = vec3(-1897.4508, 2068.5034, 140.9111),
    size = vec3(1.0, 6.0, 0.50),
    rotation = 0,
    debug = false,
    distance = 0.5,
    options = {
        {
            onSelect = function()
                OpenBossMenu()
            end,
            icon = 'fa-solid fa-wine-bottle',
            distance = 3.0,
            label = "Open Boss menu",
            groups = {
                [WEX.WineJob] = 0,
            },
        }
    }
})






for k, v in ipairs(WEX.CollectPos) do
    exports.ox_target:addBoxZone({
        coords = v.position,
        size = vec3(1.0, 1.0, 1.50),
        rotation = 0,
        debug = WEX.Debug,
        options = {
            {
                onSelect = function()
                    lib.progressCircle({
                        duration = 3000,
                        position = 'bottom',
                        label = v.ProgressLabel,
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            car = true,
                            move = true,
                        },
                        anim = {
            dict = v.dict,
            clip = v.clip
                        },
                        prop = {
    --[[                         model = `prop_ld_flow_bottle`,
                            pos = vec3(0.03, 0.03, 0.02),
                            rot = vec3(0.0, 0.0, -1.5) ]]
                        },
                    })
    
                    TriggerServerEvent("WEX_wineyard:addi", v.item, math.random(v.getMin, v.getMax))
                end,
                icon = 'fa-solid fa-scissors',
                distance = 3.0,
                groups = {
                    [WEX.WineJob] = 0,
                },
                label = v.TargetLabel,
            }
        }
    })
end

for k, v in ipairs(WEX.WinepressPos) do
    exports.ox_target:addBoxZone({
        coords = v.position,
        size = vec3(1.0, 1.0, 1.50),
        rotation = 0,
        debug = WEX.Debug,
        distance = 0.5,
        options = {
            {
                onSelect = function()
                    lib.progressCircle({
                        duration = 3000,
                        position = 'bottom',
                        label = v.ProgressLabel,
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            car = true,
                            move = true,
                        },
                        anim = {
            dict = v.dict,
            clip = v.clip
                        },
                        prop = {
    --[[                         model = `prop_ld_flow_bottle`,
                            pos = vec3(0.03, 0.03, 0.02),
                            rot = vec3(0.0, 0.0, -1.5) ]]
                        },
                    })
                    TriggerServerEvent('WEX_wineyard:crafti', v.needItem, v.getItem, math.random(v.needMin, v.needMax), math.random(v.getMin, v.getMax) )
                end,
                icon = 'fa-solid fa-wine-bottle',
                distance = 3.0,
                items = v.needItem,
                groups = {
                    [WEX.WineJob] = 0,
                },
                label = v.TargetLabel,
            }
        }
    })
end
for k, v in ipairs(WEX.WineTransferring) do
exports.ox_target:addBoxZone({
    coords = v.position,
    size = vec3(1.0, 1.0, 1.50),
    rotation = 0,
    debug = WEX.Debug,
    distance = 0.5,
    options = {
        {
            onSelect = function()
                lib.progressCircle({
                    duration = 3000,
                    position = 'bottom',
                    label = v.ProgressLabel,
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        car = true,
                        move = true,
                    },
                    anim = {
        dict = v.dict,
        clip = v.clip
                    },
                    prop = {
--[[                         model = `prop_ld_flow_bottle`,
                        pos = vec3(0.03, 0.03, 0.02),
                        rot = vec3(0.0, 0.0, -1.5) ]]
                    },
                })
--[[                 TriggerServerEvent("WEX_wineyard:removei", v.needItem, v.need)
                TriggerServerEvent("WEX_wineyard:addi", v.getItem, v.get) ]]
                TriggerServerEvent('WEX_wineyard:crafti', v.needItem, v.getItem,  math.random(v.needMin, v.needMax), math.random(v.getMin, v.getMax))
            end,
            icon = 'fa-solid fa-wine-bottle',
            distance = 3.0,
            groups = WEX.WineJob,
            items = v.needItem,
            label = v.TargetLabel,
        }
    }
})
end










function OpenBossMenu()

    TriggerEvent('esx_society:openBossMenu', "wine", function (menu)
        ESX.CloseContext() 
    end, {wash = false}) 
    end




lib.registerContext({
    id = 'penize_frakce',
    title = 'Other context menu',
    menu = 'bossmenu_wine',
    options = {
      {
        title = 'Nothing here'
      }
    }
  })



  Goptions = {
    {
        name = 'wine_garage',
        icon = 'fas fa-car',
        label = WEX.Garage.targetLabel,
        distance = 2,
        groups = WEX.WineJob,
        onSelect = function()
        local options = {}
        for k, v in pairs(WEX.Garage.cars) do
    table.insert(options, {
        title = v.carLabel,
        icon = 'fas fa-car',
        onSelect = function()
            ESX.Game.SpawnVehicle(v.carSpawnCode,  WEX.Garage.vehSpawnPos.xyz, WEX.Garage.vehSpawnPos.w, function(vehicle)
                TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
              end)
              
        end
    })
end      

lib.registerContext({
    id = 'garage_menu',
    title = WEX.Garage.menuLabel,
    options = options
})
              lib.showContext("garage_menu")
        end
    }
  }

  local SpawnedPeds = {}

local function spawnPed()
    lib.requestModel(WEX.Garage.pedModel)

    local createdPed = CreatePed(4, joaat(WEX.Garage.pedModel), WEX.Garage.pedCoords.xyz, WEX.Garage.pedCoords.w, false, false)

    SetBlockingOfNonTemporaryEvents(createdPed, true)
    SetPedDiesWhenInjured(createdPed, false)
    SetPedCanPlayAmbientAnims(createdPed, true)
    SetPedCanRagdollFromPlayerImpact(createdPed, false)
    SetEntityInvincible(createdPed, true)
    FreezeEntityPosition(createdPed, true)
    SetEntityAsMissionEntity(createdPed, true, true)
    TaskStartScenarioInPlace(createdPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
    SetModelAsNoLongerNeeded(joaat(WEX.Garage.pedModel))

    SpawnedPeds[WEX.Garage.location] = createdPed
    exports.ox_target:addLocalEntity(createdPed, Goptions)
end

local function deletePeds()
    for k, v in pairs(SpawnedPeds) do
        DeletePed(v)
        SpawnedPeds[k] = nil
    end
end

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        deletePeds()
    end
end)  

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded',function()
    spawnPed()
end)




local center = WEX.Garage.vehDeletePos
local uiText = "Press [E] to delete car"
 
local point = lib.points.new({
  coords = center,
  distance = 10,
})
 
local marker = lib.marker.new({
  coords = center,
  type = 20,
  width = 0.4,
  height = 0.2
})
 
function point:nearby()
    if ESX.GetPlayerData().job.name == "wine" and IsPedInAnyVehicle(PlayerPedId()) then
  marker:draw()
 
  if self.currentDistance < 1.5 then
    if not lib.isTextUIOpen() then
      lib.showTextUI("Press [E] to delete car")
    end
 
    if IsControlJustPressed(0, 51) then
        ESX.Game.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId(), false) )
        lib.hideTextUI()
    end
  else
  local isOpen, currentText = lib.isTextUIOpen()
    if isOpen and currentText == uiText then
      lib.hideTextUI()
    end
  end
end
end

Citizen.CreateThread(function()
    for _, WEX in pairs(WEX.Blips) do
        WEX.blip = AddBlipForCoord(WEX.coords)
      SetBlipSprite(WEX.blip, WEX.ID)
      SetBlipDisplay(WEX.blip, 4)
      SetBlipScale(WEX.blip, WEX.Scale)
      SetBlipColour(WEX.blip, WEX.Colour)
      SetBlipAsShortRange(WEX.blip, true)
    BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(WEX.Name)
      EndTextCommandSetBlipName(WEX.blip) 
    end
  end)
  

