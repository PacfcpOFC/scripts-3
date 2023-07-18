--[[
made by rouxhaver
you need to have a radio on spawn and find an area most players wont go
recommended game: https://www.roblox.com/games/417267366/Dollhouse-Roleplay
]]

id = 159544200 -- song id
radios = 10 -- how many extra radios you want
radio_delay = 0.05 -- the delay between the radios playing (set to zero if you want them all to play at once)


lp = game:GetService("Players").LocalPlayer

pos = lp.Character.HumanoidRootPart.CFrame
for i = 0, radios-1, 1 do
	wait(.5)
	lp.Character.HumanoidRootPart.CFrame = pos
	wait(.5)
	for i,v in pairs(lp.Backpack:GetChildren()) do
		if v:IsA("Tool") then
			v.Parent = lp.Character
			v.Parent = workspace
		end
	end
	lp.Character.Humanoid.Health = 0
	lp.CharacterAdded:Wait()
end

wait(.5)
--lp.Character.HumanoidRootPart.CFrame = pos

for i,v in pairs(workspace:GetChildren()) do
	if v:IsA("Tool") then
		firetouchinterest(lp.Character.Torso,v.Handle)
	end
end

wait(.5)

for i,v in pairs(lp.Character:GetChildren()) do
	if v:IsA("Tool") then
		v.Parent = lp.Backpack
	end
end

wait(.5)

tools = {}
for i,v in pairs(lp.Backpack:GetChildren()) do
	if v:IsA("Tool") then
        table.insert(tools,v)
	end
end

for i,v in pairs(tools) do
    v.Grip = CFrame.new(0,0,10) * CFrame.Angles(0,math.rad(360/(#tools)*i),0)
	v.Parent = lp.Character
end

for i,v in pairs(lp.Character:GetDescendants()) do
	if v.Name == "Remote" then
        wait(radio_delay)
		v:FireServer("PlaySong", id)
	end
end
