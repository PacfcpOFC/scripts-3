--[[

Made by Rouxhaver

Features:
Stops Low Gravity, High Speed, Invincibility, Double Jump and Bunny Hop mutators from affecting you.
Shows your players hitbox.
Changes the color and material of kill bricks.
Removes Trails.
Makes other players transparent.
And i'm too lazy to make things toggelable.

]]

RS = game:GetService("ReplicatedStorage")
Players = game:GetService("Players")
LocalPlayer = Players.LocalPlayer

function ShowHitBox(Character)
	wait(.1)
	if Character:FindFirstChild("hitbox") then
		for i,v in pairs(Character:GetChildren()) do
			if v.Name == "hitbox" then
				local sl = Instance.new("SelectionBox",v)
				sl.Adornee = v
				sl.LineThickness = 0.02
				coroutine.wrap(function()
					while sl:FindFirstAncestorOfClass("Workspace") do
						for i = 0,255,10 do
							sl.Color3 = Color3.new(255/255,i/255,0/255)
							wait()
						end
						for i = 255,0,-10 do
							sl.Color3 = Color3.new(i/255,255/255,0/255)
							wait()
						end
						for i = 0,255,10 do
							sl.Color3 = Color3.new(0/255,255/255,i/255)
							wait()
						end
						for i = 255,0,-10 do
							sl.Color3 = Color3.new(0/255,i/255,255/255)
							wait()
						end
						for i = 0,255,10 do
							sl.Color3 = Color3.new(i/255,0/255,255/255)
							wait()
						end
						for i = 255,0,-10 do
							sl.Color3 = Color3.new(255/255,0/255,i/255)
							wait()
						end

					end
				end)()
			end
		end
	end
end

game:GetService("RunService").RenderStepped:Connect(function()
	RS.globalJumps.Value = 0
	RS.globalSpeed.Value = 16
	RS.bunnyJumping.Value = false
	workspace.Gravity = 196.2
	for i,v in pairs(workspace:GetDescendants()) do
        if v.Name == "kills" and v.Parent.Material == Enum.Material.Neon then
            local Part = v.Parent
			Part.Material = Enum.Material.Rock
            local TargetColor = Color3.new(1 - Part.Color.R, 1 - Part.Color.G, 1 - Part.Color.B)
            Part.Color = TargetColor
            Part:GetPropertyChangedSignal("Color"):Connect(function()
                if Part.Color ~= TargetColor then Part.Color = TargetColor end
            end)
        end
		if v:IsA("BasePart") then
			if v.Name == "hitboxInvincible" then
				v.Name = "hitbox"
			end
		end
        if v:IsA("Trail") and v.Enabled == true then
            v.Enabled = false
        end
	end
end)

function TransPlayer(Character)
    for i,v in pairs(Character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Transparency += 0.7
        end
    end
end

for i,Player in pairs(Players:GetPlayers()) do
    if Player == LocalPlayer then continue end
    TransPlayer(Player.Character)
    Player.CharacterAppearanceLoaded:Connect(TransPlayer)
end

Players.PlayerAdded:Connect(function(Player)
    Player.CharacterAppearanceLoaded:Connect(TransPlayer)
end)

ShowHitBox(LocalPlayer.Character)
LocalPlayer.CharacterAppearanceLoaded:Connect(ShowHitBox)
