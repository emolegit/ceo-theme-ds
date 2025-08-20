local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Настройки ESP
local ESP = {
    Enabled = false,
    ShowPlayers = true,
    ShowNames = true,
    ShowHealth = true,
    ShowDistance = true,
    MaxDistance = 1000,
    BoxColor = Color3.fromRGB(255, 255, 255),
    TextColor = Color3.fromRGB(255, 255, 255),
    HealthBarColor = Color3.fromRGB(0, 255, 0),
    HealthBarBackgroundColor = Color3.fromRGB(255, 0, 0)
}

-- Создание GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ESPGui"
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.Text = "ESP Menu"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.Font = Enum.Font.SourceSansBold
Title.Parent = MainFrame

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0.8, 0, 0, 40)
ToggleButton.Position = UDim2.new(0.1, 0, 0.15, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
ToggleButton.Text = "ESP: OFF"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextScaled = true
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.Parent = MainFrame

local PlayersToggle = Instance.new("TextButton")
PlayersToggle.Name = "PlayersToggle"
PlayersToggle.Size = UDim2.new(0.8, 0, 0, 30)
PlayersToggle.Position = UDim2.new(0.1, 0, 0.3, 0)
PlayersToggle.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
PlayersToggle.Text = "Показывать игроков: ON"
PlayersToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayersToggle.TextScaled = true
PlayersToggle.Font = Enum.Font.SourceSans
PlayersToggle.Parent = MainFrame

local NamesToggle = Instance.new("TextButton")
NamesToggle.Name = "NamesToggle"
NamesToggle.Size = UDim2.new(0.8, 0, 0, 30)
NamesToggle.Position = UDim2.new(0.1, 0, 0.4, 0)
NamesToggle.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
NamesToggle.Text = "Показывать имена: ON"
NamesToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
NamesToggle.TextScaled = true
NamesToggle.Font = Enum.Font.SourceSans
NamesToggle.Parent = MainFrame

local HealthToggle = Instance.new("TextButton")
HealthToggle.Name = "HealthToggle"
HealthToggle.Size = UDim2.new(0.8, 0, 0, 30)
HealthToggle.Position = UDim2.new(0.1, 0, 0.5, 0)
HealthToggle.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
HealthToggle.Text = "Показывать здоровье: ON"
HealthToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
HealthToggle.TextScaled = true
HealthToggle.Font = Enum.Font.SourceSans
HealthToggle.Parent = MainFrame

local DistanceToggle = Instance.new("TextButton")
DistanceToggle.Name = "DistanceToggle"
DistanceToggle.Size = UDim2.new(0.8, 0, 0, 30)
DistanceToggle.Position = UDim2.new(0.1, 0, 0.6, 0)
DistanceToggle.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
DistanceToggle.Text = "Показывать дистанцию: ON"
DistanceToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
DistanceToggle.TextScaled = true
DistanceToggle.Font = Enum.Font.SourceSans
DistanceToggle.Parent = MainFrame

local MaxDistanceLabel = Instance.new("TextLabel")
MaxDistanceLabel.Name = "MaxDistanceLabel"
MaxDistanceLabel.Size = UDim2.new(0.8, 0, 0, 20)
MaxDistanceLabel.Position = UDim2.new(0.1, 0, 0.7, 0)
MaxDistanceLabel.BackgroundTransparency = 1
MaxDistanceLabel.Text = "Макс. дистанция: " .. ESP.MaxDistance
MaxDistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
MaxDistanceLabel.TextScaled = true
MaxDistanceLabel.Font = Enum.Font.SourceSans
MaxDistanceLabel.Parent = MainFrame

local MaxDistanceSlider = Instance.new("TextButton")
MaxDistanceSlider.Name = "MaxDistanceSlider"
MaxDistanceSlider.Size = UDim2.new(0.8, 0, 0, 20)
MaxDistanceSlider.Position = UDim2.new(0.1, 0, 0.75, 0)
MaxDistanceSlider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MaxDistanceSlider.Text = "Изменить дистанцию"
MaxDistanceSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
MaxDistanceSlider.TextScaled = true
MaxDistanceSlider.Font = Enum.Font.SourceSans
MaxDistanceSlider.Parent = MainFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Size = UDim2.new(0.8, 0, 0, 30)
StatusLabel.Position = UDim2.new(0.1, 0, 0.85, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Нажмите Delete для скрытия/показа меню"
StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
StatusLabel.TextScaled = true
StatusLabel.Font = Enum.Font.SourceSans
StatusLabel.Parent = MainFrame

-- Скрыть меню по умолчанию
MainFrame.Visible = false

-- Функции ESP
local function CreateESP(player)
    if not player or player == LocalPlayer then return end
    
    local esp = {}
    
    -- Создание рамки
    esp.Box = Instance.new("Frame")
    esp.Box.Name = "ESPBox"
    esp.Box.BackgroundTransparency = 1
    esp.Box.BorderSizePixel = 2
    esp.Box.BorderColor3 = ESP.BoxColor
    esp.Box.Parent = ScreenGui
    
    -- Создание имени
    esp.Name = Instance.new("TextLabel")
    esp.Name.Name = "ESPName"
    esp.Name.BackgroundTransparency = 1
    esp.Name.TextColor3 = ESP.TextColor
    esp.Name.TextScaled = true
    esp.Name.Font = Enum.Font.SourceSansBold
    esp.Name.Parent = ScreenGui
    
    -- Создание здоровья
    esp.Health = Instance.new("TextLabel")
    esp.Health.Name = "ESPHealth"
    esp.Health.BackgroundTransparency = 1
    esp.Health.TextColor3 = ESP.HealthBarColor
    esp.Health.TextScaled = true
    esp.Health.Font = Enum.Font.SourceSans
    esp.Health.Parent = ScreenGui
    
    -- Создание дистанции
    esp.Distance = Instance.new("TextLabel")
    esp.Distance.Name = "ESPDistance"
    esp.Distance.BackgroundTransparency = 1
    esp.Distance.TextColor3 = ESP.TextColor
    esp.Distance.TextScaled = true
    esp.Distance.Font = Enum.Font.SourceSans
    esp.Distance.Parent = ScreenGui
    
    -- Создание полосы здоровья
    esp.HealthBar = Instance.new("Frame")
    esp.HealthBar.Name = "ESPHealthBar"
    esp.HealthBar.BackgroundColor3 = ESP.HealthBarColor
    esp.HealthBar.BorderSizePixel = 1
    esp.HealthBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    esp.HealthBar.Parent = ScreenGui
    
    esp.HealthBarBackground = Instance.new("Frame")
    esp.HealthBarBackground.Name = "ESPHealthBarBackground"
    esp.HealthBarBackground.BackgroundColor3 = ESP.HealthBarBackgroundColor
    esp.HealthBarBackground.BorderSizePixel = 1
    esp.HealthBarBackground.BorderColor3 = Color3.fromRGB(0, 0, 0)
    esp.HealthBarBackground.Parent = ScreenGui
    
    return esp
end

local function UpdateESP()
    if not ESP.Enabled then return end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local humanoidRootPart = player.Character.HumanoidRootPart
            local humanoid = player.Character:FindFirstChild("Humanoid")
            local head = player.Character:FindFirstChild("Head")
            
            if not head then continue end
            
            local vector, onScreen = Camera:WorldToViewportPoint(humanoidRootPart.Position)
            local distance = (humanoidRootPart.Position - Camera.CFrame.Position).Magnitude
            
            if onScreen and distance <= ESP.MaxDistance then
                -- Получить или создать ESP элементы
                local esp = player:FindFirstChild("ESP") or CreateESP(player)
                if not esp then continue end
                
                -- Обновление рамки
                if ESP.ShowPlayers then
                    local topLeft = Camera:WorldToViewportPoint((humanoidRootPart.CFrame * CFrame.new(-3, 3, 0)).Position)
                    local bottomRight = Camera:WorldToViewportPoint((humanoidRootPart.CFrame * CFrame.new(3, -3, 0)).Position)
                    
                    esp.Box.Size = UDim2.new(0, bottomRight.X - topLeft.X, 0, bottomRight.Y - topLeft.Y)
                    esp.Box.Position = UDim2.new(0, topLeft.X, 0, topLeft.Y)
                    esp.Box.Visible = true
                else
                    esp.Box.Visible = false
                end
                
                -- Обновление имени
                if ESP.ShowNames then
                    esp.Name.Text = player.Name
                    esp.Name.Position = UDim2.new(0, vector.X, 0, vector.Y - 50)
                    esp.Name.Visible = true
                else
                    esp.Name.Visible = false
                end
                
                -- Обновление здоровья
                if ESP.ShowHealth and humanoid then
                    local healthPercent = humanoid.Health / humanoid.MaxHealth
                    esp.Health.Text = math.floor(humanoid.Health) .. "/" .. math.floor(humanoid.MaxHealth)
                    esp.Health.Position = UDim2.new(0, vector.X, 0, vector.Y + 30)
                    esp.Health.Visible = true
                    
                    -- Обновление полосы здоровья
                    esp.HealthBarBackground.Size = UDim2.new(0, 50, 0, 5)
                    esp.HealthBarBackground.Position = UDim2.new(0, vector.X - 25, 0, vector.Y + 50)
                    esp.HealthBarBackground.Visible = true
                    
                    esp.HealthBar.Size = UDim2.new(healthPercent, 0, 0, 5)
                    esp.HealthBar.Position = UDim2.new(0, vector.X - 25, 0, vector.Y + 50)
                    esp.HealthBar.Visible = true
                else
                    esp.Health.Visible = false
                    esp.HealthBar.Visible = false
                    esp.HealthBarBackground.Visible = false
                end
                
                -- Обновление дистанции
                if ESP.ShowDistance then
                    esp.Distance.Text = math.floor(distance) .. " studs"
                    esp.Distance.Position = UDim2.new(0, vector.X, 0, vector.Y + 70)
                    esp.Distance.Visible = true
                else
                    esp.Distance.Visible = false
                end
            else
                -- Скрыть ESP если игрок не на экране или слишком далеко
                if player:FindFirstChild("ESP") then
                    local esp = player.ESP
                    esp.Box.Visible = false
                    esp.Name.Visible = false
                    esp.Health.Visible = false
                    esp.HealthBar.Visible = false
                    esp.HealthBarBackground.Visible = false
                    esp.Distance.Visible = false
                end
            end
        end
    end
end

-- Обработчики кнопок
ToggleButton.MouseButton1Click:Connect(function()
    ESP.Enabled = not ESP.Enabled
    ToggleButton.Text = "ESP: " .. (ESP.Enabled and "ON" or "OFF")
    ToggleButton.BackgroundColor3 = ESP.Enabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(100, 100, 100)
end)

PlayersToggle.MouseButton1Click:Connect(function()
    ESP.ShowPlayers = not ESP.ShowPlayers
    PlayersToggle.Text = "Показывать игроков: " .. (ESP.ShowPlayers and "ON" or "OFF")
    PlayersToggle.BackgroundColor3 = ESP.ShowPlayers and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(80, 80, 80)
end)

NamesToggle.MouseButton1Click:Connect(function()
    ESP.ShowNames = not ESP.ShowNames
    NamesToggle.Text = "Показывать имена: " .. (ESP.ShowNames and "ON" or "OFF")
    NamesToggle.BackgroundColor3 = ESP.ShowNames and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(80, 80, 80)
end)

HealthToggle.MouseButton1Click:Connect(function()
    ESP.ShowHealth = not ESP.ShowHealth
    HealthToggle.Text = "Показывать здоровье: " .. (ESP.ShowHealth and "ON" or "OFF")
    HealthToggle.BackgroundColor3 = ESP.ShowHealth and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(80, 80, 80)
end)

DistanceToggle.MouseButton1Click:Connect(function()
    ESP.ShowDistance = not ESP.ShowDistance
    DistanceToggle.Text = "Показывать дистанцию: " .. (ESP.ShowDistance and "ON" or "OFF")
    DistanceToggle.BackgroundColor3 = ESP.ShowDistance and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(80, 80, 80)
end)

MaxDistanceSlider.MouseButton1Click:Connect(function()
    local newDistance = tonumber(game:GetService("StarterGui"):GetCore("SendNotification")({
        Title = "ESP Дистанция",
        Text = "Введите новую дистанцию (100-2000):",
        Duration = 5
    }))
    
    if newDistance and newDistance >= 100 and newDistance <= 2000 then
        ESP.MaxDistance = newDistance
        MaxDistanceLabel.Text = "Макс. дистанция: " .. ESP.MaxDistance
    end
end)

-- Обработчик клавиши Delete
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Delete then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

-- Основной цикл обновления ESP
RunService.RenderStepped:Connect(UpdateESP)

-- Очистка при выходе игрока
Players.PlayerRemoving:Connect(function(player)
    if player:FindFirstChild("ESP") then
        player.ESP:Destroy()
    end
end)

-- Уведомление о загрузке
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "ESP Script",
    Text = "ESP скрипт загружен! Нажмите Delete для открытия меню.",
    Duration = 5
})

print("ESP Script загружен успешно!")
print("Нажмите Delete для открытия/закрытия меню")
print("ESP по умолчанию выключен")
