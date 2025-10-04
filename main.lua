-- Performance Hub | Small UI like REDZ/Xeter | Gonzales Official
-- Local in-GUI password: 555 (cosmetic, NOT an exploit key system)

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local plr = Players.LocalPlayer
local playerGui = plr:WaitForChild("PlayerGui")

-- CONFIG
local CORRECT_KEY = "555"

-- Create GUI root
local gui = Instance.new("ScreenGui")
gui.Name = "PerformanceHub"
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Modal Key Prompt
local modal = Instance.new("Frame")
modal.Size = UDim2.new(0, 260, 0, 120)
modal.Position = UDim2.new(0.5, -130, 0.5, -140)
modal.BackgroundColor3 = Color3.fromRGB(30,30,30)
modal.BorderSizePixel = 0
modal.Parent = gui

local modalCorner = Instance.new("UICorner", modal)
modalCorner.CornerRadius = UDim.new(0,10)

local modalTitle = Instance.new("TextLabel", modal)
modalTitle.Size = UDim2.new(1,0,0,26)
modalTitle.Position = UDim2.new(0,0,0,0)
modalTitle.BackgroundColor3 = Color3.fromRGB(40,40,40)
modalTitle.Text = "ENTER KEY"
modalTitle.Font = Enum.Font.GothamBold
modalTitle.TextSize = 14
modalTitle.TextColor3 = Color3.fromRGB(255,255,255)

local info = Instance.new("TextLabel", modal)
info.Size = UDim2.new(1,-20,0,40)
info.Position = UDim2.new(0,10,0,30)
info.BackgroundTransparency = 1
info.TextWrapped = true
info.Text = "Type the key to unlock the Performance Hub (local only)."
info.Font = Enum.Font.Gotham
info.TextSize = 12
info.TextColor3 = Color3.fromRGB(200,200,200)

local keyBox = Instance.new("TextBox", modal)
keyBox.Size = UDim2.new(1,-20,0,28)
keyBox.Position = UDim2.new(0,10,0,70)
keyBox.PlaceholderText = "Enter key..."
keyBox.ClearTextOnFocus = false
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 14
keyBox.TextColor3 = Color3.fromRGB(230,230,230)
keyBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
local keyCorner = Instance.new("UICorner", keyBox)
keyCorner.CornerRadius = UDim.new(0,6)

local submit = Instance.new("TextButton", modal)
submit.Size = UDim2.new(0,80,0,26)
submit.Position = UDim2.new(1,-90,1,-36)
submit.Text = "Submit"
submit.Font = Enum.Font.GothamSemibold
submit.TextSize = 13
submit.BackgroundColor3 = Color3.fromRGB(70,70,70)
submit.TextColor3 = Color3.fromRGB(255,255,255)
local submitCorner = Instance.new("UICorner", submit)
submitCorner.CornerRadius = UDim.new(0,6)

local status = Instance.new("TextLabel", modal)
status.Size = UDim2.new(1,-110,0,18)
status.Position = UDim2.new(0,10,1,-34)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Gotham
status.TextSize = 12
status.TextColor3 = Color3.fromRGB(255,120,120)
status.Text = ""

-- MAIN HUB (hidden until correct key)
local main = Instance.new("Frame")
main.Size = UDim2.new(0,160,0,120)
main.Position = UDim2.new(0.5,-80,0.5,-60)
main.BackgroundColor3 = Color3.fromRGB(25,25,25)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui
main.Visible = false

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0,10)
local outline = Instance.new("UIStroke", main)
outline.Thickness = 1.2
outline.Color = Color3.fromRGB(100,100,255)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,25)
title.Position = UDim2.new(0,0,0,0)
title.BackgroundColor3 = Color3.fromRGB(35,35,35)
title.BorderSizePixel = 0
title.Text = "PERFORMANCE HUB"
title.Font = Enum.Font.GothamBold
title.TextSize = 12
title.TextColor3 = Color3.fromRGB(255,255,255)
local titleCorner = Instance.new("UICorner", title)
titleCorner.CornerRadius = UDim.new(0,10)

-- Credit
local credit = Instance.new("TextLabel", main)
credit.Size = UDim2.new(1,0,0,14)
credit.Position = UDim2.new(0,0,1,-14)
credit.BackgroundTransparency = 1
credit.Text = "by Gonzales Official"
credit.Font = Enum.Font.Gotham
credit.TextSize = 10
credit.TextColor3 = Color3.fromRGB(180,180,180)
credit.Parent = main

-- Button container list
local buttons = {}
local function relayout()
	for i,entry in ipairs(buttons) do
		entry.container.Position = UDim2.new(0,10,0,30 + (i-1)*30)
	end
end

-- Button maker: each entry is a frame with main action button + small hide button on right
local function makeBtn(txt, func)
	local index = #buttons + 1

	local container = Instance.new("Frame", main)
	container.Size = UDim2.new(1,-20,0,28)
	container.BackgroundTransparency = 1
	container.Position = UDim2.new(0,10,0,30 + (index-1)*30)

	local mainBtn = Instance.new("TextButton", container)
	mainBtn.Size = UDim2.new(1,-24,1,0)
	mainBtn.Position = UDim2.new(0,0,0,0)
	mainBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
	mainBtn.Text = txt .. " -"
	mainBtn.TextColor3 = Color3.fromRGB(255,255,255)
	mainBtn.Font = Enum.Font.GothamSemibold
	mainBtn.TextSize = 13
	mainBtn.AutoButtonColor = false
	local mainCorner = Instance.new("UICorner", mainBtn)
	mainCorner.CornerRadius = UDim.new(0,8)

	local hideBtn = Instance.new("TextButton", container)
	hideBtn.Size = UDim2.new(0,22,1,0)
	hideBtn.Position = UDim2.new(1,-22,0,0)
	hideBtn.BackgroundColor3 = Color3.fromRGB(70,70,70)
	hideBtn.Text = "-"
	hideBtn.Font = Enum.Font.GothamBold
	hideBtn.TextSize = 14
	hideBtn.TextColor3 = Color3.fromRGB(255,255,255)
	local hideCorner = Instance.new("UICorner", hideBtn)
	hideCorner.CornerRadius = UDim.new(0,6)

	local active = false

	local function setVisual(on)
		active = on
		mainBtn.Text = txt .. (on and " x" or " -")
		mainBtn.BackgroundColor3 = on and Color3.fromRGB(0,180,0) or Color3.fromRGB(50,50,50)
	end

	mainBtn.MouseButton1Click:Connect(function()
		if not active then
			-- deactivate others
			for _,e in ipairs(buttons) do
				if e ~= container and e.active then
					e.active = false
					e.mainBtn.Text = e.rawText .. " -"
					e.mainBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
					pcall(e.func, false)
				end
			end
			-- activate this
			setVisual(true)
			container.active = true
			pcall(func, true)
		else
			-- clicked while active: turn off and destroy the tab (per your request)
			pcall(func, false)
			container:Destroy()
			-- remove from buttons table
			for i,e in ipairs(buttons) do
				if e.container == container then
					table.remove(buttons, i)
					break
				end
			end
			relayout()
		end
	end)

	-- hide button: when clicked while inactive, just hide it (do not destroy)
	hideBtn.MouseButton1Click:Connect(function()
		if not active then
			container.Visible = false
		else
			-- if active and user presses hide, we first turn it off then hide
			pcall(func, false)
			container.active = false
			container.Visible = false
			-- update table entry state
			for _,e in ipairs(buttons) do
				if e.container == container then
					e.active = false
				end
			end
		end
	end)

	-- store entry
	container.mainBtn = mainBtn
	container.rawText = txt
	container.func = func
	container.active = active
	container.active = false
	container.container = container
	container.hideBtn = hideBtn

	table.insert(buttons, container)
	relayout()
end

-- Anti-Lag implementation
local function antiLag(active)
	for _, v in pairs(Workspace:GetDescendants()) do
		if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then
			pcall(function() v.Enabled = not active end)
		end
	end
end

-- Boost FPS (60 <-> 120) best-effort
local function boostFPS(active)
	if typeof(setfpscap) == "function" then
		pcall(function() setfpscap(active and 120 or 60) end)
	end
end

-- Create buttons (they'll appear after key is correct)
makeBtn("Anti-Lag", antiLag)
makeBtn("Boost FPS", boostFPS)

-- Submit handler for key modal
local function tryKey()
	local v = tostring(keyBox.Text or "")
	if v == CORRECT_KEY then
		-- unlock
		modal:Destroy()
		main.Visible = true
	else
		status.Text = "Invalid key. Try again."
		-- brief shake or visual could be added; keep simple
	end
end

submit.MouseButton1Click:Connect(tryKey)
keyBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		tryKey()
	end
end)

-- OPTIONAL: make a small close button on modal to cancel
local close = Instance.new("TextButton", modal)
close.Size = UDim2.new(0,22,0,22)
close.Position = UDim2.new(1,-26,0,4)
close.Text = "X"
close.Font = Enum.Font.GothamBold
close.TextSize = 12
close.BackgroundTransparency = 0.6
close.TextColor3 = Color3.fromRGB(255,255,255)
local closeCorner = Instance.new("UICorner", close)
closeCorner.CornerRadius = UDim.new(0,6)
close.MouseButton1Click:Connect(function()
	gui:Destroy() -- user cancellebuttons b
