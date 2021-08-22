local menuIsShowed, hasAlreadyEnteredMarker, isInMarker = false, false, false
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local display = false



function SetDisplay(bool)
    print(bool)
    display = bool
    SetNuiFocus(true,true)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

RegisterNUICallback("exit", function(data)
    SetDisplay(false)
    SetNuiFocus(false,false)

end)

RegisterNUICallback("main", function(data)
    SetDisplay(false)
end)


RegisterNUICallback("jobone", function(data)
    SetDisplay(false)
    SetNuiFocus(false,false)
    TriggerServerEvent('esx_jobcentre:setjobone')
end)

RegisterNUICallback("jobtwo", function(data)
    SetDisplay(false)
    SetNuiFocus(false,false)
    TriggerServerEvent('esx_jobcentre:setjobtwo')
end)

RegisterNUICallback("jobthree", function(data)
    SetDisplay(false)
    SetNuiFocus(false,false)
    TriggerServerEvent('esx_jobcentre:setjobthree')
end)

RegisterNUICallback("jobfour", function(data)
    SetDisplay(false)
    SetNuiFocus(false,false)
    TriggerServerEvent('esx_jobcentre:setjobfour')
end)

RegisterNUICallback("jobfive", function(data)
    SetDisplay(false)
    SetNuiFocus(false,false)
    TriggerServerEvent('esx_jobcentre:setjobfive')
end)

RegisterNUICallback("jobsix", function(data)
    SetDisplay(false)
    SetNuiFocus(false,false)
    TriggerServerEvent('esx_jobcentre:setjobsix')
end)

RegisterNUICallback("unemployed", function(data)
    SetDisplay(false)
    SetNuiFocus(false,false)
    TriggerServerEvent('esx_jobcentre:setunemployed')
end)


AddEventHandler('esx_jobcentre:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
end)

-- Activate menu when player is inside marker, and draw markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		local coords = GetEntityCoords(PlayerPedId())
		isInMarker = false

		for i=1, #Config.Zones, 1 do
			local distance = GetDistanceBetweenCoords(coords, Config.Zones[i], true)

			if distance < Config.DrawDistance then
				DrawMarker(Config.MarkerType, Config.Zones[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			end

			if distance < (Config.ZoneSize.x / 2) then
				isInMarker = true
				ESX.ShowHelpNotification('press ~INPUT_PICKUP~ to access the ~b~job center~s~.')
			end
		end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_jobcentre:hasExitedMarker')
		end
	end
end)

-- Create blips
Citizen.CreateThread(function()
	for i=1, #Config.Zones2, 1 do
		local blip = AddBlipForCoord(Config.Zones2[i])

		SetBlipSprite (blip, 407)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.75)
		SetBlipColour (blip, 27)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentSubstringPlayerName('Job Center')
		EndTextCommandSetBlipName(blip)
	end
end)

-- Menu Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if IsControlJustReleased(0, 38) and isInMarker and not menuIsShowed then
			ESX.UI.Menu.CloseAll()
			SetDisplay(true)
		end
	end
end)
