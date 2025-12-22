-- NasGUI v2.5 Continuation

local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

-- Cleanup previous intro if exists
if CoreGui:FindFirstChild("NasIntroV2") then
    CoreGui.NasIntroV2:Destroy()
end

local scr = Instance.new("ScreenGui")
scr.Name = "NasIntroV2"
scr.Parent = CoreGui
scr.IgnoreGuiInset = true

-- Blur effect
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = game:GetService("Lighting")

local function fadeBlur(startSize, endSize, duration)
    task.spawn(function()
        local elapsed = 0
        while elapsed < duration do
            local delta = RunService.RenderStepped:Wait()
            elapsed += delta
            blur.Size = startSize + (endSize - startSize) * (elapsed / duration)
        end
        blur.Size = endSize
    end)
end

local function fade(obj, startT, endT, duration)
    task.spawn(function()
        local elapsed = 0
        while elapsed < duration do
            local delta = RunService.RenderStepped:Wait()
            elapsed += delta
            local alpha = math.clamp(startT + (endT - startT) * (elapsed / duration), 0, 1)
            if obj:IsA("Frame") then
                obj.BackgroundTransparency = 1 - alpha
            elseif obj:IsA("TextLabel") then
                obj.TextTransparency = 1 - alpha
            end
        end
        if obj:IsA("Frame") then
            obj.BackgroundTransparency = 1 - endT
        elseif obj:IsA("TextLabel") then
            obj.TextTransparency = 1 - endT
        end
    end)
end

-- Background
local bg = Instance.new("Frame", scr)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
bg.BackgroundTransparency = 1
bg.BorderSizePixel = 0

local gradient = Instance.new("UIGradient", bg)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 50, 50))
}
gradient.Rotation = 45

-- Text
local title = Instance.new("TextLabel", scr)
title.Size = UDim2.new(1, -40, 0, 80)
title.Position = UDim2.new(0, 20, 0.35, 0)
title.BackgroundTransparency = 1
title.Text = "NasGUI v2.5 Continuation"
title.Font = Enum.Font.GothamBlack
title.TextSize = 40
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextTransparency = 1
title.TextScaled = true

local sub = Instance.new("TextLabel", scr)
sub.Size = UDim2.new(1, -40, 0, 40)
sub.Position = UDim2.new(0, 20, 0.5, 0)
sub.BackgroundTransparency = 1
sub.Text = "READY TO BREACH THE ENVIRONMENT!"
sub.Font = Enum.Font.GothamBold
sub.TextSize = 24
sub.TextColor3 = Color3.fromRGB(255, 255, 255)
sub.TextTransparency = 1
sub.TextScaled = true

-- Audio
local sound = Instance.new("Sound", scr)
sound.SoundId = "rbxassetid://9085309015"
sound.Volume = 1
sound:Play()

-- Intro sequence
fadeBlur(0, 25, 0.8)
task.wait(0.8)

fade(bg, 1, 0, 1.0)
fade(title, 1, 0, 1.0)
fade(sub, 1, 0, 1.0)
task.wait(1.0)

task.wait(1.2)

fade(title, 0, 1, 0.8)
fade(sub, 0, 1, 0.8)
fade(bg, 0, 1, 0.8)
task.wait(0.8)

task.wait(0.5)
fadeBlur(25, 0, 1.0)
task.wait(1.0)

scr:Destroy()
blur:Destroy()

print(">> NasGUI v2.5 Continuation loaded successfully!")

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

-- Startup sound
local startupSound = Instance.new("Sound", workspace)
startupSound.SoundId = "rbxassetid://126083075694948"
startupSound.Volume = 5
startupSound:Play()

-- Billboard on player head
pcall(function()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local head = char:WaitForChild("Head")
    local msg = "NasGUI v2.5 Loaded! | Made by: Nas9229alt & 1602sasa2/Jan"
    local Billboard = Instance.new("BillboardGui", head)
    Billboard.Size = UDim2.new(0, 200, 0, 50)
    Billboard.StudsOffset = Vector3.new(0, 2, 0)
    Billboard.Adornee = head
    Billboard.AlwaysOnTop = true
    Billboard.Name = "AutoChatAd"
    local text = Instance.new("TextLabel", Billboard)
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.TextScaled = true
    text.TextColor3 = Color3.fromRGB(255, 0, 0)
    text.Font = Enum.Font.SourceSansBold
    text.Text = msg
    task.delay(10, function()
        Billboard:Destroy()
    end)
end)

-- Main GUI setup
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "NasGUI"
gui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 450, 0, 400)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
mainFrame.BorderColor3 = Color3.fromRGB(255, 50, 50)
mainFrame.BorderSizePixel = 2
mainFrame.Active = true
mainFrame.Draggable = true

local bgImage = Instance.new("ImageLabel", mainFrame)
bgImage.Size = UDim2.new(1, 0, 1, 0)
bgImage.BackgroundTransparency = 1
bgImage.Image = "rbxassetid://82411403129832"
bgImage.ImageTransparency = 0.3
bgImage.ZIndex = 0

-- Title
local titleLabel = Instance.new("TextLabel", mainFrame)
titleLabel.Size = UDim2.new(1, -80, 0, 30)
titleLabel.Position = UDim2.new(0, 10, 0, 5)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "NasGUI v2.5 Continuation"
titleLabel.Font = Enum.Font.GothamBlack
titleLabel.TextSize = 20
titleLabel.TextColor3 = Color3.fromRGB(228, 42, 42)
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.ZIndex = 1

-- Close button
local close = Instance.new("TextButton", mainFrame)
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -40, 0, 5)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(128, 0, 0)
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.Font = Enum.Font.GothamBold
close.TextSize = 16
close.ZIndex = 1
close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Minimize button & toggle
local minimize = Instance.new("TextButton", mainFrame)
minimize.Size = UDim2.new(0, 30, 0, 30)
minimize.Position = UDim2.new(1, -75, 0, 5)
minimize.Text = "–"
minimize.BackgroundColor3 = Color3.fromRGB(128, 0, 0)
minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
minimize.Font = Enum.Font.GothamBold
minimize.TextSize = 16
minimize.ZIndex = 1

local toggle = Instance.new("ImageButton", gui)
toggle.Size = UDim2.new(0, 60, 0, 60)
toggle.Position = UDim2.new(0, 20, 0, 200)
toggle.Image = "rbxassetid://120853264656112"
toggle.BackgroundColor3 = Color3.fromRGB(128, 0, 0)
toggle.BorderColor3 = Color3.fromRGB(255, 50, 50)
toggle.BorderSizePixel = 4
toggle.Visible = false
toggle.Draggable = true

local corner = Instance.new("UICorner", toggle)
corner.CornerRadius = UDim.new(0.5, 0)

local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

minimize.MouseButton1Click:Connect(function()
    TweenService:Create(mainFrame, tweenInfo, {Size = UDim2.new(0, 450, 0, 0)}):Play()
    task.wait(0.3)
    mainFrame.Visible = false
    toggle.Visible = true
end)

toggle.MouseButton1Click:Connect(function()
    mainFrame.Visible = true
    TweenService:Create(mainFrame, tweenInfo, {Size = UDim2.new(0, 450, 0, 400)}):Play()
    toggle.Visible = false
end)

-- Tab system
local tabFrame = Instance.new("Frame", mainFrame)
tabFrame.Size = UDim2.new(1, -20, 0, 40)
tabFrame.Position = UDim2.new(0, 10, 0, 40)
tabFrame.BackgroundTransparency = 1
tabFrame.ZIndex = 1

local containerMain = Instance.new("Frame", mainFrame)
containerMain.Size = UDim2.new(1, -20, 1, -90)
containerMain.Position = UDim2.new(0, 10, 0, 80)
containerMain.BackgroundTransparency = 1
containerMain.Visible = true
containerMain.ZIndex = 1

local containerExec = Instance.new("Frame", mainFrame)
containerExec.Size = containerMain.Size
containerExec.Position = containerMain.Position
containerExec.BackgroundTransparency = 1
containerExec.Visible = false
containerExec.ZIndex = 1

local containerMisc = Instance.new("Frame", mainFrame)
containerMisc.Size = containerMain.Size
containerMisc.Position = containerMain.Position
containerMisc.BackgroundTransparency = 1
containerMisc.Visible = false
containerMisc.ZIndex = 1

local containerThemes = Instance.new("Frame", mainFrame)  -- New Themes container
containerThemes.Size = containerMain.Size
containerThemes.Position = containerMain.Position
containerThemes.BackgroundTransparency = 1
containerThemes.Visible = false
containerThemes.ZIndex = 1

local containerPlugins = Instance.new("Frame", mainFrame)
containerPlugins.Size = UDim2.new(1, 0, 1, -100)
containerPlugins.Position = UDim2.new(0, 0, 0, 100)
containerPlugins.BackgroundTransparency = 1
containerPlugins.Visible = false
containerPlugins.ZIndex = 1

local function HideAllTabs()
    containerMain.Visible = false
    containerExec.Visible = false
    containerMisc.Visible = false
    containerThemes.Visible = false
    containerPlugins.Visible = false
end

local function createTabButton(name, posX, callback)
    local b = Instance.new("TextButton", tabFrame)
    b.Size = UDim2.new(0, 100, 0, 30)
    b.Position = UDim2.new(0, posX, 0, 5)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(128, 0, 0)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.ZIndex = 1
    b.MouseButton1Click:Connect(callback)
end

createTabButton("Main", 0, function()
    HideAllTabs()
    containerMain.Visible = true
end)

createTabButton("Executor", 110, function()
    HideAllTabs()
    containerExec.Visible = true
end)

createTabButton("Misc", 220, function()
    HideAllTabs()
    containerMisc.Visible = true
end)

createTabButton("Themes", 330, function()  -- New Themes tab button
    HideAllTabs()
    containerThemes.Visible = true
end)

createTabButton("Plugins", 440, function()  -- Shifted Plugins to the right
    HideAllTabs()
    containerPlugins.Visible = true
end)

-- Themes Tab Content
local themesScroll = Instance.new("ScrollingFrame", containerThemes)
themesScroll.Size = UDim2.new(1, 0, 1, 0)
themesScroll.BackgroundTransparency = 1
themesScroll.ScrollBarThickness = 8
themesScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 50, 50)
themesScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
themesScroll.ZIndex = 1

local themesLayout = Instance.new("UIListLayout", themesScroll)
themesLayout.Padding = UDim.new(0, 15)
themesLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Dark red explanation box
local infoBox = Instance.new("Frame", themesScroll)
infoBox.Size = UDim2.new(1, -20, 0, 280)
infoBox.BackgroundColor3 = Color3.fromRGB(80, 0, 0)  -- Dark red
infoBox.BorderColor3 = Color3.fromRGB(255, 50, 50)
infoBox.BorderSizePixel = 2
infoBox.ZIndex = 2

local infoCorner = Instance.new("UICorner", infoBox)
infoCorner.CornerRadius = UDim.new(0, 8)

local infoText = Instance.new("TextLabel", infoBox)
infoText.Size = UDim2.new(1, -20, 1, -20)
infoText.Position = UDim2.new(0, 10, 0, 10)
infoText.BackgroundTransparency = 1
infoText.TextColor3 = Color3.fromRGB(255, 200, 200)
infoText.TextSize = 16
infoText.Font = Enum.Font.Gotham
infoText.TextXAlignment = Enum.TextXAlignment.Left
infoText.TextYAlignment = Enum.TextYAlignment.Top
infoText.TextWrapped = true
infoText.ZIndex = 3
infoText.Text = [[THEMES SYSTEM - HOW TO USE

NasGUI v2.5 features a customizable theme system!

How it works:
• Themes are stored as .theme files in the "NasThemes" folder.
• Each theme file is a Lua table containing colors and settings.
• Example structure:
return {
    Name = "Dark Blood",
    MainColor = Color3.fromRGB(30, 0, 0),
    AccentColor = Color3.fromRGB(200, 0, 0),
    ButtonColor = Color3.fromRGB(120, 0, 0),
}

To create a theme:
1. Create a folder named "NasThemes" (auto-created on first use).
2. Make a new file ending in ".theme" inside it.
3. Paste a theme table and save.

To apply a theme:
• Open the Themes tab
• Click on your desired theme button

Default theme: Classic Red (current look)

More themes coming soon or create your own!
Report bugs/suggestions to @nas9229alt on Discord.]]

-- Auto-resize themes scroll
themesLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    themesScroll.CanvasSize = UDim2.new(0, 0, 0, themesLayout.AbsoluteContentSize.Y + 20)
end)

-- [Rest of the script remains unchanged: Plugins, Main tab, Executor, Misc, etc.]

-- (All previous code for Main, Executor, Misc, Plugins continues exactly as before)

-- Executor detection notification
local executorName = "Unknown"
if syn then executorName = "Synapse X"
elseif KRNL_LOADED then executorName = "KRNL"
elseif fluxus then executorName = "Fluxus"
elseif identifyexecutor then executorName = identifyexecutor()
end

StarterGui:SetCore("SendNotification", {
    Title = "NasGUI v2.5 Continuation";
    Text = "Executor: "..executorName;
    Duration = 5;
})

print("~~~~~~~~~~~~~~~~~~~~ Made with LOVE! ~~~~~~~~~~~~~~~~~~~~")
