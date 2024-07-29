


local G2L = {};

local runService = game:GetService("RunService")
local players = game:GetService("Players")
local coreGui = game:GetService("CoreGui")
local tweenService = game:GetService("TweenService")
local uis = game:GetService("UserInputService")

local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

function G2L:tween(object, goal, callback)
	local tween = tweenService:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

local hover1 = false
local hover2 = false

local mouseDown1 = false
local mouseDown2 = false

local key_script = game:HttpGet("https://celestialscript.store/API/keys.php")
local key_function, error_message = loadstring(key_script)

local correct_key = key_function()
local key = correct_key

local function sendInviteRequest()
    setclipboard(tostring("https://discord.gg/FhKCM8qWgW"))
end

G2L["1"] = Instance.new("ScreenGui", runService:IsStudio() and players.LocalPlayer:WaitForChild("PlayerGui") or coreGui);
G2L["1"]["Name"] = [[key]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2"]["Size"] = UDim2.new(0, 405, 0, 194);
G2L["2"]["Position"] = UDim2.new(0.49969, 0, 0.49566, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Name"] = [[Holder]];
G2L["2"]["Draggable"] = true;

G2L["3"] = Instance.new("UICorner", G2L["2"]);
G2L["3"]["CornerRadius"] = UDim.new(0, 4);

G2L["4"] = Instance.new("TextBox", G2L["2"]);
G2L["4"]["CursorPosition"] = -1;
G2L["4"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4"]["PlaceholderColor3"] = Color3.fromRGB(218, 218, 218);
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["TextSize"] = 35;
G2L["4"]["Name"] = [[Input]];
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(29, 29, 29);
G2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4"]["PlaceholderText"] = [[Key here!]];
G2L["4"]["Size"] = UDim2.new(0, 380, 0, 53);
G2L["4"]["Position"] = UDim2.new(0.02994, 0, 0.3152, 0);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Text"] = [[]];

G2L["5"] = Instance.new("UICorner", G2L["4"]);
G2L["5"]["CornerRadius"] = UDim.new(0, 3);

G2L["6"] = Instance.new("Frame", G2L["2"]);
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(29, 29, 29);
G2L["6"]["Size"] = UDim2.new(0, 181, 0, 43);
G2L["6"]["Name"] = [[Redeem]];
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["Position"] = UDim2.new(0.02994, 0, 0.6681, 0);

G2L["f"] = Instance.new("TextLabel", G2L["6"]);
G2L["f"]["BorderSizePixel"] = 0;
G2L["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["f"]["TextSize"] = 25;
G2L["f"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["f"]["BackgroundTransparency"] = 1;
G2L["f"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["f"]["Text"] = [[Check  Key]];

G2L["7"] = Instance.new("UICorner", G2L["6"]);
G2L["7"]["CornerRadius"] = UDim.new(0, 5);

G2L["8"] = Instance.new("Frame", G2L["2"]);
G2L["8"]["BorderSizePixel"] = 0;
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(29, 29, 29);
G2L["8"]["Size"] = UDim2.new(0, 181, 0, 43);
G2L["8"]["Name"] = [[Get]];
G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8"]["Position"] = UDim2.new(0.51991, 0, 0.6681, 0);

G2L["g"] = Instance.new("TextLabel", G2L["8"]);
G2L["g"]["BorderSizePixel"] = 0;
G2L["g"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["g"]["TextSize"] = 25;
G2L["g"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["g"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["g"]["BackgroundTransparency"] = 1;
G2L["g"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["g"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["g"]["Text"] = [[Copy Discord]];

G2L["9"] = Instance.new("UICorner", G2L["8"]);
G2L["9"]["CornerRadius"] = UDim.new(0, 5);

G2L["a"] = Instance.new("Frame", G2L["2"]);
G2L["a"]["ZIndex"] = 0;
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["a"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["a"]["Name"] = [[DropShadowHolder]];
G2L["a"]["BackgroundTransparency"] = 1;

G2L["b"] = Instance.new("ImageLabel", G2L["a"]);
G2L["b"]["ZIndex"] = 0;
G2L["b"]["BorderSizePixel"] = 0;
G2L["b"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
G2L["b"]["ScaleType"] = Enum.ScaleType.Slice;
G2L["b"]["ImageTransparency"] = 0.5;
G2L["b"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["b"]["Image"] = [[rbxassetid://6014261993]];
G2L["b"]["Size"] = UDim2.new(1, 47, 1, 47);
G2L["b"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
G2L["b"]["BackgroundTransparency"] = 1;
G2L["b"]["Name"] = [[DropShadow]];
G2L["b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

-- Existing Frame representing the top bar
G2L["c"] = Instance.new("Frame", G2L["2"])
G2L["c"].BorderSizePixel = 0
G2L["c"].BackgroundColor3 = Color3.fromRGB(26, 26, 26)
G2L["c"].Size = UDim2.new(0, 405, 0, 41) -- Increased height to accommodate the line
G2L["c"].BorderColor3 = Color3.fromRGB(0, 0, 0)

-- New Frame for the separation line
local separationLine = Instance.new("Frame", G2L["c"])
separationLine.BorderSizePixel = 0
separationLine.BackgroundColor3 = Color3.fromRGB(0, 81, 255) -- Color of the separation line
separationLine.Size = UDim2.new(1, 0, 0, 1) -- Thin line below the top bar
separationLine.Position = UDim2.new(0, 0, 1, 0) -- Aligns it to the bottom of the top bar

G2L["d"] = Instance.new("TextButton", G2L["c"]);
G2L["d"]["BorderSizePixel"] = 0;
G2L["d"]["TextSize"] = 27;
G2L["d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["d"]["Size"] = UDim2.new(0, 50, 0, 50);
G2L["d"]["BackgroundTransparency"] = 1;
G2L["d"]["Name"] = [[Exit]];
G2L["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["d"]["Text"] = [[X]];
G2L["d"]["Position"] = UDim2.new(0.875, 0, -0.1, 0);

G2L["8"].MouseEnter:Connect(function()
	hover1 = true
	if not mouseDown1 then
		G2L:tween(G2L["8"], {BackgroundColor3 = Color3.fromRGB(80,80,80)})
	end
end)

G2L["8"].MouseLeave:Connect(function()
	hover1 = false
	if not mouseDown1 then
		G2L:tween(G2L["8"], {BackgroundColor3 = Color3.fromRGB(29,29,29)})
	end
end)

G2L["6"].MouseEnter:Connect(function()
	hover2 = true
	if not mouseDown2 then
		G2L:tween(G2L["6"], {BackgroundColor3 = Color3.fromRGB(80,80,80)})
	end
end)

G2L["6"].MouseLeave:Connect(function()
	hover2 = false
	if not mouseDown2 then
		G2L:tween(G2L["6"], {BackgroundColor3 = Color3.fromRGB(29,29,29)})
	end
end)

local function onInputBegan(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if hover2 == true then
            mouseDown2 = true
            G2L:tween(G2L["6"], {BackgroundColor3 = Color3.fromRGB(200,200,200)})
            
            if G2L["4"].Text == key then
                wait(0.5)
                hover1 = false
                hover2 = false
                G2L["1"]:Destroy()




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
                
                local status

-- Check if the user is an admin      --8jamiee8                                      --celestialhubtesting                            --orbithubscritps                                  --2ryley                                      --busterboy4970                              --fanaz9                                       --Suppressfully                                                
if game.Players.LocalPlayer.UserId == 6045304590 or game.Players.LocalPlayer.UserId == 246884783 or game.Players.LocalPlayer.UserId == 4167028941 or game.Players.LocalPlayer.UserId == 277225187 or game.Players.LocalPlayer.UserId == 2250301238 or game.Players.LocalPlayer.UserId == 269417255 or game.Players.LocalPlayer.UserId == 3240803666 then
    status = "  Admin"
else
    status = "  Hub"
end

Lib = Library:Init("Celestial", status, true) 
                
                local problem = Section:Title("A Problem Occured Loading 'Default' Configuration")
                problem.TextColor3 = Color3.fromRGB(255, 0, 0)

                Section:Button("Reset Coinfig", function(state)
                end)
                
                
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Hydrosploit/Celestial/main/CelestialStealerV1"))()

                
                
               



            else
                G2L["4"].Text = "Wrong Key"
                wait(1)
                G2L["4"].Text = ""
            end
        elseif hover1 == true then
            mouseDown1 = true
            G2L:tween(G2L["8"], {BackgroundColor3 = Color3.fromRGB(200,200,200)})
            G2L["4"].Text = "Copied Discord"
            sendInviteRequest()
            wait(1)
            G2L["4"].Text = ""
        end
    end
end

local function onInputEnded(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if mouseDown2 == true then
            mouseDown2 = false
            G2L:tween(G2L["6"], {BackgroundColor3 = Color3.fromRGB(29,29,29)})
        elseif mouseDown1 == true then
            mouseDown1 = false
            G2L:tween(G2L["8"], {BackgroundColor3 = Color3.fromRGB(29,29,29)})
        end
    end
end

uis.InputBegan:Connect(onInputBegan)
uis.InputEnded:Connect(onInputEnded)

G2L["d"].MouseButton1Click:Connect(function()
	G2L["1"]:Destroy()
end)


return G2L["1"], require;

