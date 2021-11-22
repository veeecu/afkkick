RegisterServerEvent("veeecuAfkKick")
AddEventHandler("veeecuAfkKick", function()
	DropPlayer(source, "veeecu-afk: Zbyt dlugo byles AFK.")
end)