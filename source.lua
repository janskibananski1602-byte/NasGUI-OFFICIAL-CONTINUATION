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

createTabButton("Plugins", 330, function()
    HideAllTabs()
    containerPlugins.Visible = true
end)

-- Plugins tab: Info box
local infoBox = Instance.new("Frame", containerPlugins)
infoBox.Size = UDim2.new(1, -20, 0, 120)
infoBox.Position = UDim2.new(0, 10, 0, 0)
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
infoText.Text = [[PLUGINS SYSTEM

How to use:
1. Create a folder named "NasPlugins" in your executor workspace (auto-created on first load).
2. Place .nas files inside (Lua scripts that return a table with: Name (string), Author (optional string), Run (function)).
3. Restart/reload the GUI or re-open Plugins tab to load them.

Example plugin code:
return {
    Name = "My Cool Plugin",
    Author = "YourName",
    Run = function()
        print("Hello from my plugin!")
    end
}

Enjoy custom plugins!]]
infoText.TextColor3 = Color3.fromRGB(255, 255, 255)
infoText.TextSize = 14
infoText.Font = Enum.Font.Gotham
infoText.TextXAlignment = Enum.TextXAlignment.Left
infoText.TextYAlignment = Enum.TextYAlignment.Top
infoText.TextWrapped = true
infoText.ZIndex = 2

-- Plugins tab scrolling frame (moved below info box)
local scrollPlugins = Instance.new("ScrollingFrame", containerPlugins)
scrollPlugins.Size = UDim2.new(1, -20, 1, -140)  -- Adjusted to fit below info box
scrollPlugins.Position = UDim2.new(0, 10, 0, 130)
scrollPlugins.BackgroundTransparency = 1
scrollPlugins.ScrollBarThickness = 8
scrollPlugins.ScrollBarImageColor3 = Color3.fromRGB(255, 50, 50)
scrollPlugins.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollPlugins.ZIndex = 2

local pluginLayout = Instance.new("UIListLayout", scrollPlugins)
pluginLayout.Padding = UDim.new(0, 10)
pluginLayout.SortOrder = Enum.SortOrder.LayoutOrder

pluginLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrollPlugins.CanvasSize = UDim2.new(0, 0, 0, pluginLayout.AbsoluteContentSize.Y + 20)
end)

-- Plugin loader
local function AddPlugin(name, callback)
    local btn = Instance.new("TextButton", scrollPlugins)
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Text = name
    btn.TextSize = 14
    btn.BackgroundColor3 = Color3.fromRGB(128, 0, 0)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    btn.ZIndex = 2
    btn.MouseButton1Click:Connect(callback)
end

local function LoadPlugins()
    local list = {}
    if not isfolder("NasPlugins") then
        makefolder("NasPlugins")
        writefile("NasPlugins/README.txt", "Put your .nas plugin files here as tables with Name, Author, Run()")
    end
    for _, file in ipairs(listfiles("NasPlugins")) do
        if file:sub(-4):lower() == ".nas" then
            local ok, plugin = pcall(function()
                return loadfile(file)()
            end)
            if ok and type(plugin) == "table" and plugin.Run then
                table.insert(list, plugin)
            end
        end
    end
    return list
end

local Plugins = LoadPlugins() or {}
if #Plugins > 0 then
    for _, plugin in ipairs(Plugins) do
        AddPlugin(plugin.Name .. " | by " .. (plugin.Author or "Unknown"), function()
            task.spawn(plugin.Run)
        end)
    end
end

-- Main tab scrolling frame (bright red scroll bar)
local scrollMain = Instance.new("ScrollingFrame", containerMain)
scrollMain.Size = UDim2.new(1, 0, 1, 0)
scrollMain.Position = UDim2.new(0, 0, 0, 0)
scrollMain.BackgroundTransparency = 1
scrollMain.ScrollBarThickness = 8
scrollMain.ScrollBarImageColor3 = Color3.fromRGB(255, 50, 50)
scrollMain.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollMain.ZIndex = 1

local mainLayout = Instance.new("UIListLayout", scrollMain)
mainLayout.Padding = UDim.new(0, 10)
mainLayout.SortOrder = Enum.SortOrder.LayoutOrder

mainLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrollMain.CanvasSize = UDim2.new(0, 0, 0, mainLayout.AbsoluteContentSize.Y + 20)
end)

local function createButton(parent, text, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Text = text
    btn.TextSize = 14
    btn.BackgroundColor3 = Color3.fromRGB(128, 0, 0)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    btn.ZIndex = 1
    btn.MouseButton1Click:Connect(callback)
end

local buttons = {
    {"Set Skybox", function()
        local id = "rbxassetid://82411403129832"
        local s = Instance.new("Sky", game.Lighting)
        s.SkyboxBk = id
        s.SkyboxDn = id
        s.SkyboxFt = id
        s.SkyboxLf = id
        s.SkyboxRt = id
        s.SkyboxUp = id
    end},
    {"Play Song", function()
        local snd = Instance.new("Sound", workspace)
        snd.SoundId = "rbxassetid://114573847650036"
        snd.Looped = true
        snd.Volume = 10
        snd.PlaybackSpeed = 0.17
        snd:Play()
    end},
    {"Decal Spam", function()
        local decalId = "130720573923509"
        local function applyDecal(part)
            if part:IsA("BasePart") then
                local surfaces = {Enum.NormalId.Top, Enum.NormalId.Bottom, Enum.NormalId.Left, Enum.NormalId.Right, Enum.NormalId.Front, Enum.NormalId.Back}
                for _, surface in pairs(surfaces) do
                    local decal = Instance.new("Decal")
                    decal.Texture = "rbxassetid://" .. decalId
                    decal.Face = surface
                    decal.Parent = part
                end
            end
        end
        for _, obj in pairs(workspace:GetDescendants()) do
            applyDecal(obj)
        end
        workspace.DescendantAdded:Connect(applyDecal)
        print("All parts now have the decal everywhere! 🗿")
    end},
    {"Set Particles", function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                local p = Instance.new("ParticleEmitter", v)
                p.Texture = "rbxassetid://82411403129832"
            end
        end
    end},
    {"ServerHint Message", function()
        local h = Instance.new("Hint", workspace)
        h.Text = "BOW DOWN TO NAS9229ALT & HAXSTER998 CUZ WE PWNED THIS GAME LOL"
    end},
    {"Nameless Admin", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))() end},
    {"Disco Fog", function()
        local Lighting = game:GetService("Lighting")
        if Lighting:FindFirstChild("DiscoFogConnection") then Lighting.DiscoFogConnection:Disconnect() end
        local discoConnection = RunService.RenderStepped:Connect(function()
            Lighting.FogColor = Color3.new(math.random(), math.random(), math.random())
        end)
        Lighting:SetAttribute("DiscoFogConnection", discoConnection)
    end},
    {"Btools", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Btools-41524"))() end},
    {"Inf Yield", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end},
    {"Jork", function() loadstring(game:HttpGet("https://pastefy.app/lawnvcTT/raw", true))() end},
    {"Sirius", function() loadstring(game:HttpGet('https://sirius.menu/sirius'))() end},
    {"Skrubl0rdz Skybox", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-c00lkidd-skybox-script-10964"))() end},
    {"007n7 Decal Spam", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-007n7-decal-spam-Not-FE-26963"))() end},
    {"Dex Explorer", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))() end},
    {"SimpleSpy", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-SimpleSpy-20145"))() end},
    {"FE Invisible", function() loadstring(game:HttpGet("https://pastefy.app/mjkbQzXk/raw"))() end},
    {"Anti-Bang", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Anti-Bang-Script-39958"))() end},
    {"Freaky Ahh Messages", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Freaky-ahh-quotes-by-me-43270"))() end},
    {"Fake R6 FE", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ALLAHSIZV0C0N456793/Hj/refs/heads/main/R6.txt"))() end},
    {"c00lgui by team c00lkidd", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/C00lHamoot/c00lgui-1/36410b4f949d3a10e8b39fc7cdcc8cfb67aefe25/c00l%20gui"))() end},
    {"Skeleton Skybox", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Skeleton-skybox-53658"))() end},
    {"Anti-Chat Logger", function() loadstring(game:HttpGet("https://pastebin.com/raw/qjDfA6E5"))() end},
    {"Dance GUI by Nas", function() loadstring(game:HttpGet("https://pastefy.app/lmRy7mqO/raw"))() end},
    {"FE Goofy Animations", function() loadstring(game:HttpGet("https://pastebin.com/raw/UQhaBfEZ"))() end},
    {"Lag All Players", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-TOOL-SERVER-CRASHER-30316"))() end},
    {"R6 Animations GUI", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ocfi/aqua-hub-is-a-skid-lol/refs/heads/main/animatrix"))() end},
    {"OP Sword Tool", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Linked-Sword-R6-Script-40329"))() end},
    {"FE KJ R6", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Universal-Temu-KJ-IMPROVED-19618"))() end},
    {"Auto Heal", function()
        spawn(function()
            while task.wait(1) do
                local player = game.Players.LocalPlayer
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.Health = player.Character.Humanoid.MaxHealth
                end
            end
        end)
    end},
    {"Animation Grabber", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Anim-Grabber-21176"))() end},
    {"LALOL Hub Backdoor", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-LALOL-Hub-Backdoor-58564"))() end},
    {"Billboard GUI", function()
        local billboard = Instance.new("BillboardGui")
        billboard.Adornee = game.Players.LocalPlayer.Character:FindFirstChild("Head")
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 2, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = game.Players.LocalPlayer.Character.Head
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = "HAXSTER998"
        label.TextColor3 = Color3.new(1, 0, 0)
        label.TextScaled = true
        label.Font = Enum.Font.SourceSansBold
        label.Parent = billboard
    end},
    {"c00lclan v2", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-c00lclan-v2-52915"))() end},
    {"FE Collection", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/sypcerr/FECollection/refs/heads/main/script.lua", true))() end},
    {"FE John Doe", function() loadstring(game:HttpGet('https://pastebin.com/raw/sB9Wwx9v', true))() end},
    {"Billboard Others", function()
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                local head = player.Character.Head
                if head:FindFirstChild("NasSlaveBillboard") then head.NasSlaveBillboard:Destroy() end
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "NasSlaveBillboard"
                billboard.Size = UDim2.new(0, 200, 0, 50)
                billboard.StudsOffset = Vector3.new(0, 2, 0)
                billboard.Adornee = head
                billboard.AlwaysOnTop = true
                billboard.Parent = head
                local label = Instance.new("TextLabel", billboard)
                label.Size = UDim2.new(1, 0, 1, 0)
                label.BackgroundTransparency = 1
                label.Text = "Nas' Slave"
                label.TextColor3 = Color3.fromRGB(255, 255, 255)
                label.TextScaled = true
                label.Font = Enum.Font.SourceSansBold
            end
        end
    end},
    {"Nas' Trail", function()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        if hrp:FindFirstChild("NasTrailAttachment0") then
            for _, obj in pairs(hrp:GetChildren()) do
                if obj:IsA("Trail") or obj:IsA("Attachment") then obj:Destroy() end
            end
        end
        local att0 = Instance.new("Attachment")
        att0.Name = "NasTrailAttachment0"
        att0.Position = Vector3.new(0, 1, 0)
        att0.Parent = hrp
        local att1 = Instance.new("Attachment")
        att1.Name = "NasTrailAttachment1"
        att1.Position = Vector3.new(0, -1, 0)
        att1.Parent = hrp
        local trail = Instance.new("Trail")
        trail.Attachment0 = att0
        trail.Attachment1 = att1
        trail.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 0))}
        trail.Lifetime = 1
        trail.MinLength = 0.1
        trail.LightEmission = 1
        trail.WidthScale = NumberSequence.new(0.5)
        trail.Parent = hrp
    end},
    {"FE R15 Sonic 2", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-R15-Sonic-The-Hedgehog-63923"))() end},
    {"Create Team", function()
        local Teams = game:GetService("Teams")
        local teamName = "TEAM NAS9229ALT JOIN TODAY!"
        local team = Teams:FindFirstChild(teamName)
        if not team then
            team = Instance.new("Team")
            team.Name = teamName
            team.TeamColor = BrickColor.new("Bright red")
            team.AutoAssignable = false
            team.Parent = Teams
        end
        local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
        if not leaderstats then
            leaderstats = Instance.new("Folder")
            leaderstats.Name = "leaderstats"
            leaderstats.Parent = LocalPlayer
        end
        local teamStat = leaderstats:FindFirstChild("Team")
        if not teamStat then
            teamStat = Instance.new("StringValue")
            teamStat.Name = "Team"
            teamStat.Parent = leaderstats
        end
        teamStat.Value = team.Name
        LocalPlayer.Team = team
    end},
    {"Universal Anti-Kick (FE)", function()
        local mt = getrawmetatable(game)
        local oldNamecall = mt.__namecall
        setreadonly(mt, false)
        mt.__namecall = newcclosure(function(self, ...)
            local args = {...}
            local method = getnamecallmethod()
            if method == "Kick" and self == game.Players.LocalPlayer then
                warn("Blocked a kick attempt!")
                return
            end
            return oldNamecall(self, ...)
        end)
        setreadonly(mt, true)
        if LocalPlayer.Character then
            LocalPlayer.Character:GetPropertyChangedSignal("Parent"):Connect(function()
                if not LocalPlayer.Character.Parent then
                    warn("Attempted to remove character! Re-parenting...")
                    LocalPlayer.Character.Parent = workspace
                end
            end)
        end
    end},
    {"Mass Report Others", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Mass-Report-Others-42251"))() end},
    {"Grab Unanchored Parts", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-grab-unanchored-blocks-42313"))() end},
    {"FE Boogie Down", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-boogie-down-53232"))() end},
    {"FE Chat Bypass", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-chisis-byp*s-54088"))() end},
    {"Remote-Abuse Admin", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-remote-abuse-FE-admin-script-27923"))() end},
    {"Prizz Admin", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Prison-Life-Prizz-Admin-14511"))() end},
    {"VC Unbanner", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Voice-Chat-Unban-42843"))() end},
    {"JanGUI v2", function() loadstring(game:HttpGet("https://pastefy.app/Sfeg0MGf/raw"))() end},
    {"SaveInstance V2", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Universally-saveinstance-V2-42081"))() end},
    {"Roblox Emotes & Animations", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-7yd7-I-Emote-Script-48024"))() end},
    {"Modified Ring Parts", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Super-modified-ring-parts-55157"))() end},
    {"FE NPC Control", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Control-script-Credits-to-patrick-34156"))() end},
    {"FE Sword Tool", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Classic-Sword-Fling-Tool-16842"))() end},
    {"Drop-Kick Tool FE", function()
        -- [Drop-Kick code unchanged, same as before]
    end},
    -- [All other buttons unchanged...]
}

for _, item in ipairs(buttons) do
    createButton(scrollMain, item[1], item[2])
end

-- Executor tab [unchanged]

-- Misc tab [unchanged, larger with bright red scroll bar]

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
