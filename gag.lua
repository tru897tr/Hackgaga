local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Tạo ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CharacterSelectionMenu"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

-- Tạo Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 350, 0, 450)
frame.Position = UDim2.new(0.5, -175, 0.5, -225)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 2
frame.Parent = screenGui

-- Bo góc cho Frame
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- Hàm tạo nút
local function createButton(name, positionY, text, characterModel)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 250, 0, 60)
    button.Position = UDim2.new(0.5, -125, 0, positionY)
    button.BackgroundColor3 = Color3.fromRGB(80, 80, 255)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 20
    button.Font = Enum.Font.SourceSansBold
    button.Parent = frame

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = button

    -- Sự kiện nhấn nút
    button.MouseButton1Click:Connect(function()
        print("Selected character: " .. text)
        -- Logic thay đổi nhân vật (giả lập)
        if characterModel then
            -- Ví dụ: Gửi yêu cầu đến server để thay đổi nhân vật
            game:GetService("ReplicatedStorage"):WaitForChild("ChangeCharacter"):FireServer(characterModel)
        end
        screenGui.Enabled = false
    end)
end

-- Tạo tiêu đề
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 250, 0, 50)
title.Position = UDim2.new(0.5, -125, 0, 10)
title.BackgroundTransparency = 1
title.Text = "Character Selection"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 26
title.Font = Enum.Font.SourceSansBold
title.Parent = frame

-- Tạo các nút chọn nhân vật
createButton("Character1Button", 80, "Warrior", "WarriorModel")
createButton("Character2Button", 150, "Mage", "MageModel")
createButton("Character3Button", 220, "Archer", "ArcherModel")

-- Nút đóng menu
createButton("CloseButton", 290, "Close", function()
    screenGui.Enabled = false
end)
