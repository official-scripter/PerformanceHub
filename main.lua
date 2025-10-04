-- Performance Hub | Small UI like REDZ/Xeter | One Tab (X / -) | by Gonzales Official

local plr = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui", plr:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

-- Main Frame
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 160, 0, 100)
main.Position = UDim2.new(0.5, -80, 0.5, -50)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

-- Corner + Outline
local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 10)
local outline = Instance.new("UIStroke", main)
outline.Thickness = 1.2
outline.Color = Color3.fromRGB(100, 100, 255)

-- Title
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 25)
title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
title.Text = "PERFORMANCE HUB"
title.Font = Enum.Font.GothamBold
title.TextSize = 12
title.TextColor3 = Color3.fromRGB(255, 255, 255)
local titleCorner = Instance.new("UICorner", title)
titleCorner.CornerRadius = UDim.new(0, 10)

-- Button Creator
local function makeBtn(txt, posY, func)
	local btn = Instance.new("TextButton", main)
	btn.Size = UDim2.new(1, -20, 0, 28)
	btn.Position = UDim2.new(0, 10, 0, posY)
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.Text = txt.." -"
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.GothamSemibold
	btn.TextSize = 13
	btn.AutoButtonColor = false
	local corner = Instance.new("UICorner", btn)
	corner.CornerRadius = UDim.new(0, 8)

	local on = false
	btn.MouseButton1Click:Connect(function()
		on = not on
		btn.Text = txt .. (on and " x" or " -")
		btn.BackgroundColor3 = on and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(50, 50, 50)
		func(on)
	end)
end

-- Anti-Lag
local function antiLag(active)
	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then
			v.Enabled = not active
		end
	end
end

-- FPS Boost (60 → 120)
local function boostFPS(active)
	if activTextLabelsetfpscap(120)
	else
		setfpscap(60)
	end
end

-- Create Buttons
makeBtn("Anti-Lag", 25, antiLag)
makeBtn("Boost FPS", 120, boostFPS)

-- Credit
local credit = Instance.new("TextLabel", main)
credit.Size = UDim2.new(1, 0, 0, 15)
credit.Position = UDim2.new(0, 0, 1, -15)
credit.BackgroundTransparency = 1
credit.Text = "by Gonzales Official"
credit.Font = Enum.Font.Gotham
credit.TextSize = 10
credit.TextColor3 = Color3.fromRGB(180, 180, 180)
