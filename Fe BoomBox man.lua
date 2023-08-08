--[[
made by rouxhaver

working games:
https://www.roblox.com/games/6142500718/Free-Boombox-Radio  (Need radio gamepass)
https://www.roblox.com/games/417267366/Dollhouse-Roleplay  (Free)
]]

LocalPlayer = game:GetService("Players").LocalPlayer

Gears = {}

for i = 1, 6, 1 do
	LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,20000,0)
    for i,Gear in pairs(Gears) do
        firetouchinterest(LocalPlayer.Character.HumanoidRootPart, Gear.Handle)
    end
	wait(0.5)
	for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
		if v:IsA("Tool") then v.Parent = LocalPlayer.Character end
	end
	for i,v in pairs(LocalPlayer.Character:GetChildren()) do
		if v:IsA("Tool") then 
			v.Parent = workspace
			table.insert(Gears,v)
		end
	end
	LocalPlayer.Character:WaitForChild("Humanoid").Health = 0
	while LocalPlayer.Character:WaitForChild("Humanoid").Health == 0 do task.wait() end
end

for i,Gear in pairs(Gears) do
    firetouchinterest(LocalPlayer.Character.HumanoidRootPart, Gear.Handle)
end

wait(1)

Character = LocalPlayer.Character

Character:FindFirstChildOfClass("Tool").Parent = LocalPlayer.Backpack

wait(1)

Character.Archivable = true
FakeCharacter = Character:Clone()
FakeCharacter.Parent = workspace
for i,v in pairs(FakeCharacter:GetDescendants()) do
	if v:IsA("BasePart") then
		v.Transparency = 1
	end
end
for i,v in pairs(FakeCharacter.Torso:GetChildren()) do
	if v:IsA("Motor6D") then
		v.C0 = CFrame.new(v.C0.X*1.5,v.C0.Y*1.5,v.C0.Z*1.5) * v.C0.Rotation
		v.C1 = CFrame.new(v.C1.X*1.5,v.C1.Y*1.5,v.C1.Z*1.5) * v.C1.Rotation
	end
end
FakeCharacter.Humanoid.HipHeight = 1.2
workspace.CurrentCamera.CameraSubject = FakeCharacter.Humanoid

if FakeCharacter:FindFirstChild("ForceField") then
	FakeCharacter.ForceField:Destroy()
end
FakeCharacter.Head.face:Destroy()

Gears = {}

for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
	if v:IsA("Tool") then
		table.insert(Gears, v)
		v.Client:Destroy()
	end
end

function Equip()
	for i,Gear in pairs(Gears) do
		Gear.Parent = Character
	end
	wait(.1)
end

function Unequip()
	for i,Gear in pairs(Gears) do
		Gear.Parent = LocalPlayer.Backpack
	end
	wait(.1)
end

function PlaySong(Song)
	for i,Gear in pairs(Gears) do
		Gear.Remote:FireServer("PlaySong", Song)
	end
end

Equip()
Unequip()

Character["Right Arm"]:Destroy()

Character.HumanoidRootPart.CFrame = CFrame.new(Gears[1].Handle.Position)
wait(.2)
Character.HumanoidRootPart.Anchored = true

wait(5)

Character.HumanoidRootPart.Anchored = false
Equip()

game:GetService("RunService").Heartbeat:Connect(function()
	Loudness = Gears[1].Handle.Sound.PlaybackLoudness/1000
	SleepOffset = Vector3.new(0,math.sin(tick()*15)*0.05,0)
	Gears[1].Handle.CFrame = FakeCharacter.Head.CFrame + SleepOffset
	Gears[2].Handle.CFrame = FakeCharacter.Torso.CFrame * CFrame.Angles(0,0,math.rad(-180)) + FakeCharacter.Torso.CFrame.UpVector * .5 + SleepOffset
	Gears[3].Handle.CFrame = FakeCharacter.Torso.CFrame + FakeCharacter.Torso.CFrame.UpVector * -.5 + SleepOffset
	Gears[4].Handle.CFrame = FakeCharacter["Right Arm"].CFrame * CFrame.Angles(0,0,math.rad(-90)) + SleepOffset
	Gears[5].Handle.CFrame = FakeCharacter["Right Leg"].CFrame * CFrame.Angles(0,0,math.rad(-90)) + FakeCharacter["Right Leg"].CFrame.UpVector * .25 + SleepOffset + FakeCharacter["Right Leg"].CFrame.RightVector * .1
	Gears[6].Handle.CFrame = FakeCharacter["Left Arm"].CFrame * CFrame.Angles(0,0,math.rad(90)) + SleepOffset
	Gears[7].Handle.CFrame = FakeCharacter["Left Leg"].CFrame * CFrame.Angles(0,0,math.rad(90)) + FakeCharacter["Left Leg"].CFrame.UpVector * .25 + SleepOffset + FakeCharacter["Left Leg"].CFrame.RightVector * -.1
	for i,Gear in pairs(Gears) do
		Gear.Handle.Velocity = Vector3.new(0,25.01,0)
		Gear.Handle.RotVelocity = Vector3.new(0,math.sin(os.clock()),0)
	end
end)

LocalPlayer.Character = FakeCharacter

SG = Instance.new("ScreenGui",LocalPlayer.PlayerGui)

frame = Instance.new("Frame",SG)
frame.Size = UDim2.new(0.2,0,0.2,0)
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.Position = UDim2.new(0.5,0,0.8,0)
frame.Active = true
frame.Draggable = true
frame.BackgroundColor3 = Color3.new(0.14902, 0.8, 1)

textbox = Instance.new("TextBox",frame)
textbox.AnchorPoint = Vector2.new(0.5,0.5)
textbox.Size = UDim2.new(0.95,0,0.65,0)
textbox.Position = UDim2.new(0.5,0,0.6,0)
textbox.TextScaled = true
textbox.BackgroundColor3 = Color3.new(1,1,1)
textbox.Text = "Audio Id"
textbox.TextColor3 = Color3.new(0, 0, 0)

title = Instance.new("TextLabel",frame)
title.Size = UDim2.new(0.3,0,0.3,0)
title.TextScaled = true
title.Text = "BoomBox"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(0, 0, 0)

closebutton = Instance.new("TextButton",frame)
closebutton.Size = UDim2.new(0.15,0,0.25,0)
closebutton.AnchorPoint = Vector2.new(1,0)
closebutton.TextScaled = true
closebutton.BackgroundColor3 = Color3.new(1, 0, 0.0156863)
closebutton.Text = "X"
closebutton.Position = UDim2.new(1,0,0,0)
closebutton.TextColor3 = Color3.new(1, 1, 1)

ui = Instance.new("UIAspectRatioConstraint",frame)
ui.AspectRatio = 4

closebutton.MouseButton1Up:Connect(function()
	SG:Destroy()
end)

textbox.FocusLost:Connect(function()
	PlaySong(tonumber(textbox.Text))
end)

FakeCharacter.Animate.Enabled = false
wait(1)
FakeCharacter.Animate.Enabled = true

Character.HumanoidRootPart.Anchored = true
Character.Animate:Destroy()
