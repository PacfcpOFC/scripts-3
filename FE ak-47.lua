--[[
Made by Rouxhaver
Instructions:
1. do the steps in this video to get two UWP clients: https://www.youtube.com/watch?v=dh_ejKCalvk
2. download and run electron from here: https://ryos.lol/
3. buy and equip this accessory for 100 robux: https://www.roblox.com/catalog/13760686814/Classic-MARKA-17M-Valkan-Left
4. paste this script into electron and change "Username1" to the USERNAME of the account with the gun (Example: "Imao_96sbrother") and change "Username2" to your alt-account on the other client
5. execute the script
6. if this works your alt-account should get a gun gear that sadly does not shoot anything, if the gun disappears then rejoin on both clients and try running the script again and/or press F9 to check for errors

Notes:
Only works in R6 for now.
A video will come soon of me using the script.
Because the setup is kinda aids so I cant be bothered to make the gun shoot.
It usually takes a few executions for the script to work.
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
