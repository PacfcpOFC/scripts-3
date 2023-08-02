--[[
made by rouxhaver

Roblox has recently patched perma death meaning this script no longer works
]]

players = game:GetService("Players")
lp = players.LocalPlayer

char = lp.Character
char.Archivable = true
fakechar = char:Clone()
fakechar.Parent = workspace
lp.Character = fakechar
workspace.CurrentCamera.CameraSubject = fakechar.Humanoid


wait(players.RespawnTime+0.3)

char.Humanoid.Health = 0

function Move(part, cframe)
	part.Velocity = Vector3.new(30,0,0)
	local tween = game:GetService("TweenService"):Create(part, TweenInfo.new(0), {CFrame = cframe})
	tween:Play()
end

for i,v in pairs(fakechar:GetDescendants()) do
	if v:IsA("BasePart") then
		v.Transparency = 1
	end
end

animate = char.Animate:Clone()
animate.Parent = fakechar

fakechar.Head.face:Destroy()

RA = char.InternationalFedora.Handle
char.InternationalFedora.Name = ""

LA = char.InternationalFedora.Handle
char.InternationalFedora.Name = ""

RL = char.InternationalFedora.Handle
char.InternationalFedora.Name = ""

LL = char.InternationalFedora.Handle
char.InternationalFedora.Name = ""

while task.wait() do
	Move(char.MeshPartAccessory.Handle, fakechar.Torso.CFrame * CFrame.Angles(0,math.rad(180),math.rad(-15)))
	Move(char.ParrotFish_AccAccessory.Handle, fakechar.Head.CFrame * CFrame.Angles(math.rad(90),0,0) - fakechar.Head.CFrame.UpVector *.25)
	Move(RA, fakechar["Right Arm"].CFrame - fakechar["Right Arm"].CFrame.UpVector*.5)
	Move(LA, fakechar["Left Arm"].CFrame - fakechar["Left Arm"].CFrame.UpVector*.5)
	Move(RL, fakechar["Right Leg"].CFrame - fakechar["Right Leg"].CFrame.UpVector*.5)
	Move(LL, fakechar["Left Leg"].CFrame - fakechar["Left Leg"].CFrame.UpVector*.5)
end
