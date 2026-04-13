local UserInputService = game:GetService("UserInputService")
local Player = game:GetService("Players").LocalPlayer

local UI = Instance.new("ScreenGui")
UI.Name = "LUNARUI_DISCORD_RED"
UI.Parent = Player:WaitForChild("PlayerGui")

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 200, 0, 140)
Main.Position = UDim2.new(1, -210, 0.5, -70)
Main.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
Main.BackgroundTransparency = 0.6
Main.BorderSizePixel = 0
Main.Parent = UI
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 14)

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 30)
Header.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
Header.BackgroundTransparency = 0.6
Header.BorderSizePixel = 0
Header.Parent = Main
Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 14)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -10, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "DISCORD"
Title.TextColor3 = Color3.fromRGB(255, 120, 120)
Title.TextSize = 14
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Box = Instance.new("Frame")
Box.Size = UDim2.new(1, -10, 0, 45)
Box.Position = UDim2.new(0, 5, 0, 32)
Box.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
Box.BackgroundTransparency = 0.6
Box.BorderSizePixel = 0
Box.Parent = Main
Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 10)

local Desc = Instance.new("TextLabel")
Desc.Size = UDim2.new(1, -6, 1, -6)
Desc.Position = UDim2.new(0, 3, 0, 3)
Desc.BackgroundTransparency = 1
Desc.Text = "Join our discord for updates or bug report"
Desc.TextColor3 = Color3.fromRGB(255, 200, 200)
Desc.TextSize = 12
Desc.Font = Enum.Font.GothamSemibold
Desc.TextWrapped = true
Desc.TextXAlignment = Enum.TextXAlignment.Left
Desc.TextYAlignment = Enum.TextYAlignment.Top
Desc.Parent = Box

local Join = Instance.new("TextButton")
Join.Size = UDim2.new(0.48, 0, 0, 24)
Join.Position = UDim2.new(0, 5, 1, -28)
Join.BackgroundColor3 = Color3.fromRGB(160, 0, 0)
Join.BackgroundTransparency = 0.4
Join.BorderSizePixel = 0
Join.Text = "COPY"
Join.TextColor3 = Color3.fromRGB(255, 220, 220)
Join.TextSize = 12
Join.Font = Enum.Font.GothamBold
Join.Parent = Main
Instance.new("UICorner", Join).CornerRadius = UDim.new(0, 10)

local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0.48, 0, 0, 24)
Close.Position = UDim2.new(0.52, 0, 1, -28)
Close.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
Close.BackgroundTransparency = 0.4
Close.BorderSizePixel = 0
Close.Text = "CLOSE"
Close.TextColor3 = Color3.fromRGB(255, 200, 200)
Close.TextSize = 12
Close.Font = Enum.Font.GothamBold
Close.Parent = Main
Instance.new("UICorner", Close).CornerRadius = UDim.new(0, 10)

Join.MouseButton1Click:Connect(function()
	setclipboard("discord.gg/2CR4umGa92")
end)

Close.MouseButton1Click:Connect(function()
	UI:Destroy()
end)

local dragging, dragInput, dragStart, startPos

Header.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = i.Position
		startPos = Main.Position
		i.Changed:Connect(function()
			if i.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

Header.InputChanged:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then
		dragInput = i
	end
end)

UserInputService.InputChanged:Connect(function(i)
	if i == dragInput and dragging then
		local delta = i.Position - dragStart
		Main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)
