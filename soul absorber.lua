--[[
made by rouxhaver
when someone leaves the game you teleport to where they were and chat "Soul absorbed"
]]

players = game:GetService("Players")

lp = players.LocalPlayer

locations = {}

players.PlayerRemoving:Connect(function(player)
	lp.Character.HumanoidRootPart.CFrame = locations[player]
	game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Soul absorbed","All")
end)

while task.wait() do
	for i,player in pairs(players:GetPlayers()) do
		if player ~= lp and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			locations[player] = player.Character.HumanoidRootPart.CFrame
		end
	end
end
