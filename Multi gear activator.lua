--[[
Made by rouxhaver
Instructions:
go into game that has gear givers or free admin
give yourself a million bombs
run script and press e
]]
lp = game:GetService("Players").LocalPlayer

game:GetService("UserInputService").InputBegan:Connect(function(key)
	if key.KeyCode == Enum.KeyCode.E then
		for i,tool in pairs(lp.Backpack:GetChildren()) do
			if tool:IsA("Tool") then
				tool.Parent = lp.Character
				tool:Activate()
				task.wait()
				tool.Parent = lp.Backpack
			end
		end
	end
end)
