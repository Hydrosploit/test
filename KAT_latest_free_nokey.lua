local scriptversion = "0.65"
local liveVersion = loadstring(game:HttpGet('https://raw.githubusercontent.com/Hydrosploit/LiveVersion/main/Main', true))()


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

	local LoadMsg = {

		"[?] Authenticating... Please Wait",
		"[?] Authenticated in 0.79559693443 seconds",
		"[!] Initializing UI Features ",
		"[!] Initializing Services",
		"[+] Creating Tables",
		"[!] Initializing Functions",
		"[+] Creating Tabs",
		"[+] Creating Toggles",
		"[+] Creating Buttons",
		"[+] Creating Dropdowns",
		"[+] Creating Keybinds",
		"[?] Fetching Whitelist Data",
		"[?] Fetching Current Version",
		"[!] Initializing Configuration",
		"Finalizing Checks...",
		"Done!",

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
		Message.TextSize = 14.000
		Message.TextXAlignment = Enum.TextXAlignment.Left

	end

	local function UpdateProgress(Index)

		local NewVal = Index / #LoadMsg

		Utilities:Tween(InnerL, .5, {Size = UDim2.new(NewVal, 0, 0, 18)})

		SendMessage(LoadMsg[Index])

	end

	for i, v in next, LoadMsg do

		UpdateProgress(i)

		task.wait(.3)

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
    Noti.DisplayOrder = 10 -- Ensures it's on top of other ScreenGui elements
    Noti.Parent = game.CoreGui -- Parenting to CoreGui makes it topmost

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
	Main.Position = UDim2.new(0, 692, 0, 213)
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
local Workspace, Players, ReplicatedStorage, Lighting, UserInputService , RunService, CoreGui, LocalPlayer   = game:GetService("Workspace"), game:GetService("Players"), game:GetService("ReplicatedStorage"), game:GetService("Lighting"), game:GetService("UserInputService"),  game:GetService("RunService"), game:GetService("CoreGui"), Players.LocalPlayer

-->Variables<--


-->Booleans<--
local autoRejoinEnabled, walkingSpeed, sprintingSpeed, defaultTime, flingEnabled, flingPower = false, 16, 32, Lighting.TimeOfDay, false, 250

-->Function Table<--

--Auto Farm CFrame
local locs = {
	CFrame.new(-474.7886047363281, 23.077606201171875, -291.6365966796875),
	CFrame.new(-474.7054748535156, 23.077383041381836, -283.515869140625),
	CFrame.new(-474.708251953125, 23.077388763427734, -275.5438537597656),
	CFrame.new(-249.1454315185547, 21.843822479248047, -410.03460693359375),
	CFrame.new(-3.4042630195617676, 21.74802017211914, -102.55184173583984),
	CFrame.new(583.2387084960938, 51.8580436706543, -272.8537292480469),
	CFrame.new(577.412841796875, 51.05942153930664, -471.27880859375),
	CFrame.new(597.0350341796875, 51.05942153930664, -471.2284240722656),
	CFrame.new(-451.2796630859375, 21.74802017211914, -331.3548278808594),
	CFrame.new(94.31041717529297, 21.75302505493164, -520.0453491210938),
	CFrame.new(-401.92840576171875, 21.75302505493164, -591.1041259765625),
	CFrame.new(518.23828125, 47.99801254272461, -302.5366516113281),
	CFrame.new(-219.9027099609375, 21.897891998291016, -786.2392578125),
	CFrame.new(-480.73297119140625, 21.84787368774414, -79.38970947265625),
	CFrame.new(-624.7388916015625, 23.24376106262207, -284.2427978515625),
	CFrame.new(-627.9735107421875, 23.243762969970703, -284.63641357421875),
	CFrame.new(-808.5276489257812, 21.74802589416504, -286.7834777832031),
	CFrame.new(-941.102783203125, 21.74802017211914, -164.144287109375),
	CFrame.new(-951.69091796875, 21.74802017211914, -164.0448455810547),
	CFrame.new(-870.6058959960938, 21.79798126220703, -90.59520721435547),
	CFrame.new(-861.7327270507812, 21.797983169555664, -89.74386596679688),
	CFrame.new(-555.1325073242188, 21.873022079467773, 269.8099670410156),
	CFrame.new(-611.4136352539062, 21.87302589416504, 270.7102355957031),
	CFrame.new(-939.7088623046875, 22.50303077697754, -663.3399658203125),
	CFrame.new(-940.005737, 22.0030289, -656.48761),
	CFrame.new(-859.46142578125, 22.003028869628906, -660.7960815429688),
	CFrame.new(-796.6346435546875, 21.87803077697754, -655.56982421875)
}

local playerNames = {}
for _, player in ipairs(game.Players:GetPlayers()) do
	table.insert(playerNames, player.Name)
end

local maplocations = {
    ["Bank"] = CFrame.new(-421.255737, 22.6476746, -284.804016),
    ["Casino"] = CFrame.new(-962.72345, 21.2549973, -186.814987),
    ["UpHill"] = CFrame.new(481.692749, 48.0030136, -609.012756),
    ["DownHill"] = CFrame.new(-962.72345, 21.2549973, -186.814987),
    ["Police Station"] = CFrame.new(-267.85434, 21.7979774, -116.103867),
    ["SafeZone"] = CFrame.new(79.7035904, 138.997986, -661.468201),
    ["High School"] = CFrame.new(-653.669922, 21.7433147, 255.817734),
    ["Hood Fitness"] = CFrame.new(-244.32457, 21.8438225, -410.796631)

}

local Funcs = {}

getgenv().Speed = 16
function Walkspeed()
game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().Speed
end)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().Speed
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

function Funcs:fling(power)
	local bambam = Instance.new("BodyThrust")
	bambam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
	bambam.Force = Vector3.new(power, 0, power)
	bambam.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
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
			v.LocalTransparencyModifier = 0.9;
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





	function Funcs:stopLoops()
		if alwaysDayLoop then
			alwaysDayLoop:Disconnect()
			alwaysDayLoop = nil
		end
		if alwaysNightLoop then
			alwaysNightLoop:Disconnect()
			alwaysNightLoop = nil
		end
	end

    function Funcs:TeleportToPlayerPosition(selectedPlayer)
		local targetPlayer = Players:FindFirstChild(selectedPlayer)
		if targetPlayer and targetPlayer.Character then
			local targetPosition = targetPlayer.Character:GetPrimaryPartCFrame().Position
			Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
		end
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
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local desktopdetected, mobiledetected = false, false

local platform = UserInputService:GetPlatform()
if platform == Enum.Platform.Windows or platform == Enum.Platform.OSX then
print("Desktop Detected")
	desktopdetected = true
elseif platform == Enum.Platform.IOS or platform == Enum.Platform.Android then
    print("Mobille Detected")

	mobiledetected = true
else
    print("Unable To Detect Device")

end



local Tab = Lib:Tab("Game", "6034227061")
local Section = Tab:Section("Visuals")

local LocalPlayer = Players.LocalPlayer
local chamsEnabled = false
local highlightConnection = nil

-- Create Highlight for all players except LocalPlayer
function Funcs:CreateHighlight()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and not player.Character:FindFirstChild("Highlight") then
            local highlight = Instance.new("Highlight")
            highlight.Parent = player.Character
            highlight.FillColor = Color3.fromRGB(0, 81, 255)
        end
    end
end

-- Update Highlights color for all players
function Funcs:UpdateHighlights()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Highlight") then
            local Highlight = player.Character:FindFirstChild("Highlight")
            Highlight.FillColor = Color3.fromRGB(0, 81, 255) -- Set highlight color to green
        end
    end
end

-- Refresh all highlights
function Funcs:refreshchams()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Highlight") then
            v:Destroy()
        end
    end
end

-- Listen for player changes
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        wait(1) -- Give time for character to fully load
        if chamsEnabled then
            Funcs:CreateHighlight()
        end
    end)
end)

Players.PlayerRemoving:Connect(function(player)
    Funcs:refreshchams()
    if chamsEnabled then
        Funcs:CreateHighlight()
    end
end)

-- Initialize for existing players
for _, player in pairs(Players:GetPlayers()) do
    player.CharacterAdded:Connect(function()
        wait(1) -- Give time for character to fully load
        if chamsEnabled then
            Funcs:CreateHighlight()
        end
    end)
end

Section:Toggle("Player Chams", false, function(enabled)
    chamsEnabled = enabled
    if chamsEnabled then
        Funcs:refreshchams()
        Funcs:CreateHighlight()
        highlightConnection = RunService.RenderStepped:Connect(function()
            Funcs:UpdateHighlights()
        end)
    else
        if highlightConnection then
            highlightConnection:Disconnect()
            highlightConnection = nil
        end
        Funcs:refreshchams()
    end
end)

local Section = Tab:Section("Aim Lock")


local FOVCircle = Drawing.new("Circle")

Section:Slider("FOV Circle", 50, 50, 650, function(value)
    FOVCircle.Radius = value
end)

local Epitaph = 0 -- calcs initial value



local AimbotEnabled = false
local AimbotRunning = false
local AimbotConnection = nil
local Locking = false
local SelectedBodyPart = "HumanoidRootPart"
local TargetLocked = nil

local LockKeyDown = false -- checks if keybind is pressed

local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local MyView = workspace.CurrentCamera
local HeadOffset = Vector3.new(0, 0.1, 0)

Section:Toggle("Aim Lock", false, function(enabled)
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

-- Keybind handling using Section:KeyBind
local KeyBind = "Q"  -- Default keybind

Section:KeyBind("Lock KeyBind", KeyBind, function()
    Locking = not Locking
    if Locking then
        UIS.MouseBehavior = Enum.MouseBehavior.LockCenter -- lock cursor middle
    else
        UIS.MouseBehavior = Enum.MouseBehavior.Default -- restores normal mouse
    end
end)

Section:DropDown("Body Part", {"HumanoidRootPart", "Head", "Random"}, false, function(Selected)
    SelectedBodyPart = Selected
end)

function SheriffAimbot()
    local connection
    local locked = false -- check if locked to someone
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




Section:Slider("Player FOV", 70, 70, 120, function(Value)
	game.Workspace.CurrentCamera.FieldOfView = Value

end)

local Section = Tab:Section("Misc")


Section:Toggle("X-Ray", false, function(state)
	getgenv().Xray = state;
	if getgenv().Xray then
		Funcs:XrayOn(Workspace);
	else
		Funcs:XrayOff(Workspace);
	end;
end)




Section:KeyBind("Reset Mouse Config", "X", function(Key)
	UserInputService.MouseBehavior = Enum.MouseBehavior.Default
end)

Section:Toggle("Rejoin After Kicked", true, function(enabled)
if enabled then
	Funcs:toggleAutoRejoin(enabled)
end
end)

Section:Button("Rejoin Server", function()
	game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)

Section:Button("Reset Character", function()
	game.Players.LocalPlayer.Character:FindFirstChild("Head"):Destroy()
end)















local Tab = Lib:Tab("Trolling", "6035067826")
local Section = Tab:Section("Spinbot")

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

local function updateTitleWithTime()
    local currentTime = os.date("%H:%M:%S") 
    TitleSection.Text = "Current Time: " .. currentTime
end

RunService.Heartbeat:Connect(function()
    updateTitleWithTime()
end)

Section:Toggle("Always Day", false, function(Value)
    Funcs:stopLoops()
    if Value then
        alwaysDayLoop = RunService.RenderStepped:Connect(function()
            Lighting.TimeOfDay = "12:00:00"
        end)
    else
        Lighting.TimeOfDay = defaultTime
    end
end)

Section:Toggle("Always Night", false, function(Value)
    Funcs:stopLoops()
    if Value then
        alwaysNightLoop = RunService.RenderStepped:Connect(function()
            Lighting.TimeOfDay = "00:00:00"
        end)
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






local Tab = Lib:Tab("Testing", "6031260784")
local Section = Tab:Section("Developer Tools")

Section:Button("Remote Spy",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
end)             

Section:Button("Open Dex",function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
end) 

Section:Button("Copy CFrame",function()
    setclipboard(tostring(game:GetService"Players".LocalPlayer.Character.HumanoidRootPart.CFrame.Position))
end)


Section:TextBox("TP to CFrame", "CFrame Here", function(Value)

    local x, y, z = string.match(Value, "([%d.-]+),%s*([%d.-]+),%s*([%d.-]+)")

    if x and y and z then

        x = tonumber(x)

        y = tonumber(y)

        z = tonumber(z)

        if x and y and z then

            local newCFrame = CFrame.new(x, y, z)

            Teleport(newCFrame)


        else


        end

    else


    end

end)

function Teleport(Pos)

    repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

    if game.Players.LocalPlayer.Character.Humanoid.SeatPart and game.Players.LocalPlayer.Character.Humanoid.SeatPart.Name == "DriveSeat" then

        if typeof(Pos) == "Vector3" then

            Pos = CFrame.new(Pos)

        end

        game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent:PivotTo(Pos)

    else

        if typeof(Pos) == "CFrame" then

            game:GetService"Players".LocalPlayer.Character:PivotTo(Pos)

            elseif typeof(Pos) == "Vector3" then

            game:GetService"Players".LocalPlayer.Character:MoveTo(Pos)

        end

    end

end


















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
							
							-----------------------------------------------------------


							task.spawn(function()
								wait(math.random(1, 15))
								local tips = math.random(1,6)
								if (tips == 1) then
								Library:Notify("Did you know", "CelestialHub was originally called Hydrosploit X.", 5)
								elseif (tips == 2) then
									Library:Notify("Did you know", "The owner of CelestialHub is Narcissist and 2Ryley.", 5)
								elseif (tips == 3) then
									Library:Notify("Did you know", "CelestialHub was actually only meant to be for Lumber Tycoon 2.", 5)
								elseif (tips == 4) then
									Library:Notify("Did you know", "Narcissist started this project with no knowledge of LUA.", 5)
								elseif (tips == 5) then
									Library:Notify("Did you know", "Black people prefer to eat fried chicken.", 5)
								elseif (tips == 6) then
									Library:Notify("Did you know", "K.A.T came out 7 years ago.", 5)
								end
								end)
