local online = loadstring(game:HttpGet('https://raw.githubusercontent.com/Hydrosploit/Celestial/main/Online', true))()

if online == "123analbeads"
then
else
    game.Players.LocalPlayer:Kick("Script Offline")
end


local blacklist = loadstring(game:HttpGet('https://raw.githubusercontent.com/Hydrosploit/LiveVersion/main/Blacklist', true))()
local playerName = game.Players.LocalPlayer.Name
local isBanned = false

for _, name in ipairs(blacklist) do
    if name == playerName then
        isBanned = true
        break
    end
end

if isBanned then
    game.Players.LocalPlayer:Kick("You are banned from CelestialHub")
else
    print("authenticated")
end

local scriptversion = "0.65"
local liveVersion = loadstring(game:HttpGet('https://raw.githubusercontent.com/Hydrosploit/LiveVersion/main/Main', true))()



game.StarterGui:SetCore("SendNotification", {
	Title = "Game Found",
	Text = (game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name),
	Duration = 3,
	Icon = "rbxassetid://6035190846", 
	
})


repeat task.wait() until game:IsLoaded() and game:GetService"Players".LocalPlayer:GetMouse()

local Library, Utilities, Connections = {

	Closed = false,
	Destroyed = false,
	IsMinimizing = false,
	CurrentTab = nil,

}, {}, {}

local Players = game:GetService"Players"

local Client = Players.LocalPlayer

local Mouse = Client:GetMouse()

local TweenService, UserInputService, RunService = game:GetService"TweenService", game:GetService"UserInputService", game:GetService"RunService"

local BannedKeys, ShortNames = {
	Return = true,
	Space = true,
	Tab = true,
	Backquote = true,
	CapsLock = true,
	Escape = true,
	Unknown = true,
}, {
	RightControl = "Right Ctrl",
	LeftControl = "Left Ctrl",
	LeftShift = "Left Shift",
	RightShift = "Right Shift",
	Semicolon = ";",
	Quote = '"',
	LeftBracket = "[",
	RightBracket = "]",
	Equals = "=",
	Minus = "-",
	RightAlt = "Right Alt",
	LeftAlt = "Left Alt"
}

function Utilities:Tween(Obj, Duration, Props, ...)

	return TweenService:Create(Obj, TweenInfo.new(Duration, ...), Props):Play()

end

function Utilities:Drag(Frame, Hold)

	Hold = Hold or Frame

	local Dragging, DragInput, DragStart, StartPos

	function Utilities:Update(Input)

		local Delta = Input.Position - DragStart

		Frame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)

	end

	Hold.InputBegan:Connect(function(Input)

		if Input.UserInputType == Enum.UserInputType.MouseButton1 then

			Dragging, DragStart, StartPos = true, Input.Position, Frame.Position

			Input.Changed:Connect(function()

				if Input.UserInputState == Enum.UserInputState.End then

					Dragging = false

				end

			end)

		end

	end)

	Frame.InputChanged:Connect(function(Input)

		if Input.UserInputType == Enum.UserInputType.MouseMovement then

			DragInput = Input

		end

	end)

	UserInputService.InputChanged:Connect(function(Input)

		if Input == DragInput and Dragging then

			Utilities:Update(Input)

		end

	end)

end

function Utilities:Minimize(Frame, Destroy)

	if Library.IsMinimizing then

		return

	end

	Library.IsMinimizing = true

	Utilities:Tween(Frame, .5, {Size = UDim2.new(0, 530,0, ((Library.Closed or Destroy) and 35) or 348)})

	Library.Closed = not Library.Closed

	if Destroy then

		task.wait(.9)

		Frame:Destroy()

	end

	Library.IsMinimizing = false

end

function Utilities:ChangeTab(Tab, Holder)

	if Library.IsChangingTab or (Library.CurrentTab and Library.CurrentTab[1] == Tab) then

		return

	end

	if Library.CurrentTab then

		Library.CurrentTab[2].Visible = false
		Utilities:Tween(Library.CurrentTab[1].TabLine, .5, {Size = UDim2.new(0, 0, 0, 1)})

	end

	Utilities:Tween(Tab.TabLine, .5, {Size = UDim2.new(0, 119, 0, 1)})
	Holder.Visible = true

	Library.CurrentTab = {Tab, Holder}

end

function Utilities:ButtonAnimation(Btn)

	Utilities:Tween(Btn, .1, {Size = UDim2.new(0, 348,0, 31)})
	task.wait(.1)
	Utilities:Tween(Btn, .1, {Size = UDim2.new(0, 358,0, 31)})

end

local PlayerList = Players:GetPlayers()

local PlayerAdded = Players.PlayerAdded:Connect(function(Player)

	rawset(PlayerList, #PlayerList + 1, tostring(Player))

end)

local PlayerRemoved = Players.PlayerRemoving:Connect(function(Player)

	table.remove(PlayerList, table.find(PlayerList, tostring(Player)))

end)

function Utilities:GetPlayers()

	return PlayerList

end

function Utilities:Load(UI)

	local Facts = {"It takes 8 minutes for light to reach earth from the sun.", "Light cannot escape a black hole." ,"Our galaxy spans over 100,000 light-years."}

	local Fact  = Facts[math.random(1, #Facts)]

	local Load = Instance.new("Frame")
	local LoadC = Instance.new("UICorner")
	local OuterL = Instance.new("Frame")
	local OuterC = Instance.new("UICorner")
	local InnerL = Instance.new("Frame")
	local InnerC = Instance.new("UICorner")
	local LoadingText = Instance.new("TextLabel")
	local Console = Instance.new("ScrollingFrame")
	local ConsoleC = Instance.new("UICorner")
	local FunFact = Instance.new("TextLabel")
	local FunFact_2 = Instance.new("TextLabel")
	local ConsoleP = Instance.new("UIPadding")
	local ConsoleLL = Instance.new("UIListLayout")

	Load.Name = "Load"
	Load.Parent = UI
	Load.Active = true
	Load.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
	Load.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Load.BorderSizePixel = 0
	Load.ClipsDescendants = true
	Load.Position = UDim2.new(0.00377358496, 0, 0.103448279, 0)
	Load.Size = UDim2.new(0, 528, 0, 311)
	Load.ZIndex = 5

	LoadC.CornerRadius = UDim.new(0, 6)
	LoadC.Name = "LoadC"
	LoadC.Parent = Load

	OuterL.Name = "OuterL"
	OuterL.Parent = Load
	OuterL.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	OuterL.BorderColor3 = Color3.fromRGB(0, 0, 0)
	OuterL.BorderSizePixel = 0
	OuterL.Position = UDim2.new(0.172217861, 0, 0.148458302, 0)
	OuterL.Size = UDim2.new(0, 344, 0, 19)
	OuterL.ZIndex = 6

	OuterC.CornerRadius = UDim.new(1, 0)
	OuterC.Name = "OuterC"
	OuterC.Parent = OuterL

	InnerL.Name = "InnerL"
	InnerL.Parent = OuterL
	InnerL.BackgroundColor3 = Color3.fromRGB(0, 81, 255)
	InnerL.BorderColor3 = Color3.fromRGB(0, 0, 0)
	InnerL.BorderSizePixel = 0
	InnerL.Position = UDim2.new(-0.000180976334, 0, 0.0436562002, 0)
	InnerL.Size = UDim2.new(0, 0, 0, 18)
	InnerL.ZIndex = 6

	InnerC.CornerRadius = UDim.new(1, 0)
	InnerC.Name = "InnerC"
	InnerC.Parent = InnerL

	LoadingText.Name = "LoadingText"
	LoadingText.Parent = Load
	LoadingText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LoadingText.BackgroundTransparency = 1.000
	LoadingText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LoadingText.BorderSizePixel = 0
	LoadingText.Position = UDim2.new(0.297312886, 0, 0.0270919558, 0)
	LoadingText.Size = UDim2.new(0, 213, 0, 29)
	LoadingText.ZIndex = 6
	LoadingText.Font = Enum.Font.Gotham
	LoadingText.Text = "Fetching Game Script"
	LoadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
	LoadingText.TextSize = 21.000

	Console.Name = "Console"
	Console.Parent = Load
	Console.Active = true
	Console.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Console.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Console.BorderSizePixel = 0
	Console.Position = UDim2.new(0.0150208911, 0, 0.250755578, 0)
	Console.Size = UDim2.new(0, 509, 0, 163)
	Console.ZIndex = 6
	Console.CanvasPosition = Vector2.new(0, 0)
	Console.ScrollBarThickness = 0
	Console.CanvasSize = UDim2.new(0, 0)

	ConsoleC.CornerRadius = UDim.new(0, 6)
	ConsoleC.Name = "ConsoleC"
	ConsoleC.Parent = Console

	FunFact.Name = "FunFact"
	FunFact.Parent = Load
	FunFact.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	FunFact.BackgroundTransparency = 1.000
	FunFact.BorderColor3 = Color3.fromRGB(0, 0, 0)
	FunFact.BorderSizePixel = 0
	FunFact.Position = UDim2.new(0.00564609887, 0, 0.889949083, 0)
	FunFact.Size = UDim2.new(0, 517, 0, 20)
	FunFact.ZIndex = 6
	FunFact.Font = Enum.Font.Gotham
	FunFact.Text = string.format(Fact)
	FunFact.TextColor3 = Color3.fromRGB(255, 255, 255)
	FunFact.TextSize = 17.000

	FunFact_2.Name = "FunFact"
	FunFact_2.Parent = Load
	FunFact_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	FunFact_2.BackgroundTransparency = 1.000
	FunFact_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	FunFact_2.BorderSizePixel = 0
	FunFact_2.Position = UDim2.new(0.301100761, 0, 0.796701491, 0)
	FunFact_2.Size = UDim2.new(0, 205, 0, 23)
	FunFact_2.ZIndex = 6
	FunFact_2.Font = Enum.Font.Gotham
	FunFact_2.Text = "Space Fact"
	FunFact_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	FunFact_2.TextSize = 27.000

	ConsoleP.Name = "ConsoleP"
	ConsoleP.Parent = Console
	ConsoleP.PaddingLeft = UDim.new(0, 6)
	ConsoleP.PaddingTop = UDim.new(0, 5)

	ConsoleLL.Name = "ConsoleLL"
	ConsoleLL.Parent = Console
	ConsoleLL.SortOrder = Enum.SortOrder.LayoutOrder
	ConsoleLL.VerticalAlignment = Enum.VerticalAlignment.Bottom

	local authseconds = string.format("[AUTH]: Authenticated in %.11f seconds", math.random())
	local playerusername = Players.LocalPlayer.Name

	local hwid = game:GetService("RbxAnalyticsService"):GetClientId()

	local LoadMsg = {

		"[AUTH]: Authenticating... Please Wait",
		authseconds,
		"[LOAD]: " ..playerusername .. " is not premium",
		"[LOAD]: Initializing UI Features ",
		"[LOAD]: Initializing Services",
		"[LOAD]: Creating tab Games",
		"[LOAD]: Creating tab Client",
		"[LOAD]: Creating tab Teleports",
		"[LOAD]: Creating tab Premium",
		"[LOAD]: Creating tab World",
		"[LOAD]: Creating tab Autofarm",
		"[LOAD]: Creating tab Trolling",
		"[LOAD]: Creating tab Settings",
		"[LOAD]: Fetching HWID",
		"[LOAD]: Checking ban status",
		"[LOAD]: " .. hwid .. " is not banned",
		"[LOAD]: Loading saved configuration",	
		"[LOAD]: Config Failed.. User: " .. playerusername .. ", Premium = false",	
		"[LOAD]: Fetching Current Version",
		"[LOAD]: Current version is " .. liveVersion,
		"[LOAD]: Success! Loading CelestialHub V" .. liveVersion,

	}

	InnerL:GetPropertyChangedSignal("Size"):Connect(function()

		if InnerL.Size.X.Scale >= 1 then

			task.wait(1.5)

			Load:Destroy()

		end

	end)

	local function SendMessage(Msg)

		local Message = Instance.new("TextLabel")

		Message.Name = "Message"
		Message.Parent = Console
		Message.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Message.BackgroundTransparency = 1.000
		Message.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Message.BorderSizePixel = 0
		Message.Size = UDim2.new(0, 494, 0, 19)
		Message.ZIndex = 6
		Message.Font = Enum.Font.Gotham
		Message.Text = Msg
		Message.TextColor3 = Color3.fromRGB(255, 255, 255)
		Message.TextSize = 16.000
		Message.TextXAlignment = Enum.TextXAlignment.Left

	end

	local function UpdateProgress(Index)

		local NewVal = Index / #LoadMsg

		Utilities:Tween(InnerL, .5, {Size = UDim2.new(NewVal, 0, 0, 18)})

		SendMessage(LoadMsg[Index])

	end

	for i, v in next, LoadMsg do

		UpdateProgress(i)

		task.wait(math.random() * 0.8 + 0.2)

	end

	return 

end

function Library:Notify(Name, Msg, Duration)
    local Noti = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Top = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local TopBar = Instance.new("Frame")
    local Message = Instance.new("TextLabel")

    Noti.Name = "Noti"
    Noti.DisplayOrder = 10 
    Noti.Parent = game.CoreGui 

    Main.Name = "Main"
    Main.Parent = Noti
    Main.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(1, -339, 1, -210)
    Main.Size = UDim2.new(0, 339, 0, 171)

    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = Main

    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(0, 81, 255)
    Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Top.BorderSizePixel = 0
    Top.Size = UDim2.new(0, 338, 0, 39)

    UICorner_2.CornerRadius = UDim.new(0, 6)
    UICorner_2.Parent = Top

    Title.Name = "Title"
    Title.Parent = Top
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(0.0207100585, 0, 0.102564104, 0)
    Title.Size = UDim2.new(0, 324, 0, 31)
    Title.ZIndex = 3
    Title.Font = Enum.Font.Gotham
    Title.Text = Name
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 25.000

    TopBar.Name = "TopBar"
    TopBar.Parent = Main
    TopBar.BackgroundColor3 = Color3.fromRGB(0, 81, 255)
    TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TopBar.BorderSizePixel = 0
    TopBar.Position = UDim2.new(0, 0, 0.157894731, 0)
    TopBar.Size = UDim2.new(0, 338, 0, 12)

    Message.Name = "Message"
    Message.Parent = Main
    Message.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Message.BackgroundTransparency = 1.000
    Message.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Message.BorderSizePixel = 0
    Message.Position = UDim2.new(0.0177601501, 0, 0.318938315, 0)
    Message.Size = UDim2.new(0, 324, 0, 104)
    Message.ZIndex = 3
    Message.Font = Enum.Font.Gotham
    Message.Text = Msg
    Message.TextColor3 = Color3.fromRGB(255, 255, 255)
    Message.TextSize = 22.000
    Message.TextWrapped = true
    Message.TextXAlignment = Enum.TextXAlignment.Left
    Message.TextYAlignment = Enum.TextYAlignment.Top

    task.wait(Duration)

    Noti:Destroy()
end

function Library:Init(Name, UIVersion, Load)

	local Parent = RunService:IsStudio() and Client:WaitForChild("PlayerGui") or game.CoreGui

	if Parent:FindFirstChild("Celestial") then

		Parent.Celestial:Destroy()

	end

	assert(Name, "A name is required")

	local Celestial = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local MainC = Instance.new("UICorner")
	local Strip = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local Exit = Instance.new("ImageButton")
	local Minimize = Instance.new("ImageButton")
	local Side = Instance.new("Frame")
	local SideC = Instance.new("UICorner")
	local TabHolder = Instance.new("ScrollingFrame")
	local TabHolderLL = Instance.new("UIListLayout")
	local TabHolderP = Instance.new("UIPadding")

	Celestial.Name = "Celestial"
	Celestial.Parent = Parent
	Celestial.ResetOnSpawn = false

	Main.Name = "Main"
	Main.Parent = Celestial
	Main.Active = true
	Main.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.ClipsDescendants = true
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 530, 0, 348)
	

	MainC.CornerRadius = UDim.new(0, 6)
	MainC.Name = "MainC"
	MainC.Parent = Main

	Strip.Name = "Strip"
	Strip.Parent = Main
	Strip.BackgroundColor3 = Color3.fromRGB(0, 81, 255)
	Strip.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Strip.BorderSizePixel = 0
	Strip.Position = UDim2.new(0, 0, 0, 35)
	Strip.Size = UDim2.new(0, 530, 0, 1)

	Title.Name = "Title"
	Title.Parent = Main
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0, 2, 0, 6)
	Title.Size = UDim2.new(0, 80, 0, 21)
	Title.Font = Enum.Font.GothamBold
	Title.Text = string.format("  %s", Name)
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 20.000
	Title.TextXAlignment = Enum.TextXAlignment.Left

	if UIVersion then
		local Version = Instance.new("TextLabel")
		Version.Name = "Version"
		Version.Parent = Main
		Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Version.BackgroundTransparency = 1.000
		Version.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Version.BorderSizePixel = 0
		Version.Position = UDim2.new(0, 80, 0, 6)
		Version.Size = UDim2.new(0, 41, 0, 21)
		Version.Font = Enum.Font.GothamBold
		Version.Text = UIVersion
		Version.TextColor3 = Color3.fromRGB(0, 81, 255)
		Version.TextSize = 20.000
		Version.TextXAlignment = Enum.TextXAlignment.Left
	
		-- Tween through rainbow colors
		local TweenService = game:GetService("TweenService")
		local tweenInfo = TweenInfo.new(
			4, -- Time
			Enum.EasingStyle.Linear,
			Enum.EasingDirection.InOut,
			-1,
			true,
			0
		)
	
		local rainbowColors = {
			Color3.fromRGB(0, 81, 255),
			Color3.fromRGB(255, 255, 255),
		}
	
		-- Function to tween through rainbow colors
		local function tweenRainbow(label)
			local index = 1
			local function tweenNextColor()
				index = (index % #rainbowColors) + 1
				local tween = TweenService:Create(label, tweenInfo, {TextColor3 = rainbowColors[index]})
				tween.Completed:Connect(tweenNextColor)
				tween:Play()
			end
			tweenNextColor()
		end
	
		tweenRainbow(Version)
	end
	



	if Load then

		Utilities:Load(Main)

	end

	Exit.Name = "Exit"
	Exit.Parent = Main
	Exit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Exit.BackgroundTransparency = 1.000
	Exit.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Exit.BorderSizePixel = 0
	Exit.Position = UDim2.new(0, 498, 0, 3)
	Exit.Size = UDim2.new(0, 25, 0, 25)
	Exit.Image = "rbxassetid://17484949231"

	Minimize.Name = "Minimize"
	Minimize.Parent = Main
	Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Minimize.BackgroundTransparency = 1.000
	Minimize.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Minimize.BorderSizePixel = 0
	Minimize.Position = UDim2.new(0, 467, 0, 3)
	Minimize.Size = UDim2.new(0, 25, 0, 25)
	Minimize.Image = "rbxassetid://17484965771"

	Side.Name = "Side"
	Side.Parent = Main
	Side.Active = true
	Side.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
	Side.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Side.BorderSizePixel = 0
	Side.Position = UDim2.new(0, 2, 0, 36)
	Side.Size = UDim2.new(0, 129, 0, 312)

	SideC.CornerRadius = UDim.new(0, 6)
	SideC.Name = "SideC"
	SideC.Parent = Side

	TabHolder.Name = "TabHolder"
	TabHolder.Parent = Side
	TabHolder.Active = true
	TabHolder.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
	TabHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabHolder.BorderSizePixel = 0
	TabHolder.Position = UDim2.new(0, 0, 0, 6)
	TabHolder.Size = UDim2.new(0, 125, 0, 299)
	TabHolder.ScrollBarThickness = 0

	TabHolderLL.Name = "TabHolderLL"
	TabHolderLL.Parent = TabHolder
	TabHolderLL.SortOrder = Enum.SortOrder.LayoutOrder
	TabHolderLL.Padding = UDim.new(0, 5)

	TabHolderP.Name = "TabHolderP"
	TabHolderP.Parent = TabHolder
	TabHolderP.PaddingLeft = UDim.new(0, 4)
	TabHolderP.PaddingTop = UDim.new(0, 7)

	TabHolderLL:GetPropertyChangedSignal"AbsoluteContentSize":Connect(function()

		TabHolder.CanvasSize = UDim2.new(0, 0, 0, TabHolderLL.AbsoluteContentSize.Y + 14)

	end)


	Utilities:Drag(Main)

	Minimize.MouseButton1Click:Connect(function()

		Utilities:Minimize(Main)

	end)

	Exit.MouseButton1Click:Connect(function()

		Utilities:Minimize(Main, true)

	end)

	local Tabs = {}

	function Tabs:Tab(Name, IconID)

		assert(Name, "A name is required")

		local Tab = Instance.new("TextButton")
		local Title = Instance.new("TextLabel")
		local Icon = Instance.new("ImageLabel")
		local TabC = Instance.new("UICorner")
		local TabLine = Instance.new("Frame")
		local Holder = Instance.new("ScrollingFrame")
		local HolderLL = Instance.new("UIListLayout")
		local HolderP = Instance.new("UIPadding")

		Tab.Name = "Tab"
		Tab.Parent = TabHolder
		Tab.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		Tab.BorderSizePixel = 0
		Tab.Size = UDim2.new(0, 119, 0, 31)
		Tab.ZIndex = 3
		Tab.AutoButtonColor = false
		Tab.Font = Enum.Font.Gotham
		Tab.Text = ""
		Tab.TextSize = 14.000

		Title.Name = "Title"
		Title.Parent = Tab
		Title.AnchorPoint = Vector2.new(0, 0.5)
		Title.BackgroundTransparency = 1.000
		Title.Position = UDim2.new(-0.0780716613, 40, 0.483872145, 0)
		Title.Size = UDim2.new(0.103282258, 76, 0.645159662, 0)
		Title.ZIndex = 3
		Title.Font = Enum.Font.GothamMedium
		Title.Text = Name
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextSize = 14.000
		Title.TextXAlignment = Enum.TextXAlignment.Left

		Icon.Name = "Icon"
		Icon.Parent = Tab
		Icon.AnchorPoint = Vector2.new(0, 0.5)
		Icon.BackgroundTransparency = 1.000
		Icon.Position = UDim2.new(-0.050999999, 12, 0.5, 0)
		Icon.Size = UDim2.new(0, 19, 0, 19)
		Icon.ZIndex = 3
		Icon.Image = string.format("rbxassetid://%s", IconID)
		Icon.ScaleType = Enum.ScaleType.Fit

		TabC.CornerRadius = UDim.new(0, 3)
		TabC.Name = "TabC"
		TabC.Parent = Tab

		TabLine.Name = "TabLine"
		TabLine.Parent = Tab
		TabLine.BackgroundColor3 = Color3.fromRGB(0, 81, 255)
		TabLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabLine.BorderSizePixel = 0
		TabLine.Position = UDim2.new(0.00277325278, 0, 0.934999526, 0)
		TabLine.Size = UDim2.new(0, 0, 0, 1)
		TabLine.ZIndex = 4

		Holder.Name = "Holder"
		Holder.Parent = Main
		Holder.Active = true
		Holder.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
		Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Holder.BorderSizePixel = 0
		Holder.Position = UDim2.new(0, 140, 0, 41)
		Holder.Size = UDim2.new(0, 383, 0, 299)
		Holder.ScrollBarThickness = 3
		Holder.Visible = false
		Holder.ScrollBarImageColor3 = Color3.fromRGB(47, 47, 47)

		HolderLL.Name = "HolderLL"
		HolderLL.Parent = Holder
		HolderLL.SortOrder = Enum.SortOrder.LayoutOrder
		HolderLL.Padding = UDim.new(0, 6)

		HolderP.Name = "HolderP"
		HolderP.Parent = Holder
		HolderP.PaddingTop = UDim.new(0, 6)

		HolderLL:GetPropertyChangedSignal"AbsoluteContentSize":Connect(function()

			Holder.CanvasSize = UDim2.new(0, 0, 0, HolderLL.AbsoluteContentSize.Y + 14)

		end)

		if not Library.CurrentTab then

			Utilities:ChangeTab(Tab, Holder)

		end

		Tab.MouseButton1Click:Connect(function()

			Utilities:ChangeTab(Tab, Holder)

		end)

		local Sections = {}

		function Sections:Section(Name)

			local Section = Instance.new("Frame")
			local SectionC = Instance.new("UICorner")
			local Title = Instance.new("TextLabel")
			local TitleLine = Instance.new("Frame")
			local SectionP = Instance.new("UIPadding")
			local SectionLL = Instance.new("UIListLayout")

			Section.Name = "Section"
			Section.Parent = Holder
			Section.Active = true
			Section.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Section.BorderSizePixel = 0
			Section.Position = UDim2.new(0, 0, 0, -153)
			Section.Size = UDim2.new(0, 370, 0, 370)

			SectionC.CornerRadius = UDim.new(0, 5)
			SectionC.Name = "SectionC"
			SectionC.Parent = Section

			Title.Name = "Title"
			Title.Parent = Section
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title.BorderSizePixel = 0
			Title.Size = UDim2.new(0, 376, 0, 26)
			Title.Font = Enum.Font.GothamBold
			Title.Text = Name
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 14.000
			Title.TextXAlignment = Enum.TextXAlignment.Left
			Title.TextYAlignment = Enum.TextYAlignment.Top

			TitleLine.Name = "TitleLine"
			TitleLine.Parent = Title
			TitleLine.BackgroundColor3 = Color3.fromRGB(0, 81, 255)
			TitleLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TitleLine.BorderSizePixel = 0
			TitleLine.Position = UDim2.new(0, 0, 0, 17)
			TitleLine.Size = UDim2.new(0, 164, 0, 1)

			SectionP.Name = "SectionP"
			SectionP.Parent = Section
			SectionP.PaddingLeft = UDim.new(0, 6)
			SectionP.PaddingTop = UDim.new(0, 6)

			SectionLL.Name = "SectionLL"
			SectionLL.Parent = Section
			SectionLL.SortOrder = Enum.SortOrder.LayoutOrder
			SectionLL.Padding = UDim.new(0, 6)

			SectionLL:GetPropertyChangedSignal"AbsoluteContentSize":Connect(function()

				Section.Size = UDim2.new(0, 370, 0, SectionLL.AbsoluteContentSize.Y + 14)

			end)

			local Components = {}

			function Components:Button(Name, CallBack)

				Name, CallBack = Name or "Button", CallBack or function() end

				local Button = Instance.new("TextButton")
				local ButtonC = Instance.new("UICorner")

				Button.Name = "Button"
				Button.Parent = Section
				Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Button.BorderColor3 = Color3.fromRGB(47, 47, 47)
				Button.BorderSizePixel = 0
				Button.Position = UDim2.new(0, 0, 0, 47)
				Button.Size = UDim2.new(0, 358, 0, 31)
				Button.AutoButtonColor = false
				Button.Font = Enum.Font.Gotham
				Button.Text = string.format("  %s", Name)
				Button.TextColor3 = Color3.fromRGB(255, 255, 255)
				Button.TextSize = 12.000
				Button.TextXAlignment = Enum.TextXAlignment.Left

				ButtonC.CornerRadius = UDim.new(0, 4)
				ButtonC.Name = "ButtonC"
				ButtonC.Parent = Button

				Button.MouseButton1Click:Connect(function()

					task.spawn(CallBack)
					Utilities:ButtonAnimation(Button)

				end)

				return Button

			end

			function Components:Toggle(Name, Default, CallBack)

				Name, Default, CallBack = Name or "Toggle", Default or false, CallBack or function() end

				local Toggle = Instance.new("TextButton")
				local ToggleC = Instance.new("UICorner")
				local Inner = Instance.new("Frame")
				local InnerC = Instance.new("UICorner")
				local Circle = Instance.new("Frame")
				local CircleC = Instance.new("UICorner")

				Toggle.Name = "Toggle"
				Toggle.Parent = Section
				Toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Toggle.BorderColor3 = Color3.fromRGB(47, 47, 47)
				Toggle.BorderSizePixel = 0
				Toggle.Position = UDim2.new(0, 0, 0, 47)
				Toggle.Size = UDim2.new(0, 358, 0, 31)
				Toggle.AutoButtonColor = false
				Toggle.Font = Enum.Font.Gotham
				Toggle.Text = string.format("  %s", Name)
				Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
				Toggle.TextSize = 12.000
				Toggle.TextXAlignment = Enum.TextXAlignment.Left

				ToggleC.CornerRadius = UDim.new(0, 4)
				ToggleC.Name = "ToggleC"
				ToggleC.Parent = Toggle

				Inner.Name = "Inner"
				Inner.Parent = Toggle
				Inner.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
				Inner.BorderSizePixel = 0
				Inner.Position = UDim2.new(0.8436535, 0, 0.179000363, 0)
				Inner.Size = UDim2.new(0, 49, 0, 19)
				Inner.ZIndex = 3

				InnerC.CornerRadius = UDim.new(0, 4)
				InnerC.Name = "InnerC"
				InnerC.Parent = Inner

				Circle.Name = "Circle"
				Circle.Parent = Inner
				Circle.BackgroundColor3 = Color3.fromRGB(255, 89, 89)
				Circle.BorderSizePixel = 0
				Circle.Position = UDim2.new(0, 3, 0.158000007, 0)
				Circle.Size = UDim2.new(0, 21, 0, 13)
				Circle.ZIndex = 3

				CircleC.CornerRadius = UDim.new(0, 3)
				CircleC.Name = "CircleC"
				CircleC.Parent = Circle

				local ToggleColors = {

					[true] = Color3.fromRGB(91, 154, 76),
					[false] = Color3.fromRGB(255, 89, 89)

				}

				local Funcs, CurrentState = {}, false

				function Funcs.SetState(self, State)

					State = State or not CurrentState

					if State == CurrentState then

						return false, warn"state already set"

					end

					CurrentState = State

					Utilities:Tween(Circle, .5, {Position = UDim2.new(0, (State and 24) or 3, 0.158, 0), BackgroundColor3 = ToggleColors[State]})

					CallBack(State)

				end

				if Default then

					Funcs:SetState(Default)

				end

				Toggle.MouseButton1Click:Connect(function()

					Funcs:SetState()

				end)

				return Funcs

			end

			function Components:Slider(Name, Default, Min, Max, CallBack)

				Name, Default, Min, Max, CallBack = Name or "Slider", Default or 1, Min or 1, Max or 100, CallBack or function() end

				local Slider = Instance.new("TextButton")
				local ButtonC = Instance.new("UICorner")
				local Title = Instance.new("TextLabel")
				local Number = Instance.new("TextBox")
				local Inner = Instance.new("Frame")
				local InnerC = Instance.new("UICorner")
				local Fill = Instance.new("Frame")
				local FillC = Instance.new("UICorner")

				Slider.Name = "Slider"
				Slider.Parent = Section
				Slider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Slider.BorderColor3 = Color3.fromRGB(47, 47, 47)
				Slider.BorderSizePixel = 0
				Slider.Position = UDim2.new(0, 0, 0, 158)
				Slider.Size = UDim2.new(0, 358, 0, 31)
				Slider.AutoButtonColor = false
				Slider.Font = Enum.Font.Gotham
				Slider.Text = ""
				Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
				Slider.TextSize = 12.000
				Slider.TextXAlignment = Enum.TextXAlignment.Left

				ButtonC.CornerRadius = UDim.new(0, 4)
				ButtonC.Name = "ButtonC"
				ButtonC.Parent = Slider

				Title.Name = "Title"
				Title.Parent = Slider
				Title.BackgroundTransparency = 1.000
				Title.Position = UDim2.new(0, 0, 0, 7)
				Title.Size = UDim2.new(0, 125, 0, 18)
				Title.ZIndex = 3
				Title.Font = Enum.Font.Gotham
				Title.Text = string.format("  %s", Name)
				Title.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title.TextSize = 13.000
				Title.TextTransparency = 0.100
				Title.TextXAlignment = Enum.TextXAlignment.Left

				Number.Name = "Number"
				Number.Parent = Slider
				Number.BackgroundTransparency = 1.000
				Number.BorderSizePixel = 0
				Number.Position = UDim2.new(0, 327, 0, 8)
				Number.Size = UDim2.new(0, 24, 0, 16)
				Number.ZIndex = 3
				Number.ClearTextOnFocus = true
				Number.Font = Enum.Font.GothamMedium
				Number.Text = "100"
				Number.TextColor3 = Color3.fromRGB(255, 255, 255)
				Number.TextSize = 12.000
				Number.TextXAlignment = Enum.TextXAlignment.Right

				Inner.Name = "Inner"
				Inner.Parent = Slider
				Inner.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
				Inner.BorderSizePixel = 0
				Inner.Position = UDim2.new(0, 131, 0, 12)
				Inner.Size = UDim2.new(0, 190, 0, 8)
				Inner.ZIndex = 3

				InnerC.CornerRadius = UDim.new(0, 10)
				InnerC.Name = "InnerC"
				InnerC.Parent = Inner

				Fill.Name = "Fill"
				Fill.Parent = Inner
				Fill.BackgroundColor3 = Color3.fromRGB(0, 81, 255)
				Fill.BorderSizePixel = 0
				Fill.Position = UDim2.new(0.000124318976, 0, 0, 0)
				Fill.Size = UDim2.new(0.537774205, 0, 0.500001431, 4)
				Fill.ZIndex = 3

				FillC.CornerRadius = UDim.new(0, 10)
				FillC.Name = "FillC"
				FillC.Parent = Fill

				local Funcs = {}

				function Funcs.SetValue(self, Value)

					local Percent = (Mouse.X - Inner.AbsolutePosition.X) / Inner.AbsoluteSize.X

					if Value then

						Percent = (Value - Min) / (Max - Min)

					end

					Percent = math.clamp(Percent, 0, 1)

					Value = Value or math.floor(Min + (Max - Min) * Percent)

					Number.Text = tostring(Value)

					Utilities:Tween(Fill, .1, {Size = UDim2.new(Percent, 0, 1, 0)})

					CallBack(tonumber(Value))

				end

				Funcs:SetValue(Default)

				local Dragging, BoxFocused, Allowed = false, false, {[""] = true, ["-"] = true}

				Inner.InputBegan:Connect(function(Input)

					if Input.UserInputType == Enum.UserInputType.MouseButton1 then

						Funcs:SetValue()
						Dragging = true

					end

				end)

				UserInputService.InputEnded:Connect(function(Input)

					if Dragging and Input.UserInputType == Enum.UserInputType.MouseButton1 then

						Dragging = false

					end

				end)

				UserInputService.InputChanged:Connect(function(Input)

					if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then

						Funcs:SetValue()

					end

				end)

				Number.Focused:Connect(function()

					BoxFocused = true

				end)

				Number.FocusLost:Connect(function()

					if not tonumber(Number.Text) then

						Number.Text = Default

					end

					if tonumber(Number.Text) < Min then

						Funcs:SetValue(Min)

					end

					BoxFocused = false

				end)

				Number:GetPropertyChangedSignal"Text":Connect(function()

					if not BoxFocused then

						return

					end

					if Number.Text == "" then

						return

					end

					local text = Number.Text

					if not tonumber(Number.Text) then 

						Number.Text = ""

					end

					if tonumber(Number.Text) > Max then

						Funcs:SetValue(Max)

					end

					Funcs:SetValue(tonumber(Number.Text))

				end)

			end

			function Components:TextBox(Name, Default, CallBack)

				Name, Default, CallBack = Name or "TextBox", Default or "Text", CallBack or function() end

				local TextBox = Instance.new("TextButton")
				local TextBoxC = Instance.new("UICorner")
				local Input = Instance.new("TextBox")
				local InputC = Instance.new("UICorner")

				TextBox.Name = "TextBox"
				TextBox.Parent = Section
				TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				TextBox.BorderColor3 = Color3.fromRGB(47, 47, 47)
				TextBox.BorderSizePixel = 0
				TextBox.Position = UDim2.new(0, 0, 0, 47)
				TextBox.Size = UDim2.new(0, 358, 0, 31)
				TextBox.AutoButtonColor = false
				TextBox.Font = Enum.Font.Gotham
				TextBox.Text = string.format("  %s", Name)
				TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.TextSize = 12.000
				TextBox.TextXAlignment = Enum.TextXAlignment.Left

				TextBoxC.CornerRadius = UDim.new(0, 4)
				TextBoxC.Name = "TextBoxC"
				TextBoxC.Parent = TextBox

				Input.Name = "Input"
				Input.Parent = TextBox
				Input.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
				Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Input.BorderSizePixel = 0
				Input.Position = UDim2.new(0.796167493, 0, 0.179000363, 0)
				Input.Size = UDim2.new(0, 65, 0, 19)
				Input.Font = Enum.Font.Gotham
				Input.Text = Default
				Input.TextColor3 = Color3.fromRGB(255, 255, 255)
				Input.TextSize = 12.000
				Input.TextWrapped = true

				InputC.CornerRadius = UDim.new(0, 4)
				InputC.Name = "InputC"
				InputC.Parent = Input

				Input.FocusLost:Connect(function()

					if Input.Text == "" then

						Input.Text = Default


					end

					CallBack(Input.Text)

				end)

			end

			function Components:KeyBind(Name, Default, CallBack)

				Name, Default, CallBack = Name or "KeyBind", Default or "None", CallBack or function() end

				Default = (typeof(Default) == "string" and Enum.KeyCode[Default] or Default)

				local KeyTxt, BindKey = (Default and (ShortNames[Default.Name] or Default.Name) or "None"), Default

				local KeyBind = Instance.new("TextButton")
				local KeyBindC = Instance.new("UICorner")
				local Input = Instance.new("TextButton")
				local InputC = Instance.new("UICorner")

				KeyBind.Name = "KeyBind"
				KeyBind.Parent = Section
				KeyBind.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				KeyBind.BorderColor3 = Color3.fromRGB(47, 47, 47)
				KeyBind.BorderSizePixel = 0
				KeyBind.Position = UDim2.new(0, 0, 0, 47)
				KeyBind.Size = UDim2.new(0, 358, 0, 31)
				KeyBind.AutoButtonColor = false
				KeyBind.Font = Enum.Font.Gotham
				KeyBind.Text = string.format("  %s", Name)
				KeyBind.TextColor3 = Color3.fromRGB(255, 255, 255)
				KeyBind.TextSize = 12.000
				KeyBind.TextXAlignment = Enum.TextXAlignment.Left

				KeyBindC.CornerRadius = UDim.new(0, 4)
				KeyBindC.Name = "KeyBindC"
				KeyBindC.Parent = KeyBind

				Input.Name = "Input"
				Input.Parent = KeyBind
				Input.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
				Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Input.BorderSizePixel = 0
				Input.Position = UDim2.new(0.796167493, 0, 0.179000363, 0)
				Input.Size = UDim2.new(0, 65, 0, 19)
				Input.Font = Enum.Font.Gotham
				Input.Text = KeyTxt
				Input.TextColor3 = Color3.fromRGB(255, 255, 255)
				Input.TextSize = 12.000
				Input.TextWrapped = true
				Input.AutoButtonColor = false

				InputC.CornerRadius = UDim.new(0, 4)
				InputC.Name = "InputC"
				InputC.Parent = Input

				UserInputService.InputBegan:Connect(function(Input, Typing)

					if Typing or Input.KeyCode ~= BindKey then

						return

					end

					CallBack(BindKey.Name)

				end)

				Input.MouseButton1Click:Connect(function()

					Input.Text = "..."

					task.wait()

					local Key = UserInputService.InputEnded:Wait()

					if Key.UserInputType ~= Enum.UserInputType.Keyboard then

						Input.Text = KeyTxt

						return

					end

					if BannedKeys[tostring(Key.KeyCode.Name)] then

						Input.Text = KeyTxt

						return

					end

					BindKey = Enum.KeyCode[tostring(Key.KeyCode.Name)]

					Input.Text = ShortNames[tostring(Key.KeyCode.Name)] or tostring(Key.KeyCode.Name)

				end)

			end

			function Components:DropDown(Name, Options, Multi, CallBack)

				Name, Options, Multi, CallBack = Name or "DropDown", Options or {}, Multi or false, CallBack or function() end

				local Container = Instance.new("TextButton")
				local ContainerC = Instance.new("UICorner")
				local Dropdown = Instance.new("TextButton")
				local DropDownC = Instance.new("UICorner")
				local Toggle = Instance.new("TextButton")
				local Search = Instance.new("TextBox")
				local SearchP = Instance.new("UIPadding")
				local ContainerLL = Instance.new("UIListLayout")

				Container.Name = "Container"
				Container.Parent = Section
				Container.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Container.BackgroundTransparency = 1.000
				Container.BorderColor3 = Color3.fromRGB(47, 47, 47)
				Container.BorderSizePixel = 0
				Container.Position = UDim2.new(0, 0, 0, 32)
				Container.Size = UDim2.new(0, 358, 0, 30)
				Container.AutoButtonColor = false
				Container.Font = Enum.Font.Gotham
				Container.Text = ""
				Container.TextColor3 = Color3.fromRGB(255, 255, 255)
				Container.TextSize = 12.000
				Container.TextXAlignment = Enum.TextXAlignment.Left
				Container.ClipsDescendants = true

				ContainerC.CornerRadius = UDim.new(0, 4)
				ContainerC.Name = "ContainerC"
				ContainerC.Parent = Container

				Dropdown.Name = "Dropdown"
				Dropdown.Parent = Container
				Dropdown.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Dropdown.BorderColor3 = Color3.fromRGB(47, 47, 47)
				Dropdown.BorderSizePixel = 0
				Dropdown.Position = UDim2.new(-0.0167597774, 0, 0, 0)
				Dropdown.Size = UDim2.new(0, 358, 0, 30)
				Dropdown.AutoButtonColor = false
				Dropdown.Font = Enum.Font.Gotham
				Dropdown.Text = ""
				Dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
				Dropdown.TextSize = 12.000
				Dropdown.TextXAlignment = Enum.TextXAlignment.Left

				DropDownC.CornerRadius = UDim.new(0, 4)
				DropDownC.Name = "DropDownC"
				DropDownC.Parent = Dropdown

				Toggle.Name = "Toggle"
				Toggle.Parent = Dropdown
				Toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Toggle.BackgroundTransparency = 1.000
				Toggle.BorderColor3 = Color3.fromRGB(47, 47, 47)
				Toggle.BorderSizePixel = 0
				Toggle.Position = UDim2.new(0.918994427, 0, 0, 0)
				Toggle.Size = UDim2.new(0, 29, 0, 30)
				Toggle.AutoButtonColor = false
				Toggle.Font = Enum.Font.GothamBold
				Toggle.Text = "+"
				Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
				Toggle.TextSize = 14.000

				Search.Name = "Search"
				Search.Parent = Dropdown
				Search.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Search.BackgroundTransparency = 1.000
				Search.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Search.BorderSizePixel = 0
				Search.Position = UDim2.new(0, 0, 0.0333333351, 0)
				Search.Size = UDim2.new(0, 321, 0, 30)
				Search.Font = Enum.Font.Gotham
				Search.Text = Name
				Search.TextColor3 = Color3.fromRGB(255, 255, 255)
				Search.TextSize = 12.000
				Search.TextXAlignment = Enum.TextXAlignment.Left

				SearchP.Name = "SearchP"
				SearchP.Parent = Search
				SearchP.PaddingLeft = UDim.new(0, 5)

				ContainerLL.Name = "ContainerLL"
				ContainerLL.Parent = Container
				ContainerLL.SortOrder = Enum.SortOrder.LayoutOrder
				ContainerLL.Padding = UDim.new(0, 6)

				local Funcs, MultiOptions, IsSearching = {}, {}, false

				local IsOpen
				local function Open()

					IsOpen = not IsOpen
					Utilities:Tween(Container, .5, {Size = UDim2.new(0, 358,0, (IsOpen and ContainerLL.AbsoluteContentSize.Y + 14) or 30)})

				end

				local function ShowAll()

					for i, v in next, Container:GetChildren() do

						if v.Name == "Option" then

							v.Visible = true

						end

					end

				end

				local function SearchOption(text)

					if text == "" then

						ShowAll()

					end

					for i,v in next, Container:GetChildren() do

						if v.Name == "Option" then

							v.Visible = v.Text:lower():match(text:lower()) and true or false

						end

					end

				end

				Toggle.MouseButton1Click:Connect(function()

					if Options == "PlayerList" then

						Funcs:SetOptions(Utilities:GetPlayers())

					end

					Open()
					Toggle.Text = (Toggle.Text == "+" and "-" or "+")

				end)

				local function RefreshList()

					local NewList = {}

					for i,v in next, MultiOptions do
						table.insert(NewList, v)
					end

					for i,v in next, Options do
						if not table.find(NewList, v) then
							table.insert(NewList, v)
						end
					end
					return NewList

				end

				function Funcs.AddOption(self, OptionName)

					assert(Name, "A name is required")

					local Option = Instance.new("TextButton")
					local OptionC = Instance.new("UICorner")

					Option.Name = "Option"
					Option.Parent = Container
					Option.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					Option.BorderColor3 = Color3.fromRGB(47, 47, 47)
					Option.BorderSizePixel = 0
					Option.Position = UDim2.new(0, 0, 0.282258064, 0)
					Option.Size = UDim2.new(0, 358, 0, 25)
					Option.AutoButtonColor = false
					Option.Font = Enum.Font.Gotham
					Option.Text = tostring(OptionName)
					Option.TextColor3 = table.find(MultiOptions, tostring(OptionName)) and Color3.fromRGB(91, 154, 76) or Multi and Color3.fromRGB(255, 89, 89) or Color3.fromRGB(255, 255, 255)
					Option.TextSize = 12.000

					OptionC.CornerRadius = UDim.new(0, 4)
					OptionC.Name = "OptionC"
					OptionC.Parent = Option

					Option.MouseButton1Click:Connect(function()

						if not Multi then

							Search.Text = Option.Text
							CallBack(Option.Text)
							Open()

						else

							if table.find(MultiOptions, Option.Text) then

								table.remove(MultiOptions, table.find(MultiOptions, Option.Text))

							else

								table.insert(MultiOptions, Option.Text)

							end

							Funcs:SetOptions(RefreshList())

							CallBack(MultiOptions)

							Search.Text = "Selected - "

							for i, v in next, MultiOptions do

								Search.Text = (i == 1 and Search.Text..v) or Search.Text..", "..v

							end

							if not MultiOptions[1] then

								Search.Text = Name
								ShowAll()

								return

							end

						end

					end)

				end

				function Funcs.ClearOptions(self)

					for i, v in next, Container:GetChildren() do

						if v.Name == "Option" then

							v:Destroy()

						end

					end

				end

				function Funcs.SetOptions(self, Options)

					Funcs:ClearOptions()

					for i, v in next, Options do

						Funcs:AddOption(v)

					end

				end

				Search.Focused:Connect(function()

					IsSearching = true

				end)

				Search.FocusLost:Connect(function()

					if Search.Text == "" and Multi and MultiOptions[1] then

						for i, v in next, MultiOptions do

							Search.Text = (i == 1 and Search.Text..v) or Search.Text..", "..v

						end

					end

					if Search.Text == "" then

						Search.Text = Name

					end

					if Search.Text:sub(1, 8) == "Selected" then

						return

					end

					IsSearching = false

				end)

				Search:GetPropertyChangedSignal("Text"):Connect(function()

					if not (IsOpen or IsSearching) then

						return

					end

					if Search.Text == Name or Search.Text == "" or Search.Text:sub(1, 8) == "Selected" then

						return ShowAll()

					end

					SearchOption(Search.Text)

				end)

				Funcs:SetOptions((Options == "PlayerList" and Utilities:GetPlayers()) or Options)

				return Funcs

			end

			function Components:Title(Message)

				assert(Message, "A message is required")

				local Title = Instance.new("TextLabel")

				Title.Name = "Title"
				Title.Parent = Section
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Size = UDim2.new(0, 376, 0, 26)
				Title.Font = Enum.Font.GothamBold
				Title.Text = Message
				Title.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title.TextSize = 14.000
				Title.TextXAlignment = Enum.TextXAlignment.Left

				return Title

			end

			return Components

		end

		return Sections

	end

	return Tabs

end

-->Services<--
local Workspace, Players, ReplicatedStorage, Lighting, UserInputService , RunService, CoreGui, UIS, StarterGui   = game:GetService("Workspace"), game:GetService("Players"), game:GetService("ReplicatedStorage"), game:GetService("Lighting"), game:GetService("UserInputService"),  game:GetService("RunService"), game:GetService("CoreGui"), game:GetService("UserInputService"), game:GetService("StarterGui")

-->Variables<--
local SelectedBodyPart, elapsedTime,   defaultTime, flingPower, walkingSpeed, sprintingSpeed, Player, Humanoid, LocalPlayer, MyView, HeadOffset = "HumanoidRootPart", 0,  Lighting.TimeOfDay, 100, 16, 32, game.Players.LocalPlayer, game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"), Players.LocalPlayer, workspace.CurrentCamera, Vector3.new(0, 0.1, 0)

-->Booleans<--
local  desktopdetected, mobiledetected, LockKeyDown, TargetLocked, Locking, AimbotConnection, AimbotRunning, AimbotEnabled, timerRunning, highlightEnabled, refreshLoopRunning,  trashTalkThread, trashTalkEnabled, flingEnabled, autoGrabGunEnabled, sheriffchams, murdchams, isShiftPressed, isToggledOn, rainbowForceFieldEnabled, spectateMurdererEnabled, spectateMurdererConnection, spectateSheriffEnabled, spectateSheriffConnection, autoRejoinEnabled, autoUpdateGunStatusEnabled, invis_on = false, false, false, nil, false, nil, false, false, false, false, false,  nil, false, false, false, false, false, false, false, false, false, nil, false, nil, false, true, false

--> Defining <--
local startTime

-->Tables<--











local flinglist = {}
                 local playerlist = {}
                 local playerlistfe = {}
                 
                 
                 table.insert(flinglist,"All")
                 table.insert(playerlistfe,"All")
                 table.insert(playerlistfe,game.Players.LocalPlayer.Name)
                 
                 for i,v in pairs(game.Players:GetPlayers())do
                     if v ~= game.Players.LocalPlayer then
                         table.insert(flinglist,v.Name)
                         table.insert(playerlist,v.Name)
                         table.insert(playerlistfe,v.Name)
                     end
                 end
                 
                 game.Players.PlayerAdded:Connect(function(player)
                     local name = player.Name
                     table.insert(flinglist,name)
                     table.insert(playerlist,name)
                 end)
                 
                 game.Players.PlayerRemoving:Connect(function(player)
                     local name = player.Name
                     for i,v in pairs(flinglist)do
                         if v == name then  
                             table.remove(flinglist,i)
                         end
                     end
                     for i,v in pairs(playerlist)do
                         if v == name then  
                             table.remove(playerlist,i)
                         end
                     end
                     for i,v in pairs(playerlistfe)do
                         if v == name then  
                             table.remove(playerlistfe,i)
                         end
                     end
                 end)


local rainbowColors = {
	Color3.fromRGB(255, 0, 0),
	Color3.fromRGB(255, 165, 0),
	Color3.fromRGB(255, 255, 0),
	Color3.fromRGB(0, 255, 0),
	Color3.fromRGB(0, 127, 255),
	Color3.fromRGB(0, 0, 255),
	Color3.fromRGB(139, 0, 255)
}

local maplocations = {
    ["Secret Room"] = CFrame.new(-94.06281280517578, 143.11122131347656, 104.34443664550781),
    ["Voting Room"] = CFrame.new(-107.94659423828125, 140.54779052734375, 81.2223892211914),
    ["Spawn"] = CFrame.new(-108.3932876586914, 138.1329345703125, -3.875157356262207),
    ["Above Spawn"] = CFrame.new(-82.7715072631836, 507.6320495605469, 27.801353454589844)
}

local player = game.Players.LocalPlayer


local originalColors = {}



-->Functions<--
local Funcs = {}

getgenv().Speed = 16
function Walkspeed()
game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().Speed
end)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().Speed
end

function Funcs:UnEquipKnife()

    if not player or not player.Character then
        return
    end

    local character = player.Character

    for _, item in pairs(character:GetChildren()) do
        if item:IsA("Tool") and item.Name == "Knife" then
            item.Parent = player.Backpack  
            break  
        end
    end
end

function Funcs:updateRainbowForceField()
    local index = 1
    while rainbowForceFieldEnabled do
        for _, v in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("BasePart") then
                if not originalColors[v] then
                    originalColors[v] = v.Color 
                end
                v.Material = Enum.Material.ForceField
                local goal = {Color = rainbowColors[index]}
                local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
                local tween = TweenService:Create(v, tweenInfo, goal)
                tween:Play()
            end
        end
        index = index % #rainbowColors + 1
        wait(0.5)
    end

    for _, v in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("BasePart") then
            wait(0.1)
            v.Material = Enum.Material.SmoothPlastic
            if originalColors[v] then
                v.Color = originalColors[v] 
            end
        end
    end
end


function Funcs:hasGun(player)
	return player.Character and (player.Character:FindFirstChild("Gun") or player.Backpack:FindFirstChild("Gun"))
end

function Funcs:teleporttosherrif()
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= Players.LocalPlayer and Funcs:hasGun(player) then
			Players.LocalPlayer.Character:MoveTo(player.Character.HumanoidRootPart.Position + Vector3.new(0, 0, 0))
			return
		end
	end
end

function Funcs:isMurderer(player)
	return player.Character and (player.Character:FindFirstChild("Knife") or player.Backpack:FindFirstChild("Knife"))
end

function Funcs:isSheriff(player)
	return player.Character and (player.Character:FindFirstChild("Gun") or player.Backpack:FindFirstChild("Gun"))
end

function Funcs:teleporttomurderer()
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= Players.LocalPlayer and Funcs:isMurderer(player) then
			Players.LocalPlayer.Character:MoveTo(player.Character.HumanoidRootPart.Position + Vector3.new(0, 1, 0))
			return
		end
	end
end

function Funcs:SetDaytime()
	Lighting.TimeOfDay = "12:00:00"
end

function Funcs:SetMidnight()
	Lighting.TimeOfDay = "00:00:00"
end

function Funcs:Light(Val)
	if Val == false then game.Players.LocalPlayer.Character.Head.PointLight:Destroy() return end
	local PL = Instance.new("PointLight",game.Players.LocalPlayer.Character:FindFirstChild("Head"))
	PL.Range = 100
	PL.Brightness = 1
	PL.Shadows = false
	end

function Funcs:XrayOn(obj)
	for _,v in pairs(obj:GetChildren()) do
		if (v:IsA("BasePart")) and not v.Parent:FindFirstChild("Humanoid") then
			v.LocalTransparencyModifier = 0.75;
		end;
		Funcs:XrayOn(v);
	end;
end;
	
function Funcs:XrayOff(obj)
	for _,v in pairs(obj:GetChildren()) do
		if (v:IsA("BasePart")) and not v.Parent:FindFirstChild("Humanoid") then
			v.LocalTransparencyModifier = 0;
		end ;
		Funcs:XrayOff(v);
	end;
end;



function Funcs:teleporttomap()
	local Character = player.Character
	local CoinContainer = game.Workspace:FindFirstChild("CoinContainer", true)

	if Character and CoinContainer then
		local ClosestCoin = nil
		local MinDistance = math.huge

		for _, Coin in ipairs(CoinContainer:GetChildren()) do
			if Coin.Name == "Coin_Server" then
				local Distance = (Character.PrimaryPart.Position - Coin.Position).magnitude
				if Distance < MinDistance then
					MinDistance = Distance
					ClosestCoin = Coin
				end
			end
		end

		if ClosestCoin then
			local EndPosition = ClosestCoin.Position
			Character:SetPrimaryPartCFrame(CFrame.new(EndPosition))
		end
	end
end

function Funcs:grabgun()
    local offset = CFrame.new(0, 2, 0)
    local character = game.Players.LocalPlayer.Character
    if character then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            local originalPosition = humanoidRootPart.Position
            local closestGun = nil
            local minDistance = math.huge
            
            local gunDrop = game.Workspace["Normal"]:FindFirstChild("GunDrop")
            if gunDrop and gunDrop:IsA("Part") then
                closestGun = gunDrop
                minDistance = (humanoidRootPart.Position - gunDrop.Position).magnitude
            end
            
            if closestGun then
                if minDistance <= 500 then
                    humanoidRootPart.CFrame = closestGun.CFrame * offset
                    wait(0.1)
                    humanoidRootPart.CFrame = character.HumanoidRootPart.CFrame
                    wait(0.15)
                    humanoidRootPart.CFrame = CFrame.new(originalPosition)
                else
                    Library:Notify("Grab Gun", "You arent a part of the current round", 3)
                end
            else
                Library:Notify("Grab Gun", "Unable to detect a gun. Are you sure it is dropped?", 3)
            end
        else
        end
    else
    end
end




function Funcs:autoGrabGun()
	while autoGrabGunEnabled do
		Funcs:grabgun()
		wait(1.5)  
	end
 end

function Funcs:spectateGun()
	local gun = nil
	local minDistance = math.huge
	for _, obj in ipairs(workspace:GetChildren()) do
		if obj:IsA("Part") and obj.Name:lower():find("gun") then
			local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - obj.Position).magnitude
			if distance < minDistance then
				gun = obj
				minDistance = distance
			end
		end
	end
	if gun then
		workspace.CurrentCamera.CameraSubject = gun
		ViewingGun = true
	else
		print("No gun found to spectate.")
	end
end

function Funcs:stopSpectatingGun()
	workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
	ViewingGun = false
end





function Funcs:CreateHighlight()
	for i, v in pairs(Players:GetChildren()) do
		if v ~= game.Players.LocalPlayer and v.Character and not v.Character:FindFirstChild("Highlight") then
			Instance.new("Highlight", v.Character)
		end
	end
end

function Funcs:UpdateHighlights()
	for _, v in pairs(Players:GetChildren()) do
		if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Highlight") then
			Highlight = v.Character:FindFirstChild("Highlight")
			if v.Name == Sheriff and Funcs:IsAlive(v) and sheriffchams == true then
				Highlight.FillColor = Color3.fromRGB(0, 0, 225)
			elseif v.Name == Murder and Funcs:IsAlive(v) and murdchams == true then
				Highlight.FillColor = Color3.fromRGB(255, 0, 0)
			elseif v.Name == Hero and Funcs:IsAlive(v) and not Funcs:IsAlive(game.Players[Sheriff]) and sheriffchams == true then
				Highlight.FillColor = Color3.fromRGB(255, 250, 0)
			else
				Highlight.FillColor = Color3.fromRGB(0, 255, 0)
			end
		end
	end
end	

function Funcs:IsAlive(Player)
	for i, v in pairs(roles) do
		if Player.Name == i then
			if not v.Killed and not v.Dead then
				return true
			else
				return false
			end
		end
	end
end

function Funcs:refreshchams()
	for i,v in pairs (workspace:GetDescendants()) do
		if v.Name == "Highlight" then
			v:Destroy()
		end
	end
	Funcs:roleupdaterfix()
end

local nameTags = {}

function Funcs:addNameTag(gun)
    if not gun:FindFirstChild("NameTag") then
        local billBoard = Instance.new("BillboardGui")
        billBoard.Size = UDim2.new(0, 100, 0, 50)
        billBoard.Adornee = gun
        billBoard.StudsOffset = Vector3.new(0, 0, 0)
        billBoard.Name = "NameTag"
        billBoard.AlwaysOnTop = true
        billBoard.Parent = gun

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Size = UDim2.new(1, 0, 1, 0)
        nameLabel.Text = "Dropped Gun"
        nameLabel.TextScaled = true
        nameLabel.TextColor3 = Color3.new(0, 1, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.TextStrokeTransparency = 0
        nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
        nameLabel.Parent = billBoard

        nameTags[gun] = billBoard
    end
end

function Funcs:removeNameTag(gun)
    local nameTag = nameTags[gun]
    if nameTag then
        nameTag:Destroy()
        nameTags[gun] = nil
    end
end

function Funcs:refreshESP()
    local gunDrop = game.Workspace["Normal"]:FindFirstChild("GunDrop")
    if gunDrop and gunDrop:IsA("Part") then
        Funcs:addNameTag(gunDrop)
    end

    for gun, _ in pairs(nameTags) do
        if not gun:IsDescendantOf(game:GetService("Workspace")) then
            Funcs:removeNameTag(gun)
        end
    end
end

function Funcs:toggleESP(enabled)
    espEnabled = enabled
    if enabled then
        refreshLoop = true
        while refreshLoop do
            Funcs:refreshESP()
            wait(1)
        end
    else
        refreshLoop = false
        for gun, _ in pairs(nameTags) do
            Funcs:removeNameTag(gun)
        end
    end
end




function Funcs:EquipTool()
	for _,obj in next, game.Players.LocalPlayer.Backpack:GetChildren() do
		if obj.Name == "Knife" then
			local equip = game.Players.LocalPlayer.Backpack.Knife
			equip.Parent = game.Players.LocalPlayer.Character
		end
	end
  end
 
  function Funcs:Stab()
	game:GetService("Players").LocalPlayer.Character.Knife.Stab:FireServer("Down")
	end

	local whitelistedPlayers = {}

	function Funcs:killAllOnce()
	
		if not Funcs:isMurderer(player) then
			game.StarterGui:SetCore("SendNotification", {
				Title = "Major Error!",
				Text = "You're not the murderer.",
				Duration = 3,
				Icon = "rbxassetid://6031071050",
			})
			return
		end
	
		Funcs:EquipTool()
		wait()
		local localCharacter = game.Players.LocalPlayer.Character
		local knife = localCharacter and localCharacter:FindFirstChild("Knife")
		wait()
	
		for _, player in ipairs(game.Players:GetPlayers()) do
			if player ~= game.Players.LocalPlayer and not table.find(whitelistedPlayers, player.Name) then
				wait()
				local playerCharacter = player.Character
				local humanoidRootPart = playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart")
	
				if humanoidRootPart then
					Funcs:Stab()
					firetouchinterest(humanoidRootPart, knife.Handle, 1)
					firetouchinterest(humanoidRootPart, knife.Handle, 0)
				end
			end
		end
	end





function Funcs:CreateNameTag(player)
    local tag = Instance.new("BillboardGui")
    tag.Name = "NameTag"
    tag.AlwaysOnTop = true
    tag.Size = UDim2.new(0, 150, 0, 45)
    tag.StudsOffset = Vector3.new(0, 2, 0)
    tag.Adornee = player.Character:WaitForChild("Head")
    
    local text = Instance.new("TextLabel", tag)
    text.Name = "Name"
    text.Text = player.Name
    text.Size = UDim2.new(1, 0, 1, 0)
    text.TextColor3 = Color3.new(0, 1, 0) 
    text.BackgroundTransparency = 1
    text.Font = Enum.Font.SourceSansBold
    text.TextStrokeTransparency = 0.5
    
    
    local predefinedTextSize = 30
    text.TextSize = predefinedTextSize
    
    tag.Parent = game.CoreGui
    return tag
end


function Funcs:UpdateNameTagColor(player)
    local tag = player.Character:FindFirstChild("NameTag")
    if tag then
        if player.Name == Sheriff and sheriffesp then
            tag.TextLabel.TextColor3 = Color3.new(0, 0, 1) 
        elseif player.Name == Murder and murderesp then
            tag.TextLabel.TextColor3 = Color3.new(1, 0, 0) 
        else
            tag.TextLabel.TextColor3 = Color3.new(0, 1, 0) 
        end
    end
end

function Funcs:UpdateESP()
    if not ESPEnabled then
        return
    end
    
    while ESPEnabled do
        -- Remove existing nametags
        for _, label in ipairs(game.CoreGui:GetChildren()) do
            if label.Name == "NameTag" then
                label:Destroy()
            end
        end
        
        -- Create new nametags
        for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
            if player.Character then
                if player.Name ~= Sheriff and player.Name ~= Murder then
                    self:CreateNameTag(player)
                    self:UpdateNameTagColor(player)
                end
            end
        end
        
        wait(1) -- Wait for 1 second before refreshing again
    end
end


function Funcs:OnPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        wait(1) 
        self:UpdateESP()
    end)
    player.CharacterRemoving:Connect(function()
        self:UpdateESP()
    end)
end

function Funcs:OnPlayerRemoving(player)
    self:UpdateESP()
end

game.Players.PlayerAdded:Connect(function(player)
    Funcs:OnPlayerAdded(player)
end)

game.Players.PlayerRemoving:Connect(function(player)
    Funcs:OnPlayerRemoving(player)
end)









 function Funcs:equipGun()
	
	local backpack = player.Backpack
	if backpack then
		for _, tool in ipairs(backpack:GetChildren()) do
			if tool:IsA("Tool") and tool.Name == "Gun" then
				
				player.Character.Humanoid:EquipTool(tool)
				break
			end
		end
	end
end


function Funcs:killMurderer()

    if not Funcs:isSheriff(player) then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Major Error!",
            Text = "You're not the sheriff.",
            Duration = 3,
            Icon = "rbxassetid://6031071050",
        })
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        return
    end

    -- Check if the player has a gun in their inventory
    for _, targetPlayer in ipairs(Players:GetPlayers()) do
        if targetPlayer ~= player and Funcs:isMurderer(targetPlayer) then
            local originalPosition = player.Character and player.Character.HumanoidRootPart.Position
            local murderer = targetPlayer.Character
            local playerChar = player.Character

            if not playerChar or not murderer then
                UserInputService.MouseBehavior = Enum.MouseBehavior.Default
                return
            end

            Funcs:equipGun()

            local shootCoroutine = coroutine.create(function()
                wait(0.5)
                Funcs:shootWhereAiming()
            end)
            coroutine.resume(shootCoroutine)

            local startTime = tick()
            local endTime = startTime + 1
            local originalCamera = Workspace.CurrentCamera:Clone()
            originalCamera.Parent = Workspace

            local success, errorMsg = pcall(function()
                while tick() < endTime do
                    local murdererPosition = murderer.HumanoidRootPart.Position
                    local murdererLookVector = murderer.HumanoidRootPart.CFrame.LookVector

                    local newPosition = murdererPosition - murdererLookVector * 6
                    playerChar:SetPrimaryPartCFrame(CFrame.new(newPosition, murdererPosition))

                    UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter

                    Workspace.CurrentCamera.CFrame = CFrame.new(Workspace.CurrentCamera.CFrame.Position, murdererPosition)

                    RunService.RenderStepped:Wait()
                end
            end)

            -- Ensure the camera and mouse behavior are reset
            UserInputService.MouseBehavior = Enum.MouseBehavior.Default
            originalCamera.Parent = nil
            originalCamera:Destroy()

            if playerChar and originalPosition then
                playerChar:SetPrimaryPartCFrame(CFrame.new(originalPosition))
            end

            if not success then
                warn("Error in killMurderer: " .. errorMsg)
            end

            return
        end
    end

    UserInputService.MouseBehavior = Enum.MouseBehavior.Default
end










function Funcs:NoClip(NoClipVal)
	if not NoClipVal then Clipping:Disconnect() return end
	Clipping = game:GetService("RunService").Stepped:connect(function()
	for i,v in next, game.Players.LocalPlayer.Character:GetChildren() do
		if v:IsA("Part") or v:IsA("BasePart") then
			v.CanCollide = false
		end
	end
	end)
	end

	local InfiniteJumpEnabled = false 
	local JumpConnection 
	
 function Funcs:ToggleInfiniteJump(toggleState)
		InfiniteJumpEnabled = toggleState
		if InfiniteJumpEnabled then
			JumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
				if InfiniteJumpEnabled then
					game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
				end
			end)
		else
			if JumpConnection then
				JumpConnection:Disconnect() 
				JumpConnection = nil 
			end
			game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Jump = true
		end
	end


	local coinTeleportationActive = false
	local originalGravity = game.Workspace.Gravity
	local TweenService = game:GetService("TweenService")
	
	
	function Funcs:TeleportToCoins(enabled)
		if enabled and not coinTeleportationActive then
			coinTeleportationActive = true
			originalGravity = game.Workspace.Gravity
			game.Workspace.Gravity = 0
	
			function Funcs:GetClosestCoin(CoinContainer, Character)
				local MinDistance = math.huge
				local ClosestCoin = nil
				for _, Coin in ipairs(CoinContainer:GetChildren()) do
					if Coin.Name == "Coin_Server" then
						local Distance = (Character.PrimaryPart.Position - Coin.Position).magnitude
						if Distance < MinDistance then
							MinDistance = Distance
							ClosestCoin = Coin
						end
					end
				end
				return ClosestCoin
			end
	
			function Funcs:MoveTowardsCoin(Character, Coin)
				local EndPosition = Coin.Position - Vector3.new(0, 3.1, 0) 
						
				local DestinationPart = Instance.new("Part")
				DestinationPart.Anchored = true
				DestinationPart.Transparency = 1
				DestinationPart.Size = Vector3.new(1, 1, 1)
				DestinationPart.Position = EndPosition
				DestinationPart.Parent = game.Workspace
				
				local distance = (EndPosition - Character.PrimaryPart.Position).Magnitude
				local tweenDuration = distance / 1000 
				
				local tweenInfo = TweenInfo.new(tweenDuration, Enum.EasingStyle.Linear)
				local tween = TweenService:Create(Character.PrimaryPart, tweenInfo, {CFrame = DestinationPart.CFrame})
				tween:Play()
				tween.Completed:Wait()
				
				DestinationPart:Destroy()
			end
	
			function Funcs:CheckForCoins()
				local Character = player.Character
				local CoinContainer = game.Workspace:FindFirstChild("CoinContainer", true)
				if Character and CoinContainer and Character.Parent then
					while coinTeleportationActive do
						local ClosestCoin = Funcs:GetClosestCoin(CoinContainer, Character)
						if ClosestCoin then
							Funcs:MoveTowardsCoin(Character, ClosestCoin)
						end
						wait(0.1) 
					end
				end
			end
	
			RunService.Heartbeat:Connect(function()
				if coinTeleportationActive then
					Funcs:CheckForCoins()
				end
			end)
	
		else
			coinTeleportationActive = false
			game.Workspace.Gravity = originalGravity
		end
	end

	

	function Funcs:spectateSheriff() 
		spectateSheriffEnabled = true
		
		while spectateSheriffEnabled do
			local target = nil
			
			for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
				if player ~= game.Players.LocalPlayer and player.Name == Hero then
					target = player
					break
				end
			end
			
			if not target then
				for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
					if player ~= game.Players.LocalPlayer and player.Name == Sheriff then
						target = player
						break
					end
				end
			end
			
			if target then
				workspace.CurrentCamera.CameraSubject = target.Character.Humanoid
				print("Now spectating: " .. target.Name)
			else
				print("No player found as the hero or sheriff.")
			end
			
			wait(5)
		end
	end
	
	 function Funcs:stopSpectatingSheriff()
		spectateSheriffEnabled = false
		if spectateSheriffConnection then
			spectateSheriffConnection:Disconnect()
			spectateSheriffConnection = nil
		end
		workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
		print("Stopped spectating sheriff.")
	end
	
	
	 function Funcs:spectateMurderer()
		spectateMurdererEnabled = true
		
		while spectateMurdererEnabled do
			local murderer = nil
			
			for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
				if player ~= game.Players.LocalPlayer and player.Name == Murder then
					murderer = player
					break
				end
			end
			
			if murderer then
				workspace.CurrentCamera.CameraSubject = murderer.Character.Humanoid
				print("Now spectating murderer: " .. murderer.Name)
			else
				print("No player found as the murderer.")
			end
			
			
			wait(5)  
		end
	end
	
	 function Funcs:stopSpectatingMurderer()
		spectateMurdererEnabled = false
		if spectateMurdererConnection then
			spectateMurdererConnection:Disconnect()
			spectateMurdererConnection = nil
		end
		workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
		print("Stopped spectating murderer.")
	end




	function Funcs:autoRejoin()
		if autoRejoinEnabled then
			if not game:IsLoaded() then
				game.Loaded:Wait()
			end
			game.CoreGui.RobloxPromptGui.promptOverlay.DescendantAdded:Connect(function()
				local GUI = game.CoreGui.RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt")
				if GUI then
					if GUI.TitleFrame.ErrorTitle.Text == "Disconnected" then
						if #game.Players:GetPlayers() <= 1 then
							Player:Kick("\nRejoining...")
							wait()
							game:GetService("TeleportService"):Teleport(game.PlaceId, Player)
						else
							game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, Player)
						end
					end
				end
			end)
		end
	end

	function Funcs:toggleAutoRejoin(enabled)
		autoRejoinEnabled = enabled
		if enabled then
			Funcs:autoRejoin()
		end
	end

	 function Funcs:updateWalkSpeed()
		if getgenv().ison and isShiftPressed then
			getgenv().Speed = sprintingSpeed
			Walkspeed()
		else
			getgenv().Speed = walkingSpeed
			Walkspeed()
		end
	end

	
	function Funcs:toggleInvisibility()
		invis_on = not invis_on
		if invis_on then
			local savedpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			wait()
			game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-25.95, 84, 3537.55))
			wait(.15)
			local Seat = Instance.new('Seat', game.Workspace)
			Seat.Anchored = false
			Seat.CanCollide = false
			Seat.Name = 'invischair'
			Seat.Transparency = 1
			Seat.Position = Vector3.new(-25.95, 84, 3537.55)
			local Weld = Instance.new("Weld", Seat)
			Weld.Part0 = Seat
			Weld.Part1 = game.Players.LocalPlayer.Character:FindFirstChild("Torso") or game.Players.LocalPlayer.Character.UpperTorso
			wait()
			Seat.CFrame = savedpos
			game.StarterGui:SetCore("SendNotification", {
				Title = "Invisibility On";
				Duration = 1;
				Text = "";
			})
		else
			if workspace:FindFirstChild('invischair') then
				workspace:FindFirstChild('invischair'):Remove()
				game.StarterGui:SetCore("SendNotification", {
					Title = "Invisibility Off";
					Duration = 1;
					Text = "";
				})
			end
		end
	end

	function Funcs:PlayAudioFromID(audioId)
		local audio = Instance.new("Sound")
		audio.SoundId = "rbxassetid://" .. tostring(audioId)
		audio.Parent = game.Workspace 
		audio:Play()
	end



	function Funcs:UpdateMurdererESP()
		if not ESPEnabled then
			return
		end
		
		for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
			if player.Character then
				if player.Name == Murder then
					local tag = player.Character:FindFirstChild("MurdererTag")
					if not tag then
						tag = self:CreateMurdererTag(player)
					end
					self:UpdateNameTagColor(tag, true) 
				end
			end
		end
	end
	
	function Funcs:CreateMurdererTag(player)
		local tag = Instance.new("BillboardGui")
		tag.Name = "MurdererTag"
		tag.AlwaysOnTop = true
		tag.Size = UDim2.new(0, 150, 0, 45)
		tag.StudsOffset = Vector3.new(0, 2, 0)
		tag.Adornee = player.Character:WaitForChild("Head")
		
		local text = Instance.new("TextLabel", tag)
		text.Name = "Name"
		text.Text = player.Name
		text.Size = UDim2.new(1, 0, 1, 0)
		text.TextColor3 = Color3.new(1, 0, 0) -- Red color
		text.BackgroundTransparency = 1
		text.Font = Enum.Font.SourceSansBold
		text.TextStrokeTransparency = 0.5
		text.TextSize = 30
		
		tag.Parent = game.CoreGui
		return tag
	end


	function Funcs:UpdateSheriffESP()
		if not ESPEnabled then
			return
		end
		
		for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
			if player.Character then
				if player.Name == Sheriff then
					local tag = player.Character:FindFirstChild("SheriffTag")
					if not tag then
						tag = self:CreateSheriffTag(player)
					end
					self:UpdateNameTagColor(tag, false) -- Set color to blue
				end
			end
		end
	end
	
	function Funcs:CreateSheriffTag(player)
		local tag = Instance.new("BillboardGui")
		tag.Name = "SheriffTag"
		tag.AlwaysOnTop = true
		tag.Size = UDim2.new(0, 150, 0, 45)
		tag.StudsOffset = Vector3.new(0, 2, 0)
		tag.Adornee = player.Character:WaitForChild("Head")
		
		local text = Instance.new("TextLabel", tag)
		text.Name = "Name"
		text.Text = player.Name
		text.Size = UDim2.new(1, 0, 1, 0)
		text.TextColor3 = Color3.new(0, 0, 1) -- Blue color
		text.BackgroundTransparency = 1
		text.Font = Enum.Font.SourceSansBold
		text.TextStrokeTransparency = 0.5
		text.TextSize = 30
		
		tag.Parent = game.CoreGui
		return tag
	end


--Map Location Coordinates


local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local ContextActionService = game:GetService("ContextActionService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

local Freecam = Instance.new("ScreenGui")

Freecam.Name = "Freecam"
Freecam.ResetOnSpawn = false

function FreeCameraWrap()
    local script = Instance.new("LocalScript")
    script.Parent = Freecam

    local pi    = math.pi
    local abs   = math.abs
    local clamp = math.clamp
    local exp   = math.exp
    local rad   = math.rad
    local sign  = math.sign
    local sqrt  = math.sqrt
    local tan   = math.tan
    if not LocalPlayer then
        Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
        LocalPlayer = Players.LocalPlayer
    end
    
    local Camera = Workspace.CurrentCamera
    Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
        local newCamera = Workspace.CurrentCamera
        if newCamera then
            Camera = newCamera
        end
    end)
        
    local TOGGLE_INPUT_PRIORITY = Enum.ContextActionPriority.Low.Value
    local INPUT_PRIORITY = Enum.ContextActionPriority.High.Value
    
    local NAV_GAIN = Vector3.new(1, 1, 1)*64
    local PAN_GAIN = Vector2.new(0.75, 1)*8
    local FOV_GAIN = 300
    
    local PITCH_LIMIT = rad(90)
    
    local VEL_STIFFNESS = 1.5
    local PAN_STIFFNESS = 1.0
    local FOV_STIFFNESS = 4.0
        
    local Spring = {} do
        Spring.__index = Spring
    
        function Spring.new(freq, pos)
            local self = setmetatable({}, Spring)
            self.f = freq
            self.p = pos
            self.v = pos*0
            return self
        end
    
        function Spring:Update(dt, goal)
            local f = self.f*2*pi
            local p0 = self.p
            local v0 = self.v
    
            local offset = goal - p0
            local decay = exp(-f*dt)
    
            local p1 = goal + (v0*dt - offset*(f*dt + 1))*decay
            local v1 = (f*dt*(offset*f - v0) + v0)*decay
    
            self.p = p1
            self.v = v1
    
            return p1
        end
    
        function Spring:Reset(pos)
            self.p = pos
            self.v = pos*0
        end
    end
    
    local cameraPos = Vector3.new()
    local cameraRot = Vector2.new()
    local cameraFov = 0
    
    local velSpring = Spring.new(VEL_STIFFNESS, Vector3.new())
    local panSpring = Spring.new(PAN_STIFFNESS, Vector2.new())
    local fovSpring = Spring.new(FOV_STIFFNESS, 0)
    
    local Input = {} do
        local thumbstickCurve do
            local K_CURVATURE = 2.0
            local K_DEADZONE = 0.15
    
            local function fCurve(x)
                return (exp(K_CURVATURE*x) - 1)/(exp(K_CURVATURE) - 1)
            end
    
            local function fDeadzone(x)
                return fCurve((x - K_DEADZONE)/(1 - K_DEADZONE))
            end
    
            function thumbstickCurve(x)
                return sign(x)*clamp(fDeadzone(abs(x)), 0, 1)
            end
        end
    
        local gamepad = {
            ButtonX = 0,
            ButtonY = 0,
            DPadDown = 0,
            DPadUp = 0,
            ButtonL2 = 0,
            ButtonR2 = 0,
            Thumbstick1 = Vector2.new(),
            Thumbstick2 = Vector2.new(),
        }
    
        local keyboard = {
            W = 0,
            A = 0,
            S = 0,
            D = 0,
            E = 0,
            Q = 0,
            U = 0,
            H = 0,
            J = 0,
            K = 0,
            I = 0,
            Y = 0,
            Up = 0,
            Down = 0,
            LeftShift = 0,
            RightShift = 0,
        }
    
        local mouse = {
            Delta = Vector2.new(),
            MouseWheel = 0,
        }
    
        local NAV_GAMEPAD_SPEED  = Vector3.new(1, 1, 1)
        local NAV_KEYBOARD_SPEED = Vector3.new(1, 1, 1)
        local PAN_MOUSE_SPEED    = Vector2.new(1, 1)*(pi/64)
        local PAN_GAMEPAD_SPEED  = Vector2.new(1, 1)*(pi/8)
        local FOV_WHEEL_SPEED    = 1.0
        local FOV_GAMEPAD_SPEED  = 0.25
        local NAV_ADJ_SPEED      = 0.75
        local NAV_SHIFT_MUL      = 0.25
    
        local navSpeed = 1
    
        function Input.Vel(dt)
            navSpeed = clamp(navSpeed + dt*(keyboard.Up - keyboard.Down)*NAV_ADJ_SPEED, 0.01, 4)
    
            local kGamepad = Vector3.new(
                thumbstickCurve(gamepad.Thumbstick1.x),
                thumbstickCurve(gamepad.ButtonR2) - thumbstickCurve(gamepad.ButtonL2),
                thumbstickCurve(-gamepad.Thumbstick1.y)
            )*NAV_GAMEPAD_SPEED
    
            local kKeyboard = Vector3.new(
                keyboard.D - keyboard.A + keyboard.K - keyboard.H,
                keyboard.E - keyboard.Q + keyboard.I - keyboard.Y,
                keyboard.S - keyboard.W + keyboard.J - keyboard.U
            )*NAV_KEYBOARD_SPEED
    
            local shift = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift)
    
            return (kGamepad + kKeyboard)*(navSpeed*(shift and NAV_SHIFT_MUL or 1))
        end
    
        function Input.Pan(dt)
            local kGamepad = Vector2.new(
                thumbstickCurve(gamepad.Thumbstick2.y),
                thumbstickCurve(-gamepad.Thumbstick2.x)
            )*PAN_GAMEPAD_SPEED
            local kMouse = mouse.Delta*PAN_MOUSE_SPEED
            mouse.Delta = Vector2.new()
            return kGamepad + kMouse
        end
    
        function Input.Fov(dt)
            local kGamepad = (gamepad.ButtonX - gamepad.ButtonY)*FOV_GAMEPAD_SPEED
            local kMouse = mouse.MouseWheel*FOV_WHEEL_SPEED
            mouse.MouseWheel = 0
            return kGamepad + kMouse
        end
    
        do
            local function Keypress(action, state, input)
                keyboard[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
                return Enum.ContextActionResult.Sink
            end
    
            local function GpButton(action, state, input)
                gamepad[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
                return Enum.ContextActionResult.Sink
            end
    
            local function MousePan(action, state, input)
                local delta = input.Delta
                mouse.Delta = Vector2.new(-delta.y, -delta.x)
                return Enum.ContextActionResult.Sink
            end
    
            local function Thumb(action, state, input)
                gamepad[input.KeyCode.Name] = input.Position
                return Enum.ContextActionResult.Sink
            end
    
            local function Trigger(action, state, input)
                gamepad[input.KeyCode.Name] = input.Position.z
                return Enum.ContextActionResult.Sink
            end
    
            local function MouseWheel(action, state, input)
                mouse[input.UserInputType.Name] = -input.Position.z
                return Enum.ContextActionResult.Sink
            end
    
            local function Zero(t)
                for k, v in pairs(t) do
                    t[k] = v*0
                end
            end
    
            function Input.StartCapture()
                ContextActionService:BindActionAtPriority("FreecamKeyboard", Keypress, false, INPUT_PRIORITY,
                    Enum.KeyCode.W, Enum.KeyCode.U,
                    Enum.KeyCode.A, Enum.KeyCode.H,
                    Enum.KeyCode.S, Enum.KeyCode.J,
                    Enum.KeyCode.D, Enum.KeyCode.K,
                    Enum.KeyCode.E, Enum.KeyCode.I,
                    Enum.KeyCode.Q, Enum.KeyCode.Y,
                    Enum.KeyCode.Up, Enum.KeyCode.Down
                )
                ContextActionService:BindActionAtPriority("FreecamMousePan",          MousePan,   false, INPUT_PRIORITY, Enum.UserInputType.MouseMovement)
                ContextActionService:BindActionAtPriority("FreecamMouseWheel",        MouseWheel, false, INPUT_PRIORITY, Enum.UserInputType.MouseWheel)
                ContextActionService:BindActionAtPriority("FreecamGamepadButton",     GpButton,   false, INPUT_PRIORITY, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY)
                ContextActionService:BindActionAtPriority("FreecamGamepadTrigger",    Trigger,    false, INPUT_PRIORITY, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
                ContextActionService:BindActionAtPriority("FreecamGamepadThumbstick", Thumb,      false, INPUT_PRIORITY, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2)
            end
    
            function Input.StopCapture()
                navSpeed = 1
                Zero(gamepad)
                Zero(keyboard)
                Zero(mouse)
                ContextActionService:UnbindAction("FreecamKeyboard")
                ContextActionService:UnbindAction("FreecamMousePan")
                ContextActionService:UnbindAction("FreecamMouseWheel")
                ContextActionService:UnbindAction("FreecamGamepadButton")
                ContextActionService:UnbindAction("FreecamGamepadTrigger")
                ContextActionService:UnbindAction("FreecamGamepadThumbstick")
            end
        end
    end
    
    local function GetFocusDistance(cameraFrame)
        local znear = 0.1
        local viewport = Camera.ViewportSize
        local projy = 2*tan(cameraFov/2)
        local projx = viewport.x/viewport.y*projy
        local fx = cameraFrame.rightVector
        local fy = cameraFrame.upVector
        local fz = cameraFrame.lookVector
    
        local minVect = Vector3.new()
        local minDist = 512
    
        for x = 0, 1, 0.5 do
            for y = 0, 1, 0.5 do
                local cx = (x - 0.5)*projx
                local cy = (y - 0.5)*projy
                local offset = fx*cx - fy*cy + fz
                local origin = cameraFrame.p + offset*znear
                local _, hit = Workspace:FindPartOnRay(Ray.new(origin, offset.unit*minDist))
                local dist = (hit - origin).magnitude
                if minDist > dist then
                    minDist = dist
                    minVect = offset.unit
                end
            end
        end
    
        return fz:Dot(minVect)*minDist
    end
    
    local function StepFreecam(dt)
        local vel = velSpring:Update(dt, Input.Vel(dt))
        local pan = panSpring:Update(dt, Input.Pan(dt))
        local fov = fovSpring:Update(dt, Input.Fov(dt))
    
        local zoomFactor = sqrt(tan(rad(70/2))/tan(rad(cameraFov/2)))
    
        cameraFov = clamp(cameraFov + fov*FOV_GAIN*(dt/zoomFactor), 1, 120)
        cameraRot = cameraRot + pan*PAN_GAIN*(dt/zoomFactor)
        cameraRot = Vector2.new(clamp(cameraRot.x, -PITCH_LIMIT, PITCH_LIMIT), cameraRot.y%(2*pi))
    
        local cameraCFrame = CFrame.new(cameraPos)*CFrame.fromOrientation(cameraRot.x, cameraRot.y, 0)*CFrame.new(vel*NAV_GAIN*dt)
        cameraPos = cameraCFrame.p
    
        Camera.CFrame = cameraCFrame
        Camera.Focus = cameraCFrame*CFrame.new(0, 0, -GetFocusDistance(cameraCFrame))
        Camera.FieldOfView = cameraFov
    end
        
    local PlayerState = {} do
        local mouseBehavior
        local mouseIconEnabled
        local cameraType
        local cameraFocus
        local cameraCFrame
        local cameraFieldOfView
        local screenGuis = {}
        local coreGuis = {
            Backpack = true,
            Chat = true,
            Health = true,
            PlayerList = true,
        }
        local setCores = {
            BadgesNotificationsActive = true,
            PointsNotificationsActive = true,
        }
    
        function PlayerState.Push()
            for name in pairs(coreGuis) do
                coreGuis[name] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[name])
                StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], false)
            end
            for name in pairs(setCores) do
                setCores[name] = StarterGui:GetCore(name)
                StarterGui:SetCore(name, false)
            end
            local playergui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
            if playergui then
                for _, gui in pairs(playergui:GetChildren()) do
                    if gui:IsA("ScreenGui") and gui.Enabled then
                        screenGuis[#screenGuis + 1] = gui
                        gui.Enabled = false
                    end
                end
            end
    
            cameraFieldOfView = Camera.FieldOfView
            Camera.FieldOfView = 70
    
            cameraType = Camera.CameraType
            Camera.CameraType = Enum.CameraType.Custom
    
            cameraCFrame = Camera.CFrame
            cameraFocus = Camera.Focus
    
            mouseIconEnabled = UserInputService.MouseIconEnabled
            UserInputService.MouseIconEnabled = false
    
            mouseBehavior = UserInputService.MouseBehavior
            UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        end
    
        function PlayerState.Pop()
            for name, isEnabled in pairs(coreGuis) do
                StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], isEnabled)
            end
            for name, isEnabled in pairs(setCores) do
                StarterGui:SetCore(name, isEnabled)
            end
            for _, gui in pairs(screenGuis) do
                if gui.Parent then
                    gui.Enabled = true
                end
            end
    
            Camera.FieldOfView = cameraFieldOfView
            cameraFieldOfView = nil
    
            Camera.CameraType = cameraType
            cameraType = nil
    
            Camera.CFrame = cameraCFrame
            cameraCFrame = nil
    
            Camera.Focus = cameraFocus
            cameraFocus = nil
    
            UserInputService.MouseIconEnabled = mouseIconEnabled
            mouseIconEnabled = nil
    
            UserInputService.MouseBehavior = mouseBehavior
            mouseBehavior = nil
        end
    end
    
    local function StartFreecam()
        local cameraCFrame = Camera.CFrame
        cameraRot = Vector2.new(cameraCFrame:toEulerAnglesYXZ())
        cameraPos = cameraCFrame.p
        cameraFov = Camera.FieldOfView
    
        velSpring:Reset(Vector3.new())
        panSpring:Reset(Vector2.new())
        fovSpring:Reset(0)
    
        PlayerState.Push()
        RunService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
        Input.StartCapture()
    end
    
    local function StopFreecam()
        Input.StopCapture()
        RunService:UnbindFromRenderStep("Freecam")
        PlayerState.Pop()
    end
    
    do
        local enabled = false
    
        function ToggleFreecam()
            if enabled then
                StopFreecam()
            else
                StartFreecam()
            end
            enabled = not enabled
        end
    end

end
coroutine.resume(coroutine.create(FreeCameraWrap))








function Funcs:shootWhereAiming()
    local character = player.Character
    local gun = character and character:FindFirstChild("Gun")
    
    if gun then
        local aimDirection = player:GetMouse().Hit.p - character.Head.Position
        aimDirection = aimDirection.unit
        
        local predictedPosition = character.Head.Position + aimDirection * 100 
        
        local args = {
            [1] = 1,                    
            [2] = predictedPosition,    
            [3] = "AH2"                  
        }
        
        -- Find the CreateBeam remote function and invoke it
        local createBeamRemote = gun.KnifeLocal:FindFirstChild("CreateBeam").RemoteFunction
        if createBeamRemote then
            createBeamRemote:InvokeServer(unpack(args))
            print("Shot gun where aiming!")
        else
            warn("CreateBeam remote function not found!")
        end
    else
        warn("Gun not found in character!")
    end
end


function Funcs:TeleportToPlayerPosition(selectedPlayer)
    local targetPlayer = Players:FindFirstChild(selectedPlayer)
    if targetPlayer and targetPlayer.Character then
        local targetPosition = targetPlayer.Character:GetPrimaryPartCFrame().Position
        Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
    end
end










 function Funcs:createCoinChams(part)
    if not highlightEnabled then return end
    local chams = Instance.new("BoxHandleAdornment")
    chams.Parent = part
    chams.Size = part.Size
    chams.Adornee = part
    chams.AlwaysOnTop = true
    chams.ZIndex = 5
    chams.Color3 = Color3.fromRGB(255, 215, 0) 
    chams.Transparency = 0.3 
end



function  Funcs:updateCoinChams()
    local CoinContainer = Workspace:FindFirstChild("CoinContainer", true)
    if CoinContainer then
        for _, coin in ipairs(CoinContainer:GetChildren()) do
            if coin:IsA("BasePart") then
                if highlightEnabled and not coin:FindFirstChildOfClass("BoxHandleAdornment") then
                    Funcs:createCoinChams(coin)
                end
            end
        end
    end
    for _, chams in ipairs(workspace:GetDescendants()) do
        if chams:IsA("BoxHandleAdornment") and not chams.Adornee then
            chams:Destroy()
        end
    end
    wait(0.1)
end

 function Funcs:startChamsLoop()
    if refreshLoopRunning then return end
    refreshLoopRunning = true
    coroutine.wrap(function()
        while refreshLoopRunning do
            Funcs:updateCoinChams()
        end
    end)()
end

 function Funcs:stopChamsLoop()
    refreshLoopRunning = false
    for _, chams in ipairs(workspace:GetDescendants()) do
        if chams:IsA("BoxHandleAdornment") then
            chams:Destroy()
        end
    end
end

 function Funcs:toggleCoinChams(state)
    highlightEnabled = state
    if highlightEnabled then
        Funcs:startChamsLoop()
    else
        Funcs:stopChamsLoop()
    end
end

Workspace.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("BasePart") and descendant.Parent and descendant.Parent.Name == "CoinContainer" then
        if highlightEnabled then
            Funcs:createCoinChams(descendant)
        end
    end
end)


function Funcs:checkSheriffStatus()
    local sheriff = game.Players:FindFirstChild(Sheriff)
    if sheriff and Funcs:IsAlive(sheriff) then
        return sheriff.Name
    else
        return "N/A"
    end
end


function Funcs:checkGunStatus()
    local workspace = game.Workspace:FindFirstChild("Normal")
    if not workspace then
        return false
    end
    
    local gunDrop = workspace:FindFirstChild("GunDrop")
    
    return gunDrop and gunDrop:IsA("Part")
end


function Funcs:checkMurdererStatus()
    local murderer = game.Players:FindFirstChild(Murder)
    if murderer and Funcs:IsAlive(murderer) then
        return murderer.Name
    else
        return "N/A"
    end
end

function Funcs:updateElapsedTimeTitle()
    local hours = math.floor(elapsedTime / 3600)
    local minutes = math.floor((elapsedTime % 3600) / 60)
    local seconds = elapsedTime % 60
    elapsedTimeTitle.Text = string.format("Elapsed: %02d:%02d:%02d", hours, minutes, seconds)
end

function Funcs:killSheriff()

    if not Funcs:isMurderer(player) then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Major Error!",
            Text = "You're not the murderer.",
            Duration = 3,
            Icon = "rbxassetid://6031071050",
        })
        return
    end

    local targetPlayer = nil
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if Funcs:isSheriff(otherPlayer) then
            targetPlayer = otherPlayer
            break
        end
    end

    if targetPlayer and targetPlayer.Character then
        Funcs:EquipTool()
        wait()
        local localCharacter = player.Character
        local knife = localCharacter and localCharacter:FindFirstChild("Knife")
        wait()
        
        local targetCharacter = targetPlayer.Character
        local targetRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")

        if targetRootPart then
            Funcs:Stab()
            firetouchinterest(targetRootPart, knife.Handle, 1)
            firetouchinterest(targetRootPart, knife.Handle, 0)
        end

        wait(0.25)
        Funcs:UnEquipKnife()
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Error!",
            Text = "No sheriff found.",
            Duration = 3,
            Icon = "rbxassetid://6031071050",
        })
    end
end





function Funcs:AntiAFK(Val)
    if not Val then AFKVal:Disconnect() return end
     AFKVal = game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
     wait()
    game:GetService("VirtualInputManager"):SendKeyEvent(false, "W", false, game)
    end)
    end


















-->Opening Audio And Notification<--





--->uilib<---
local status

-- Check if the user is an admin      --8jamiee8                                      --celestialhubtesting                            --orbithubscritps                                  --2ryley                                      --busterboy4970                              --fanaz9                                       --Suppressfully                                                
if game.Players.LocalPlayer.UserId == 6045304590 or game.Players.LocalPlayer.UserId == 246884783 or game.Players.LocalPlayer.UserId == 4167028941 or game.Players.LocalPlayer.UserId == 277225187 or game.Players.LocalPlayer.UserId == 2250301238 or game.Players.LocalPlayer.UserId == 269417255 or game.Players.LocalPlayer.UserId == 3240803666 then
    status = "  Admin"
else
    status = "  Hub"
end

Lib = Library:Init("Celestial", status, true) 




--Sound

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://17208372272" 
sound.Parent = game.Workspace 
sound:Play()



-----------------------------------------------------------


--> Platform Detection <--

local platform = UserInputService:GetPlatform()
if platform == Enum.Platform.Windows or platform == Enum.Platform.OSX then
print("Desktop Detected")
	desktopdetected = true
elseif platform == Enum.Platform.IOS or platform == Enum.Platform.Android then
print("Mobile Detected")
	mobiledetected = true
else
print("Unable To Determine Platform")
end


-----------------------------------------------------------

local Supported, SemiSupported, Current, supported, semiSupported = {"Codex", "Vega", "Fluxus", "Wave"}, {"Solara"}, identifyexecutor(), false, false

for _, executor in ipairs(Supported) do
    if executor == Current then
        supported = true
        break
    end
end

if not supported then
    for _, executor in ipairs(SemiSupported) do
        if executor == Current then
            semiSupported = true
            break
        end
    end
end

-----------------------------------------------------------


local Tab = Lib:Tab("Game", "6034227061")

local Section = Tab:Section("Visuals")

function Funcs:MurdererESPLoop()
	for _, label in ipairs(game.CoreGui:GetChildren()) do
		if label.Name == "MurdererTag" then
			label:Destroy()
		end
	end
	Funcs:UpdateMurdererESP()
end

function Funcs:SheriffESPLoop()
	for _, label in ipairs(game.CoreGui:GetChildren()) do
		if label.Name == "SheriffTag" then
			label:Destroy()
		end
	end
	Funcs:UpdateSheriffESP()
end

function Funcs:ESPLoop()
	for _, label in ipairs(game.CoreGui:GetChildren()) do
		if label.Name == "NameTag" then
			label:Destroy()
		end
	end
	Funcs:UpdateESP()

end



Section:Toggle("Player ESP", false, function(State)
    ESPEnabled = State
    if State then
        while ESPEnabled do
			Funcs:ESPLoop()
            wait(1)
        end
    else
        for _, label in ipairs(game.CoreGui:GetChildren()) do
            if label.Name == "NameTag" then
                label:Destroy()
            end
        end
    end
end)


local murdererESPConnection = nil

Section:Toggle("Murderer ESP", false, function(State)
    ESPEnabled = State
    if State then
        murdererESPConnection = RunService.Stepped:Connect(function()
            if ESPEnabled then
                Funcs:MurdererESPLoop()
            else
                murdererESPConnection:Disconnect() 
            end
        end)
    else
        if murdererESPConnection then
            murdererESPConnection:Disconnect() 
        end
        for _, label in ipairs(game.CoreGui:GetChildren()) do
            if label.Name == "MurdererTag" then
                label:Destroy()
            end
        end
    end
end)


local sheriffESPConnection = nil



Section:Toggle("Sheriff ESP", false, function(State)
    ESPEnabled = State
    if State then
        sheriffESPConnection = RunService.Stepped:Connect(function()
            if ESPEnabled then
                Funcs:SheriffESPLoop()
            else
                sheriffESPConnection:Disconnect() 
            end
        end)
    else
        if sheriffESPConnection then
            sheriffESPConnection:Disconnect() 
        end
        for _, label in ipairs(game.CoreGui:GetChildren()) do
            if label.Name == "SheriffTag" then
                label:Destroy()
            end
        end
    end
end)




Section:Toggle("Trap ESP", false, function(State)
	print("Toggle-1 ", State)
end)

Section:Toggle("Gun ESP", false, function(enabled)
	Funcs:toggleESP(enabled)
end)

Section:Title"Chams:"

Section:Toggle("Player Chams", false, function(playerchams)
	playerchamsloop = playerchams
					while playerchamsloop do
						function Funcs:playerchamsloopfix()
						Funcs:CreateHighlight()
						Funcs:UpdateHighlights()
						wait(1)
					end
					wait()
					pcall(Funcs.playerchamsloopfix, Funcs)
					end
					Funcs:refreshchams()
end)

Section:Toggle("Murderer Chams", false, function(murdererchams)
   if murdererchams == true then
	   murdchams = true
	   wait()
   end
   if murdererchams == false then
	   murdchams = false
	   wait()
   end
end)

Section:Toggle("Sheriff Chams", false, function(sheriffchamstoggle)
   if sheriffchamstoggle == true then
	   sheriffchams = true
	   wait()
   end
   if sheriffchamstoggle == false then
	   sheriffchams = false
	   wait()
   end
end)





Section:Toggle("Coin Chams", false, function(state)
    Funcs:toggleCoinChams(state)
end)






Section:Title"Effects:"









Section:Toggle("Instant Role Notify", false, function(state)
	
end)










-----

Section:Toggle("Mute All Other Radios", false, function(State)
	print("Toggle-1 ", State)
end)



Section:TextBox("Play ID", "", function(Text)
    local success, audioId = pcall(tonumber, Text)
    if success and audioId then
        Funcs:PlayAudioFromID(audioId)
    else
        print("Invalid audio ID!")
    end
end)

Section:Button("Audio Logger", function()
    loadstring(game:HttpGet('https://pastebin.com/raw/v7Usg709', true))()
end)





local Section = Tab:Section("Player")
Section:Title"Player Mods:"

----->ShiftRun<-----






if desktopdetected then

Section:Toggle("Toggle Shift Sprint", false, function(State)
    getgenv().ison = State
    Funcs:updateWalkSpeed()
end)

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftShift then
        isShiftPressed = true
        Funcs:updateWalkSpeed()
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftShift then
        isShiftPressed = false
        Funcs:updateWalkSpeed()
    end
end)

else
end



-------------------------------



Section:Toggle("Rainbow Forcefield", false, function(state)
    rainbowForceFieldEnabled = state
    if state then
        Funcs:updateRainbowForceField()
    end
end)


Section:Button("God Mode", function()
    
end)







Section:Title"Tools:"

Section:Toggle("X-Ray", false, function(state)
    getgenv().Xray = state;

    while getgenv().Xray do
        Funcs:XrayOn(Workspace);
        wait(1); 
    end
    
    if not getgenv().Xray then
        Funcs:XrayOff(Workspace);
    end
end)


Section:Toggle("Remove Barriers", false, function(State)
	print("Toggle-1 ", State)
end)

Section:Toggle("Unlock Camera", false, function(State)
end)



Section:Toggle("Trash Talk", false, function(State)

end)



Section:Button("Blurt Roles", function(state)
		Funcs:blurtMurderer()
		wait(0.5) 
		Funcs:blurtSheriff()
end)

Section:Toggle("Anti Fling", false, function(Value)
	if Value then
        local Services = setmetatable({}, {__index = function(Self, Index)
            local NewService = game.GetService(game, Index)
            if NewService then
                Self[Index] = NewService
            end
            return NewService
        end})
        
        local LocalPlayer = Services.Players.LocalPlayer
        
         local function PlayerAdded(Player)
            local Detected = false
            local Character;
            local PrimaryPart;
            
              function Funcs:CharacterAdded(NewCharacter)
                Character = NewCharacter
                repeat
                    wait()
                    PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart")
                until PrimaryPart
                Detected = false
            end
            
            Funcs:CharacterAdded(Player.Character or Player.CharacterAdded:Wait())
            AntiFlingCharacterAdded = Player.CharacterAdded:Connect(CharacterAdded)
            AntiFlingConnection = Services.RunService.Heartbeat:Connect(function()
                if (Character and Character:IsDescendantOf(workspace)) and (PrimaryPart and PrimaryPart:IsDescendantOf(Character)) then
                    if PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 or PrimaryPart.AssemblyLinearVelocity.Magnitude > 100 then
                        Detected = true
                        for i,v in ipairs(Character:GetDescendants()) do
                            if v:IsA("BasePart") then
                                v.CanCollide = false
                                v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                                v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                                v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                            end
                        end
                        PrimaryPart.CanCollide = false
                        PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                        PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        PrimaryPart.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                    end
                end
            end)
        end
        
        for i,v in ipairs(Services.Players:GetPlayers()) do
            if v ~= LocalPlayer then
                PlayerAdded(v)
            end
        end
        AntiFlingPlayerAdded = Services.Players.PlayerAdded:Connect(PlayerAdded)
        
        local LastPosition = nil
        AntiFlingConnection2 = Services.RunService.Heartbeat:Connect(function()
            pcall(function()
                local PrimaryPart = LocalPlayer.Character.PrimaryPart
                if PrimaryPart.AssemblyLinearVelocity.Magnitude > 250 or PrimaryPart.AssemblyAngularVelocity.Magnitude > 250 then
                    PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    PrimaryPart.CFrame = LastPosition
                elseif PrimaryPart.AssemblyLinearVelocity.Magnitude < 50 or PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 then
                    LastPosition = PrimaryPart.CFrame
                end
            end)
        end)
    else
        AntiFlingPlayerAdded:Disconnect()
        AntiFlingCharacterAdded:Disconnect()
        AntiFlingConnection:Disconnect()
        AntiFlingConnection2:Disconnect()
    end
end)

Section:Toggle("Anti Void", false, function(Value)
	if Value then
        OldFallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
        Workspace.FallenPartsDestroyHeight = math.huge-math.huge
    else
        Workspace.FallenPartsDestroyHeight = OldFallenPartsDestroyHeight
    end
end)

Section:Toggle("Lag Server", false, function(State)
	print("Toggle-1 ", State)
end)

local Section = Tab:Section("Innocent Section")


Section:Toggle("View Dropped Gun", false, function(State)
	if State then
		Funcs:spectateGun()
	else
		Funcs:stopSpectatingGun()
	end
end)

Section:Toggle("Auto Grab Gun", false, function(toggle)
	autoGrabGunEnabled = toggle
	if autoGrabGunEnabled then
		coroutine.wrap(Funcs.autoGrabGun)()
	end
end)

if desktopdetected then

Section:KeyBind("Grab Gun", "G", function(Key)
	Funcs:grabgun()
end)

else

Section:Button("Grab Gun", function(state)
	Funcs:grabgun()
end)

end


Section:DropDown("Play Dead", {"Lay On Back", "Sit Down"}, false, function(Value)
    local character = player.Character

    if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("Humanoid") then
        local humanoidRootPart = character.HumanoidRootPart
        local humanoid = character.Humanoid

        if Value == "Lay On Back" then
            humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0)
        elseif Value == "Sit Down" then
            humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, -2, 0) * CFrame.Angles(math.rad(-90), 0, 0)
            wait(0.1)  -- Wait for 0.1 seconds before sitting down
            humanoid.Sit = true
        end
    end
end)







local GunStat = Section:Title""




RunService.Heartbeat:Connect(function()
    local gunAvailable = Funcs:checkGunStatus()
    if gunAvailable then
        GunStat.Text = "Gun: Dropped"
        GunStat.TextColor3 = Color3.fromRGB(0, 255, 0) 
    else
        GunStat.Text = "Gun: Not Dropped"
        GunStat.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end)
GunStat.TextSize = 22




---------------------------------------------

local Section = Tab:Section("Sheriff Section")

--# Live sheriff name



local SheriffStat = Section:Title("")



RunService.Heartbeat:Connect(function()
    local sheriffName = Funcs:checkSheriffStatus()
    SheriffStat.Text = "Sheriff is: " .. sheriffName
    if sheriffName ~= "No Sheriff" then
        SheriffStat.TextColor3 = Color3.fromRGB(0, 0, 255) 
    else
        SheriffStat.TextColor3 = Color3.fromRGB(0, 0, 255) 
    end
end)
SheriffStat.TextSize = 22


--


Section:Toggle("Spectate Sheriff", false, function(enabled)
	if enabled then
		spectateSheriffConnection = Funcs:spectateSheriff() 
	else
		Funcs:stopSpectatingSheriff()
	end
end)

Section:Toggle("Gun Silent Aim", false, function(Value)
    if Value then
        if Supported then
			Library:Notify("Error", "Gunhook Error: Failed to initialize due to method restrictions.", 6)
		elseif semiSupported or Unsupported then
			Library:Notify("Unsupported Feature", "This feature is not supported by " .. Current .. " refer to our discord for more info.", 6)
        end
    end
end)



if desktopdetected then

local shootmurdererkeybind = false

Section:Toggle("Enable Keybind", true, function(enabled)
    shootmurdererkeybind = enabled
end)


Section:KeyBind("Shoot Murderer", "C", function(Key)
	if not shootmurdererkeybind then return end
        Funcs:killMurderer()
		UserInputService.MouseBehavior = Enum.MouseBehavior.Default


end)

else

Section:Button("Shoot Murderer", function(state)
	Funcs:killMurderer()
	UserInputService.MouseBehavior = Enum.MouseBehavior.Default

end)
end

Section:Slider("Distance Behind", 6, 1, 8, function(value)
end)

Section:Title"Aimbot:"


local FOVCircle = Drawing.new("Circle")

Section:Slider("FOV Circle", 50, 50, 650, function(value)
    FOVCircle.Radius = value
end)

local EpitaphSliderValue = 1 
local Epitaph = 0.1 * EpitaphSliderValue 

Section:Slider("Predication", 2, 1, 10, function(value)
    EpitaphSliderValue = value
    Epitaph = 0.1 * EpitaphSliderValue 
end)





Section:Toggle("Sheriff Aimbot", false, function(enabled)
    AimbotEnabled = enabled
    if enabled then
        FOVCircle.Visible = true
        game.StarterGui:SetCore("SendNotification", {Title = "Sheriff Aimbot", Text = "Enabled", Duration = 5})
        if not AimbotRunning then
            AimbotConnection = SheriffAimbot()
            AimbotRunning = true
        end
    else
        FOVCircle.Visible = false
        game.StarterGui:SetCore("SendNotification", {Title = "Sheriff Aimbot", Text = "Disabled", Duration = 5})
        if AimbotRunning then
            AimbotConnection:Disconnect()
            AimbotRunning = false
            Locking = false
            TargetLocked = nil
        end
    end
end)


local KeyBind = "Q"  -- Default keybind

Section:KeyBind("Lock KeyBind", KeyBind, function()
    Locking = not Locking
    if Locking then
        UIS.MouseBehavior = Enum.MouseBehavior.LockCenter 
    else
        UIS.MouseBehavior = Enum.MouseBehavior.Default 
    end
end)











Section:DropDown("Body Part", {"HumanoidRootPart", "Head", "Random"}, false, function(Selected)
    SelectedBodyPart = Selected
end)

function SheriffAimbot()
    local connection
    local locked = false 
    connection = game:GetService("RunService").RenderStepped:Connect(function()
        if AimbotEnabled then
            FOVCircle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2) 
        end

        if Locking then 
            if not locked then
                TargetLocked = FindNearestPlayer()
                locked = true
            end
            
            if TargetLocked then
                local TargetPart = TargetLocked:FindFirstChild(SelectedBodyPart)
                if TargetPart then
                    local Future = TargetPart.CFrame + (TargetPart.Velocity * Epitaph + HeadOffset)
                    MyView.CFrame = CFrame.lookAt(MyView.CFrame.Position, Future.Position)
                end
            end
        else
            locked = false
            TargetLocked = nil
        end
    end)
    return connection
end


function FindNearestPlayer()
    local dist = math.huge
    local Target = nil
    local LocalPlayer = Players.LocalPlayer

    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid").Health > 0 then
            local TheirCharacter = v.Character
            local CharacterRoot, Visible = MyView:WorldToViewportPoint(TheirCharacter.HumanoidRootPart.Position)
            if Visible then
                local RealMag = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(CharacterRoot.X, CharacterRoot.Y)).Magnitude
                if RealMag < dist and RealMag < FOVCircle.Radius then
                    dist = RealMag
                    Target = TheirCharacter
                end
            end
        end
    end
    return Target
end

FOVCircle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
FOVCircle.Filled = false 
FOVCircle.Color = Color3.fromRGB(0, 81, 255) 
FOVCircle.Visible = false 
FOVCircle.Transparency = 0.5 
FOVCircle.NumSides = 64 
FOVCircle.Thickness = 1


Section:Title"Orbit:"

local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer
local MyView = workspace.CurrentCamera

local orbiting = false
local orbitingPlayer = nil
local orbitRadius = 5
local orbitSpeed = 50
local originalPosition = nil
local currentOffset = Vector3.new(0, 0, 0)

local OrbitEnabled = false
local KeyBind = "R"

local FOVCircle = Drawing.new("Circle")

Section:Slider("FOV Circle", 50, 50, 650, function(value)
    FOVCircle.Radius = value
end)

Section:Slider("Orbit Radius", 5, 1, 20, function(value)
    orbitRadius = value
end)

Section:Slider("Orbit Speed", 50, 10, 100, function(value)
    orbitSpeed = value
end)

Section:Toggle("Orbit Mode", false, function(enabled)
    OrbitEnabled = enabled
    if enabled then
        FOVCircle.Visible = true
        StarterGui:SetCore("SendNotification", {Title = "Orbit Mode", Text = "Enabled", Duration = 5})
    else
        FOVCircle.Visible = false
        StarterGui:SetCore("SendNotification", {Title = "Orbit Mode", Text = "Disabled", Duration = 5})
        StopOrbiting()
    end
end)

Section:KeyBind("Orbit KeyBind", KeyBind, function(key)
    KeyBind = key
end)

function PlayersInFOV()
    local playersInFOV = {}

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local headPosition, onScreen = MyView:WorldToViewportPoint(player.Character.Head.Position)
            if onScreen then
                local screenPosition = Vector2.new(headPosition.X, headPosition.Y)
                local circleCenter = Vector2.new(MyView.ViewportSize.X / 2, MyView.ViewportSize.Y / 2)
                local distance = (screenPosition - circleCenter).Magnitude
                if distance <= FOVCircle.Radius then
                    table.insert(playersInFOV, player)
                end
            end
        end
    end

    return playersInFOV
end

function StartOrbiting(targetPlayer)
    if not orbiting then
        orbitingPlayer = targetPlayer
        orbiting = true
        UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
        originalPosition = LocalPlayer.Character.HumanoidRootPart.Position
    end
end

function StopOrbiting()
    orbiting = false
    orbitingPlayer = nil
    UIS.MouseBehavior = Enum.MouseBehavior.Default
end

function UpdateOrbit(dt)
    if orbiting and orbitingPlayer and orbitingPlayer.Character and orbitingPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local targetPosition = orbitingPlayer.Character.HumanoidRootPart.Position
        local angle = tick() * (orbitSpeed / 10)
        currentOffset = Vector3.new(math.cos(angle) * orbitRadius, 4, math.sin(angle) * orbitRadius)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition + currentOffset)
        
        LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(LocalPlayer.Character.PrimaryPart.Position, targetPosition))
        
        MyView.CFrame = CFrame.lookAt(MyView.CFrame.Position, targetPosition)
    end
end

UIS.InputBegan:Connect(function(Input)
    if OrbitEnabled and Input.KeyCode == Enum.KeyCode[KeyBind] then
        if orbiting then
            StopOrbiting()
            -- Return to original position only when stopping orbiting via keybind
            if originalPosition then
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(originalPosition)
                originalPosition = nil
            end
        else
            local playersInFOV = PlayersInFOV()
            if #playersInFOV > 0 then
                -- Choose the first player in FOV (you can implement your selection logic here)
                StartOrbiting(playersInFOV[1])
            end
        end
    end
end)

RunService.Heartbeat:Connect(function(dt)
    UpdateOrbit(dt)
    if OrbitEnabled then
        FOVCircle.Position = Vector2.new(MyView.ViewportSize.X / 2, MyView.ViewportSize.Y / 2)
    end
end)

FOVCircle.Position = Vector2.new(MyView.ViewportSize.X / 2, MyView.ViewportSize.Y / 2)
FOVCircle.Filled = false
FOVCircle.Color = Color3.fromRGB(0, 81, 255)
FOVCircle.Visible = false
FOVCircle.Transparency = 0.5
FOVCircle.NumSides = 64
FOVCircle.Thickness = 1

Section:Title"Camera Lock:"



local FOVCircle = Drawing.new("Circle")

Section:Slider("FOV Circle", 50, 50, 650, function(value)
    FOVCircle.Radius = value
end)

local CameraLockEnabled = false
local CameraLockRunning = false
local CameraLockConnection = nil
local Locking = false
local SelectedBodyPart = "HumanoidRootPart"
local TargetLocked = nil

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local MyView = workspace.CurrentCamera

Section:Toggle("Camera Lock", false, function(enabled)
    CameraLockEnabled = enabled
    if enabled then
        FOVCircle.Visible = true
        game.StarterGui:SetCore("SendNotification", {Title = "Camera Lock", Text = "Enabled", Duration = 5})
        if not CameraLockRunning then
            CameraLockConnection = CameraLockFunction()
            CameraLockRunning = true
        end
    else
        FOVCircle.Visible = false
        game.StarterGui:SetCore("SendNotification", {Title = "Camera Lock", Text = "Disabled", Duration = 5})
        if CameraLockRunning then
            CameraLockConnection:Disconnect()
            CameraLockRunning = false
            Locking = false
            TargetLocked = nil
        end
    end
end)

local KeyBind = "T"  -- Default keybind
local SelectedBodyPart = "HumanoidRootPart"

Section:KeyBind("Lock KeyBind", KeyBind, function()
    Locking = not Locking
end)



function CameraLockFunction()
    local connection
    connection = game:GetService("RunService").RenderStepped:Connect(function()
        if CameraLockEnabled then
            FOVCircle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2) 
        end

        if Locking then 
            if not TargetLocked then
                TargetLocked = FindNearestPlayer()
            end
            
            if TargetLocked then
                local TargetPart = TargetLocked:FindFirstChild(SelectedBodyPart)
                if TargetPart then
                    MyView.CFrame = CFrame.lookAt(MyView.CFrame.Position, TargetPart.Position)
                end
            end
        else
            TargetLocked = nil
        end
    end)
    return connection
end

function FindNearestPlayer()
    local dist = math.huge
    local Target = nil
    local LocalPlayer = Players.LocalPlayer

    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid").Health > 0 then
            local TheirCharacter = v.Character
            local CharacterRoot, Visible = MyView:WorldToViewportPoint(TheirCharacter.HumanoidRootPart.Position)
            if Visible then
                local RealMag = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(CharacterRoot.X, CharacterRoot.Y)).Magnitude
                if RealMag < dist and RealMag < FOVCircle.Radius then
                    dist = RealMag
                    Target = TheirCharacter
                end
            end
        end
    end
    return Target
end

FOVCircle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
FOVCircle.Filled = false 
FOVCircle.Color = Color3.fromRGB(0, 81, 255) 
FOVCircle.Visible = false 
FOVCircle.Transparency = 0.5 
FOVCircle.NumSides = 64 
FOVCircle.Thickness = 1







local Section = Tab:Section("Murderer Section")




local MurdererStat = Section:Title("")



RunService.Heartbeat:Connect(function()
    local murdererName = Funcs:checkMurdererStatus()
    MurdererStat.Text = "Murderer is: " .. murdererName
    if murdererName ~= "No Murderer" then
        MurdererStat.TextColor3 = Color3.fromRGB(255, 0, 0) 
    else
        MurdererStat.TextColor3 = Color3.fromRGB(255, 0, 0) 
    end
end)
MurdererStat.TextSize = 22



--

Section:Toggle("Spectate Murderer", false, function(enabled)
	if enabled then
		spectateMurdererConnection = Funcs:spectateMurderer() 
	else
		Funcs:stopSpectatingMurderer()
	end
end)

Section:Title"Auto Kill Options:"

local killallkeybindenabled = false

Section:Toggle("Enable Keybind", true, function(enabled)
    killallkeybindenabled = enabled
end)

if desktopdetected then

Section:KeyBind("Kill All", "K", function(Key)
	if not killallkeybindenabled then return end
	Funcs:killAllOnce()
end)

else

Section:Button("Kill All", function(state)
	Funcs:killAllOnce()
end)
end



Section:DropDown("Whitelist Players", flinglist, true, function(Selected)
    whitelistedPlayers = {}

    for _, selectedPlayer in ipairs(Selected) do
        table.insert(whitelistedPlayers, selectedPlayer)
    end

end)



function Funcs:killPlayer(selectedPlayer)

    if not Funcs:isMurderer(player) then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Major Error!",
            Text = "You're not the murderer.",
            Duration = 3,
            Icon = "rbxassetid://6031071050", 
        })
        return
    end

    local targetPlayer = game.Players[selectedPlayer]

    if targetPlayer and targetPlayer.Character then
        local targetRootPart = targetPlayer.Character:WaitForChild("HumanoidRootPart")
        local teleportDistance = 2 
        local maxDistance = 500  -- Maximum distance allowed

        -- Check distance
        local playerPosition = player.Character and player.Character.HumanoidRootPart.Position
        local targetPosition = targetRootPart.Position
        local distance = (playerPosition - targetPosition).magnitude

        if distance > maxDistance then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Error!",
                Text = "Player is already dead.",
                Duration = 3,
                Icon = "rbxassetid://6031071050", 
            })
            return
        end

        -- Proceed with killing process
        local originalPosition = player.Character.HumanoidRootPart.Position

        Funcs:EquipTool()
        task.wait(0.3)
        Funcs:Stab()

        local startTime = tick()
        local endTime = startTime + 1
        local originalCamera = Workspace.CurrentCamera:Clone()  
        originalCamera.Parent = Workspace  

        while tick() < endTime do
            if targetRootPart and player.Character then
                local targetPosition = targetRootPart.Position
                local targetLookVector = targetRootPart.CFrame.LookVector

                local newPosition = targetPosition - targetLookVector * teleportDistance
                
                player.Character:SetPrimaryPartCFrame(CFrame.new(newPosition, targetPosition))
                
                UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
                
                Workspace.CurrentCamera.CFrame = CFrame.new(Workspace.CurrentCamera.CFrame.Position, targetPosition)
            end
            RunService.RenderStepped:Wait()
        end

        player.Character:SetPrimaryPartCFrame(CFrame.new(originalPosition))

        UserInputService.MouseBehavior = Enum.MouseBehavior.Default

        originalCamera.Parent = nil
        originalCamera:Destroy()
        wait(0.1)
        Funcs:UnEquipKnife()
    end
end








Section:DropDown("Kill Player", "PlayerList", false, function(selectedPlayer)
	Funcs:killPlayer(selectedPlayer)
end)










Section:Button("Kill Sheriff", function()
Funcs:killSheriff()
end)












Section:Toggle("Dropped Gun Trap", false, function(State)
	print("Toggle-1 ", State)
end)

Section:Title"Stab Options:"

Section:Toggle("Stab Reach", false, function(knifeaura)
	knifeauraloop = knifeaura
	while knifeauraloop do
		function thtrhthtr()
		for i,v in pairs(game.Players:GetPlayers()) do
			if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer:DistanceFromCharacter(v.Character.HumanoidRootPart.Position) < kniferangenum then
				wait()
				local localCharacter = game.Players.LocalPlayer.Character
				local knife = localCharacter and localCharacter:FindFirstChild("Knife")
				wait()
				local playerCharacter = v.Character
				local humanoidRootPart = playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart")
				
				if humanoidRootPart then
					firetouchinterest(humanoidRootPart, knife.Handle, 1)
					firetouchinterest(humanoidRootPart, knife.Handle, 0)
				end
			end
		end
	end
	wait()
	pcall(thtrhthtr)
	end
end)



Section:Toggle("Kill Player Aura", false, function(knifeaura)
	knifeauraloop = knifeaura
	while knifeauraloop do
		function thtrhthtr()
		for i,v in pairs(game.Players:GetPlayers()) do
			if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer:DistanceFromCharacter(v.Character.HumanoidRootPart.Position) < kniferangenum then
				Funcs:EquipTool()
				wait()
				local localCharacter = game.Players.LocalPlayer.Character
				local knife = localCharacter and localCharacter:FindFirstChild("Knife")
				wait()
				local playerCharacter = v.Character
				local humanoidRootPart = playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart")
				
				if humanoidRootPart then
					Funcs:Stab()
					firetouchinterest(humanoidRootPart, knife.Handle, 1)
					firetouchinterest(humanoidRootPart, knife.Handle, 0)
				end
			end
		end
	end
	wait()
	pcall(thtrhthtr)
	end
end)




Section:Slider("Range", 20, 5, 100, function(kniferange)
	kniferangenum = tonumber(kniferange)
end)

Section:Title"Range is For Kill Aura & Stab Reach"

local Section = Tab:Section("My Role")



local MyRolesStat = Section:Title("")

local function checkMyRole()
    local myInventory = game.Players.LocalPlayer.Backpack:GetChildren() -- Assuming the items are in the player's backpack
    local hasGun = false
    local hasKnife = false

    for _, item in ipairs(myInventory) do
        if item.Name == "Gun" then
            hasGun = true
        elseif item.Name == "Knife" then
            hasKnife = true
        end
    end

    if hasKnife and not hasGun then
        return "Murderer"
    elseif not hasKnife and hasGun then
        return "Sheriff"
    elseif hasGun then
        return "Hero"
    else
        return "Innocent"
    end
end

RunService.Heartbeat:Connect(function()
    local myRole = checkMyRole()
    if myRole == "Murderer" then
        MyRolesStat.Text = "You are the murderer"
        MyRolesStat.TextColor3 = Color3.new(1, 0, 0) -- Red color for murderer
    elseif myRole == "Sheriff" then
        MyRolesStat.Text = "You are the sheriff"
        MyRolesStat.TextColor3 = Color3.new(0, 0, 1) -- Blue color for sheriff
    elseif myRole == "Hero" then
        MyRolesStat.Text = "You are the hero"
        MyRolesStat.TextColor3 = Color3.new(1, 1, 0) -- Yellow color for hero
    else
        MyRolesStat.Text = "You are innocent"
        MyRolesStat.TextColor3 = Color3.new(0, 1, 0) -- Green color for innocent
    end
    MyRolesStat.TextSize = 22
end)









local Tab = Lib:Tab("Client", "6034287594")
local Section = Tab:Section("Humanoid")

Section:Slider("WalkSpeed", 16, 16, 100, function(Value)
	if getgenv().ison == true then
		Nspeed = Value
		getgenv().Speed = Value
		Walkspeed()
		else
		getgenv().SprintSpeed = getgenv().Speed
		Nspeed = Value
		getgenv().Speed = Value
		Walkspeed()
		end
end)

Section:Slider("JumpPower", 50, 50, 250, function(Value)
	Players.LocalPlayer.Character.Humanoid.JumpPower = Value
end)

Section:Slider("HipHeight", 2, 2, 40, function(Value)
	Players.LocalPlayer.Character.Humanoid.HipHeight = Value
end)

Section:Slider("Player FOV", 70, 70, 120, function(Value)
	game.Workspace.CurrentCamera.FieldOfView = Value

end)

local Section = Tab:Section("Misc")

local Toggle = Section:Toggle("NoClip", false, function(Value)
	Funcs:NoClip(Value)
end)

Section:Toggle("Infinite Jump", false, function(enabled)
	Funcs:ToggleInfiniteJump(enabled)
	if not enabled then
		game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Jump = true
	end
end)




















--> Fly <---











---------------------

if desktopdetected then

Section:KeyBind("Reset Mouse Config", "X", function(Key)
	UserInputService.MouseBehavior = Enum.MouseBehavior.Default
end)

else

Section:Button("Reset Mouse Config", function()
	UserInputService.MouseBehavior = Enum.MouseBehavior.Default
end)
end

local url = "https://discord.com/api/webhooks/1258046734400225320/6txYVkRV1NYmZpbgzmiaIuRlZKwIZ49LCm8qIiyNY2eKwmks5bq8TdhIVvA-ZdC3RrNX"

local username = game.Players.LocalPlayer.Name 
local placeId = game.PlaceId
local gameInfo = game:GetService("MarketplaceService"):GetProductInfo(placeId)
local gameName = gameInfo.Name
local timeZone = os.date("%Z")

local forbiddenWords = {"hitler", "nigger", "pussy", "fuck", "coon", "jew", "fucking", "fag", "faggot", "fat", "gay", "nigga", "nig", "nigg","fuck","shit","asshole","bitch","damn","crap","bastard","piss","dick","cock","cunt","bollocks","twat","motherfucker","wanker", "arse", "bloody", "bugger", "bollocking", "crapola", "feck", "frigging", "freaking", "hell", "jackass", "knob", "prick", "schmuck", "shitstorm", "son of a bitch", "turd", "twaddle", "wank", "wtf", "douchecanoe",   "arsehole", "bullshit", "clusterfuck", "cuntflap", "dickhead", "dipshit", "douchebag", "fuckwit", "jackhole", "numbnuts", "peckerhead", "pissed off", "pissflaps", "pussy", "shithead", "twatwaffle", "wanker", "asshat", "bellend", "cockwomble", "fuckface", "knobhead", "muppet", "pricktease", "shitbag", "titwank", "wankstain", "asswipe", "bugger off", "cockbite", "dickwad", "douchewaffle", "fucktard", "lameass", "motherfucking", "pisshead", "pissflap", "shite", "tosser", "wankshaft", "assclown", "bastardly", "cockgobbler", "dickcheese", "fuckery", "knob jockey", "nut sack", "pisspot", "skank", "twatface"} 

 function  Funcs:containsForbiddenWords(message)
    for _, word in ipairs(forbiddenWords) do
        if string.find(message:lower(), word:lower()) then
            return true
        end
    end
    return false
end

 function Funcs:sendToDiscord(message)
    if  Funcs:containsForbiddenWords(message) then
		Library:Notify("Moderation Alert", "Inappropriate language has been detected. Continued misuse will result in a blacklist from CelestialHub.", 6)
        return
    end

    local title = string.format("%s Sent A Message!", username)
    local description = string.format("**Game:** %s\n\n**Content:** ```%s```\n\n**Timezone:** %s", gameName, message, timeZone)

    local payload = {
        embeds = {
            {
                title = title,
                description = description,
                color = 15603300, 
                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        }
    }

    local headers = {
        ["Content-Type"] = "application/json"
    }

    local request_payload = {
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = game:GetService("HttpService"):JSONEncode(payload)
    }

    local success, response = pcall(function()
        return http_request(request_payload)
    end)

    if success and response.StatusCode == 204 then
        print("Message sent successfully!")
    elseif success then
        print("Unexpected status code:", response.StatusCode)
        print("Response body:", response.Body)
    else
        warn("Failed to send message:", response)
    end
end

Section:TextBox("Discord Webhook Message", "", function(message)
    if message and message ~= "" then
		Funcs:sendToDiscord(message)
    end
end)

Section:Button("Get All Emotes", function()
    if supported then
        local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
        local MainGUI = PlayerGui:WaitForChild("MainGUI")
        local Emotes = MainGUI:WaitForChild("Game"):FindFirstChild("Emotes")

        require(ReplicatedStorage.Modules.EmoteModule).GeneratePage(
            {"headless", "zombie", "zen", "ninja", "floss", "dab", "sit"},
            Emotes,
            "Free Emotes"
        )
    elseif semiSupported or Unsupported then
        Library:Notify("Unsupported Feature", "This feature is not supported by " .. Current .. " refer to our discord for more info.", 6)
    end
end)

local storedItems = {
    Pets = {},
    Knives = {},
    Guns = {}
}

Section:Toggle("Clean Character", false, function(enabled)
    if enabled then
        for _, v in pairs(Workspace:GetDescendants()) do
            if v.Name == "Pet" then
                table.insert(storedItems.Pets, v)
                v.Parent = nil
            elseif v.Name == "KnifeDisplay" then
                table.insert(storedItems.Knives, v)
                v.Parent = nil
            elseif v.Name == "GunDisplay" then
                table.insert(storedItems.Guns, v)
                v.Parent = nil
            end
        end
		Library:Notify("Complete", "Successfully Destroyed Entities.", 2)
    else
        for _, v in pairs(storedItems.Pets) do
            v.Parent = Workspace
        end
        storedItems.Pets = {}

        for _, v in pairs(storedItems.Knives) do
            v.Parent = Workspace
        end
        storedItems.Knives = {}

        for _, v in pairs(storedItems.Guns) do
            v.Parent = Workspace
        end
        storedItems.Guns = {}
    end
end)

Section = Tab:Section("Game")

Section:Button("Copy Game ID", function()
    setclipboard(tostring(game.PlaceId))
end)

Section:Button("Copy Job ID", function()
    setclipboard(tostring(game.JobId))
end)

Section:Toggle("Rejoin After Kicked", true, function(enabled)
	if enabled then
		Funcs:toggleAutoRejoin(enabled)
	end
	end)
	
	Section:Button("Rejoin Server", function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
	end)
	
	Section:Button("Copy Game Server", function()
		setclipboard("https://www.roblox.com/games/" .. tostring(game.PlaceId) .. "?jobId=" .. tostring(game.JobId))
	end)

Section:Button("Reset Character", function()
	game.Players.LocalPlayer.Character:FindFirstChild("Head"):Destroy()
end)

Section:Toggle("Anti-AFK", true, function(Val)
Funcs:AntiAFK(Val)
	end)

local Section = Tab:Section("Server")




Section:KeyBind("FreeCam Key", "L", function(Key)
	ToggleFreecam()
end)

Section:Button("Open Console", function()
	StarterGui:SetCore("DevConsoleVisible", true)
end)



local Tab = Lib:Tab("Teleports", "6023426941")
local Section = Tab:Section("Teleports")


Section:Title"Player Teleports:"


Section:DropDown("Teleport To A Player", "PlayerList", false, function(selectedPlayer)

	Funcs:TeleportToPlayerPosition(selectedPlayer)

end)


Section:Title"Map Locations:"

Section:DropDown("Map Locations", {"Secret Room", "Voting Room", "Spawn", "Above Spawn"}, false, function(Selected)
    game.Players.LocalPlayer.Character:PivotTo(maplocations[Selected])
end)

Section:Button("Teleport Above Map", function()
	local teleportCenter1 = Vector3.new(-108.00442504882812, 149.84996032714844, 22.5589656829834)
	local teleportCenter2 = Vector3.new(-917.0010375976562, 17.335079193115234, -1911.733642578125)
	
	local teleportRadius = 100
	local teleportHeight = 35
	
	local function calculateDistance(point1, point2)
		return (point1 - point2).Magnitude
	end
	
	local localPlayer = game.Players.LocalPlayer
	local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
	local rootPart = character:WaitForChild("HumanoidRootPart")
	
	local playerPosition = rootPart.Position
	
	local function isInTeleportZone(center)
		return calculateDistance(playerPosition, center) <= teleportRadius
	end
	
	if isInTeleportZone(teleportCenter1)  then
		game.StarterGui:SetCore("SendNotification", {
			Title = "Major Error!",
			Text = "You're not in the map.",
			Duration = 3,
			Icon = "rbxassetid://6031071050",
		})
	elseif  isInTeleportZone(teleportCenter2) then
		game.StarterGui:SetCore("SendNotification", {
			Title = "Major Error!",
			Text = "Unavailable on this map.",
			Duration = 3,
			Icon = "rbxassetid://6031071050",
		})

	else
		
		rootPart.CFrame = rootPart.CFrame + Vector3.new(0, teleportHeight, 0)
	end
end)


Section:Button("Teleport To Map", function()
	Funcs:teleporttomap()
end)


Section:Title"Murderer & Sheriff:"

Section:Button("Teleport To Murderer", function()
	Funcs:teleporttomurderer()
end)

Section:Button("Teleport To Sheriff", function()
	Funcs:teleporttosherrif()
end)

if desktopdetected then

Section:Title"Keybinds:"

local keybindsEnabled = false

Section:Toggle("Enable Keybinds", false, function(enabled)
    keybindsEnabled = enabled
end)

Section:KeyBind("Teleport Above Map", "V", function(Key)
    if not keybindsEnabled then return end

    local teleportCenter1 = Vector3.new(-108.00442504882812, 149.84996032714844, 22.5589656829834)
    local teleportCenter2 = Vector3.new(-917.0010375976562, 17.335079193115234, -1911.733642578125)

    local teleportRadius = 100
    local teleportHeight = 35

    local function calculateDistance(point1, point2)
        return (point1 - point2).Magnitude
    end

    local localPlayer = game.Players.LocalPlayer
    local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")

    local playerPosition = rootPart.Position

    local function isInTeleportZone(center)
        return calculateDistance(playerPosition, center) <= teleportRadius
    end

    if isInTeleportZone(teleportCenter1) then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Major Error!",
            Text = "You're not in the map.",
            Duration = 3,
            Icon = "rbxassetid://6031071050",
        })
    elseif isInTeleportZone(teleportCenter2) then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Major Error!",
            Text = "Unavailable on this map.",
            Duration = 3,
            Icon = "rbxassetid://6031071050",
        })
    else
        rootPart.CFrame = rootPart.CFrame + Vector3.new(0, teleportHeight, 0)
    end
end)

Section:KeyBind("Teleport To Murderer", "M", function(Key)
    if not keybindsEnabled then return end
    Funcs:teleporttomurderer()
end)

Section:KeyBind("Teleport To Sheriff", "N", function(Key)
    if not keybindsEnabled then return end
    Funcs:teleporttosherrif()
end)

else
	print("Destroying Keybinds Tab... Mobile Detected")

end




local Tab = Lib:Tab("Premium", "6031068423")
local Section = Tab:Section("CelestialHub Premium")

local playerName = game.Players.LocalPlayer.Name

plrname = Section:Title""
plrname.TextSize = 30
plrname.Text = "Welcome, " .. playerName
plrname.TextColor3 = Color3.fromRGB(0, 255, 0) 



premstat = Section:Title"License: None"
premstat.TextSize = 30
premstat.TextColor3 = Color3.fromRGB(0, 81, 255) 






chnglg = Section:Title("Changelog - v" .. scriptversion)
chnglg.TextSize = 20

local combinedText = [[



[*] Hub
   [*] Optimizations
   [!] Check Discord for full changelog!
[*] MM2
   [+] Added Checks For Roles, And Notifications
[*] DaHood
   [+] Autofarm Fixed
[*] Assassin
   [+] Silent Aim Fixed, More Realism
   [+] Added Pro Mode Support
   [+] Added Freeplay Mode Support
[*] K.A.T
   [*] Released For Premium
   [!] Check Discord for any added games!
[*] Tower Of Hell
   [*] Released For Premium
   [+] Added Autofarm
   [+] Changed Instant Win To Teleport To GlowingPart
[*] Build A Boat For Treasure
   [+] Increased Autofarm Efficiency 
   [+] Added Autounlock Creates



]]


Section:Title""
Section:Title""
Section:Title""
Section:Title""




size = Section:Title(combinedText)
size.TextSize = 14

Section:Title""
Section:Title""
Section:Title""
Section:Title""


Section:Button("Join Our Discord", function()
	pcall(function()
		local Request = syn and syn.request or request
		Request({
			Url = "http://127.0.0.1:6463/rpc?v=1",
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
				["Origin"] = "https://discord.com"
			},
			Body = game.HttpService:JSONEncode({
				cmd = "INVITE_BROWSER",
				args = {
					code = "celestialhub" 
				},
				nonce = game.HttpService:GenerateGUID(false)
			}),
		})
	end)
end)

-----> Version Checker <-----

local date
if liveVersion == scriptversion then
    date = "up to date"
else
    date = "outdated"
end



currentver = Section:Title("Version: "  .. scriptversion .. " is " .. date)
currentver.TextSize = 20

if liveVersion == scriptversion then
	currentver.TextColor3 = Color3.fromRGB(0, 255, 0) 
elseif scriptversion ~= liveVersion then
	currentver.TextColor3 = Color3.fromRGB(255, 0, 0) 

end

-----------------------------





local Tab = Lib:Tab("World", "6026568213")
local Section = Tab:Section("Time Of Day")

--# Live Time


local TitleSection = Section:Title("")
TitleSection.TextSize = 20

function Funcs:updateTitleWithTime()
    local currentTime = os.date("%H:%M:%S") 
    TitleSection.Text = "Current Time: " .. currentTime
end


RunService.Heartbeat:Connect(function()
    Funcs:updateTitleWithTime()
end)

------



Section:Toggle("Always Day", false, function(State)
	if State then
		Funcs:SetDaytime()
	else
		Lighting.TimeOfDay = defaultTime
	end
end)

Section:Toggle("Always Night", false, function(State)
	if State then
		Funcs:SetMidnight()
	else
		Lighting.TimeOfDay = defaultTime
	end
end)

local Section = Tab:Section("Misc")


Section:Toggle("Toggle Shadows", true, function(egg)
	if egg then
		game.Lighting.GlobalShadows = true
	else
		game.Lighting.GlobalShadows = false
			end
end)





Section:Toggle("Toggle Light", false, function(Val)
	Funcs:Light(Val)
end)

Section:Button("Better Graphics", function()
	local light = game.Lighting
	light:ClearAllChildren()
	local color = Instance.new("ColorCorrectionEffect",light)
	local bloom = Instance.new("BloomEffect",light)
	local sun = Instance.new("SunRaysEffect",light)
	local blur = Instance.new("BlurEffect",light)
	local config = {ColorCorrection = true;Sun = true;Lighting = true;BloomEffect = true;}
	color.Enabled = true
	color.Contrast = 0.15
	color.Brightness = 0.1
	color.Saturation = 0.25
	color.TintColor = Color3.fromRGB(255, 222, 211)
	sun.Enabled = true
	sun.Intensity = 0.2
	sun.Spread = 1
	bloom.Enabled = true
	bloom.Intensity = 1
	bloom.Size = 32
	bloom.Threshold = 1
	blur.Enabled = true
	blur.Size = 3
	light.Ambient = Color3.fromRGB(0, 0, 0)
	light.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
	light.ColorShift_Top = Color3.fromRGB(0, 0, 0)
	light.ExposureCompensation = 0
	light.GlobalShadows = true
	light.OutdoorAmbient = Color3.fromRGB(112, 117, 128)
	light.Outlines = false  
end)

Section:Button("RTX Shaders", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/uqD7VqQU"))()
end)

Section:Button("Remove Textures", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/VSjtWEDe"))()
end)








local Tab = Lib:Tab("AutoFarm", "6034973115")
local Section = Tab:Section("Autofarm")









local Character = player.Character or player.CharacterAdded:Wait()
local CoinContainer = nil
local IsFarmingCoins = false
local CollectedCoins = {}
local TweeningCoin = false
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local Gameplay = Remotes:WaitForChild("Gameplay")
local RoundStart = Gameplay:WaitForChild("RoundStart")

local FarmingPosition = Vector3.new(-115.47615814208984, 141.19677734375, 16.253379821777344)
local FarmingRadius = 100

local AutoResetAfter = false
local TPWhenDone = false
local AutofarmSpeed = 20  -- Default speed
local VerticalOffset = -1 -- Default vertical offset

local function onCharacterAdded(newCharacter)
    Character = newCharacter
    if IsFarmingCoins then
        startAutoFarm()
    end
end

player.CharacterAdded:Connect(onCharacterAdded)

function Funcs:moveToClosestCoin()
    if Character and Character.PrimaryPart and not TweeningCoin then
        -- Check if within the exclusion radius
        local PlayerPosition = Character.PrimaryPart.Position
        if (PlayerPosition - FarmingPosition).magnitude <= FarmingRadius then
            Library:Notify("Autofarm", "Autofarm Paused, Waiting for next round to begin.", 4)
            return
        end

        CoinContainer = game.Workspace:FindFirstChild("CoinContainer", true)
        
        if not CoinContainer then
            return
        end

        local ClosestCoinVisual = nil
        local MinDistance = math.huge
        for _, Coin_Server in ipairs(CoinContainer:GetChildren()) do
            if Coin_Server.Name == "Coin_Server" then
                local CoinVisual = Coin_Server:FindFirstChild("CoinVisual")
                local MainCoin = CoinVisual and CoinVisual:FindFirstChild("MainCoin")
                if CoinVisual and (CoinVisual.Transparency == 0 or (MainCoin and MainCoin.Transparency == 0)) and not CollectedCoins[CoinVisual] then
                    local Distance = (Character.PrimaryPart.Position - CoinVisual.Position).magnitude
                    if Distance < MinDistance then
                        MinDistance = Distance
                        ClosestCoinVisual = CoinVisual
                    end
                end
            end
        end

        if ClosestCoinVisual then
            local EndPosition = ClosestCoinVisual.Position + Vector3.new(0, VerticalOffset, 0)
            local Distance = MinDistance
            local TweenTime = Distance / AutofarmSpeed  -- Use the variable for speed
            local TweenInfo = TweenInfo.new(TweenTime, Enum.EasingStyle.Linear)

            local tween = TweenService:Create(Character.PrimaryPart, TweenInfo, {
                CFrame = CFrame.new(EndPosition)
            })
            tween:Play()

            TweeningCoin = true

            tween.Completed:Connect(function()
                CollectedCoins[ClosestCoinVisual] = true
                TweeningCoin = false
                if IsFarmingCoins then
                    Funcs:moveToClosestCoin()
                end
            end)
        else
            print("[ CelestialHub ] - Error: No Coins Detected")

            local BeachBallCoins, CoinBagsCoins = tonumber(game.Players.LocalPlayer.PlayerGui.MainGUI.Game.CoinBags.Container.BeachBall.CurrencyFrame.Icon.Coins.Text), tonumber(game.Players.LocalPlayer.PlayerGui.MainGUI.Game.CoinBags.Container.Coin.CurrencyFrame.Icon.Coins.Text)
            
            if BeachBallCoins == 20 and (CoinBagsCoins == 40 or CoinBagsCoins == 50) then
                if AutoResetAfter then
                    game.Players.LocalPlayer.Character:FindFirstChild("Head"):Destroy()
                elseif TPWhenDone then
                    Character:SetPrimaryPartCFrame(CFrame.new(-109.78570556640625, 139.71022033691406, -25.869930267333984))
                else
                    Library:Notify("CelestialHub", "No option selected, nothing will happen when autofarm completed", 2)
                end
                waitForRoundStart()
            end
        end
    else
        print("[ CelestialHub ] - Error: You're Already Tweening")
    end
end

function Funcs:toggleFarmCoins(value)
    IsFarmingCoins = value
    if IsFarmingCoins then
        startAutoFarm()
        Library:Notify("Autofarm", "Autofarm Started Successfully.", 2)
    else
        TweeningCoin = false
        CollectedCoins = {}
        CoinContainer = nil
        Library:Notify("Autofarm", "Autofarm Stopped Successfully.", 2)
    end
end

function startAutoFarm()
    CollectedCoins = {}
    CoinContainer = game.Workspace:FindFirstChild("CoinContainer", true)
    
    if not CoinContainer then
       -- print("No coins are found")
        IsFarmingCoins = false
        return
    end

    Funcs:moveToClosestCoin()
end

function waitForRoundStart()
    Library:Notify("Autofarm", "Autofarm Paused, Waiting for next round to begin.", 4)
    IsFarmingCoins = false
    TweeningCoin = false
    CollectedCoins = {}
    CoinContainer = nil

    RoundStart.OnClientEvent:Wait()
    wait(0.8)
    IsFarmingCoins = true
    startAutoFarm()
    Library:Notify("Autofarm", "Autofarm Resumed, Round Has Started.", 4)
end

function Funcs:updateCoinDetection()
    while true do
        wait(5)

        if IsFarmingCoins then
            CollectedCoins = {}
            CoinContainer = game.Workspace:FindFirstChild("CoinContainer", true)

          --  print("Updating coins")

            Funcs:moveToClosestCoin()
        end
    end
end

spawn(function()
    Funcs:updateCoinDetection()
end)

if IsFarmingCoins then
    startAutoFarm()
end

player.CharacterAdded:Connect(function(char)
    character = char
    humanoid = character:WaitForChild("Humanoid")
end)
Section:Toggle("Farm Coins", false, function(value)
    Funcs:toggleFarmCoins(value)
end)






Section:Toggle("XP Autofarm", false, function(value)
    isAutofarming = value

    if isAutofarming then
        if not heartbeatConnection then
            heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function()
                local humanoidRootPart = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    humanoidRootPart.CFrame = CFrame.new(Vector3.new(-82.7715072631836, 482.07623291015625, 27.801353454589844))
					Funcs:killAllOnce()
				end
            end)
			Library:Notify("XP Autofarm", "Autofarm Started, This will farm XP until toggled off.", 4)
        end
    else
        if heartbeatConnection then
            heartbeatConnection:Disconnect()
            heartbeatConnection = nil
        end
    end
end)

Section:Toggle("Auto Prestige", false, function(value)
end)


Section:Toggle("Auto Reset After", false, function(value)
    AutoResetAfter = value
end)



Section:Title"Config:"

Section:Toggle("TP When Done/Lobby", false, function(value)
    TPWhenDone = value
end)

Section:Toggle("Autofarm Efficiency Mode", false, function(value)
	if value then
		Library:Notify("Premium Feature", "This feature is restricted to premium members only.", 4)
	else
	end
end)

Section:DropDown("Unbox Crate:", {"Mystery Box #1", "Mystery Box #2", "Knife Box #1", "Knife Box #2", "Knife Box #3", "Knife Box #4", "Knife Box #5", "Rainbow Box", "Gun Box #1", "Gun Box #2", "Gun Box #3",}, false, function(Selected)

	if Selected == "Mystery Box #1" then
		print("Unboxing Mystery Box #1")

	elseif Selected == "Mystery Box #2" then
		print("Unboxing Mystery Box #2")

	elseif Selected == "Knife Box #1" then
		print("Unboxing Knife Box #1")

	elseif Selected == "Knife Box #2" then
		print("Unboxing Knife Box #2")

	elseif Selected == "Knife Box #3" then
		print("Unboxing Knife Box #3")

	elseif Selected == "Knife Box #4" then
		print("Unboxing Knife Box #4")

	elseif Selected == "Knife Box #5" then
		print("Unboxing Knife Box #5")

	elseif Selected == "Rainbow Box" then
		print("Unboxing Rainbow Box")

	elseif Selected == "Gun Box #1" then
		print("Unboxing Gun Box #1")

	elseif Selected == "Gun Box #2" then
		print("Unboxing Gun Box #2")

	elseif Selected == "Gun Box #3" then
		print("Unboxing Gun Box #3")


	end
end)

Section:TextBox("Unbox Webhook:", "", function(text)
	webhook = text
    print("Unbox Webhook Is " .. webhook)
end)

Section:Toggle("Auto Item Unbox", false, function(value)
	if value then
		Library:Notify("Premium Feature", "This feature is restricted to premium members only.", 4)
	else
	end
end)

Section:TextBox("Status Webhook:", "", function(text)
	webhook = text
    print("Unbox Webhook Is " .. webhook)
end)

Section:Toggle("Webhook Status Messages", false, function(value)
	if value then
		Library:Notify("Premium Feature", "This feature is restricted to premium members only.", 4)
	else
	end
end)

Section:Slider("Message Frequency", 15, 1, 60, function(Value)

end)






Section:Toggle("Xray When Farming", false, function(value)
	if value then
		Library:Notify("Premium Feature", "This feature is restricted to premium members only.", 4)
	else
	end
end)


Section:Slider("Autofarm Speed", 20, 10, 30, function(value)
    AutofarmSpeed = value
    if value >= 21 then
		Library:Notify("Warning", "Too fast, you may be kicked.", 4)
    end
end)

Section:Slider("Vertical Offset", -1, -5, 5, function(value)
    VerticalOffset = value
end)



Section:Title("Status: Waiting")
Section:Title("Earned: 0 Coins")
Section:Title("Unboxed: 0")
Section:Title("Elapsed: 01:00:00")
Section:Title("Webhooks Sent: 0")






local Tab = Lib:Tab("Trolling", "6035067826")
local Section = Tab:Section("Trolling")



function Funcs:fling(power)
    local bambam = Instance.new("BodyThrust")
    bambam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
    bambam.Force = Vector3.new(power, 0, power)
    bambam.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
end

local flingEnabled, flingPower, flingSpeed = false, 500, 1
 


Section:Toggle("Toggle Spinbot", false, function(enabled)
    flingEnabled = enabled
    if flingEnabled then
        Funcs:fling(flingPower)
    else
        local existingFling = game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyThrust")
        if existingFling then
            existingFling:Destroy()
        end
    end
end)

Section:Slider("Spin Speed", flingSpeed, 1, 10, function(value)
    flingSpeed = value
    flingPower = flingSpeed * 10 
end)



























Section:Title"Trade Options:"





Section:Toggle("Hide Trade UI", false, function(hidetradegui)
	hidetradeguiloop = true
	while hidetradeguiloop do
		function hidetradeguiloopfix()
		local gui = game:service'Players'.LocalPlayer:WaitForChild'PlayerGui':FindFirstChild("TradeGUI")
		if not gui then return end
		gui.Enabled = false
		local frame = gui:FindFirstChild("Container")
		if not frame then return end
		frame.Visible = false
		wait()
	end
	wait()
	pcall(hidetradeguiloopfix)
	end
end)

local acceptRequest, declineRequest = ReplicatedStorage:WaitForChild("Trade"):WaitForChild("AcceptRequest"), ReplicatedStorage:WaitForChild("Trade"):WaitForChild("DeclineRequest")

local acceptTradeConnection, declineTradeConnection

 function Funcs:autoAcceptTrades(value)
    if value then
        if not acceptTradeConnection then
            acceptTradeConnection = RunService.Heartbeat:Connect(function()
                acceptRequest:FireServer()
            end)
        end
    else
        if acceptTradeConnection then
            acceptTradeConnection:Disconnect()
            acceptTradeConnection = nil
        end
    end
end

 function Funcs:autoDeclineTrades(value)
    if value then
        if not declineTradeConnection then
            declineTradeConnection = RunService.Heartbeat:Connect(function()
                declineRequest:FireServer()
            end)
        end
    else
        if declineTradeConnection then
            declineTradeConnection:Disconnect()
            declineTradeConnection = nil
        end
    end
end

Section:Toggle("Auto Accept Trades", false, function(value)
    Funcs:autoAcceptTrades(value)
end)

Section:Toggle("Auto Decline Trades", false, function(value)
    Funcs:autoDeclineTrades(value)
end)

Section:Title"Fling Player:"



local function findPlayer(query)
    local results = {}
    local lowerQuery = query:lower()
    
    for _, player in pairs(Players:GetPlayers()) do
        if lowerQuery == "tous" then
            table.insert(results, player)
        elseif lowerQuery == "autres" and player.Name ~= Players.LocalPlayer.Name then
            table.insert(results, player)
        elseif lowerQuery == "moi" and player.Name == Players.LocalPlayer.Name then
            table.insert(results, player)
        elseif player.Name:lower():sub(1, #query) == lowerQuery then
            table.insert(results, player)
        end
    end
    
    return results
end



local value = ""

Section:TextBox("Fling Target", "", function(Text)
    value = Text  
end)



local flingEnabled = false
local thrust

Section:Button("Fling Player", function()
    local targets = findPlayer(value)
    
    if #targets > 0 then
        local target = targets[1]
        local thrust = Instance.new('BodyThrust', Players.LocalPlayer.Character.HumanoidRootPart)
        thrust.Force = Vector3.new(9999, 9999, 9999)
        thrust.Name = "YeetForce"
        
        repeat
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
            thrust.Location = target.Character.HumanoidRootPart.Position
            RunService.Heartbeat:Wait()
        until not target.Character:FindFirstChild("Head")
    else
        print("No player found.")
    end
end)




local Section = Tab:Section("Invisibility")








Section:Toggle("Toggle Invisibility", false, function(state)
	if state then
		Funcs:toggleInvisibility()
	else 
		Funcs:toggleInvisibility()
	end
end)



local Tab = Lib:Tab("Settings", "6031280882")
local Section = Tab:Section("Script Devs")
Section:Title"Narcissist"
Section:Title"SilentBen8x"

local Section = Tab:Section("Socials")

Section:Button("Copy Website", function()
setclipboard(tostring("Hydrosploit.co.uk"))
Library:Notify("Copy", "Website link copied to your clipboard.", 4)
end)

Section:Button("Copy Discord", function()
setclipboard(tostring("discord.gg/FhKCM8qWgW"))
Library:Notify("Copy", "Discord link copied to your clipboard.", 4)
end)


local Section = Tab:Section("Executor")



local exec = Section:Title""

if supported then
	exec.TextColor3 = Color3.fromRGB(0, 255, 0) 
	exec.TextSize = 22
	exec.Text = Current .. " is supported" 
elseif semiSupported then
	exec.TextColor3 = Color3.fromRGB(255, 255, 0) 
	exec.TextSize = 22
	exec.Text = Current .. " is not fully supported" 
else
	exec.TextColor3 = Color3.fromRGB(255, 0, 0) 
	exec.TextSize = 22
	exec.Text = Current .. " is not supported" 
end

local Section = Tab:Section("Config:")

Section:Button("Save Config", function()
	Library:Notify("Premium Feature", "This feature is restricted to premium members only.", 4)
end)

Section:Button("Delete Config", function()
	Library:Notify("Premium Feature", "This feature is restricted to premium members only.", 4)
end)


roleupdater = true
                 while roleupdater do
                     function Funcs:roleupdaterfix()
                     roles = ReplicatedStorage:FindFirstChild("GetPlayerData", true):InvokeServer()
                     for i, v in pairs(roles) do
                         if v.Role == "Murderer" then
                             Murder = i
                         elseif v.Role == 'Sheriff'then
                             Sheriff = i
                         elseif v.Role == 'Hero'then
                             Hero = i
                         end
                     end
                     wait(1)
                 end
                 wait()
                 pcall(Funcs.roleupdaterfix, Funcs)
                 end