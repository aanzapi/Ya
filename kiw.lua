-- // Advanced GUI by AanZAPI (16:9 + Fly Control Update)

-- Services
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AanGUI"
ScreenGui.Parent = LP:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Toggle Button
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0,40,0,40)
ToggleBtn.Position = UDim2.new(0,10,0.5,-20)
ToggleBtn.Text = "≡"
ToggleBtn.TextSize = 22
ToggleBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
ToggleBtn.TextColor3 = Color3.fromRGB(255,255,255)
ToggleBtn.Parent = ScreenGui
Instance.new("UICorner",ToggleBtn).CornerRadius = UDim.new(0,10)

-- Main Frame (16:9)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 280)
MainFrame.Position = UDim2.new(0.25, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Title Bar
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "🚀 AanZAPI GUI"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
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

-------------------- FITUR (ATAS HORIZONTAL) --------------------
local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, -10, 0, 50)
TopBar.Position = UDim2.new(0,5,0,35)
TopBar.BackgroundTransparency = 1

local UIList = Instance.new("UIListLayout", TopBar)
UIList.FillDirection = Enum.FillDirection.Horizontal
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 10)

-- Fly Btn
local FlyBtn = Instance.new("TextButton", TopBar)
FlyBtn.Size = UDim2.new(0,120,1,0)
FlyBtn.Text = "✈️ Fly: OFF"
FlyBtn.TextColor3 = Color3.fromRGB(255,255,255)
FlyBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
FlyBtn.Font = Enum.Font.SourceSansBold
FlyBtn.TextSize = 18
Instance.new("UICorner", FlyBtn).CornerRadius = UDim.new(0,8)

-- Tombol Naik
local UpBtn = Instance.new("TextButton", TopBar)
UpBtn.Size = UDim2.new(0,60,1,0)
UpBtn.Text = "⬆️"
UpBtn.TextColor3 = Color3.fromRGB(255,255,255)
UpBtn.BackgroundColor3 = Color3.fromRGB(70,70,70)
UpBtn.Font = Enum.Font.SourceSansBold
UpBtn.TextSize = 18
Instance.new("UICorner", UpBtn).CornerRadius = UDim.new(0,8)

-- Tombol Turun
local DownBtn = Instance.new("TextButton", TopBar)
DownBtn.Size = UDim2.new(0,60,1,0)
DownBtn.Text = "⬇️"
DownBtn.TextColor3 = Color3.fromRGB(255,255,255)
DownBtn.BackgroundColor3 = Color3.fromRGB(70,70,70)
DownBtn.Font = Enum.Font.SourceSansBold
DownBtn.TextSize = 18
Instance.new("UICorner", DownBtn).CornerRadius = UDim.new(0,8)

-- Tombol Speed
local SpeedBtn = Instance.new("TextButton", TopBar)
SpeedBtn.Size = UDim2.new(0,100,1,0)
SpeedBtn.Text = "⚡ Speed: 50"
SpeedBtn.TextColor3 = Color3.fromRGB(255,255,255)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(80,80,80)
SpeedBtn.Font = Enum.Font.SourceSansBold
SpeedBtn.TextSize = 18
Instance.new("UICorner", SpeedBtn).CornerRadius = UDim.new(0,8)

-- Tele Player Btn
local TeleBtn = Instance.new("TextButton", TopBar)
TeleBtn.Size = UDim2.new(0,120,1,0)
TeleBtn.Text = "👤 Teleport Player"
TeleBtn.TextColor3 = Color3.fromRGB(255,255,255)
TeleBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
TeleBtn.Font = Enum.Font.SourceSansBold
TeleBtn.TextSize = 18
Instance.new("UICorner", TeleBtn).CornerRadius = UDim.new(0,8)

-- Tele CP Btn
local CPBtn = Instance.new("TextButton", TopBar)
CPBtn.Size = UDim2.new(0,120,1,0)
CPBtn.Text = "📍 Teleport CP"
CPBtn.TextColor3 = Color3.fromRGB(255,255,255)
CPBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
CPBtn.Font = Enum.Font.SourceSansBold
CPBtn.TextSize = 18
Instance.new("UICorner", CPBtn).CornerRadius = UDim.new(0,8)

-------------------- LIST PANEL (KE KANAN) --------------------
local ListPanel = Instance.new("Frame", MainFrame)
ListPanel.Size = UDim2.new(1,-20,1,-90)
ListPanel.Position = UDim2.new(0,10,0,90)
ListPanel.BackgroundColor3 = Color3.fromRGB(30,30,30)
Instance.new("UICorner", ListPanel).CornerRadius = UDim.new(0,10)

local ListFrame = Instance.new("ScrollingFrame", ListPanel)
ListFrame.Size = UDim2.new(1,-10,1,-10)
ListFrame.Position = UDim2.new(0,5,0,5)
ListFrame.CanvasSize = UDim2.new(0,0,0,0)
ListFrame.BackgroundTransparency = 1
ListFrame.ScrollBarThickness = 5

local UIList2 = Instance.new("UIListLayout", ListFrame)
UIList2.FillDirection = Enum.FillDirection.Horizontal
UIList2.SortOrder = Enum.SortOrder.LayoutOrder
UIList2.Padding = UDim.new(0,8)

for i=1,6 do
    local Btn = Instance.new("TextButton", ListFrame)
    Btn.Size = UDim2.new(0,120,0,40)
    Btn.Text = "Item "..i
    Btn.TextColor3 = Color3.fromRGB(255,255,255)
    Btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0,8)
end

-------------------- FLY SYSTEM --------------------
local flying = false
local speed = 50
local upHeld, downHeld = false, false

FlyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    FlyBtn.Text = flying and "✈️ Fly: ON" or "✈️ Fly: OFF"
end)

SpeedBtn.MouseButton1Click:Connect(function()
    if speed == 50 then
        speed = 100
    elseif speed == 100 then
        speed = 150
    else
        speed = 50
    end
    SpeedBtn.Text = "⚡ Speed: "..speed
end)

UpBtn.MouseButton1Down:Connect(function() if flying then upHeld=true end end)
UpBtn.MouseButton1Up:Connect(function() upHeld=false end)
DownBtn.MouseButton1Down:Connect(function() if flying then downHeld=true end end)
DownBtn.MouseButton1Up:Connect(function() downHeld=false end)

RunService.RenderStepped:Connect(function()
    if flying and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        local HRP = LP.Character.HumanoidRootPart
        local camCF = workspace.CurrentCamera.CFrame
        local moveDir = Vector3.new(0,0,0)

        if UIS:IsKeyDown(Enum.KeyCode.W) then
            moveDir = moveDir + camCF.LookVector
        end
        if UIS:IsKeyDown(Enum.KeyCode.S) then
            moveDir = moveDir - camCF.LookVector
        end
        if UIS:IsKeyDown(Enum.KeyCode.A) then
            moveDir = moveDir - camCF.RightVector
        end
        if UIS:IsKeyDown(Enum.KeyCode.D) then
            moveDir = moveDir + camCF.RightVector
        end
        if upHeld then
            moveDir = moveDir + Vector3.new(0,1,0)
        end
        if downHeld then
            moveDir = moveDir + Vector3.new(0,-1,0)
        end

        if moveDir.Magnitude > 0 then
            HRP.Velocity = moveDir.Unit * speed
        else
            HRP.Velocity = Vector3.new(0,0,0)
        end
    end
end)
