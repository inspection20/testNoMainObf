local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local UIS = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

if PlayerGui:FindFirstChild("TabbedGUI") then
	PlayerGui:FindFirstChild("TabbedGUI"):Destroy()
end

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TabbedGUI"
screenGui.Parent = PlayerGui
screenGui.ResetOnSpawn = false

-- Main Frame (Hacker Theme)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 420, 0, 320)
frame.Position = UDim2.new(0.3, 0, 0.25, 0)
frame.BackgroundColor3 = Color3.fromRGB(10,10,10) -- Deep black
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

-- Title bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(0, 20, 0) -- Dark greenish black
titleBar.BorderSizePixel = 0
titleBar.Parent = frame
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 10)

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -80, 1, 0)
titleLabel.Position = UDim2.new(0, 12, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Grow A Garden Modded Script (by funcMode)"
titleLabel.TextColor3 = Color3.fromRGB(0,255,0)
titleLabel.TextSize = 15
titleLabel.Font = Enum.Font.Code
titleLabel.TextStrokeTransparency = 0.5
titleLabel.TextStrokeColor3 = Color3.fromRGB(0,150,0)
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleBar

local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 26, 0, 26)
minimizeBtn.Position = UDim2.new(1, -58, 0, 2)
minimizeBtn.Text = "➖"
minimizeBtn.BackgroundTransparency = 1
minimizeBtn.TextColor3 = Color3.fromRGB(0,255,0)
minimizeBtn.Font = Enum.Font.Code
minimizeBtn.TextStrokeTransparency = 0.4
minimizeBtn.TextStrokeColor3 = Color3.fromRGB(0,150,0)
minimizeBtn.TextSize = 18
minimizeBtn.Parent = titleBar

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 26, 0, 26)
closeBtn.Position = UDim2.new(1, -28, 0, 2)
closeBtn.Text = "❌"
closeBtn.BackgroundTransparency = 1
closeBtn.TextColor3 = Color3.fromRGB(255,0,0)
closeBtn.TextStrokeTransparency = 0.4
closeBtn.TextStrokeColor3 = Color3.fromRGB(150,0,0)
closeBtn.Font = Enum.Font.Code
closeBtn.TextSize = 15
closeBtn.Parent = titleBar

-- Left tabs container
local tabsFrame = Instance.new("ScrollingFrame")
tabsFrame.Size = UDim2.new(0, 120, 1, -30)
tabsFrame.Position = UDim2.new(0, 0, 0, 30)
tabsFrame.BackgroundColor3 = Color3.fromRGB(5,5,5)
tabsFrame.BorderSizePixel = 0
tabsFrame.ScrollBarThickness = 6
tabsFrame.ScrollBarImageColor3 = Color3.fromRGB(0,255,0)
tabsFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
tabsFrame.Parent = frame
Instance.new("UICorner", tabsFrame).CornerRadius = UDim.new(0,6)

-- UIListLayout for tab buttons
local UIListLayoutTabs = Instance.new("UIListLayout")
UIListLayoutTabs.FillDirection = Enum.FillDirection.Vertical
UIListLayoutTabs.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayoutTabs.Padding = UDim.new(0, 6)
UIListLayoutTabs.Parent = tabsFrame

-- Adjust scroll
UIListLayoutTabs:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	tabsFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayoutTabs.AbsoluteContentSize.Y + 10)
end)

-- Right content frame
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -130, 1, -40)
contentFrame.Position = UDim2.new(0, 130, 0, 36)
contentFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = frame
Instance.new("UICorner", contentFrame).CornerRadius = UDim.new(0, 6)

-- Helper to create tab button
local function createTab(name, emoji)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -14, 0, 38)
	btn.Position = UDim2.new(0, 7, 0, 0)
	btn.BackgroundColor3 = Color3.fromRGB(15,15,15)
	btn.BorderSizePixel = 0
	btn.Font = Enum.Font.Code
	btn.TextSize = 13
	btn.TextColor3 = Color3.fromRGB(0,255,0)
	btn.TextStrokeTransparency = 0.6
	btn.TextStrokeColor3 = Color3.fromRGB(0,150,0)
	btn.Text = (emoji and (emoji.." ") or "") .. name
	btn.Parent = tabsFrame
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)

	-- Hover effect
	btn.MouseEnter:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(0,50,0)
	end)
	btn.MouseLeave:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(15,15,15)
	end)

	return btn
end

-- Tabs setup
local tabNames = {"Eggs", "Pets", "Lollipop", "Egg Placer", "Gear", "Seed", "Chris P.'S k.", "Speed & Jump", "Auto-Harvest", "Sell-Fruits"}
local tabIcons = {
    Eggs = "🥚",
    Pets = "🐾",
    Lollipop = "🍭",
    ["Egg Placer"] = "📍",
    Gear = "⚙️",
    Seed = "🌱",
	["Chris P.'S k."] = "👨‍🍳",
    ["Speed & Jump"] = "🏃‍♂️",
    ["Auto-Harvest"] = "🍓",
    ["Sell-Fruits"] = "💰"
}

local tabButtons, tabContents = {}, {}

for _, tabName in ipairs(tabNames) do
    local icon = tabIcons[tabName] or "📌"
    local tabBtn = createTab(tabName, icon)
    tabButtons[tabName] = tabBtn

    local tabContent = Instance.new("Frame")
    tabContent.Size = UDim2.new(1, 0, 1, 0)
    tabContent.BackgroundTransparency = 1
    tabContent.Visible = false
    tabContent.Parent = contentFrame
    tabContents[tabName] = tabContent
end

-- Function to set active tab
local function setActiveTab(name)
    for tabName, btn in pairs(tabButtons) do
        if tabName == name then
            btn.BackgroundColor3 = Color3.fromRGB(0,80,0)
            tabContents[tabName].Visible = true
        else
            btn.BackgroundColor3 = Color3.fromRGB(15,15,15)
            tabContents[tabName].Visible = false
        end
    end
end

-- Default active tab
setActiveTab("Eggs")

-- Tab button click connections
for tabName, btn in pairs(tabButtons) do
    btn.MouseButton1Click:Connect(function()
        setActiveTab(tabName)
    end)
end

-- Notification helper
local function notify(title, text, duration)
	duration = duration or 2
	pcall(function()
		StarterGui:SetCore("SendNotification", {Title = "[HACKER] "..(title or "Notice"), Text = text or "", Duration = duration})
	end)
end

-- ========== MINIMIZE / CLOSE logic ==========
local minimized = false
local originalSize = frame.Size
local minimizedSize = UDim2.new(0, originalSize.X.Offset, 0, 30)

minimizeBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized then
		frame.Size = minimizedSize
		contentFrame.Visible = false
		tabsFrame.Visible = false
	else
		frame.Size = originalSize
		contentFrame.Visible = true
		tabsFrame.Visible = true
	end
end)

closeBtn.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.M then
		minimizeBtn:Activate()
	end
end)


-- ========== EGGS TAB ========== 
local eggsTab = tabContents["Eggs"]
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Dropdown button
local dropdownEggBtn = Instance.new("TextButton", eggsTab)
dropdownEggBtn.AnchorPoint = Vector2.new(0.5, 0.5)
dropdownEggBtn.Position = UDim2.new(0.5, 0, 0.5, -20)
dropdownEggBtn.Size = UDim2.new(0, 240, 0, 32)
dropdownEggBtn.Text = "Select Egg Type ▼"
dropdownEggBtn.TextColor3 = Color3.fromRGB(245,245,245)
dropdownEggBtn.BackgroundColor3 = Color3.fromRGB(65,65,65)
dropdownEggBtn.Font = Enum.Font.Gotham
dropdownEggBtn.TextSize = 14
Instance.new("UICorner", dropdownEggBtn).CornerRadius = UDim.new(0,6)

-- Dropdown frame
local dropdownEggFrame = Instance.new("Frame", eggsTab)
dropdownEggFrame.AnchorPoint = Vector2.new(0.5, 0)
dropdownEggFrame.Position = UDim2.new(0.5, 0, 0.5, 12)
dropdownEggFrame.Size = UDim2.new(0, 240, 0, 0)
dropdownEggFrame.BackgroundColor3 = Color3.fromRGB(55,55,55)
dropdownEggFrame.ClipsDescendants = true
dropdownEggFrame.Visible = false
Instance.new("UICorner", dropdownEggFrame).CornerRadius = UDim.new(0,6)

-- Scroll inside dropdown
local scrollEggFrame = Instance.new("ScrollingFrame", dropdownEggFrame)
scrollEggFrame.Size = UDim2.new(1, 0, 1, 0)
scrollEggFrame.CanvasSize = UDim2.new(0,0,0,0)
scrollEggFrame.ScrollBarThickness = 6
scrollEggFrame.BackgroundTransparency = 1
scrollEggFrame.ScrollBarImageColor3 = Color3.fromRGB(120,120,120)
scrollEggFrame.AutomaticCanvasSize = Enum.AutomaticSize.None

-- Padding
local paddingEgg = Instance.new("UIPadding", scrollEggFrame)
paddingEgg.PaddingTop = UDim.new(0,2)
paddingEgg.PaddingLeft = UDim.new(0,4)
paddingEgg.PaddingRight = UDim.new(0,4)

local layoutEgg = Instance.new("UIListLayout", scrollEggFrame)
layoutEgg.SortOrder = Enum.SortOrder.LayoutOrder
layoutEgg.Padding = UDim.new(0,2)

-- Search bar
local searchBox = Instance.new("TextBox", scrollEggFrame)
searchBox.Size = UDim2.new(1, -8, 0, 26)
searchBox.PlaceholderText = "Search Egg..."
searchBox.Text = ""
searchBox.BackgroundColor3 = Color3.fromRGB(70,70,70)
searchBox.TextColor3 = Color3.fromRGB(255,255,255)
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 14
Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0,4)

-- Auto Buy button
local autoBuyEggBtn = Instance.new("TextButton", eggsTab)
autoBuyEggBtn.AnchorPoint = Vector2.new(0.5, 0.5)
autoBuyEggBtn.Position = UDim2.new(0.5, 0, 0.5, 20)
autoBuyEggBtn.Size = UDim2.new(0, 240, 0, 36)
autoBuyEggBtn.Text = "Start Auto Buy"
autoBuyEggBtn.TextColor3 = Color3.fromRGB(250,250,250)
autoBuyEggBtn.BackgroundColor3 = Color3.fromRGB(0,160,0)
autoBuyEggBtn.Font = Enum.Font.GothamBold
autoBuyEggBtn.TextSize = 14
Instance.new("UICorner", autoBuyEggBtn).CornerRadius = UDim.new(0,6)

-- State vars
local buyingEgg = false
local selectedEgg = nil

local eggCodes = {
    ["Common Egg"] = "\n\000\000\224\138\"i\232A",
    ["Common Summer Egg"] = "\n\000\000\128\127+\173\232A",
    ["Rare Summer Egg"] = "\n\000\000@\143+\173\232A",
    ["Mythical Egg"] = "\n\000\000`\181\157|\232A",
    ["Paradise Egg"] = "\n\000\000`\161+\173\232A",
    ["Bug Egg"] = "\n\000\000\128\224aj\232A",
    ["Night Egg"] = "\n\000\000\000\2247t\232A",
    ["Zen Egg"] = "\n\000\000\160n\156\222\232A",
    ["Bee Egg"] = "\n\000\000\192]y\141\232A",
    ["Oasis Egg"] = "\n\000\000\128\030\141\183\232A",
    ["Anti Bee Egg"] = "\n\000\000\000\187=\153\232A",
}

-- Populate options
local eggButtons = {}
for eggName, code in pairs(eggCodes) do
	local option = Instance.new("TextButton")
	option.Size = UDim2.new(1, -8, 0, 26)
	option.Text = eggName
	option.TextColor3 = Color3.fromRGB(245,245,245)
	option.BackgroundColor3 = Color3.fromRGB(75,75,75)
	option.Font = Enum.Font.Gotham
	option.TextSize = 14
	option.Parent = scrollEggFrame
	Instance.new("UICorner", option).CornerRadius = UDim.new(0,4)
	
	option.MouseButton1Click:Connect(function()
		selectedEgg = code
		dropdownEggBtn.Text = eggName.." ▼"

		dropdownEggFrame:TweenSize(UDim2.new(0, 240, 0, 0), "Out", "Quad", 0.18, true, function()
			dropdownEggFrame.Visible = false
		end)
		dropdownEggBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, -20), "Out", "Quad", 0.18, true)
		autoBuyEggBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, 20), "Out", "Quad", 0.18, true)

		notify("🥚 Auto Buy Eggs", "Selected Egg: "..eggName, 2)
	end)
	
	table.insert(eggButtons, option)
end

-- Search functionality
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
	local query = searchBox.Text:lower()
	for _, option in pairs(eggButtons) do
		option.Visible = option.Text:lower():find(query) ~= nil
	end
end)

-- Update scroll size
layoutEgg:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	scrollEggFrame.CanvasSize = UDim2.new(0,0,0, layoutEgg.AbsoluteContentSize.Y + 4)
end)

-- Toggle dropdown
dropdownEggBtn.MouseButton1Click:Connect(function()
	local maxHeight = 140
	local contentHeight = layoutEgg.AbsoluteContentSize.Y + 4
	local visibleHeight = math.min(contentHeight, maxHeight)

	if dropdownEggFrame.Visible then
		-- CLOSE
		dropdownEggFrame:TweenSize(UDim2.new(0, 240, 0, 0), "Out", "Quad", 0.18, true, function()
			dropdownEggFrame.Visible = false
		end)
		dropdownEggBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, -20), "Out", "Quad", 0.18, true)
		dropdownEggFrame:TweenPosition(UDim2.new(0.5, 0, 0.5, 12), "Out", "Quad", 0.18, true)
		autoBuyEggBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, 20), "Out", "Quad", 0.18, true)
	else
		-- OPEN
		dropdownEggFrame.Visible = true
		dropdownEggFrame:TweenPosition(
			UDim2.new(0.5, 0, 0.5, -(visibleHeight/2) + 12),
			"Out", "Quad", 0.18, true
		)
		dropdownEggFrame:TweenSize(UDim2.new(0, 240, 0, visibleHeight), "Out", "Quad", 0.18, true)
		dropdownEggBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, -visibleHeight/2 - 4), "Out", "Quad", 0.18, true)

		-- Limit para hindi lumabas sa GUI yung button
		local maxBtnOffset = (eggsTab.AbsoluteSize.Y / 2) - (autoBuyEggBtn.Size.Y.Offset / 2) - 5
		local targetOffset = math.min(visibleHeight + 40, maxBtnOffset)

		autoBuyEggBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, targetOffset), "Out", "Quad", 0.18, true)
	end
end)

-- Auto buy loop
local function autoBuyEggLoop()
	while buyingEgg and selectedEgg do
		local success = pcall(function()
			local args = { buffer.fromstring(selectedEgg) }
			ReplicatedStorage:WaitForChild("ByteNetReliable"):FireServer(unpack(args))
		end)
		if success then
			notify("🥚 Auto Buy Eggs", "Bought 1 egg", 1)
		end
		task.wait(1)
	end
end

-- Toggle buy button
autoBuyEggBtn.MouseButton1Click:Connect(function()
	if not selectedEgg then
		notify("⚠ Auto Buy Eggs", "Please select an egg first.", 2)
		return
	end
	buyingEgg = not buyingEgg
	if buyingEgg then
		autoBuyEggBtn.Text = "Stop Auto Buy"
		autoBuyEggBtn.BackgroundColor3 = Color3.fromRGB(170,40,40)
		task.spawn(autoBuyEggLoop)
	else
		autoBuyEggBtn.Text = "Start Auto Buy"
		autoBuyEggBtn.BackgroundColor3 = Color3.fromRGB(0,160,0)
	end
end)


-- ========== PETS TAB ==========  
local petsTab = tabContents["Pets"]
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Dropdown button
local dropdownPetBtn = Instance.new("TextButton", petsTab)
dropdownPetBtn.AnchorPoint = Vector2.new(0.5, 0.5)
dropdownPetBtn.Position = UDim2.new(0.5, 0, 0.5, -20)
dropdownPetBtn.Size = UDim2.new(0, 240, 0, 32)
dropdownPetBtn.Text = "Select Pet ▼"
dropdownPetBtn.TextColor3 = Color3.fromRGB(245,245,245)
dropdownPetBtn.BackgroundColor3 = Color3.fromRGB(65,65,65)
dropdownPetBtn.Font = Enum.Font.Gotham
dropdownPetBtn.TextSize = 14
Instance.new("UICorner", dropdownPetBtn).CornerRadius = UDim.new(0,6)

-- Dropdown frame
local dropdownPetFrame = Instance.new("Frame", petsTab)
dropdownPetFrame.AnchorPoint = Vector2.new(0.5, 0)
dropdownPetFrame.Position = UDim2.new(0.5, 0, 0.5, 12)
dropdownPetFrame.Size = UDim2.new(0, 240, 0, 0)
dropdownPetFrame.BackgroundColor3 = Color3.fromRGB(55,55,55)
dropdownPetFrame.ClipsDescendants = true
dropdownPetFrame.Visible = false
Instance.new("UICorner", dropdownPetFrame).CornerRadius = UDim.new(0,6)

-- Search box
local searchBox = Instance.new("TextBox", dropdownPetFrame)
searchBox.Size = UDim2.new(1, -8, 0, 28)
searchBox.Position = UDim2.new(0, 4, 0, 4)
searchBox.PlaceholderText = "Search pets..."
searchBox.Text = ""
searchBox.TextColor3 = Color3.fromRGB(245,245,245)
searchBox.BackgroundColor3 = Color3.fromRGB(60,60,60)
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 14
Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0,4)

-- Scroll inside dropdown
local scrollPetFrame = Instance.new("ScrollingFrame", dropdownPetFrame)
scrollPetFrame.Position = UDim2.new(0,0,0,36)
scrollPetFrame.Size = UDim2.new(1,0,1,-36)
scrollPetFrame.CanvasSize = UDim2.new(0,0,0,0)
scrollPetFrame.ScrollBarThickness = 6
scrollPetFrame.BackgroundTransparency = 1
scrollPetFrame.ScrollBarImageColor3 = Color3.fromRGB(120,120,120)

-- Padding
local paddingPet = Instance.new("UIPadding", scrollPetFrame)
paddingPet.PaddingTop = UDim.new(0,2)
paddingPet.PaddingLeft = UDim.new(0,4)
paddingPet.PaddingRight = UDim.new(0,4)

local layoutPet = Instance.new("UIListLayout", scrollPetFrame)
layoutPet.SortOrder = Enum.SortOrder.LayoutOrder
layoutPet.Padding = UDim.new(0,2)

-- Auto Buy button
local autoBuyPetBtn = Instance.new("TextButton", petsTab)
autoBuyPetBtn.AnchorPoint = Vector2.new(0.5, 0.5)
autoBuyPetBtn.Position = UDim2.new(0.5, 0, 0.5, 20)
autoBuyPetBtn.Size = UDim2.new(0, 240, 0, 36)
autoBuyPetBtn.Text = "Start Auto Buy"
autoBuyPetBtn.TextColor3 = Color3.fromRGB(250,250,250)
autoBuyPetBtn.BackgroundColor3 = Color3.fromRGB(0,160,0)
autoBuyPetBtn.Font = Enum.Font.GothamBold
autoBuyPetBtn.TextSize = 14
Instance.new("UICorner", autoBuyPetBtn).CornerRadius = UDim.new(0,6)

-- State vars
local buyingPet = false
local selectedPet = nil

local petCodes = {
    ["Blood HedgeHog"] = "\n\000\000\1609i|\232A",
    ["Blood Kiwi"] = "\n\000\000\224\"i|\232A",
    ["Blood Owl"] = "\n\000\000`Di|\232A",
    ["Hamster"] = "\n\000\000\0007\003\183\232A",
    ["Moon Cat"] = "\n\000\000\192\209\132\135\232A",
}

-- Populate options with hover effect
local tweenService = game:GetService("TweenService")
local petButtons = {}
for petName, code in pairs(petCodes) do
	local option = Instance.new("TextButton")
	option.Size = UDim2.new(1, -8, 0, 26)
	option.Text = petName
	option.TextColor3 = Color3.fromRGB(245,245,245)
	option.BackgroundColor3 = Color3.fromRGB(75,75,75)
	option.Font = Enum.Font.Gotham
	option.TextSize = 14
	option.Parent = scrollPetFrame
	Instance.new("UICorner", option).CornerRadius = UDim.new(0,4)

	-- Hover effect
	local normalColor = Color3.fromRGB(75,75,75)
	local hoverColor = Color3.fromRGB(100,100,100)
	option.MouseEnter:Connect(function()
		tweenService:Create(option, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = hoverColor}):Play()
	end)
	option.MouseLeave:Connect(function()
		tweenService:Create(option, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = normalColor}):Play()
	end)

	option.MouseButton1Click:Connect(function()
		selectedPet = code
		dropdownPetBtn.Text = petName.." ▼"

		dropdownPetFrame:TweenSize(UDim2.new(0, 240, 0, 0), "Out", "Quad", 0.18, true, function()
			dropdownPetFrame.Visible = false
		end)
		dropdownPetBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, -20), "Out", "Quad", 0.18, true)
		autoBuyPetBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, 20), "Out", "Quad", 0.18, true)

		notify("🐾 Auto Buy Pets", "Selected Pet: "..petName, 2)
	end)

	table.insert(petButtons, option)
end

-- Search filter
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
	local query = searchBox.Text:lower()
	for _, btn in ipairs(petButtons) do
		btn.Visible = btn.Text:lower():find(query) ~= nil
	end
	layoutPet:Reorder()
end)

-- Update scroll size
layoutPet:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	scrollPetFrame.CanvasSize = UDim2.new(0,0,0, layoutPet.AbsoluteContentSize.Y + 4)
end)

-- Toggle dropdown
dropdownPetBtn.MouseButton1Click:Connect(function()
	local maxHeight = 140
	local contentHeight = layoutPet.AbsoluteContentSize.Y + 4
	local visibleHeight = math.min(contentHeight, maxHeight)

	if dropdownPetFrame.Visible then
		-- CLOSE
		dropdownPetFrame:TweenSize(UDim2.new(0, 240, 0, 0), "Out", "Quad", 0.18, true, function()
			dropdownPetFrame.Visible = false
		end)
		dropdownPetBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, -20), "Out", "Quad", 0.18, true)
		dropdownPetFrame:TweenPosition(UDim2.new(0.5, 0, 0.5, 12), "Out", "Quad", 0.18, true)
		autoBuyPetBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, 20), "Out", "Quad", 0.18, true)
	else
		-- OPEN
		dropdownPetFrame.Visible = true
		dropdownPetFrame:TweenPosition(
			UDim2.new(0.5, 0, 0.5, -(visibleHeight/2) + 12),
			"Out", "Quad", 0.18, true
		)
		dropdownPetFrame:TweenSize(UDim2.new(0, 240, 0, visibleHeight), "Out", "Quad", 0.18, true)
		dropdownPetBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, -visibleHeight/2 - 4), "Out", "Quad", 0.18, true)

		local maxBtnOffset = (petsTab.AbsoluteSize.Y / 2) - (autoBuyPetBtn.Size.Y.Offset / 2) - 5
		local targetOffset = math.min(visibleHeight + 40, maxBtnOffset)
		autoBuyPetBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, targetOffset), "Out", "Quad", 0.18, true)
	end
end)

-- Auto buy loop
local function autoBuyPetLoop()
	while buyingPet and selectedPet do
		local success = pcall(function()
			local args = { buffer.fromstring(selectedPet) }
			ReplicatedStorage:WaitForChild("ByteNetReliable"):FireServer(unpack(args))
		end)
		if success then
			notify("🐾 Auto Buy Pets", "Bought 1 pet", 1)
		end
		task.wait(1)
	end
end

-- Toggle buy button
autoBuyPetBtn.MouseButton1Click:Connect(function()
	if not selectedPet then
		notify("⚠ Auto Buy Pets", "Please select a pet first.", 2)
		return
	end
	buyingPet = not buyingPet
	if buyingPet then
		autoBuyPetBtn.Text = "Stop Auto Buy"
		autoBuyPetBtn.BackgroundColor3 = Color3.fromRGB(170,40,40)
		task.spawn(autoBuyPetLoop)
	else
		autoBuyPetBtn.Text = "Start Auto Buy"
		autoBuyPetBtn.BackgroundColor3 = Color3.fromRGB(0,160,0)
	end
end)


-- ========== FEATURE: Lollipop Auto ==========
local lolliTab = tabContents["Lollipop"]

-- Wrapper frame para i-center lahat ng UI sa gitna
local lolliWrapper = Instance.new("Frame", lolliTab)
lolliWrapper.Size = UDim2.new(0, 320, 0, 150)
lolliWrapper.AnchorPoint = Vector2.new(0.5, 0.5)
lolliWrapper.Position = UDim2.new(0.5, 0, 0.5, 0)
lolliWrapper.BackgroundTransparency = 1

-- Title label
local lolliLabel = Instance.new("TextLabel", lolliWrapper)
lolliLabel.Size = UDim2.new(1, 0, 0, 24)
lolliLabel.Position = UDim2.new(0.5, 0, 0, 0)
lolliLabel.AnchorPoint = Vector2.new(0.5, 0)
lolliLabel.BackgroundTransparency = 1
lolliLabel.Text = "Lollipop Auto (Levelup Lollipop)"
lolliLabel.TextColor3 = Color3.fromRGB(240,240,240)
lolliLabel.Font = Enum.Font.GothamBold
lolliLabel.TextSize = 16
lolliLabel.TextXAlignment = Enum.TextXAlignment.Center

-- Toggle button
local toggleLolliBtn = Instance.new("TextButton", lolliWrapper)
toggleLolliBtn.Size = UDim2.new(0.6, 0, 0, 40)
toggleLolliBtn.Position = UDim2.new(0.5, 0, 0, 44)
toggleLolliBtn.AnchorPoint = Vector2.new(0.5, 0)
toggleLolliBtn.Text = "Start Auto Buy"
toggleLolliBtn.BackgroundColor3 = Color3.fromRGB(65,130,180)
toggleLolliBtn.Font = Enum.Font.GothamBold
toggleLolliBtn.TextColor3 = Color3.fromRGB(245,245,245)
toggleLolliBtn.TextSize = 14
Instance.new("UICorner", toggleLolliBtn).CornerRadius = UDim.new(0,6)

-- Status label
local statusLabel = Instance.new("TextLabel", lolliWrapper)
statusLabel.Size = UDim2.new(1, 0, 0, 22)
statusLabel.Position = UDim2.new(0.5, 0, 0, 92)
statusLabel.AnchorPoint = Vector2.new(0.5, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Idle"
statusLabel.TextColor3 = Color3.fromRGB(200,255,200)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 14
statusLabel.TextXAlignment = Enum.TextXAlignment.Center

-- Auto buy logic
local autoLolli = false

toggleLolliBtn.MouseButton1Click:Connect(function()
	autoLolli = not autoLolli
	toggleLolliBtn.Text = autoLolli and "Stop Auto Buy" or "Start Auto Buy"
	statusLabel.Text = autoLolli and "Status: Attempting..." or "Status: Idle"

	if autoLolli then
		task.spawn(function()
			while autoLolli do
				-- Request restock
				pcall(function()
					local restockArgs = { buffer.fromstring("\n\000\000\021JU\232A") }
					ReplicatedStorage:WaitForChild("ByteNetReliable"):FireServer(unpack(restockArgs))
				end)

				task.wait(1.5)

				local success, err = pcall(function()
					ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("BuyGearStock"):FireServer("Levelup Lollipop")
				end)

				local gearRestocks = ReplicatedStorage:FindFirstChild("GearRestocks")
				local lollipopRestock = gearRestocks and gearRestocks:FindFirstChild("Levelup Lollipop")
				local hasStock = lollipopRestock and lollipopRestock.Value > 0

				if success and hasStock then
					statusLabel.Text = "Status: ✅ Bought Lollipop!"
					notify("🍭 Lollipop", "Bought Lollipop!", 2)
				elseif not hasStock then
					statusLabel.Text = "Status: ⏳ Waiting for restock..."
				else
					statusLabel.Text = "Status: ❌ Failed to buy"
				end

				task.wait(1.5)
			end
		end)
	end
end)


-- ========== FEATURE: Egg Placer (PRIVATE SERVER ONLY) ==========
local placerTab = tabContents["Egg Placer"]

-- ⚠ Disclaimer Label
local disclaimerLabel = Instance.new("TextLabel", placerTab)
disclaimerLabel.Size = UDim2.new(1, -20, 0, 28)
disclaimerLabel.Position = UDim2.new(0, 10, 0, 0)
disclaimerLabel.BackgroundTransparency = 1
disclaimerLabel.Text = "⚠ Works only in Private Servers!"
disclaimerLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
disclaimerLabel.Font = Enum.Font.GothamBold
disclaimerLabel.TextSize = 16
disclaimerLabel.TextWrapped = true

-- Create scrolling container
local scrollFrame = Instance.new("ScrollingFrame", placerTab)
scrollFrame.Size = UDim2.new(1, 0, 1, -32)
scrollFrame.Position = UDim2.new(0, 0, 0, 32)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 300)
scrollFrame.ScrollBarThickness = 6
scrollFrame.BackgroundTransparency = 1

-- UIListLayout
local layout = Instance.new("UIListLayout", scrollFrame)
layout.Padding = UDim.new(0, 8)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	scrollFrame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
end)

-- Egg Placer Label
local placerLabel = Instance.new("TextLabel", scrollFrame)
placerLabel.Size = UDim2.new(1, -20, 0, 24)
placerLabel.Position = UDim2.new(0, 10, 0, 0)
placerLabel.BackgroundTransparency = 1
placerLabel.Text = "Egg Auto System"
placerLabel.TextColor3 = Color3.fromRGB(240,240,240)
placerLabel.Font = Enum.Font.GothamBold
placerLabel.TextSize = 16
placerLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Default positions for eggs
local positions = {
	Vector3.new(43.991127014160156, 0.1754859983921051, -87.39613342285156),
	Vector3.new(50.305335998535156, 0.1754859983921051, -88.32907104492188),
	Vector3.new(57.79936218261719, 0.1754859983921051, -88.03072357177734),
	Vector3.new(66.23564147949219, 0.1754859983921051, -88.21456909177734),
	Vector3.new(44.061241149902344, 0.1754859983921051, -81.71434020996094),
	Vector3.new(50.816139221191406, 0.1754859983921051, -82.52154541015625),
	Vector3.new(57.98183059692383, 0.1754859983921051, -83.09522247314453),
	Vector3.new(66.24691009521484, 0.1754859983921051, -83.41040802001953)
}

local function placeEggs(count)
	local ok, eggService = pcall(function()
		return ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("PetEggService")
	end)
	if not ok or not eggService then
		notify("Egg Placer", "PetEggService not found.", 3)
		return
	end

	for i = 1, count do
		local pos = positions[((i-1) % #positions) + 1]
		pcall(function()
			eggService:FireServer("CreateEgg", pos)
		end)
		task.wait(0.2)
	end
	notify("✅ Eggs Placed", tostring(count).." Egg(s) Placed", 3)
end

-- ========== FEATURE: Auto Place + Skip + Hatch Loop ==========
local autoRunning = false
local autoBtn = Instance.new("TextButton", scrollFrame)
autoBtn.Size = UDim2.new(1, -20, 0, 36)
autoBtn.Text = "Start Auto Place + Skip + Hatch"
autoBtn.Font = Enum.Font.GothamBold
autoBtn.TextSize = 16
autoBtn.TextColor3 = Color3.new(1,1,1)
autoBtn.BackgroundColor3 = Color3.fromRGB(255,0,100)
Instance.new("UICorner", autoBtn).CornerRadius = UDim.new(0,6)

autoBtn.MouseButton1Click:Connect(function()
	autoRunning = not autoRunning
	if autoRunning then
		autoBtn.Text = "Stop Auto Place + Skip + Hatch"
		notify("✅ Auto Started", "Looping Place + Skip + Hatch (Smart Mode)", 3)

		task.spawn(function()
			while autoRunning do
				placeEggs(8)
				task.wait(0.5)

				local ok, eggService = pcall(function()
					return ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("PetEggService")
				end)

				if ok and eggService then
					local eggFolder = workspace:FindFirstChild("Farm")
					if eggFolder then
						local target = eggFolder:FindFirstChild("Farm") or eggFolder
						target = target:FindFirstChild("Important") or target
						target = target:FindFirstChild("Objects_Physical") or target

						for _, egg in pairs(target:GetChildren()) do
							if egg.Name == "PetEgg" then
								pcall(function() eggService:FireServer("AuthorisePurchase", egg) end)
							end
						end

						task.wait(0.5)

						for _, egg in pairs(target:GetChildren()) do
							if egg.Name == "PetEgg" then
								pcall(function() eggService:FireServer("HatchPet", egg) end)
							end
						end

						repeat
							local stillEggs = false
							for _, egg in pairs(target:GetChildren()) do
								if egg.Name == "PetEgg" then
									stillEggs = true
									break
								end
							end
							if stillEggs then task.wait(1) end
						until not autoRunning or #target:GetChildren() == 0
					end
				end

				notify("🔁 Loop Complete", "All eggs hatched. Placing new batch...", 3)
				task.wait(0.5)
			end
		end)
	else
		autoBtn.Text = "Start Auto Place + Skip + Hatch"
		notify("⛔ Auto Stopped", "Loop has been stopped", 3)
	end
end)

-- =========================
-- EGG EQUIP LOGIC + TAB DROPDOWN + Auto-Equip Toggle ==========
-- =========================
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

local humanoid
local function resolveHumanoid()
	local char = player.Character or player.CharacterAdded:Wait()
	humanoid = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid")
end
resolveHumanoid()
player.CharacterAdded:Connect(resolveHumanoid)

local eggTypes = {
	"Mythical Egg","Bug Egg","Common Summer Egg","Premium Oasis Egg",
	"Common Egg","Paradise Egg","Premium Night Egg","Rare Summer Egg",
	"Premium Anti Bee Egg","Zen Egg","Bee Egg"
}

local function nameMatchesEgg(toolName,eggName)
	return toolName:lower():find(eggName:lower(),1,true)~=nil
end

local selectedEgg
local manualOverride=false
local autoEquipEnabled=true
local suppressNextBackpackNotify=false

-- Equip function
local function equipSelectedEgg(selectedEgg,skipNotify)
	if not humanoid then resolveHumanoid() end
	if not selectedEgg or selectedEgg=="" then
		if not skipNotify then warn("⚠ Pili ka muna ng egg!") end
		return
	end
	for _,item in ipairs(backpack:GetChildren()) do
		if item:IsA("Tool") and nameMatchesEgg(item.Name,selectedEgg) then
			task.wait(0.2)
			humanoid:EquipTool(item)
			if not skipNotify then warn("✅ Na-equip: "..item.Name) end
			if skipNotify then suppressNextBackpackNotify=true end
			return
		end
	end
	if not skipNotify then warn("❌ Wala sa Backpack ang egg: "..selectedEgg) end
end

-- Auto-equip backpack
backpack.ChildAdded:Connect(function(item)
	if autoEquipEnabled and item:IsA("Tool") and selectedEgg and nameMatchesEgg(item.Name,selectedEgg) then
		task.wait(0.3)
		if humanoid then
			equipSelectedEgg(selectedEgg)
		end
	end
end)

-- Detect manual equip
player.Character.ChildAdded:Connect(function(item)
	if item:IsA("Tool") then
		for _,eggName in ipairs(eggTypes) do
			if nameMatchesEgg(item.Name,eggName) then
				selectedEgg=eggName
				manualOverride=true
				warn("🔄 Manual equip detected: "..eggName.." (auto OFF)")
				break
			end
		end
	end
end)

-- Auto-Equip Toggle Button
local toggleBtn = Instance.new("TextButton",scrollFrame)
toggleBtn.Size=UDim2.new(1,-20,0,30)
toggleBtn.Position=UDim2.new(0,10,0,180)
toggleBtn.Text="Auto-Equip-Egg: ON"
toggleBtn.Font=Enum.Font.GothamBold
toggleBtn.TextSize=14
toggleBtn.TextColor3=Color3.fromRGB(255,255,255)
toggleBtn.BackgroundColor3=Color3.fromRGB(80,80,80)
Instance.new("UICorner",toggleBtn).CornerRadius=UDim.new(0,6)

toggleBtn.MouseButton1Click:Connect(function()
	autoEquipEnabled = not autoEquipEnabled
	toggleBtn.Text = "Auto-Equip: "..(autoEquipEnabled and "ON" or "OFF")
end)

-- Dropdown with search
local eggDropdownBtn = Instance.new("TextButton",scrollFrame)
eggDropdownBtn.Size=UDim2.new(1,-20,0,34)
eggDropdownBtn.Position=UDim2.new(0,10,0,220)
eggDropdownBtn.Text="Select Egg"
eggDropdownBtn.Font=Enum.Font.GothamBold
eggDropdownBtn.TextSize=14
eggDropdownBtn.TextColor3=Color3.fromRGB(255,255,255)
eggDropdownBtn.BackgroundColor3=Color3.fromRGB(60,60,60)
Instance.new("UICorner",eggDropdownBtn).CornerRadius=UDim.new(0,6)

local dropdownFrame = Instance.new("ScrollingFrame",scrollFrame)
dropdownFrame.Size=UDim2.new(1,-20,0,120)
dropdownFrame.Position=UDim2.new(0,10,0,260)
dropdownFrame.BackgroundColor3=Color3.fromRGB(40,40,40)
dropdownFrame.ScrollBarThickness=4
dropdownFrame.Visible=false
dropdownFrame.CanvasSize=UDim2.new(0,0,0,#eggTypes*28)
Instance.new("UICorner",dropdownFrame).CornerRadius=UDim.new(0,6)

local layout2 = Instance.new("UIListLayout",dropdownFrame)
layout2.Padding=UDim.new(0,4)
layout2.FillDirection=Enum.FillDirection.Vertical
layout2.SortOrder=Enum.SortOrder.LayoutOrder

-- Search bar
local searchBox = Instance.new("TextBox",dropdownFrame)
searchBox.Size=UDim2.new(1,-8,0,24)
searchBox.PlaceholderText="Search Egg..."
searchBox.Text=""
searchBox.BackgroundColor3=Color3.fromRGB(70,70,70)
searchBox.TextColor3=Color3.fromRGB(255,255,255)
searchBox.Font=Enum.Font.Gotham
searchBox.TextSize=14
Instance.new("UICorner",searchBox).CornerRadius=UDim.new(0,4)

-- Populate dropdown buttons
local eggBtns={}
for _,eggName in ipairs(eggTypes) do
	local eggBtn = Instance.new("TextButton",dropdownFrame)
	eggBtn.Size = UDim2.new(1,-8,0,24)
	eggBtn.Text = eggName
	eggBtn.BackgroundColor3 = Color3.fromRGB(70,70,70)
	eggBtn.TextColor3 = Color3.fromRGB(255,255,255)
	eggBtn.Font = Enum.Font.Gotham
	eggBtn.TextSize = 14
	Instance.new("UICorner",eggBtn).CornerRadius=UDim.new(0,4)
	
	eggBtn.MouseButton1Click:Connect(function()
		selectedEgg = eggName
		manualOverride=false
		eggDropdownBtn.Text = "Selected: "..eggName
		dropdownFrame.Visible=false
		if autoEquipEnabled then equipSelectedEgg(selectedEgg) end
	end)
	
	table.insert(eggBtns,eggBtn)
end

-- Search functionality
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
	local query = searchBox.Text:lower()
	for i,eggBtn in ipairs(eggBtns) do
		eggBtn.Visible = eggBtn.Text:lower():find(query)~=nil
	end
end)

-- Dropdown toggle
eggDropdownBtn.MouseButton1Click:Connect(function()
	dropdownFrame.Visible = not dropdownFrame.Visible
end)

-- ========== GEAR TAB ==========  
local gearTab = tabContents["Gear"]
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Dropdown button
local dropdownGearBtn = Instance.new("TextButton", gearTab)
dropdownGearBtn.AnchorPoint = Vector2.new(0.5, 0.5)
dropdownGearBtn.Position = UDim2.new(0.5, 0, 0.5, -20)
dropdownGearBtn.Size = UDim2.new(0, 240, 0, 32)
dropdownGearBtn.Text = "Select Gear Type ▼"
dropdownGearBtn.TextColor3 = Color3.fromRGB(245,245,245)
dropdownGearBtn.BackgroundColor3 = Color3.fromRGB(65,65,65)
dropdownGearBtn.Font = Enum.Font.Gotham
dropdownGearBtn.TextSize = 14
Instance.new("UICorner", dropdownGearBtn).CornerRadius = UDim.new(0,6)

-- Dropdown frame
local dropdownGearFrame = Instance.new("Frame", gearTab)
dropdownGearFrame.AnchorPoint = Vector2.new(0.5, 0)
dropdownGearFrame.Position = UDim2.new(0.5, 0, 0.5, 12)
dropdownGearFrame.Size = UDim2.new(0, 240, 0, 0)
dropdownGearFrame.BackgroundColor3 = Color3.fromRGB(55,55,55)
dropdownGearFrame.ClipsDescendants = true
dropdownGearFrame.Visible = false
Instance.new("UICorner", dropdownGearFrame).CornerRadius = UDim.new(0,6)

-- Search box
local searchBox = Instance.new("TextBox", dropdownGearFrame)
searchBox.Size = UDim2.new(1, -8, 0, 28)
searchBox.Position = UDim2.new(0, 4, 0, 4)
searchBox.PlaceholderText = "Search gear..."
searchBox.Text = ""
searchBox.TextColor3 = Color3.fromRGB(245,245,245)
searchBox.BackgroundColor3 = Color3.fromRGB(60,60,60)
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 14
Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0,4)

-- Scroll inside dropdown
local scrollGearFrame = Instance.new("ScrollingFrame", dropdownGearFrame)
scrollGearFrame.Position = UDim2.new(0,0,0,36)
scrollGearFrame.Size = UDim2.new(1,0,1,-36)
scrollGearFrame.CanvasSize = UDim2.new(0,0,0,0)
scrollGearFrame.ScrollBarThickness = 6
scrollGearFrame.BackgroundTransparency = 1
scrollGearFrame.ScrollBarImageColor3 = Color3.fromRGB(120,120,120)

-- Padding
local paddingGear = Instance.new("UIPadding", scrollGearFrame)
paddingGear.PaddingTop = UDim.new(0,2)
paddingGear.PaddingLeft = UDim.new(0,4)
paddingGear.PaddingRight = UDim.new(0,4)

local layoutGear = Instance.new("UIListLayout", scrollGearFrame)
layoutGear.SortOrder = Enum.SortOrder.LayoutOrder
layoutGear.Padding = UDim.new(0,2)

-- Auto Buy button
local autoBuyGearBtn = Instance.new("TextButton", gearTab)
autoBuyGearBtn.AnchorPoint = Vector2.new(0.5, 0.5)
autoBuyGearBtn.Position = UDim2.new(0.5, 0, 0.5, 20)
autoBuyGearBtn.Size = UDim2.new(0, 240, 0, 36)
autoBuyGearBtn.Text = "Start Auto Buy"
autoBuyGearBtn.TextColor3 = Color3.fromRGB(250,250,250)
autoBuyGearBtn.BackgroundColor3 = Color3.fromRGB(0,160,0)
autoBuyGearBtn.Font = Enum.Font.GothamBold
autoBuyGearBtn.TextSize = 14
Instance.new("UICorner", autoBuyGearBtn).CornerRadius = UDim.new(0,6)

-- State vars
local buyingGear = false
local selectedGear = nil

local gearCodes = {
	["Watering Can"]   = "\n\000\000@\207dJ\232A",
	["Trading Ticket"] = "\n\000\000\192\1365\251\232A",
	["Trowel"]         = "\n\000\000 xLU\232A",
	["Recall Wrench"]  = "\n\000\000`\128\171u\232A",
	["Basic Sprinkler"] = "\n\000\000 \1680U\232A",
	["Advance Sprinker"] = "n\000\000\224\1860U\232A",
	["Medium Toy"]     = "\n\000\000\192s\145\206\232A",
	["Small Toy"]      = "\n\000\000\160\200\145\206\232A",
	["Godly Sprinkler"] = "\n\000\000\128\2110U\232A",
	["Magnifying Glass"] = "\n\000\000\160kD\181\232A",
	["Tanning Mirror"] = "\n\000\000\128C\137\171\232A",
	["Master Sprinkler"] = "\n\000\000\1609jX\232A",
	["Cleaning Spray"] = "\n\000\000`X(\163\232A",
	["Favorite Tool"] = "\n\000\000\160^Ns\232A",
	["Harvest Tool"] = "\n\000\000\128\219\158{\232A",
	["FriendShip Pot"] = "\n\000\000@\174\015\153\232A",
	["GrandMaster Sprinker"] = "\n\000\000\128\211~\253\232A",
}

-- Populate options with hover effect
local tweenService = game:GetService("TweenService")
local gearButtons = {}
for gearName, code in pairs(gearCodes) do
	local option = Instance.new("TextButton")
	option.Size = UDim2.new(1, -8, 0, 26)
	option.Text = gearName
	option.TextColor3 = Color3.fromRGB(245,245,245)
	option.BackgroundColor3 = Color3.fromRGB(75,75,75)
	option.Font = Enum.Font.Gotham
	option.TextSize = 14
	option.Parent = scrollGearFrame
	Instance.new("UICorner", option).CornerRadius = UDim.new(0,4)

	-- Hover effect
	local normalColor = Color3.fromRGB(75,75,75)
	local hoverColor = Color3.fromRGB(100,100,100)
	option.MouseEnter:Connect(function()
		tweenService:Create(option, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = hoverColor}):Play()
	end)
	option.MouseLeave:Connect(function()
		tweenService:Create(option, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = normalColor}):Play()
	end)

	option.MouseButton1Click:Connect(function()
		selectedGear = code
		dropdownGearBtn.Text = gearName.." ▼"

		dropdownGearFrame:TweenSize(UDim2.new(0, 240, 0, 0), "Out", "Quad", 0.18, true, function()
			dropdownGearFrame.Visible = false
		end)
		dropdownGearBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, -20), "Out", "Quad", 0.18, true)
		autoBuyGearBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, 20), "Out", "Quad", 0.18, true)

		notify("⚔ Auto Buy Gear", "Selected Gear: "..gearName, 2)
	end)

	table.insert(gearButtons, option)
end

-- Search filter
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
	local query = searchBox.Text:lower()
	for _, btn in ipairs(gearButtons) do
		btn.Visible = btn.Text:lower():find(query) ~= nil
	end
	layoutGear:Reorder()
end)

-- Update scroll size
layoutGear:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	scrollGearFrame.CanvasSize = UDim2.new(0,0,0, layoutGear.AbsoluteContentSize.Y + 4)
end)

-- Toggle dropdown
dropdownGearBtn.MouseButton1Click:Connect(function()
	local maxHeight = 140
	local contentHeight = layoutGear.AbsoluteContentSize.Y + 4
	local visibleHeight = math.min(contentHeight, maxHeight)

	if dropdownGearFrame.Visible then
		-- CLOSE
		dropdownGearFrame:TweenSize(UDim2.new(0, 240, 0, 0), "Out", "Quad", 0.18, true, function()
			dropdownGearFrame.Visible = false
		end)
		dropdownGearBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, -20), "Out", "Quad", 0.18, true)
		dropdownGearFrame:TweenPosition(UDim2.new(0.5, 0, 0.5, 12), "Out", "Quad", 0.18, true)
		autoBuyGearBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, 20), "Out", "Quad", 0.18, true)
	else
		-- OPEN
		dropdownGearFrame.Visible = true
		dropdownGearFrame:TweenPosition(
			UDim2.new(0.5, 0, 0.5, -(visibleHeight/2) + 12),
			"Out", "Quad", 0.18, true
		)
		dropdownGearFrame:TweenSize(UDim2.new(0, 240, 0, visibleHeight), "Out", "Quad", 0.18, true)
		dropdownGearBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, -visibleHeight/2 - 4), "Out", "Quad", 0.18, true)

		local maxBtnOffset = (gearTab.AbsoluteSize.Y / 2) - (autoBuyGearBtn.Size.Y.Offset / 2) - 5
		local targetOffset = math.min(visibleHeight + 40, maxBtnOffset)
		autoBuyGearBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, targetOffset), "Out", "Quad", 0.18, true)
	end
end)

-- Auto buy loop
local function autoBuyGearLoop()
	while buyingGear and selectedGear do
		local success = pcall(function()
			local args = { buffer.fromstring(selectedGear) }
			ReplicatedStorage:WaitForChild("ByteNetReliable"):FireServer(unpack(args))
		end)
		if success then
			notify("⚔ Auto Buy Gear", "Bought 1 gear", 1)
		end
		task.wait(1)
	end
end

-- Toggle buy button
autoBuyGearBtn.MouseButton1Click:Connect(function()
	if not selectedGear then
		notify("⚠ Auto Buy Gear", "Please select a gear first.", 2)
		return
	end
	buyingGear = not buyingGear
	if buyingGear then
		autoBuyGearBtn.Text = "Stop Auto Buy"
		autoBuyGearBtn.BackgroundColor3 = Color3.fromRGB(170,40,40)
		task.spawn(autoBuyGearLoop)
	else
		autoBuyGearBtn.Text = "Start Auto Buy"
		autoBuyGearBtn.BackgroundColor3 = Color3.fromRGB(0,160,0)
	end
end)


-- ========== SEED TAB ==========  
local seedTab = tabContents["Seed"]
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

-- Dropdown button
local dropdownSeedBtn = Instance.new("TextButton", seedTab)
dropdownSeedBtn.AnchorPoint = Vector2.new(0.5, 0.5)
dropdownSeedBtn.Position = UDim2.new(0.5, 0, 0.5, -20)
dropdownSeedBtn.Size = UDim2.new(0, 240, 0, 32)
dropdownSeedBtn.Text = "Select Seed Type ▼"
dropdownSeedBtn.TextColor3 = Color3.fromRGB(245,245,245)
dropdownSeedBtn.BackgroundColor3 = Color3.fromRGB(65,65,65)
dropdownSeedBtn.Font = Enum.Font.Gotham
dropdownSeedBtn.TextSize = 14
Instance.new("UICorner", dropdownSeedBtn).CornerRadius = UDim.new(0,6)

-- Dropdown frame
local dropdownSeedFrame = Instance.new("Frame", seedTab)
dropdownSeedFrame.AnchorPoint = Vector2.new(0.5, 0)
dropdownSeedFrame.Position = UDim2.new(0.5, 0, 0.5, 12)
dropdownSeedFrame.Size = UDim2.new(0, 240, 0, 0)
dropdownSeedFrame.BackgroundColor3 = Color3.fromRGB(55,55,55)
dropdownSeedFrame.ClipsDescendants = true
dropdownSeedFrame.Visible = false
Instance.new("UICorner", dropdownSeedFrame).CornerRadius = UDim.new(0,6)

-- Search box
local searchBox = Instance.new("TextBox", dropdownSeedFrame)
searchBox.Size = UDim2.new(1, -8, 0, 28)
searchBox.Position = UDim2.new(0, 4, 0, 4)
searchBox.PlaceholderText = "Search seed..."
searchBox.Text = ""
searchBox.TextColor3 = Color3.fromRGB(245,245,245)
searchBox.BackgroundColor3 = Color3.fromRGB(60,60,60)
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 14
Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0,4)

-- Scroll inside dropdown
local scrollSeedFrame = Instance.new("ScrollingFrame", dropdownSeedFrame)
scrollSeedFrame.Position = UDim2.new(0,0,0,36)
scrollSeedFrame.Size = UDim2.new(1,0,1,-36)
scrollSeedFrame.CanvasSize = UDim2.new(0,0,0,0)
scrollSeedFrame.ScrollBarThickness = 6
scrollSeedFrame.BackgroundTransparency = 1
scrollSeedFrame.ScrollBarImageColor3 = Color3.fromRGB(120,120,120)

-- Padding
local paddingSeed = Instance.new("UIPadding", scrollSeedFrame)
paddingSeed.PaddingTop = UDim.new(0,2)
paddingSeed.PaddingLeft = UDim.new(0,4)
paddingSeed.PaddingRight = UDim.new(0,4)

local layoutSeed = Instance.new("UIListLayout", scrollSeedFrame)
layoutSeed.SortOrder = Enum.SortOrder.LayoutOrder
layoutSeed.Padding = UDim.new(0,2)

-- Auto Buy button
local autoBuySeedBtn = Instance.new("TextButton", seedTab)
autoBuySeedBtn.AnchorPoint = Vector2.new(0.5, 0.5)
autoBuySeedBtn.Position = UDim2.new(0.5, 0, 0.5, 20)
autoBuySeedBtn.Size = UDim2.new(0, 240, 0, 36)
autoBuySeedBtn.Text = "Start Auto Buy"
autoBuySeedBtn.TextColor3 = Color3.fromRGB(250,250,250)
autoBuySeedBtn.BackgroundColor3 = Color3.fromRGB(0,160,0)
autoBuySeedBtn.Font = Enum.Font.GothamBold
autoBuySeedBtn.TextSize = 14
Instance.new("UICorner", autoBuySeedBtn).CornerRadius = UDim.new(0,6)

-- State vars
local buyingSeed = false
local selectedSeed = nil

local seedCodes = {
	["Carrot Seed"] = "\n\000\000`yc4\232A",
	["StarberrySeed 2"] = "\n\000\000`Qe4\232A",
	["Blueberry Seed"] = "\n\000\000\000\226b4\232A",
	["Orange Seed"] = "\n\000\000\000\030CU\232A",
	["Tomato Seed"] = "\n\000\000\192\205e4\232A",
	["Corn Seed"] = "\n\000\000\160\205c4\232A",
	["Daffodil Seed"] = "\n\000\000@eCU\232A",
	["Watermelon Seed"] = "\n\000\000@\025f4\232A",
	["Pumpkin Seed"] = "\n\000\000\224\243d4\232A",
	["Apple Seed"] = "\n\000\000\1929o4\232A",
	["Bamboo Seed"] = "\n\000\000\160\155\225K\232A",
	["Coconut Seed"] = "\n\000\000\160",
	["Cactus Seed"] = "\n\000\000@5\192K\232A",
	["Dragon Fruit Seed"] = "\n\000\000\000\220\160<\232A",
	["Mango Seed"] = "\n\000\000\192d\175H\232A",
	["Grape Seed"] = "\n\000\000\160\182\254K\232A",
	["Mushroom Seed"] = "\n\000\000 \252\155d\232A",
	["Pepper Seed"] = "\n\000\000\128q\171k\232A",
	["Cacao Seed"] = "\n\000\000@F\148u\232A",
	["Beanstalk Seed"] = "\n\000\000@@zx\232A",
	["Ember Lily Seed"] = "\n\000\000`\169 \152\232A",
	["Sugar Apple Seed"] = "\n\000\000 W\186\159\232A",
	["Burning Bud Seed"] = "\n\000\000@KX\182\232A",
	["Giant Picone Seed"] = "\n\000\000\000\004\139\208\232A",
	["Elder Strawberry Seed"] = "\n\000\000\224\026]\236\232A",
}

-- Populate options with hover effect
local seedButtons = {}
for seedName, code in pairs(seedCodes) do
	local option = Instance.new("TextButton")
	option.Size = UDim2.new(1, -8, 0, 26)
	option.Text = seedName
	option.TextColor3 = Color3.fromRGB(245,245,245)
	option.BackgroundColor3 = Color3.fromRGB(75,75,75)
	option.Font = Enum.Font.Gotham
	option.TextSize = 14
	option.Parent = scrollSeedFrame
	Instance.new("UICorner", option).CornerRadius = UDim.new(0,4)

	local normalColor = Color3.fromRGB(75,75,75)
	local hoverColor = Color3.fromRGB(100,100,100)
	option.MouseEnter:Connect(function()
		TweenService:Create(option, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = hoverColor}):Play()
	end)
	option.MouseLeave:Connect(function()
		TweenService:Create(option, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = normalColor}):Play()
	end)

	option.MouseButton1Click:Connect(function()
		selectedSeed = code
		dropdownSeedBtn.Text = seedName.." ▼"

		dropdownSeedFrame:TweenSize(UDim2.new(0, 240, 0, 0), "Out", "Quad", 0.18, true, function()
			dropdownSeedFrame.Visible = false
		end)
		dropdownSeedBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, -20), "Out", "Quad", 0.18, true)
		autoBuySeedBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, 20), "Out", "Quad", 0.18, true)

		notify("🌱 Auto Buy Seed", "Selected Seed: "..seedName, 2)
	end)

	table.insert(seedButtons, option)
end

-- Search filter
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
	local query = searchBox.Text:lower()
	for _, btn in ipairs(seedButtons) do
		btn.Visible = btn.Text:lower():find(query) ~= nil
	end
	layoutSeed:Reorder()
end)

-- Update scroll size
layoutSeed:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	scrollSeedFrame.CanvasSize = UDim2.new(0,0,0, layoutSeed.AbsoluteContentSize.Y + 4)
end)

-- Toggle dropdown
dropdownSeedBtn.MouseButton1Click:Connect(function()
	local maxHeight = 140
	local contentHeight = layoutSeed.AbsoluteContentSize.Y + 4
	local visibleHeight = math.min(contentHeight, maxHeight)

	if dropdownSeedFrame.Visible then
		-- CLOSE
		dropdownSeedFrame:TweenSize(UDim2.new(0, 240, 0, 0), "Out", "Quad", 0.18, true, function()
			dropdownSeedFrame.Visible = false
		end)
		dropdownSeedBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, -20), "Out", "Quad", 0.18, true)
		dropdownSeedFrame:TweenPosition(UDim2.new(0.5, 0, 0.5, 12), "Out", "Quad", 0.18, true)
		autoBuySeedBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, 20), "Out", "Quad", 0.18, true)
	else
		-- OPEN
		dropdownSeedFrame.Visible = true
		dropdownSeedFrame:TweenPosition(
			UDim2.new(0.5, 0, 0.5, -(visibleHeight/2) + 12),
			"Out", "Quad", 0.18, true
		)
		dropdownSeedFrame:TweenSize(UDim2.new(0, 240, 0, visibleHeight), "Out", "Quad", 0.18, true)
		dropdownSeedBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, -visibleHeight/2 - 4), "Out", "Quad", 0.18, true)

		local maxBtnOffset = (seedTab.AbsoluteSize.Y / 2) - (autoBuySeedBtn.Size.Y.Offset / 2) - 5
		local targetOffset = math.min(visibleHeight + 40, maxBtnOffset)
		autoBuySeedBtn:TweenPosition(UDim2.new(0.5, 0, 0.5, targetOffset), "Out", "Quad", 0.18, true)
	end
end)

-- Auto buy loop
local function autoBuySeedLoop()
	while buyingSeed and selectedSeed do
		local success = pcall(function()
			local args = { buffer.fromstring(selectedSeed) }
			ReplicatedStorage:WaitForChild("ByteNetReliable"):FireServer(unpack(args))
		end)
		if success then
			notify("🌱 Auto Buy Seed", "Bought 1 seed", 1)
		end
		task.wait(1)
	end
end

-- Toggle buy button
autoBuySeedBtn.MouseButton1Click:Connect(function()
	if not selectedSeed then
		notify("⚠ Auto Buy Seed", "Please select a seed first.", 2)
		return
	end
	buyingSeed = not buyingSeed
	if buyingSeed then
		autoBuySeedBtn.Text = "Stop Auto Buy"
		autoBuySeedBtn.BackgroundColor3 = Color3.fromRGB(170,40,40)
		task.spawn(autoBuySeedLoop)
	else
		autoBuySeedBtn.Text = "Start Auto Buy"
		autoBuySeedBtn.BackgroundColor3 = Color3.fromRGB(0,160,0)
	end
end)



-- ========== CHRIS P.'S KITCHEN TAB ==========
local kitchenTab = tabContents["Chris P.'S k."]
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Remote references
local cookingEvent = ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("CookingPotService_RE")

-- State variables
local autoSubmitRunning = false
local autoKitchenRunning = false


-- ========== CHRIS P.'S KITCHEN TAB ==========
local kitchenTab = tabContents["Chris P.'S k."]
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Remote references
local cookingEvent = ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("CookingPotService_RE")
local submitFoodEvent = ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("SubmitFoodService_RE")

-- State variables
local autoSubmitRunning = false
local autoKitchenRunning = false

-- =================== BUTTON 2: Auto Kitchen (Submit + Cook + Skip + Get) ===================
local autoKitchenBtn = Instance.new("TextButton", kitchenTab)
autoKitchenBtn.AnchorPoint = Vector2.new(0.5, 0.5)
autoKitchenBtn.Position = UDim2.new(0.5, 0, 0.6, 0)
autoKitchenBtn.Size = UDim2.new(0, 260, 0, 38)
autoKitchenBtn.Text = "(hold fruit) Start Auto Kitchen"
autoKitchenBtn.TextColor3 = Color3.fromRGB(255,255,255)
autoKitchenBtn.BackgroundColor3 = Color3.fromRGB(0,160,0)
autoKitchenBtn.Font = Enum.Font.GothamBold
autoKitchenBtn.TextSize = 14
Instance.new("UICorner", autoKitchenBtn).CornerRadius = UDim.new(0,6)

local function autoKitchenLoop()
	while autoKitchenRunning do
		local success = pcall(function()
			-- Prioritize fruit submission first, then cook actions
			cookingEvent:FireServer("SubmitHeldPlant")
			task.wait(0.1) -- tiny delay for safety
			cookingEvent:FireServer("CookBest")
			cookingEvent:FireServer("TrySkipCooking")
			cookingEvent:FireServer("GetFoodFromPot")
		end)
		if success then
			notify("🍽 Chris P.'S kitchen", "Executed all cooking actions", 0.5)
		end
		task.wait(0.3) -- much faster than 1.5s
	end
end

autoKitchenBtn.MouseButton1Click:Connect(function()
	autoKitchenRunning = not autoKitchenRunning
	if autoKitchenRunning then
		autoKitchenBtn.Text = "Stop Auto Kitchen"
		autoKitchenBtn.BackgroundColor3 = Color3.fromRGB(170,40,40)
		task.spawn(autoKitchenLoop)
	else
		autoKitchenBtn.Text = "(hold fruit) Start Auto Kitchen"
		autoKitchenBtn.BackgroundColor3 = Color3.fromRGB(0,160,0)
	end
end)

-- =================== BUTTON 1: Auto Submit Food Only ===================
local autoSubmitBtn = Instance.new("TextButton", kitchenTab)
autoSubmitBtn.AnchorPoint = Vector2.new(0.5, 0.5)
autoSubmitBtn.Position = UDim2.new(0.5, 0, 0.4, 0)
autoSubmitBtn.Size = UDim2.new(0, 240, 0, 36)
autoSubmitBtn.Text = "(Hold food) Start Auto Submit Food"
autoSubmitBtn.TextColor3 = Color3.fromRGB(250,250,250)
autoSubmitBtn.BackgroundColor3 = Color3.fromRGB(0,160,0)
autoSubmitBtn.Font = Enum.Font.GothamBold
autoSubmitBtn.TextSize = 14
Instance.new("UICorner", autoSubmitBtn).CornerRadius = UDim.new(0,6)

local function autoSubmitLoop()
	while autoSubmitRunning do
		local success = pcall(function()
			submitFoodEvent:FireServer("SubmitHeldFood")
		end)
		if success then
			notify("🍽 Chris P.'S kitchen", "Submitted held food", 0.5)
		end
		task.wait(0.25) -- faster submit loop
	end
end

autoSubmitBtn.MouseButton1Click:Connect(function()
	autoSubmitRunning = not autoSubmitRunning
	if autoSubmitRunning then
		autoSubmitBtn.Text = "Stop Auto Submit Food"
		autoSubmitBtn.BackgroundColor3 = Color3.fromRGB(170,40,40)
		task.spawn(autoSubmitLoop)
	else
		autoSubmitBtn.Text = "(Hold food) Start Auto Submit Food"
		autoSubmitBtn.BackgroundColor3 = Color3.fromRGB(0,160,0)
	end
end)



-- ========== SPEED & JUMP TAB (Improved UI Spacing) ==========
local speedJumpTab = tabContents["Speed & Jump"]
if not speedJumpTab then
    warn("[SpeedJump] Tab 'Speed & Jump' not found. Make sure it's created in tabNames/tabIcons.")
    return
end

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Defaults + state
local DEFAULT_SPEED = 16
local DEFAULT_JUMP  = 50
local currentSpeed  = DEFAULT_SPEED
local currentJump   = DEFAULT_JUMP

-- Helpers
local function getHumanoid()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    if not char then return nil end
    return char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid", 2)
end

local function applyValues(spd, jmp)
    local hum = getHumanoid()
    if not hum then return end
    hum.WalkSpeed = spd
    hum.JumpPower = jmp
    currentSpeed, currentJump = spd, jmp
    if typeof(notify) == "function" then
        notify("⚡ Speed & Jump", ("Applied: Speed=%d | Jump=%d"):format(spd, jmp), 1)
    end
end

-- Re-apply on respawn
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.2)
    applyValues(currentSpeed, currentJump)
end)

-- Clean old UI if re-executed
for _, name in ipairs({
    "SJ_SpeedLbl","SJ_JumpLbl",
    "SJ_SpeedInput","SJ_JumpInput",
    "SJ_ApplyBtn","SJ_ResetBtn"
}) do
    local old = speedJumpTab:FindFirstChild(name)
    if old then old:Destroy() end
end

-- UI Builder function para consistent style
local function makeLabel(name, parent, text, posY)
    local lbl = Instance.new("TextLabel")
    lbl.Name = name
    lbl.Parent = parent
    lbl.AnchorPoint = Vector2.new(0.5, 0.5)
    lbl.Position = UDim2.new(0.5, 0, posY, 0)
    lbl.Size = UDim2.new(0, 260, 0, 18)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 14
    lbl.TextColor3 = Color3.fromRGB(220,220,220)
    return lbl
end

local function makeInput(name, parent, placeholder, posY)
    local box = Instance.new("TextBox")
    box.Name = name
    box.Parent = parent
    box.AnchorPoint = Vector2.new(0.5, 0.5)
    box.Position = UDim2.new(0.5, 0, posY, 0)
    box.Size = UDim2.new(0, 260, 0, 36)
    box.BackgroundColor3 = Color3.fromRGB(255,255,255)
    box.PlaceholderText = placeholder
    box.Text = ""
    box.Font = Enum.Font.Gotham
    box.TextSize = 14
    box.TextColor3 = Color3.fromRGB(0,0,0)
    Instance.new("UICorner", box).CornerRadius = UDim.new(0,6)
    return box
end

local function makeButton(name, parent, text, posY, color)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = parent
    btn.AnchorPoint = Vector2.new(0.5, 0.5)
    btn.Position = UDim2.new(0.5, 0, posY, 0)
    btn.Size = UDim2.new(0, 260, 0, 38)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.BackgroundColor3 = color
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)
    return btn
end

-- Labels + Inputs (with more spacing)
local speedLabel = makeLabel("SJ_SpeedLbl", speedJumpTab, "WalkSpeed", 0.18)
local speedInput = makeInput("SJ_SpeedInput", speedJumpTab, "Default: "..DEFAULT_SPEED, 0.28)

local jumpLabel  = makeLabel("SJ_JumpLbl", speedJumpTab, "JumpPower", 0.38)
local jumpInput  = makeInput("SJ_JumpInput", speedJumpTab, "Default: "..DEFAULT_JUMP, 0.48)

-- Buttons
local applyBtn = makeButton("SJ_ApplyBtn", speedJumpTab, "Apply Speed & Jump", 0.62, Color3.fromRGB(0,160,0))
local resetBtn = makeButton("SJ_ResetBtn", speedJumpTab, "Reset to Default", 0.74, Color3.fromRGB(170,40,40))

-- Button Logic
applyBtn.MouseButton1Click:Connect(function()
    local spd = tonumber(speedInput.Text)
    local jmp = tonumber(jumpInput.Text)
    if not spd then spd = DEFAULT_SPEED end
    if not jmp then jmp = DEFAULT_JUMP end
    spd = math.clamp(spd, 0, 500)
    jmp = math.clamp(jmp, 0, 500)
    applyValues(spd, jmp)
end)

resetBtn.MouseButton1Click:Connect(function()
    speedInput.Text = ""
    jumpInput.Text = ""
    applyValues(DEFAULT_SPEED, DEFAULT_JUMP)
end)

-- ========== FEATURE: Auto-Harvest ==========
local harvestTab = tabContents["Auto-Harvest"]

-- Wrapper para i-center lahat ng UI sa loob ng tab
local harvestWrapper = Instance.new("Frame", harvestTab)
harvestWrapper.Size = UDim2.new(0, 320, 0, 150)
harvestWrapper.AnchorPoint = Vector2.new(0.5, 0.5)
harvestWrapper.Position = UDim2.new(0.5, 0, 0.5, 0)
harvestWrapper.BackgroundTransparency = 1

-- Title Label
local harvestLabel = Instance.new("TextLabel", harvestWrapper)
harvestLabel.Size = UDim2.new(1, 0, 0, 24)
harvestLabel.Position = UDim2.new(0.5, 0, 0, 0)
harvestLabel.AnchorPoint = Vector2.new(0.5, 0)
harvestLabel.BackgroundTransparency = 1
harvestLabel.Text = "Auto-Harvest (Grow a Garden)"
harvestLabel.TextColor3 = Color3.fromRGB(240,240,240)
harvestLabel.Font = Enum.Font.GothamBold
harvestLabel.TextSize = 16
harvestLabel.TextXAlignment = Enum.TextXAlignment.Center

-- Status Label
local statusLabel = Instance.new("TextLabel", harvestWrapper)
statusLabel.Size = UDim2.new(1, 0, 0, 22)
statusLabel.Position = UDim2.new(0.5, 0, 0, 92)
statusLabel.AnchorPoint = Vector2.new(0.5, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: locating farm..."
statusLabel.TextColor3 = Color3.fromRGB(200,255,200)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 14
statusLabel.TextXAlignment = Enum.TextXAlignment.Center

-- Toggle Button
local toggleHarvestBtn = Instance.new("TextButton", harvestWrapper)
toggleHarvestBtn.Size = UDim2.new(0.6, 0, 0, 40)
toggleHarvestBtn.Position = UDim2.new(0.5, 0, 0, 44)
toggleHarvestBtn.AnchorPoint = Vector2.new(0.5, 0)
toggleHarvestBtn.Text = "Auto-Harvest: OFF"
toggleHarvestBtn.BackgroundColor3 = Color3.fromRGB(69,142,40)
toggleHarvestBtn.Font = Enum.Font.GothamBold
toggleHarvestBtn.TextColor3 = Color3.fromRGB(245,245,245)
toggleHarvestBtn.TextSize = 14
Instance.new("UICorner", toggleHarvestBtn).CornerRadius = UDim.new(0,6)

-- ================= LOGIC =================
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local AutoHarvestEnabled = false
local PlantsPhysical

-- Check if object can harvest
local function CanHarvest(obj)
    local Prompt = obj and obj:FindFirstChild("ProximityPrompt", true)
    return Prompt and Prompt.Enabled
end

local function Harvest(obj)
    local Prompt = obj and obj:FindFirstChild("ProximityPrompt", true)
    if Prompt then
        pcall(function() fireproximityprompt(Prompt) end)
    end
end

local function GetHarvestables()
    if not PlantsPhysical or not PlantsPhysical.Parent then return {} end
    local list = {}
    for _, plant in ipairs(PlantsPhysical:GetChildren()) do
        if CanHarvest(plant) then table.insert(list, plant) end
        local Fruits = plant:FindFirstChild("Fruits")
        if Fruits then
            for _, fruit in ipairs(Fruits:GetChildren()) do
                if CanHarvest(fruit) then table.insert(list, fruit) end
            end
        end
    end
    return list
end

local function AutoHarvestLoop()
    while AutoHarvestEnabled do
        if not PlantsPhysical then
            statusLabel.Text = "Status: waiting for farm..."
            task.wait(0.5)
        else
            local items = GetHarvestables()
            if #items == 0 then
                statusLabel.Text = "Status: no harvestables"
            else
                statusLabel.Text = ("Status: harvesting %d item(s)"):format(#items)
                for _, obj in ipairs(items) do
                    Harvest(obj)
                    task.wait(0.08)
                end
            end
            task.wait(0.6)
        end
    end
    statusLabel.Text = "Status: idle"
end

toggleHarvestBtn.MouseButton1Click:Connect(function()
    AutoHarvestEnabled = not AutoHarvestEnabled
    toggleHarvestBtn.Text = "Auto-Harvest: " .. (AutoHarvestEnabled and "ON" or "OFF")
    if AutoHarvestEnabled then
        task.spawn(AutoHarvestLoop)
    end
end)

-- Find farm by Owner.Value
task.spawn(function()
    local FarmsFolder = workspace:WaitForChild("Farm")
    while not PlantsPhysical do
        for _, farm in ipairs(FarmsFolder:GetChildren()) do
            local Important = farm:FindFirstChild("Important")
            local Data = Important and Important:FindFirstChild("Data")
            local Owner = Data and Data:FindFirstChild("Owner")
            if Owner and Owner.Value == LocalPlayer.Name then
                local pp = Important:FindFirstChild("Plants_Physical")
                if pp then
                    PlantsPhysical = pp
                    statusLabel.Text = "Status: ready ✅"
                    break
                end
            end
        end
        if not PlantsPhysical then
            statusLabel.Text = "Status: locating farm..."
            task.wait(1)
        end
    end
end)

-- ========== FEATURE: Sell Fruits ==========
local sellTab = tabContents["Sell-Fruits"]

-- Wrapper frame para i-center lahat ng UI sa gitna
local sellWrapper = Instance.new("Frame", sellTab)
sellWrapper.Size = UDim2.new(0, 320, 0, 150)
sellWrapper.AnchorPoint = Vector2.new(0.5, 0.5)
sellWrapper.Position = UDim2.new(0.5, 0, 0.5, 0)
sellWrapper.BackgroundTransparency = 1

-- Title label
local sellLabel = Instance.new("TextLabel", sellWrapper)
sellLabel.Size = UDim2.new(1, 0, 0, 24)
sellLabel.Position = UDim2.new(0.5, 0, 0, 0)
sellLabel.AnchorPoint = Vector2.new(0.5, 0)
sellLabel.BackgroundTransparency = 1
sellLabel.Text = "Sell Fruits"
sellLabel.TextColor3 = Color3.fromRGB(240,240,240)
sellLabel.Font = Enum.Font.GothamBold
sellLabel.TextSize = 16
sellLabel.TextXAlignment = Enum.TextXAlignment.Center

-- Buttons (Sell Fruit and Sell All Fruits)
local sellFruitBtn = Instance.new("TextButton", sellWrapper)
sellFruitBtn.Size = UDim2.new(0.8, 0, 0, 36)
sellFruitBtn.Position = UDim2.new(0.5, 0, 0, 44)
sellFruitBtn.AnchorPoint = Vector2.new(0.5, 0)
sellFruitBtn.Text = "Sell Fruit"
sellFruitBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
sellFruitBtn.Font = Enum.Font.GothamBold
sellFruitBtn.TextColor3 = Color3.fromRGB(245,245,245)
sellFruitBtn.TextSize = 14
Instance.new("UICorner", sellFruitBtn).CornerRadius = UDim.new(0,6)

local sellFruitsBtn = Instance.new("TextButton", sellWrapper)
sellFruitsBtn.Size = UDim2.new(0.8, 0, 0, 36)
sellFruitsBtn.Position = UDim2.new(0.5, 0, 0, 90)
sellFruitsBtn.AnchorPoint = Vector2.new(0.5, 0)
sellFruitsBtn.Text = "Sell All Fruits"
sellFruitsBtn.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
sellFruitsBtn.Font = Enum.Font.GothamBold
sellFruitsBtn.TextColor3 = Color3.fromRGB(245,245,245)
sellFruitsBtn.TextSize = 14
Instance.new("UICorner", sellFruitsBtn).CornerRadius = UDim.new(0,6)

-- Status label
local statusLabel = Instance.new("TextLabel", sellWrapper)
statusLabel.Size = UDim2.new(1, 0, 0, 22)
statusLabel.Position = UDim2.new(0.5, 0, 0, 132)
statusLabel.AnchorPoint = Vector2.new(0.5, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Idle"
statusLabel.TextColor3 = Color3.fromRGB(200,255,200)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 14
statusLabel.TextXAlignment = Enum.TextXAlignment.Center

--// Logic
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local sellItemEvent = ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("Sell_Item")
local sellInventoryEvent = ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("Sell_Inventory")
local sellNPCPrompt = Workspace:WaitForChild("NPCS"):WaitForChild("Steven"):WaitForChild("HumanoidRootPart"):WaitForChild("ProximityPrompt"):WaitForChild("SellNPC")

sellFruitBtn.MouseButton1Click:Connect(function()
    if sellItemEvent then
        sellItemEvent:FireServer()
        if sellNPCPrompt then fireproximityprompt(sellNPCPrompt) end
        statusLabel.Text = "Status: Sold 1 Fruit ✅"
    else
        statusLabel.Text = "Status: Error - Event Missing!"
    end
end)

sellFruitsBtn.MouseButton1Click:Connect(function()
    if sellInventoryEvent then
        sellInventoryEvent:FireServer()
        if sellNPCPrompt then fireproximityprompt(sellNPCPrompt) end
        statusLabel.Text = "Status: Sold All Fruits ✅"
    else
        statusLabel.Text = "Status: Error - Event Missing!"
    end
end)



notify("Grow A Garden Modded", "Enjoy your script!", 3)
