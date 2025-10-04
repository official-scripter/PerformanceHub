-- Performance Hub | Small UI like REDZ/open Gonzales Official

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

-- Corners & Outline
local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 10)
local stroke = Instance.new("UIStroke", main)
stroke.Thickness = 1.2
stroke.Color = Color3.fromRGB(100, 100, 255)

-- Title Bar
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -25, 0, 25)
title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
title.Text = "PERFORMANCE HUB"
title.Font = Enum.Font.GothamBold
title.TextSize = 12
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Position = UDim2.new(0, 10, 0, 0)
local titleCorner = Instance.new("UICorner", title)
titleCorner.CornerRadius = UDim.new(0, 10)

-- Close/Open Button
local toggleBtn = Instance.new("TextButton", main)
toggleBtn.Size = UDim2.new(0, 25, 0, 25)
toggleBtn.Position = UDim2.new(1, -25, 0, 0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleBtn.Text = "x"
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.TextSize = 14
local toggleCorner = Instance.new("UICorner", toggleBtn)
toggleCorner.CornerRadius = UDim.new(0, 10)

-- Main content
local content = Instance.new("Frame", main)
content.Size = UDim2.new(1, 0, 1, -25)
content.Position = UDim2.new(0, 0, 0, 25)
content.BackgroundTransparency = 1

-- Info label
local info = Instance.new("TextLabel", content)
info.Size = UDim2.new(1, 0, 0, 30)
info.Position = UDim2.new(0, 0, 0, 10)
info.BackgroundTransparency = 1
info.Text = "Anti-Lag + FPS 120 Enabled"
info.Font = Enum.Font.GothamSemibold
info.TextColor3 = Color3.fromRGB(0, 255, 0)
info.TextSize = 13

-- Apply optimizations
for _, v in pairs(workspace:GetDescendants()) do
	if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then
		v.Enabled = false
	end
end
if setfpscap then setfpscap(120) end

-- Minimize / Open behavior
local open = true
toggleBtn.MouseButton1Click:Connect(function()
	open = not open
	toggleBtn.Text = open and "x" or "-"
	content.Visible = not open
end)

-- Credit label
local credit = Instance.new("TextLabel", main)
credit.Size = UDim2.new(1, 0, 0, 15)
credit.Position = UDim2.new(0, 0, 1, -15)
credit.BackgroundTransparency = 1
credit.Text = "by Gonzales Official"
credit.Font = Enum.Font.Gotham
credit.TextSize = 10
credit.TextColor3 = Color3.fromRGB(180, 180, 180)
