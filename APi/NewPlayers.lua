-- // USELESS CODE \\ --
--|| If you're here because of HTTP spy... sorry but yea... i guess feel free to take this shit..?
--|| Skid :/


local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "BlackFade"
gui.IgnoreGuiInset = true
gui.DisplayOrder = 999999
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 1, 0)
frame.Position = UDim2.new(0, 0, 0, 0)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BackgroundTransparency = 1
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0.4, -40)
title.BackgroundTransparency = 1
title.Text = "Warning"
title.TextColor3 = Color3.fromRGB(255, 200, 0)
title.TextScaled = true
title.Font = Enum.Font.GothamBold

local desc = Instance.new("TextLabel")
desc.Parent = frame
desc.Size = UDim2.new(0.8, 0, 0, 80)
desc.Position = UDim2.new(0.1, 0, 0.5, -20)
desc.BackgroundTransparency = 1
desc.Text = "Please head to 'Settings' and setup your weapon of choice, and enable 'Auto-Equip Weapon', Feel free to also edit tween speed and things.. Thank you"
desc.TextColor3 = Color3.new(1,1,1)
desc.TextWrapped = true
desc.TextScaled = true
desc.Font = Enum.Font.Gotham

local note = Instance.new("TextLabel")
note.Parent = frame
note.Size = UDim2.new(1, 0, 0, 30)
note.Position = UDim2.new(0, 0, 0.75, 0)
note.BackgroundTransparency = 1
note.Text = "(This is a note for new players)"
note.TextColor3 = Color3.new(1,1,1)
note.TextTransparency = 0.8
note.TextScaled = true
note.Font = Enum.Font.Gotham

local fadeIn = TweenService:Create(
    frame,
    TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {BackgroundTransparency = 0.3}
)

fadeIn:Play()

task.delay(4, function()
    local fadeOut = TweenService:Create(
        frame,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
        {BackgroundTransparency = 1}
    )
    fadeOut:Play()
    fadeOut.Completed:Wait()
    gui:Destroy()
end)
