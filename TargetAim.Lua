--coded by cub :3--
--coded by cub :3--
--coded by cub :3--
--coded by cub :3--
--coded by cub :3--
--coded by cub :3--


local TargetAim = {
    Enabled         = true,
    Keybind         = 'e',
    AirshotFunction = true,
    Predict         = true,
    AutoPred        = true,
    Prediction      = 0.146,
    Notification    = true,
    Resolver        = true
}

local AutoPrediction = {
    Ping20 = {
        CloseRange = 0.1057,
        MidRange   = 0.1259,
        FarRange   = 0.11327
    },
    Ping30 = {
        CloseRange = 0.10554,
        MidRange   = 0.12417,
        FarRange   = 0.11504
    },
    Ping40 = {
        CloseRange = 0.1059910,
        MidRange   = 0.1259910,
        FarRange   = 0.1159910
    },
    Ping50 = {
        CloseRange = 0.10731,
        MidRange   = 0.12731,
        FarRange   = 0.11731
    },
    Ping60 = {
        CloseRange = 0.10841,
        MidRange   = 0.13481,
        FarRange   = 0.11847896
    },
    Ping70 = {
        CloseRange = 0.10419,
        MidRange   = 0.13237,
        FarRange   = 0.11967724521
    },
    Ping80 = {
        CloseRange = 0.10189,
        MidRange   = 0.13481,
        FarRange   = 0.12
    },
    Ping90 = {
        CloseRange = 0.11181,
        MidRange   = 0.13781,
        FarRange   = 0.125451
    },
    Ping100 = {
        CloseRange = 0.138,
        MidRange   = 0.1246,
        FarRange   = 0.141
    },
    Ping110 = {
        CloseRange = 0.134487,
        MidRange   = 0.147475,
        FarRange   = 0.13467
    },
    Ping120 = {
        CloseRange = 0.1385,
        MidRange   = 0.14457,
        FarRange   = 0.1348564
    },
    Ping130 = {
        CloseRange = 0.13187,
        MidRange   = 0.143561,
        FarRange   = 0.138448
    },
    Ping140 = {
        CloseRange = 0.1452,
        MidRange = 0.15348,
        FarRange = 0.14454
    },
    Ping150 = {
        CloseRange = 0.14626,
        MidRange   = 0.154677,
        FarRange   = 0.14954
    },
    Ping160 = {
        CloseRange = 0.15215,
        MidRange   = 0.16485,
        FarRange   = 0.14515
    },
    Ping170 = {
        CloseRange = 0.15725,
        MidRange   = 0.16755,
        FarRange   = 0.149285
    },
    Ping180 = {
        CloseRange = 0.162875,
        MidRange   = 0.17245,
        FarRange   = 0.152520
    },
    Ping190 = {
        CloseRange = 0.165145,
        MidRange   = 0.17254,
        FarRange   = 0.154255
    },
    Ping200 = {
        CloseRange = 0.17815,
        MidRange   = 0.18150,
        FarRange   = 0.16845
    }
}

local TargetAim = getgenv().Settings
local AutoPrediction = getgenv().AutoPrediction

getgenv().SelectedPart = "UpperTorso"
getgenv().Cub = true

local IsTargeting = false
local CurrentCamera = game:GetService("Workspace").CurrentCamera
local Mouse = game.Players.LocalPlayer:GetMouse()
local AccomidationFactor = 0.139
local Plr;

function MakeMarker(Parent, Adornee, Color, Size, Size2)
    local Dot = Instance.new("BillboardGui", Parent)
    Dot.Name = "HelloWorld"
    Dot.Adornee = Adornee
    Dot.Size = UDim2.new(Size, Size2, Size, Size2)
    Dot.AlwaysOnTop = Cub
    local Frame = Instance.new("Frame", Dot)
    if Cub == true then
        Frame.Size = UDim2.new(1, 0, 1, 0)
    else
        Frame.Size = UDim2.new(0, 0, 0, 0)
    end
    if Cub == true then
        Frame.Transparency = 0
        Frame.BackgroundTransparency = 0
    else
        Frame.Transparency = 1
        Frame.BackgroundTransparency = 1
    end
    Frame.BackgroundColor3 = Color
    local Corner = Instance.new("UICorner", Frame)
    if Cub == false then
        Corner.CornerRadius = UDim.new(0, 0)
    else
        Corner.CornerRadius = UDim.new(1, 1)
    end
    return Dot
end

local Players = game.Players:GetPlayers()
function noob(Player)
    local character
    repeat wait() until Player.Character
    local handler = MakeMarker(game, Player.Character:WaitForChild(getgenv().SelectedPart), Color3.fromRGB(98, 37, 209), 0.3, 3)
    handler.Name = Player.Name
    Player.CharacterAdded:Connect(function(Char) handler.Adornee = Char:WaitForChild(getgenv().SelectedPart) end)


    spawn(function()
        while wait() do
            if Player.Character then
            end
        end
    end)
end

for i = 1, #Players do
    if Players[i] ~= game.Players.LocalPlayer then
        noob(Players[i])
    end
end

game.Players.PlayerAdded:Connect(function(Player)
    noob(Player)
end)

Mouse.KeyDown:Connect(function(k)
    if k == TargetAim.Keybind and TargetAim.Enabled then
        if IsTargeting == true then
            IsTargeting = false
            if TargetAim.Notification == true then
                Plr = getClosestPlayerToCursor()
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Cub Private",
                    Text = "Unlocked",
                    Icon = "rbxassetid://143232321500585",
                    Duration = 5
                })
            end
        else
            Plr = getClosestPlayerToCursor()
            IsTargeting = true
            if TargetAim.Notification == true then
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Cub Private",
                    Text = "Target: "..tostring(Plr.Character.Humanoid.DisplayName),
                    Icon = "rbxassetid://1423232321500585",
                    Duration = 5
                })
            end
        end
    end
end)

local function calculateDistance()
    if IsTargeting then
        local ClosestPlayer = Plr
        if ClosestPlayer then
            local PlayerPosition = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.PrimaryPart and game.Players.LocalPlayer.Character.PrimaryPart.Position
            local TargetPosition = ClosestPlayer.Character and ClosestPlayer.Character.PrimaryPart and ClosestPlayer.Character.PrimaryPart.Position
            if PlayerPosition and TargetPosition then
                local distance = (PlayerPosition - TargetPosition).magnitude
                return distance
            end
        end
    end
    return nil
end

function getClosestPlayerToCursor()
    local ClosestPlayer
    local ShortestDistance = math.huge

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
            local Pos = CurrentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local Magnitude = (Vector2.new(Pos.X, Pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
            if Magnitude < ShortestDistance then
                ClosestPlayer = v
                ShortestDistance = Magnitude
            end
        end
    end

    local PlayerPosition = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.PrimaryPart and game.Players.LocalPlayer.Character.PrimaryPart.Position
    local TargetPosition = ClosestPlayer.Character and ClosestPlayer.Character.PrimaryPart and ClosestPlayer.Character.PrimaryPart.Position
    local distance = (PlayerPosition - TargetPosition).magnitude

    if TargetAim.AutoPred == true then
        local pingvalue = game:GetService("Stats"):FindFirstChild("Network"):FindFirstChild("ServerStatsItem")["Data Ping"]:GetValueString()
        local split = string.split(pingvalue,'(')
        local ping = tonumber(split[1])
-- 200 ping
        if ping < 200 and distance < 50 then
            TargetAim.Prediction = AutoPrediction.Ping200.CloseRange
        elseif ping < 200 and distance < 100 then
            TargetAim.Prediction = AutoPrediction.Ping200.MidRange
        elseif ping < 200 and distance < 200 then
            TargetAim.Prediction = AutoPrediction.Ping200.FarRange
-- 190 ping
        elseif ping < 190 and distance < 50 then
            TargetAim.Prediction = AutoPrediction.Ping190.CloseRange
        elseif ping < 190 and distance < 100 then
            TargetAim.Prediction = AutoPrediction.Ping190.MidRange
        elseif ping < 190 and distance < 200 then
            TargetAim.Prediction = AutoPrediction.Ping190.FarRange
-- 180 ping
        elseif ping < 180 and distance < 50 then
            TargetAim.Prediction = AutoPrediction.Ping180.CloseRange
        elseif ping < 180 and distance < 100 then
            TargetAim.Prediction = AutoPrediction.Ping180.MidRange
        elseif ping < 180 and distance < 200 then
            TargetAim.Prediction = AutoPrediction.Ping180.FarRange
-- 170 ping
        elseif ping < 170 and distance < 50 then
            TargetAim.Prediction = AutoPrediction.Ping170.CloseRange
        elseif ping < 170 and distance < 100 then
            TargetAim.Prediction = AutoPrediction.Ping170.MidRange
        elseif ping < 170 and distance < 200 then
            TargetAim.Prediction = AutoPrediction.Ping170.FarRange
-- 160 ping
        elseif ping < 160 and distance < 50 then
            TargetAim.Prediction = AutoPrediction.Ping160.CloseRange
        elseif ping < 160 and distance < 100 then
            TargetAim.Prediction = AutoPrediction.Ping160.MidRange
        elseif ping < 160 and distance < 200 then
            TargetAim.Prediction = AutoPrediction.Ping160.FarRange
-- 150 ping
        elseif ping < 150 and distance < 50 then
            TargetAim.Prediction = AutoPrediction.Ping150.CloseRange
        elseif ping < 150 and distance < 100 then
            TargetAim.Prediction = AutoPrediction.Ping150.MidRange
        elseif ping < 150 and distance < 200 then
            TargetAim.Prediction = AutoPrediction.Ping150.FarRange
-- 140 ping
        elseif ping < 140 and distance < 25 then
            TargetAim.Prediction = AutoPrediction.Ping140.CloseRange
        elseif ping < 140 and distance < 50 then
            TargetAim.Prediction = AutoPrediction.Ping140.MidRange
        elseif ping < 140 and distance < 90 then
            TargetAim.Prediction = AutoPrediction.Ping140.FarRange
-- 130 ping
        elseif ping < 130 and distance < 25 then
            TargetAim.Prediction = AutoPrediction.Ping130.CloseRange
        elseif ping < 130 and distance < 50 then
            TargetAim.Prediction = AutoPrediction.Ping130.MidRange
        elseif ping < 130 and distance < 90 then
            TargetAim.Prediction = AutoPrediction.Ping130.FarRange
-- 120 ping
        elseif ping < 120 and distance < 25 then
            TargetAim.Prediction = AutoPrediction.Ping120.CloseRange
        elseif ping < 120 and distance < 50 then
            TargetAim.Prediction = AutoPrediction.Ping120.MidRange
        elseif ping < 120 and distance < 90 then
            TargetAim.Prediction = AutoPrediction.Ping120.FarRange
-- 110 ping
        elseif ping < 110 and distance < 25 then
            TargetAim.Prediction = AutoPrediction.Ping110.CloseRange
        elseif ping < 110 and distance < 50 then
            TargetAim.Prediction = AutoPrediction.Ping110.MidRange
        elseif ping < 110 and distance < 90 then
            TargetAim.Prediction = AutoPrediction.Ping110.FarRange
-- 100 ping
        elseif ping < 100 and distance < 25 then
            TargetAim.Prediction = AutoPrediction.Ping100.CloseRange
        elseif ping < 100 and distance < 50 then
            TargetAim.Prediction = AutoPrediction.Ping100.MidRange
        elseif ping < 100 and distance < 90 then
            TargetAim.Prediction = AutoPrediction.Ping100.FarRange
-- 90 ping
        elseif ping < 90 and distance < 25 then
            TargetAim.Prediction = AutoPrediction.Ping90.CloseRange
        elseif ping < 90 and distance < 50 then
            TargetAim.Prediction = AutoPrediction.Ping90.MidRange
        elseif ping < 90 and distance < 90 then
            TargetAim.Prediction = AutoPrediction.Ping90.FarRange
-- 80 ping
        elseif ping < 80 and distance < 25 then
            TargetAim.Prediction = AutoPrediction.Ping80.CloseRange
        elseif ping < 80 and distance < 50 then
            TargetAim.Prediction = AutoPrediction.Ping80.MidRange
        elseif ping < 80 and distance < 90 then
            TargetAim.Prediction = AutoPrediction.Ping80.FarRange
-- 70 ping
        elseif ping < 70 and distance < 25 then
            TargetAim.Prediction = AutoPrediction.Ping70.CloseRange
        elseif ping < 70 and distance < 50 then
            TargetAim.Prediction = AutoPrediction.Ping70.MidRange
        elseif ping < 70 and distance < 90 then
            TargetAim.Prediction = AutoPrediction.Ping70.FarRange
-- 60 ping
        elseif ping < 60 and distance < 50 then
            TargetAim.Prediction = AutoPrediction.Ping60.CloseRange
        elseif ping < 60 and distance < 100 then
            TargetAim.Prediction = AutoPrediction.Ping60.MidRange
        elseif ping < 60 and distance < 200 then
            TargetAim.Prediction = AutoPrediction.Ping60.FarRange
-- 50 ping
        elseif ping < 50 and distance < 50 then
            TargetAim.Prediction = AutoPrediction.Ping50.CloseRange
        elseif ping < 50 and distance < 100 then
            TargetAim.Prediction = AutoPrediction.Ping50.MidRange
        elseif ping < 50 and distance < 200 then
            TargetAim.Prediction = AutoPrediction.Ping50.FarRange
-- 40 ping
        elseif ping < 40 and distance < 25 then
            TargetAim.Prediction = AutoPrediction.Ping40.CloseRange
        elseif ping < 40 and distance < 50 then
            TargetAim.Prediction = AutoPrediction.Ping40.MidRange
        elseif ping < 40 and distance < 90 then
            TargetAim.Prediction = AutoPrediction.Ping40.FarRange
-- 30 ping
        elseif ping < 30 and distance < 25 then
            TargetAim.Prediction = AutoPrediction.Ping30.CloseRange
        elseif ping < 30 and distance < 50 then
            TargetAim.Prediction = AutoPrediction.Ping30.MidRange
        elseif ping < 30 and distance < 90 then
            TargetAim.Prediction = AutoPrediction.Ping30.FarRange
-- 20 ping
        elseif ping < 20 and distance < 25 then
            TargetAim.Prediction = AutoPrediction.Ping20.CloseRange
        elseif ping < 20 and distance < 50 then
            TargetAim.Prediction = AutoPrediction.Ping20.MidRange
        elseif ping < 20 and distance < 90 then
            TargetAim.Prediction = AutoPrediction.Ping20.FarRange
        end
    end

    return ClosestPlayer
end

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
    local args = {...}
    if IsTargeting and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" and TargetAim.Enabled and Plr.Character ~= nil then
        if TargetAim.Predict == true then
            args[3] = Plr.Character[getgenv().SelectedPart].Position+(Plr.Character[getgenv().SelectedPart].Velocity*TargetAim.Prediction)
        else
            args[3] = Plr.Character[getgenv().SelectedPart].Position
        end
        return old(unpack(args))
    end
    return old(...)
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if TargetAim.Resolver == true and Plr.Character ~= nil and IsTargeting and TargetAim.Enabled then
        if TargetAim.Resolver == true and IsTargeting and Plr.Character ~= nil then
            if game.Workspace.Players[Plr.Name].Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                    AnchorCount = AnchorCount + 1
                    if AnchorCount >= MaxAnchor then
                        TargetAim.Predict = false
                        wait(2)
                        AnchorCount = 0;
                    end
                else
                    TargetAim.Predict = true
                    AnchorCount = 0;
                end
                SelectedPart = "LeftFoot"
            else
                if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                    AnchorCount = AnchorCount + 1
                    if AnchorCount >= MaxAnchor then
                        TargetAim.Predict = false
                        wait(2)
                        AnchorCount = 0;
                    end
                else
                    TargetAim.Predict = true
                    AnchorCount = 0;
                end
                SelectedPart = "HumanoidRootPart"
            end
        else
            if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                AnchorCount = AnchorCount + 1
                if AnchorCount >= MaxAnchor then
                    TargetAim.Predict = false
                    wait(2)
                    AnchorCount = 0;
                end
            else
                TargetAim.Predict = true
                AnchorCount = 0;
            end
            SelectedPart = "HumanoidRootPart"
        end
    else
        SelectedPart = "HumanoidRootPart"
    end
end)
