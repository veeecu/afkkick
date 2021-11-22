-- CONFIG --

-- Czas po którym wywala z server (w sekundach)
secondsUntilKick = 1500

-- Warnowanie gracza o wyrzuceniu przez AFK
kickWarning = true

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1000)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)

			if currentPos == prevPos then
				if time > 0 then
					if kickWarning and time == math.ceil(secondsUntilKick / 4) then
						TriggerEvent("chatMessage", "AFK", {255, 0, 0}, "^1Jezeli sie nie poruszysz w przeciagu " .. time .. " sekund zostaniesz wyrzucony z server!")
					end

					time = time - 1
				else
					TriggerServerEvent("veeecuAfkKick")
				end
			else
				time = secondsUntilKick
			end

			prevPos = currentPos
		end
	end
end)