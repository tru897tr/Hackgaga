local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Tạo ScreenGui để chứa menu
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GrowAGardenMenu"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false -- Không reset GUI khi người chơi respawn

-- Tạo Frame chính cho menu (hình chữ nhật nhỏ)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 150) -- Kích thước nhỏ gọn
frame.Position = UDim2.new(0.5, -100, 0.5, -75) -- Căn giữa màn hình
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Màu nền xám tối
frame.BorderSizePixel = 2
frame.Parent = screenGui

-- Bo góc cho Frame
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10) -- Góc bo tròn nhẹ
corner.Parent = frame

-- Tạo tiêu đề "Grow A Garden"
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 180, 0, 40)
title.Position = UDim2.new(0.5, -90, 0, 10)
title.BackgroundTransparency = 1
title.Text = "Grow A Garden"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 20
title.Font = Enum.Font.SourceSansBold
title.Parent = frame

-- Hàm tạo nút
local function createButton(name, positionY, text, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 150, 0, 40)
    button.Position = UDim2.new(0.5, -75, 0, positionY)
    button.BackgroundColor3 = Color3.fromRGB(100, 100, 255) -- Màu nút xanh
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 16
    button.Font = Enum.Font.SourceSansBold
    button.Parent = frame

    -- Bo góc cho nút
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = button

    -- Sự kiện khi nhấn nút
    button.MouseButton1Click:Connect(callback)
end

-- Tạo nút "Speed Up X"
createButton("SpeedUpButton", 60, "Speed Up X", function()
    print("Executing Speed Up X script...")
    -- Chạy script loadstring từ URL bạn cung cấp
    local success, errorMsg = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end)
    if success then
        print("Script executed successfully!")
    else
        warn("Error executing script: " .. errorMsg)
    end
end)
