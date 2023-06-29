--[[
made by rouxhaver

required hats:
https://www.roblox.com/catalog/3033908130/International-Fedora-France
https://www.roblox.com/catalog/3409612660/International-Fedora-USA
https://www.roblox.com/catalog/3398308134/International-Fedora-Canada
https://www.roblox.com/catalog/3438342658/International-Fedora-Argentina
https://www.roblox.com/catalog/4819740796/Robox
https://www.roblox.com/catalog/2956239660/Belle-Of-Belfast-Long-Red-Hair
https://www.roblox.com/catalog/376526888/Straight-Blonde-Hair
https://www.roblox.com/catalog/1103003368/Orange-Beanie-with-Black-Hair
https://www.roblox.com/catalog/301818806/Serenas-Hair
https://www.roblox.com/catalog/617605556/Medieval-Hood-of-Mystery
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
	Move(char.MediHood.Handle, fakechar.Head.CFrame)
	Move(RA, fakechar["Right Arm"].CFrame - fakechar["Right Arm"].CFrame.UpVector*.5)
	Move(LA, fakechar["Left Arm"].CFrame - fakechar["Left Arm"].CFrame.UpVector*.5)
	Move(RL, fakechar["Right Leg"].CFrame - fakechar["Right Leg"].CFrame.UpVector*.5)
	Move(LL, fakechar["Left Leg"].CFrame - fakechar["Left Leg"].CFrame.UpVector*.5)
	Move(char.LongStraightHair.Handle, fakechar["Right Arm"].CFrame * CFrame.Angles(0,math.rad(90),0))
	Move(char.RedBeanieWithHair.Handle, fakechar["Left Arm"].CFrame * CFrame.Angles(0,math.rad(-90),0))
	Move(char.LongRedHair.Handle, fakechar["Right Leg"].CFrame * CFrame.Angles(0,math.rad(90),0))
	Move(char.LongHairBeanie.Handle, fakechar["Left Leg"].CFrame * CFrame.Angles(0,math.rad(-90),0))
end
