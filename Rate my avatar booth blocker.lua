--[[
Made by Rouxhaver
click on a booth to block its text
press space to stop blocking
game: https://www.roblox.com/games/6708206173/Rate-My-Avatar
]]
if game:GetService("ReplicatedStorage"):FindFirstChild("RequestRespawn") then
	game:GetService("ReplicatedStorage").RequestRespawn:Destroy()
end

stuff = Instance.new("Folder",workspace)

for i,Booth in pairs(workspace:GetChildren()) do
	if Booth.Name == "Booth" then
		local selpart = Instance.new("Part", stuff)
		selpart.CanCollide = false
		selpart.Anchored = true
		selpart.CFrame = Booth.Banner.CFrame
		selpart.Size = Vector3.new(8.7,2.9,0.5)
		selpart.Name = "selpart"
		selpart.Transparency = 1
	end
end

activebooth = nil

mouse = game:GetService("Players").LocalPlayer:GetMouse()

mouse.Button1Up:Connect(function()
	if mouse.Target.Name == "selpart" then
		activebooth = mouse.Target
	end
end)

game:GetService("UserInputService").InputBegan:Connect(function(key)
	if key.KeyCode == Enum.KeyCode.Space then
		activebooth = nil
	end
end)

outline = Instance.new("SelectionBox",stuff)

game:GetService("RunService").RenderStepped:Connect(function()
	if mouse.Target.Name == "selpart" then do
		outline.Adornee = mouse.Target
	end else
		outline.Adornee = nil
	end
end)

while task.wait() do
	if activebooth ~= nil then
		hrp = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
		hrp.CFrame = activebooth.CFrame * CFrame.Angles(0,0,math.rad(90)) + activebooth.CFrame.RightVector*-1.5
		hrp.Velocity = Vector3.new(0,0,0)
	end
end
