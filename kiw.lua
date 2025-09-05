-- // Advanced GUI by AanZAPI (No Toggle Button)
-- Bisa digeser, ada tombol close
-- Fly controllable + speed
-- Teleport player
-- Checkpoint system (save/delete/auto teleport)
-- Multi-page dengan tombol Next/Prev di atas

-- Services
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AanGUI"
ScreenGui.Parent = LP:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 250, 0, 400)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

-- Title Bar
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -60, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "🚀 AanZAPI GUI"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.Parent = MainFrame

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -30, 0, 0)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 16
CloseBtn.BackgroundTransparency = 1
CloseBtn.Parent = MainFrame
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- Page Control (Top)
local Page = 1
local MaxPage = 2

local PrevBtn = Instance.new("TextButton")
PrevBtn.Size = UDim2.new(0, 30, 0, 30)
PrevBtn.Position = UDim2.new(0, 0, 0, 0)
PrevBtn.Text = "<"
PrevBtn.TextColor3 = Color3.fromRGB(255,255,255)
PrevBtn.Font = Enum.Font.SourceSansBold
PrevBtn.TextSize = 16
PrevBtn.BackgroundTransparency = 1
PrevBtn.Parent = MainFrame

local NextBtn = Instance.new("TextButton")
NextBtn.Size = UDim2.new(0, 30, 0, 30)
NextBtn.Position = UDim2.new(0, 30, 0, 0)
NextBtn.Text = ">"
NextBtn.TextColor3 = Color3.fromRGB(255,255,255)
NextBtn.Font = Enum.Font.SourceSansBold
NextBtn.TextSize = 16
NextBtn.BackgroundTransparency = 1
NextBtn.Parent = MainFrame

-- Frame Pages
local Page1 = Instance.new("Frame")
Page1.Size = UDim2.new(1,0,1,-30)
Page1.Position = UDim2.new(0,0,0,30)
Page1.BackgroundTransparency = 1
Page1.Parent = MainFrame

local Page2 = Instance.new("Frame")
Page2.Size = UDim2.new(1,0,1,-30)
Page2.Position = UDim2.new(0,0,0,30)
Page2.BackgroundTransparency = 1
Page2.Visible = false
Page2.Parent = MainFrame

-- Switch page
local function updatePage()
    Page1.Visible = (Page == 1)
    Page2.Visible = (Page == 2)
end
PrevBtn.MouseButton1Click:Connect(function()
    Page = math.max(1, Page - 1)
    updatePage()
end)
NextBtn.MouseButton1Click:Connect(function()
    Page = math.min(MaxPage, Page + 1)
    updatePage()
end)

-- ========================= PAGE 1: Fly + Teleport =========================
-- Fly Button
local FlyBtn = Instance.new("TextButton")
FlyBtn.Size = UDim2.new(0.9, 0, 0, 40)
FlyBtn.Position = UDim2.new(0.05, 0, 0.05, 0)
FlyBtn.Text = "✈️ Fly: OFF"
FlyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
FlyBtn.Font = Enum.Font.SourceSansBold
FlyBtn.TextSize = 18
FlyBtn.Parent = Page1
Instance.new("UICorner", FlyBtn).CornerRadius = UDim.new(0, 6)

-- Teleport Player List
local DropDown = Instance.new("TextButton")
DropDown.Size = UDim2.new(0.9, 0, 0, 40)
DropDown.Position = UDim2.new(0.05, 0, 0.65, 0)
DropDown.Text = "👤 Teleport Menu"
DropDown.TextColor3 = Color3.fromRGB(255, 255, 255)
DropDown.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
DropDown.Font = Enum.Font.SourceSansBold
DropDown.TextSize = 18
DropDown.Parent = Page1
Instance.new("UICorner", DropDown).CornerRadius = UDim.new(0, 6)

local ListFrame = Instance.new("ScrollingFrame")
ListFrame.Size = UDim2.new(0.9, 0, 0, 110)
ListFrame.Position = UDim2.new(0.05, 0, 0.8, 0)
ListFrame.CanvasSize = UDim2.new(0,0,0,0)
ListFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
ListFrame.ScrollBarThickness = 4
ListFrame.Visible = false
ListFrame.Parent = Page1
Instance.new("UICorner", ListFrame).CornerRadius = UDim.new(0, 6)

local function refreshPlayers()
    for _,child in pairs(ListFrame:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    local y = 0
    for _,plr in pairs(Players:GetPlayers()) do
        if plr ~= LP then
            local Btn = Instance.new("TextButton")
            Btn.Size = UDim2.new(1, -5, 0, 30)
            Btn.Position = UDim2.new(0, 0, 0, y)
            Btn.Text = plr.Name
            Btn.TextColor3 = Color3.fromRGB(255,255,255)
            Btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
            Btn.Parent = ListFrame
            y = y + 35
            Btn.MouseButton1Click:Connect(function()
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    LP.Character:WaitForChild("HumanoidRootPart").CFrame = plr.Character.HumanoidRootPart.CFrame + Vector3.new(0,3,0)
                end
            end)
        end
    end
    ListFrame.CanvasSize = UDim2.new(0,0,0,y)
end
Players.PlayerAdded:Connect(refreshPlayers)
Players.PlayerRemoving:Connect(refreshPlayers)
refreshPlayers()
DropDown.MouseButton1Click:Connect(function()
    ListFrame.Visible = not ListFrame.Visible
end)

-- Fly System
local flying = false
local speed = 60
local bv
local flyY = 0
local upHeld, downHeld = false, false

local function startFly()
    local HRP = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not HRP then return end
    bv = Instance.new("BodyVelocity")
    bv.Velocity = Vector3.zero
    bv.MaxForce = Vector3.new(1e5,1e5,1e5)
    bv.Parent = HRP

    RunService.RenderStepped:Connect(function()
        if flying and HRP and bv then
            local moveDir = LP.Character:FindFirstChild("Humanoid").MoveDirection
            local vel = Vector3.new(moveDir.X*speed, flyY, moveDir.Z*speed)
            bv.Velocity = vel
        end
    end)
end

FlyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    FlyBtn.Text = flying and "✈️ Fly: ON" or "✈️ Fly: OFF"
    flyY = 0
    if flying then
        startFly()
    else
        if bv then bv:Destroy() bv = nil end
    end
end)

-- ========================= PAGE 2: Checkpoint =========================
local Checkpoints = {}
local AutoTele = false

local SaveBtn = Instance.new("TextButton")
SaveBtn.Size = UDim2.new(0.9, 0, 0, 40)
SaveBtn.Position = UDim2.new(0.05, 0, 0.05, 0)
SaveBtn.Text = "💾 Save Checkpoint"
SaveBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SaveBtn.Font = Enum.Font.SourceSansBold
SaveBtn.TextSize = 18
SaveBtn.Parent = Page2
Instance.new("UICorner", SaveBtn).CornerRadius = UDim.new(0, 6)

local DeleteBtn = Instance.new("TextButton")
DeleteBtn.Size = UDim2.new(0.9, 0, 0, 40)
DeleteBtn.Position = UDim2.new(0.05, 0, 0.2, 0)
DeleteBtn.Text = "🗑️ Delete Last Checkpoint"
DeleteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DeleteBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
DeleteBtn.Font = Enum.Font.SourceSansBold
DeleteBtn.TextSize = 18
DeleteBtn.Parent = Page2
Instance.new("UICorner", DeleteBtn).CornerRadius = UDim.new(0, 6)

local AutoTeleBtn = Instance.new("TextButton")
AutoTeleBtn.Size = UDim2.new(0.9, 0, 0, 40)
AutoTeleBtn.Position = UDim2.new(0.05, 0, 0.35, 0)
AutoTeleBtn.Text = "⚡ Auto Teleport: OFF"
AutoTeleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoTeleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AutoTeleBtn.Font = Enum.Font.SourceSansBold
AutoTeleBtn.TextSize = 18
AutoTeleBtn.Parent = Page2
Instance.new("UICorner", AutoTeleBtn).CornerRadius = UDim.new(0, 6)

SaveBtn.MouseButton1Click:Connect(function()
    local HRP = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if HRP then
        table.insert(Checkpoints, HRP.CFrame)
        print("Checkpoint saved:", #Checkpoints)
    end
end)

DeleteBtn.MouseButton1Click:Connect(function()
    if #Checkpoints > 0 then
        table.remove(Checkpoints)
        print("Last checkpoint deleted. Total:", #Checkpoints)
    end
end)

AutoTeleBtn.MouseButton1Click:Connect(function()
    AutoTele = not AutoTele
    AutoTeleBtn.Text = AutoTele and "⚡ Auto Teleport: ON" or "⚡ Auto Teleport: OFF"
    if AutoTele then
        coroutine.wrap(function()
            while AutoTele do
                for _,cf in ipairs(Checkpoints) do
                    if not AutoTele then break end
                    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                        LP.Character.HumanoidRootPart.CFrame = cf + Vector3.new(0,3,0)
                        task.wait(1)
                    end
                end
            end
        end)()
    end
end)
