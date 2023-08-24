Toggle_Key = "Z" --(capital letter)
Message = "Soul absorbed"

--[[
made by rouxhaver
when someone leaves the game you teleport to where they were and chat a message
Added toggle and easier customization
]]

players = game:GetService("Players")

lp = players.LocalPlayer

ui = Instance.new("ScreenGui", game:GetService("CoreGui"))
showtoggle = Instance.new("TextLabel",ui)
showtoggle.Size = UDim2.new(0.05, 0, 0.05)
UIARC = Instance.new("UIAspectRatioConstraint",showtoggle)
UIARC.AspectRatio = 2
showtoggle.TextScaled = true
showtoggle.BackgroundColor3 = Color3.new(1, 0, 0)
showtoggle.Text = "Paused"
showtoggle.AnchorPoint = Vector2.new(0,1)
showtoggle.Position = UDim2.new(0,0,1)
showtoggle.TextColor3 = Color3.new(0,0,0)

active = false

game:GetService("UserInputService").InputEnded:Connect(function(key)
	if key.KeyCode == Enum.KeyCode[Toggle_Key] then
		active = not active
		if active then do
				showtoggle.BackgroundColor3 = Color3.new(0, 1, 0)
				showtoggle.Text = "Active"
			end else
			showtoggle.BackgroundColor3 = Color3.new(1, 0, 0)
			showtoggle.Text = "Paused"
		end
	end
end)

locations = {}

players.PlayerRemoving:Connect(function(player)
	if active then
		lp.Character.HumanoidRootPart.CFrame = locations[player]
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Message,"All")
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	for i,player in pairs(players:GetPlayers()) do
		if player ~= lp and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			locations[player] = player.Character.HumanoidRootPart.CFrame
		end
	end
end)
