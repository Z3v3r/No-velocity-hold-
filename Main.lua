local buttons = {Enum.KeyCode.B}

function getstringtable(tabl)
	local output = ""
	for i,v in ipairs(tabl) do
		output = output .. tostring(v)
		if i < #tabl then
			output =  output .. ", "
		end
	end
	output = "{"..output.."}"
	return output
end

local source = "local bool = false local humanoidrootpart = game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart') local buttons = "..getstringtable(buttons).." local uis = game:GetService('UserInputService') local findvel = 'BodyVeloo' game:GetService('RunService').RenderStepped:Connect(function() if bool then if not humanoidrootpart:FindFirstChild(findvel) then local att = Instance.new('Attachment') local vel = Instance.new('LinearVelocity') vel.Name = findvel vel.Attachment0 = att vel.MaxForce = 999999 vel.VectorVelocity = Vector3.new(0,0,0) att.Name = findvel vel.Parent = att att.Parent = humanoidrootpart end else spawn(function() for i,v in pairs(humanoidrootpart:GetChildren()) do if v.Name == findvel then v:Remove() end end end) end end) uis.InputBegan:Connect(function(input, gameproceed) if table.find(buttons, input.KeyCode) and not gameproceed then bool = true end end) uis.InputEnded:Connect(function(input, gameproceed) if table.find(buttons, input.KeyCode) and not gameproceed then bool = false end end)"

local seed = 2186294902137

local character = game.Players.LocalPlayer.Character

if character:FindFirstChild(seed) then
	character:FindFirstChild(seed):Remove()
end

local lscript = Instance.new("LocalScript", character)
lscript.Enabled = false
lscript.Name = seed
lscript.Source = source

lscript.Enabled = true
