--[[
Made by Rouxhaver

Roblox has recently patched perma death meaning this script no longer works
]]
players = game:GetService("Players")
lp = players.LocalPlayer

char = lp.Character
char.Archivable = true

if lp.Backpack:FindFirstChildWhichIsA("Tool") then
	lp.Backpack:FindFirstChildWhichIsA("Tool").Parent = char
end

fchar = char:Clone()
fchar.Parent = workspace

lp.Character = fchar

char.Animate.Parent = fchar
fchar.Animate.Enabled = false
fchar.Animate.Enabled = true

for i,v in pairs(fchar:GetDescendants()) do
	if v:IsA("BasePart") then
		v.Transparency = 1
	end
end
fchar.Head.face:Destroy()

workspace.CurrentCamera.CameraSubject = fchar.Humanoid

wait(players.RespawnTime + 0.5)

char.Humanoid.Health = 0


function Move(part, cframe)
	part.Velocity=Vector3.new(0,25.01,0)
	part.RotVelocity=Vector3.new(0,math.sin(os.clock()),0)
	--[[
	local tween = game:GetService("TweenService"):Create(part, TweenInfo.new(0), {CFrame = cframe+Vector3.new(0,0,math.sin(os.clock()*30)*0.05)})
	tween:Play()
	]]
	part.CFrame = cframe+Vector3.new(0,math.sin(os.clock()*7.5)*0.05,0)
end

gunmode = false

gearfling = false

mouse = lp:GetMouse()

gear = char:FindFirstChildWhichIsA("Tool")
if gear then
	gearfling = true
	mouse.TargetFilter = gear.Handle
	fchar:FindFirstChildWhichIsA("Tool"):Destroy()
end

shootoff = 0


runs = game:GetService("RunService")

runs.Heartbeat:Connect(function()
	Move(char["Extra Left hand (Blocky)"].Handle,fchar["Left Leg"].CFrame*CFrame.Angles(math.rad(-45),0,math.rad(180)))
	Move(char["Extra Right hand (Blocky)"].Handle,fchar["Right Leg"].CFrame*CFrame.Angles(math.rad(-45),0,math.rad(180)))
	Move(char["MeshPartAccessory"].Handle,fchar["Torso"].CFrame*CFrame.Angles(0,math.rad(180),math.rad(-15)))
	Move(char["asdasdvvvv"].Handle,fchar["Head"].CFrame*CFrame.Angles(0,math.rad(-90),0))
	if not gunmode then do
			Move(char["Extra Left Hand"].Handle,fchar["Left Arm"].CFrame*CFrame.Angles(math.rad(-120),0,0))
			Move(char["Extra Right Hand"].Handle,fchar["Right Arm"].CFrame*CFrame.Angles(math.rad(-120),0,0))
			Move(char["Airvolter LeftAccessory"].Handle,fchar["Torso"].CFrame-fchar["Torso"].CFrame.LookVector*.7)
		end else
		local TSLK = fchar["Torso"].CFrame.LookVector
		local TSRG = fchar["Torso"].CFrame.RightVector
		local TSUP = fchar["Torso"].CFrame.UpVector
		Move(char["Extra Left Hand"].Handle,fchar["Torso"].CFrame*CFrame.Angles(math.rad(0.488),math.rad(-75.522),math.rad(86.159))+TSUP*.4+TSLK*(1.6+shootoff))
		Move(char["Extra Right Hand"].Handle,fchar["Torso"].CFrame*CFrame.Angles(math.rad(-43.763),math.rad(14.867),math.rad(7.89))+TSRG*0.762+TSLK*(1+shootoff)+TSUP*.5)
		Move(char["Airvolter LeftAccessory"].Handle,fchar["Torso"].CFrame*CFrame.Angles(0,math.rad(-90),math.rad(-45))+TSRG*.5+TSLK*(1.893+shootoff)+TSUP*.5)
	end
	if gearfling then
		if not shooting or mouse.Hit.Y < -200 then do
				Move(gear.Handle, char.Head.CFrame-Vector3.new(0,10,0))
			end else
			gear.Handle.Position = mouse.Hit.Position
			gear.Handle.Velocity=Vector3.new(0,20000,0)
			gear.Handle.RotVelocity=Vector3.new(math.rad(50,150),math.rad(50,150),math.rad(50,150))
		end
	end
end)

game:GetService("UserInputService").InputBegan:Connect(function(key)
	if key.KeyCode == Enum.KeyCode.X then
		gunmode = not gunmode
	end
end)


shooting = false

mouse.Button1Down:Connect(function()
	if gunmode and not shooting and gearfling then
		shooting = true
		while shooting do
			shootoff = -.5
			wait(0.05)
			shootoff = 0
			wait(0.05)
		end
	end
end)

mouse.Button1Up:Connect(function()
	shooting = false
end)
