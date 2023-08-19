TargetUser = "Builderman"
--[[

made by rouxhaver

Instructions:
change targetuser to the Username of the person you want to fling.
equip the firework tool.
run the script.
activate the firework tool by clicking.

Notes:
sometimes the fireworks won't fling.
people won't get flung if they're sitting.
Im too lazy to make a gui or automate most of this.
feel free to build upon this script, just don't sell it >:(
]]

SPlayers = game:GetService("Players")
rocket = SPlayers.LocalPlayer.Character["Small Firework Show"].Handle

repeat task.wait() until rocket.Parent == workspace

target = workspace[TargetUser].HumanoidRootPart

workspace.CurrentCamera.CameraSubject = target.Parent.Humanoid

loop = game:GetService("RunService").Heartbeat:Connect(function()
	rocket.Velocity = Vector3.new(0,10000,0)
	rocket.CFrame = target.CFrame
end)

wait(4)

loop:Disconnect()
