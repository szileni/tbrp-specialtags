local RSGCore = exports['rsg-core']:GetCoreObject()
local ShowPlayerNames = false
local TagDrawDistance = 50
local HudIsRevealed = false
local ActivePlayers = {}
local MyCoords = vector3(0, 0, 0)

RegisterNetEvent('tbrp-specialtags:client:playernames', function(source, args, raw)
	ShowPlayerNames = not ShowPlayerNames
	while true do
		DrawTags()
		Citizen.Wait(0)
	end
end)

function DrawText3D(x, y, z, text, playerpedid, licence)
	local onScreen, screenX, screenY = GetScreenCoordFromWorldCoord(x, y, z)
	local drawcolor = {255, 255, 255, 223}
	for _, k in ipairs(Config.Admin) do
		if GetPlayerName(playerpedid) == k.name then
			if licence == k.license then
				drawcolor = k.tagtextcolor
			end
		end
	end			
	SetTextScale(0.35, 0.35)
	SetTextFontForCurrentCommand(1)
	SetTextColor(drawcolor[1], drawcolor[2], drawcolor[3], drawcolor[4])
	SetTextCentre(1)
	DisplayText(CreateVarString(10, "LITERAL_STRING", text), screenX, screenY)
end

function GetPedCrouchMovement(ped)
	return Citizen.InvokeNative(0xD5FE956C70FF370B, ped)
end

function DrawTags()
	if ShowPlayerNames or HudIsRevealed then
		for _, playerId in ipairs(ActivePlayers) do
			local ped = GetPlayerPed(playerId)
			local pedCoords = GetEntityCoords(ped)
			local PlayerData = RSGCore.Functions.GetPlayerData()
			local specialplayerlicense = PlayerData.license
			if #(MyCoords - pedCoords) <= TagDrawDistance and not GetPedCrouchMovement(ped) then
				local text = GetPlayerName(playerId)
				for _, k in ipairs(Config.Admin) do
					if GetPlayerName(playerId) ~= k.name then
						if specialplayerlicense ~= k.license then
							text = ''
						DrawText3D(pedCoords.x, pedCoords.y, pedCoords.z + 1, text, playerId, specialplayerlicense)
						end
					else
						text = "~m~" .. k.name .. ' -~s~ ' .. k.tag
						specialplayerlicense = k.license
						DrawText3D(pedCoords.x, pedCoords.y, pedCoords.z + 1, text, playerId, specialplayerlicense)
					end
				end
			end
		end
	end
end

Citizen.CreateThread(function()
	while true do
		ActivePlayers = GetActivePlayers()
		MyCoords = GetEntityCoords(PlayerPedId())
		Citizen.Wait(500)
	end
end)
