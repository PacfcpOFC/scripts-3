--[[
Made by Rouxhaver

Roblox has recently patched perma death meaning this script no longer works
]]
giver = "Username1"
holder = "Username2"



players = game:GetService("Players")
lp = players.LocalPlayer
char = lp.Character

if lp.Name == giver then
	lp.Character = nil
	lp.Character = char
	wait(players.RespawnTime+.5)
	char.Humanoid.Health = 0
    	for i = 10, 0, -1 do
	    wait(.1)
	    char:WaitForChild("Airvolter LeftAccessory").Handle.CFrame = workspace:WaitForChild(holder).Head.CFrame
	    char:WaitForChild("Airvolter LeftAccessory").Handle.Velocity = Vector3.new(0,0,0)
   	end
end

if lp.Name == holder then
	giver = workspace:WaitForChild(giver)
	gun = giver:WaitForChild("Airvolter LeftAccessory").Handle
	repeat task.wait() until giver.Humanoid.Health == 0

	Tool = Instance.new("Tool",lp.Backpack)
	Tool.Name = "Gun"

	GunEquipped = false

	GunPos = Vector3.new(0,0,0)
	GunRot = CFrame.Angles(0,0,0)

	game:GetService("RunService").Heartbeat:Connect(function()
		local tscf = char.Torso.CFrame

		if GunEquipped then do
				GunPos = tscf.RightVector*.5 + tscf.UpVector*.79 + tscf.LookVector*1.7
				GunRot = CFrame.Angles(0,math.rad(-90),math.rad(-45))
			end else
			GunPos = tscf.LookVector*-.52
			GunRot = CFrame.Angles(0,0,0)
		end

		gun.Velocity=Vector3.new(0,25.01,0)
		gun.RotVelocity=Vector3.new(0,math.sin(os.clock()),0)
		local PosAntisleep = Vector3.new(0,math.sin(os.clock()*7.5)*0.05,0)
		gun.CFrame = (tscf + GunPos + PosAntisleep) * GunRot
	end)

	Animation = Instance.new("Animation")
	Animation.AnimationId = "rbxassetid://94242777"

	AnimationTrack = char.Humanoid.Animator:LoadAnimation(Animation)

	Tool.AncestryChanged:Connect(function()
		if Tool.Parent == char then do
				GunEquipped = true
				AnimationTrack:Play()
			end else
			GunEquipped = false
			AnimationTrack:Stop()
		end
	end)
end
