ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--Job One
RegisterServerEvent('esx_jobcentre:setjobone')
AddEventHandler('esx_jobcentre:setjobone', function(job)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.setJob('lumberjack', 0)
	--For example: 	xPlayer.setJob('taxi', 0)
end)

--Job Two
RegisterServerEvent('esx_jobcentre:setjobtwo')
AddEventHandler('esx_jobcentre:setjobtwo', function(job)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.setJob('tailor', 0)
end)

--Job Three
RegisterServerEvent('esx_jobcentre:setjobthree')
AddEventHandler('esx_jobcentre:setjobthree', function(job)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.setJob('cleaner', 0)
end)

--Job Four
RegisterServerEvent('esx_jobcentre:setjobfour')
AddEventHandler('esx_jobcentre:setjobfour', function(job)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.setJob('delivery', 0)
end)

--Job Five
RegisterServerEvent('esx_jobcentre:setjobfive')
AddEventHandler('esx_jobcentre:setjobfive', function(job)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.setJob('garbage', 0)
end)

--Job Six
RegisterServerEvent('esx_jobcentre:setjobsix')
AddEventHandler('esx_jobcentre:setjobsix', function(job)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.setJob('technician', 0)
end)

--Unemployed
RegisterServerEvent('esx_jobcentre:setunemployed')
AddEventHandler('esx_jobcentre:setunemployed', function(job)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.setJob('unemployed', 0)
end)