-- GUI Library
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield", true))()

local Window =
    Rayfield:CreateWindow(
    {
        Name = "Beaks | CookieHub",
        LoadingTitle = "Beaks | CookieHub",
        LoadingSubtitle = "by CookieHub Developer Team.",
        ConfigurationSaving = {Enabled = false}
    }
)

-- Initialize tabs
local MainTab = Window:CreateTab("Main")
local AutoTab = Window:CreateTab("Auto")
local EspTab = Window:CreateTab("ESP")
local OPTab = Window:CreateTab("OP ( adding and fixing stuff )")
local TeleportTab = Window:CreateTab("Teleports")
local MiscTab = Window:CreateTab("Misc")

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")

-- Variables
local LocalPlayer = Players.LocalPlayer
local originalProperties = {}
local originalSizes = {}
local originalLighting = {}
local ClientBirds =
    workspace:FindFirstChild("Regions") and workspace.Regions:FindFirstChild("Beakwoods") and
    workspace.Regions.Beakwoods:FindFirstChild("ClientBirds")

-- Initialize Settings
local Settings = {
    AutoFarm = {
        Beakwoods = false,
        Deadlands = false,
        MountBeaks = false,
        QuillLake = false,
        Enabled = false,
        AutoShoot = false,
        BirdDuration = 10,
        MovementSpeed = 25,
        MinDistanceForNewTween = 15,
        YOffset = 3,
        OrbitRadius = 5,
        OrbitSpeed = 0.7,
        ApproachSpeed = 0.9,
        MinDistance = 10,
        CameraSmoothness = 1.5,
        ShootVariance = 0.2,
        ZOffset = 8,
        TweenDuration = 1.5,
        EasingStyle = Enum.EasingStyle.Quad,
        EasingDirection = Enum.EasingDirection.Out,
        SmoothAimbot = false,
        FreezeBirds = false
    },
    AutoSell = false,
    SellThreshold = 50,
    AutoDart = false,
    HitboxExpander = false,
    HitboxSize = 15,
    WalkSpeed = 16,
    InfiniteJump = false
}

-- ESP Configuration
local ESPColors = {
    ["Beakwoods"] = Color3.fromRGB(0, 255, 0),
    ["Deadlands"] = Color3.fromRGB(255, 0, 0),
    ["Mount Beaks"] = Color3.fromRGB(0, 0, 255),
    ["Quill Lake"] = Color3.fromRGB(255, 255, 0)
}

local ESPEnabled = false
local ESPObjects = {}

-- Update ESP to always show full bird model and name
function CreateESP(bird, regionName)
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.Adornee = bird
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.FillColor = ESPColors[regionName] or Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.OutlineTransparency = 0
    highlight.Parent = bird

    local primary = bird.PrimaryPart or bird:FindFirstChildWhichIsA("BasePart")
    if primary then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESP_Billboard"
        billboard.Adornee = primary
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = primary

        local textLabel = Instance.new("TextLabel")
        textLabel.Name = "ESP_Text"
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = regionName .. " - " .. bird.Name
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        textLabel.TextScaled = true
        textLabel.Font = Enum.Font.SourceSansBold
        textLabel.Parent = billboard

        ESPObjects[bird] = {highlight, billboard}
    end
end

-- Function to toggle ESP
function ToggleESP(state)
    ESPEnabled = state

    if ESPEnabled then
        -- Add ESP to existing birds
        for _, regionName in pairs({"Beakwoods", "Deadlands", "Mount Beaks", "Quill Lake"}) do
            local region = workspace.Regions:FindFirstChild(regionName)
            if region then
                local clientBirds = region:FindFirstChild("ClientBirds")
                if clientBirds then
                    for _, bird in pairs(clientBirds:GetChildren()) do
                        if bird:IsA("Model") then
                            CreateESP(bird, regionName)
                        end
                    end

                    -- Connect to detect new birds
                    clientBirds.ChildAdded:Connect(
                        function(bird)
                            if ESPEnabled and bird:IsA("Model") then
                                CreateESP(bird, regionName)
                            end
                        end
                    )
                end
            end
        end
    else
        -- Remove all ESP
        for bird, _ in pairs(ESPObjects) do
            RemoveESP(bird)
        end
    end
end

-- Function to expand hitboxes
local function ExpandHitboxes(enable)
    for _, regionName in pairs({"Beakwoods", "Deadlands", "Mount Beaks", "Quill Lake"}) do
        local region = workspace.Regions:FindFirstChild(regionName)
        if region then
            local clientBirds = region:FindFirstChild("ClientBirds")
            if clientBirds then
                for _, bird in pairs(clientBirds:GetChildren()) do
                    if bird:IsA("Model") then
                        for _, part in pairs(bird:GetDescendants()) do
                            if part:IsA("BasePart") then
                                if enable then
                                    if not originalSizes[part] then
                                        originalSizes[part] = part.Size
                                    end
                                    part.Size =
                                        Vector3.new(
                                        Settings.HitboxSize,
                                        Settings.HitboxSize,
                                        Settings.HitboxSize
                                    )
                                    part.CanCollide = false
                                else
                                    if originalSizes[part] then
                                        part.Size = originalSizes[part]
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

-- Function to get a random bird from a region
local function GetRandomBird(region)
    local clientBirds =
        workspace.Regions:FindFirstChild(region) and workspace.Regions[region]:FindFirstChild("ClientBirds")
    if not clientBirds then
        return nil
    end

    local validBirds = {}
    for _, bird in pairs(clientBirds:GetChildren()) do
        if bird:IsA("Model") then
            local primaryPart = bird.PrimaryPart or bird:FindFirstChildWhichIsA("BasePart")
            if primaryPart then
                table.insert(validBirds, bird)
            end
        end
    end

    if #validBirds > 0 then
        return validBirds[math.random(1, #validBirds)]
    end
    return nil
end

local function StartAutoFarm(region)
    local player = game.Players.LocalPlayer
    local Camera = workspace.CurrentCamera
    local tweenService = game:GetService("TweenService")
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local RunService = game:GetService("RunService")

    local CurrentBird, CurrentTween, LastBirdSwitch = nil, nil, 0
    local originalGravity = workspace.Gravity
    workspace.Gravity = 10

    local clientBirds =
        workspace.Regions:FindFirstChild(region) and workspace.Regions[region]:FindFirstChild("ClientBirds")
    if not clientBirds then
        return
    end

    while Settings.AutoFarm[region:gsub(" ", "")] do
        task.wait(0.05)
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local hrp = character.HumanoidRootPart
            local now = os.clock()

            -- Choose a new bird every 10 seconds
            if not CurrentBird or (now - LastBirdSwitch) > Settings.AutoFarm.BirdDuration then
                CurrentBird = GetRandomBird(region)
                LastBirdSwitch = now
                if CurrentTween then
                    CurrentTween:Cancel()
                end
            end

            if CurrentBird then
                local success, pivot =
                    pcall(
                    function()
                        return CurrentBird:GetPivot()
                    end
                )

                if success and pivot then
                    -- Tween to bird with offset
                    local offset = Vector3.new(0, 3, 8)
                    local targetPos = pivot.Position + offset
                    local targetCFrame = CFrame.new(targetPos, pivot.Position)

                    CurrentTween =
                        tweenService:Create(
                        hrp,
                        TweenInfo.new(
                            Settings.AutoFarm.TweenDuration,
                            Settings.AutoFarm.EasingStyle,
                            Settings.AutoFarm.EasingDirection
                        ),
                        {CFrame = targetCFrame}
                    )
                    CurrentTween:Play()

                    -- Follow the bird for up to 10 seconds
                    local followStart = os.clock()
                    while os.clock() - followStart < Settings.AutoFarm.BirdDuration and
                        Settings.AutoFarm[region:gsub(" ", "")] do
                        local pivotSuccess, pivotUpdate =
                            pcall(
                            function()
                                return CurrentBird:GetPivot()
                            end
                        )

                        if pivotSuccess then
                            -- Keep camera aimed at bird
                            local aimPos = pivotUpdate.Position
                            Camera.CFrame = CFrame.new(Camera.CFrame.Position, aimPos)

                            -- Auto shoot if enabled
                            if Settings.AutoFarm.AutoShoot then
                                local screenPoint = Camera:WorldToViewportPoint(aimPos)
                                local shootX =
                                    screenPoint.X +
                                    ((math.random() - 0.5) * Settings.AutoFarm.ShootVariance * 50)
                                local shootY =
                                    screenPoint.Y +
                                    ((math.random() - 0.5) * Settings.AutoFarm.ShootVariance * 30)

                                VirtualInputManager:SendMouseButtonEvent(shootX, shootY, 0, true, game, 1)
                                task.wait(0.02 + math.random() * 0.03)
                                VirtualInputManager:SendMouseButtonEvent(shootX, shootY, 0, false, game, 1)
                            end
                        end

                        task.wait(0.1)
                    end
                end
            end
        end
    end

    if CurrentTween then
        CurrentTween:Cancel()
    end
    workspace.Gravity = originalGravity
end

-- Create toggles for each region
for _, name in ipairs({"Beakwoods", "Deadlands", "Mount Beaks", "Quill Lake"}) do
    local cleanName = name:gsub(" ", "")
    MainTab:CreateToggle(
        {
            Name = "AutoFarm: " .. name,
            CurrentValue = false,
            Callback = function(v)
                Settings.AutoFarm[cleanName] = v
                if v then
                    task.spawn(
                        function()
                            StartAutoFarm(name)
                        end
                    )
                end
            end
        }
    )
end

-- Add Auto Shoot toggle
MainTab:CreateToggle(
    {
        Name = "Auto Shoot",
        CurrentValue = Settings.AutoFarm.AutoShoot,
        Callback = function(value)
            Settings.AutoFarm.AutoShoot = value
            Rayfield:Notify(
                {
                    Title = "Auto Shoot",
                    Content = value and "Auto Shoot enabled!" or "Auto Shoot disabled!",
                    Duration = 3,
                    Image = 4483362458
                }
            )
        end
    }
)

MainTab:CreateButton(
    {
        Name = "Aimbot",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/VJpfksLY", true))()
        end
    }
)

-- Hitbox Expander Toggle
MainTab:CreateToggle(
    {
        Name = "Hitbox Expander",
        CurrentValue = false,
        Callback = function(val)
            Settings.HitboxExpander = val
            ExpandHitboxes(val)
        end
    }
)

-- Hitbox Size Slider
MainTab:CreateSlider(
    {
        Name = "Hitbox Size",
        Range = {5, 80},
        Increment = 1,
        Suffix = "Size",
        CurrentValue = Settings.HitboxSize,
        Callback = function(val)
            Settings.HitboxSize = val
            if Settings.HitboxExpander then
                ExpandHitboxes(true)
            end
        end
    }
)

-- Add a new toggle for freezing birds
MainTab:CreateToggle(
    {
        Name = "Freeze Birds in Place",
        CurrentValue = Settings.AutoFarm.FreezeBirds,
        Callback = function(value)
            Settings.AutoFarm.FreezeBirds = value
            if value then
                local character = LocalPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    Settings.AutoFarm.FreezePosition =
                        character.HumanoidRootPart.Position +
                        character.HumanoidRootPart.CFrame.LookVector * 10
                end

                -- Freeze all existing birds
                for _, regionName in pairs({"Beakwoods", "Deadlands", "Mount Beaks", "Quill Lake"}) do
                    local region = workspace.Regions:FindFirstChild(regionName)
                    if region then
                        local clientBirds = region:FindFirstChild("ClientBirds")
                        if clientBirds then
                            for _, bird in pairs(clientBirds:GetChildren()) do
                                if bird:IsA("Model") then
                                    for _, part in pairs(bird:GetDescendants()) do
                                        if part:IsA("BasePart") then
                                            part.Anchored = true
                                            part.CanCollide = false
                                            if not originalProperties[part] then
                                                originalProperties[part] = {
                                                    Anchored = part.Anchored,
                                                    CanCollide = part.CanCollide,
                                                    CFrame = part.CFrame
                                                }
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end

                Rayfield:Notify(
                    {
                        Title = "Bird Freeze",
                        Content = "Birds will be frozen in place",
                        Duration = 3,
                        Image = 4483362458
                    }
                )
            else
                -- When disabling, restore original properties
                for part, props in pairs(originalProperties) do
                    if part and part.Parent then
                        part.Anchored = props.Anchored
                        part.CanCollide = props.CanCollide
                    end
                end
                originalProperties = {}

                Rayfield:Notify(
                    {
                        Title = "Bird Freeze",
                        Content = "Birds are no longer frozen",
                        Duration = 3,
                        Image = 4483362458
                    }
                )
            end
        end
    }
)

-- AUTO TAB
AutoTab:CreateToggle(
    {
        Name = "Auto Sell",
        CurrentValue = Settings.AutoSell,
        Callback = function(value)
            Settings.AutoSell = value
            if value then
                Rayfield:Notify(
                    {
                        Title = "Auto Sell",
                        Content = "Auto Sell enabled! Will sell when inventory reaches " ..
                            Settings.SellThreshold,
                        Duration = 3,
                        Image = 4483362458
                    }
                )
            end
        end
    }
)

-- Sell Threshold Slider
AutoTab:CreateSlider(
    {
        Name = "Sell Threshold",
        Range = {5, 200},
        Increment = 5,
        Suffix = "items",
        CurrentValue = Settings.SellThreshold,
        Callback = function(value)
            Settings.SellThreshold = value
        end
    }
)

AutoTab:CreateButton(
    {
        Name = "Sell All Items",
        Callback = function()
            local player = Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local hrp = character:WaitForChild("HumanoidRootPart")

            -- Check if required services exist
            local Seller =
                Workspace:FindFirstChild("Regions") and Workspace.Regions:FindFirstChild("Beakwoods") and
                Workspace.Regions.Beakwoods:FindFirstChild("Useable") and
                Workspace.Regions.Beakwoods.Useable:FindFirstChild("NeilBirdCollector")

            local Net =
                ReplicatedStorage:FindFirstChild("Util") and ReplicatedStorage.Util:FindFirstChild("Net")

            if not Seller or not Net then
                Rayfield:Notify(
                    {
                        Title = "Error",
                        Content = "Could not find seller or network components",
                        Duration = 6.5,
                        Image = 4483362458
                    }
                )
                return
            end

            local SellInventory = Net:FindFirstChild("RF/SellInventory")
            if not SellInventory then
                Rayfield:Notify(
                    {
                        Title = "Error",
                        Content = "SellInventory remote function not found",
                        Duration = 6.5,
                        Image = 4483362458
                    }
                )
                return
            end

            -- Use the known pivot CFrame
            local sellerCFrame = CFrame.new(515.973022, 154.072998, 45.8440018, -1, 0, 0, 0, 1, 0, 0, 0, -1)

            -- Save original position
            local originalCFrame = hrp.CFrame

            -- Teleport slightly above the seller's pivot to avoid getting stuck in the model
            hrp.CFrame = sellerCFrame + Vector3.new(0, 5, 0)

            -- Notify user
            Rayfield:Notify(
                {
                    Title = "Auto-Sell Started",
                    Content = "Selling all items 5 times...",
                    Duration = 3,
                    Image = 4483362458
                }
            )

            -- Sell all items 5 times
            for _ = 1, 5 do
                SellInventory:InvokeServer("All")
                task.wait(0.1)
            end

            -- Return to original position
            hrp.CFrame = originalCFrame

            -- Notify completion
            Rayfield:Notify(
                {
                    Title = "Auto-Sell Complete",
                    Content = "Successfully sold all items!",
                    Duration = 5,
                    Image = 4483362458
                }
            )
        end
    }
)

-- Auto Dart Toggle
AutoTab:CreateToggle(
    {
        Name = "Auto Buy Darts",
        CurrentValue = Settings.AutoDart,
        Callback = function(value)
            Settings.AutoDart = value
            if value then
                Rayfield:Notify(
                    {
                        Title = "Auto Darts",
                        Content = "Auto buying darts enabled!",
                        Duration = 3,
                        Image = 4483362458
                    }
                )
                while Settings.AutoDart do
                    ReplicatedStorage:WaitForChild("Util"):WaitForChild("Net"):WaitForChild("RF/DartRoll"):InvokeServer(
                        "Beakwoods"
                    )
                    task.wait(1)
                end
            else
                Rayfield:Notify(
                    {
                        Title = "Auto Darts",
                        Content = "Auto buying darts disabled!",
                        Duration = 3,
                        Image = 4483362458
                    }
                )
            end
        end
    }
)

-- ESP TAB
EspTab:CreateToggle(
    {
        Name = "Enable Bird ESP",
        CurrentValue = false,
        Callback = function(Value)
            ToggleESP(Value)
        end
    }
)

-- Create color pickers for each region
for regionName, defaultColor in pairs(ESPColors) do
    EspTab:CreateColorPicker(
        {
            Name = regionName .. " Color",
            Color = defaultColor,
            Callback = function(Value)
                ESPColors[regionName] = Value
                -- Update existing ESPs if enabled
                if ESPEnabled then
                    for bird, espData in pairs(ESPObjects) do
                        for _, obj in pairs(espData) do
                            if obj:IsA("Highlight") then
                                obj.FillColor = Value
                            end
                        end
                    end
                end
            end
        }
    )
end

-- Create section for additional options
local SettingsSection = EspTab:CreateSection("ESP Settings")

EspTab:CreateToggle(
    {
        Name = "Show Names",
        CurrentValue = true,
        Callback = function(Value)
            for bird, espData in pairs(ESPObjects) do
                for _, obj in pairs(espData) do
                    if obj:IsA("BillboardGui") then
                        obj.Enabled = Value
                    end
                end
            end
        end
    }
)

EspTab:CreateSlider(
    {
        Name = "ESP Transparency",
        Range = {0, 1},
        Increment = 0.1,
        Suffix = "%",
        CurrentValue = 0.5,
        Callback = function(Value)
            for bird, espData in pairs(ESPObjects) do
                for _, obj in pairs(espData) do
                    if obj:IsA("Highlight") then
                        obj.FillTransparency = Value
                    end
                end
            end
        end
    }
)

-- FullBright with loop
local FullbrightEnabled = false
MiscTab:CreateToggle(
    {
        Name = "FullBright",
        CurrentValue = false,
        Callback = function(Value)
            FullbrightEnabled = Value
            local Lighting = game:GetService("Lighting")

            if Value then
                -- Store original values
                originalLighting = {
                    Brightness = Lighting.Brightness,
                    ClockTime = Lighting.ClockTime,
                    FogEnd = Lighting.FogEnd,
                    GlobalShadows = Lighting.GlobalShadows,
                    OutdoorAmbient = Lighting.OutdoorAmbient
                }

                -- Start the fullbright loop
                task.spawn(
                    function()
                        while FullbrightEnabled do
                            Lighting.Brightness = 2
                            Lighting.ClockTime = 14
                            Lighting.FogEnd = 100000
                            Lighting.GlobalShadows = false
                            Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
                            task.wait(0.1)
                        end
                    end
                )

                Rayfield:Notify(
                    {
                        Title = "FullBright",
                        Content = "FullBright enabled!",
                        Duration = 3,
                        Image = 4483362458
                    }
                )
            else
                -- Restore original values if they were stored
                if originalLighting.Brightness then
                    Lighting.Brightness = originalLighting.Brightness
                    Lighting.ClockTime = originalLighting.ClockTime
                    Lighting.FogEnd = originalLighting.FogEnd
                    Lighting.GlobalShadows = originalLighting.GlobalShadows
                    Lighting.OutdoorAmbient = originalLighting.OutdoorAmbient
                else
                    -- Default fallback values
                    Lighting.Brightness = 1
                    Lighting.ClockTime = 12
                    Lighting.FogEnd = 100000
                    Lighting.GlobalShadows = true
                    Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
                end

                Rayfield:Notify(
                    {
                        Title = "FullBright",
                        Content = "FullBright disabled!",
                        Duration = 3,
                        Image = 4483362458
                    }
                )
            end
        end
    }
)

-- NoFog
MiscTab:CreateToggle(
    {
        Name = "NoFog",
        CurrentValue = false,
        Callback = function(Value)
            local Lighting = game:GetService("Lighting")

            -- Only store original FogEnd if we haven't already
            if originalLighting.FogEnd == nil then
                originalLighting.FogEnd = Lighting.FogEnd
            end

            if Value then
                Lighting.FogEnd = 100000
                Rayfield:Notify(
                    {
                        Title = "NoFog",
                        Content = "Fog removed!",
                        Duration = 3,
                        Image = 4483362458
                    }
                )
            else
                -- Restore to either FullBright's value or original
                Lighting.FogEnd = originalLighting.FogEnd or 1000
                Rayfield:Notify(
                    {
                        Title = "NoFog",
                        Content = "Fog restored!",
                        Duration = 3,
                        Image = 4483362458
                    }
                )
            end
        end
    }
)

-- Infinite Jump
MiscTab:CreateToggle(
    {
        Name = "Infinite Jump",
        CurrentValue = false,
        Callback = function(Value)
            Settings.InfiniteJump = Value
            if Value then
                UserInputService.JumpRequest:Connect(
                    function()
                        if Settings.InfiniteJump then
                            local character = LocalPlayer.Character
                            if character then
                                local humanoid = character:FindFirstChildOfClass("Humanoid")
                                if humanoid then
                                    humanoid:ChangeState("Jumping")
                                end
                            end
                        end
                    end
                )
            end
        end
    }
)

-- WalkSpeed
MiscTab:CreateSlider(
    {
        Name = "WalkSpeed",
        Range = {16, 200},
        Increment = 5,
        Suffix = "Speed",
        CurrentValue = 16,
        Callback = function(Value)
            Settings.WalkSpeed = Value
            local character = LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = Value
                end
            end
        end
    }
)

-- Fly
local FLYING = false
local flyKeyDown, flyKeyUp
local IYMouse = game:GetService("Players").LocalPlayer:GetMouse()
local QEfly = true
local iyflyspeed = 200

local function getRoot(char)
    return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or
        char:FindFirstChild("UpperTorso")
end

local function sFLY()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    local root = getRoot(character)
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if not root or not humanoid then
        return
    end

    FLYING = true
    humanoid.PlatformStand = true

    local BG = Instance.new("BodyGyro", root)
    local BV = Instance.new("BodyVelocity", root)
    BG.P = 9e4
    BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    BG.cframe = root.CFrame
    BV.velocity = Vector3.new(0, 0, 0)
    BV.maxForce = Vector3.new(9e9, 9e9, 9e9)

    local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local SPEED = 0

    if flyKeyDown then
        flyKeyDown:Disconnect()
    end
    if flyKeyUp then
        flyKeyUp:Disconnect()
    end

    flyKeyDown =
        IYMouse.KeyDown:Connect(
        function(KEY)
            local key = KEY:lower()
            local speed = iyflyspeed or 200
            if key == "w" then
                CONTROL.F = speed
            elseif key == "s" then
                CONTROL.B = -speed
            elseif key == "a" then
                CONTROL.L = -speed
            elseif key == "d" then
                CONTROL.R = speed
            elseif QEfly and key == "e" then
                CONTROL.Q = speed * 2
            elseif QEfly and key == "q" then
                CONTROL.E = -speed * 2
            end
            workspace.CurrentCamera.CameraType = Enum.CameraType.Track
        end
    )

    flyKeyUp =
        IYMouse.KeyUp:Connect(
        function(KEY)
            local key = KEY:lower()
            if key == "w" then
                CONTROL.F = 0
            elseif key == "s" then
                CONTROL.B = 0
            elseif key == "a" then
                CONTROL.L = 0
            elseif key == "d" then
                CONTROL.R = 0
            elseif key == "e" then
                CONTROL.Q = 0
            elseif key == "q" then
                CONTROL.E = 0
            end
        end
    )

    game:GetService("RunService").Heartbeat:Connect(
        function()
            if FLYING and root then
                if
                    (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or
                        (CONTROL.Q + CONTROL.E) ~= 0
                    then
                    SPEED = 50
                    BV.velocity =
                        ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) +
                        ((workspace.CurrentCamera.CoordinateFrame *
                            CFrame.new(
                                CONTROL.L + CONTROL.R,
                                (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2,
                                0
                            ).p -
                            workspace.CurrentCamera.CoordinateFrame.p) *
                            SPEED))
                    lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                else
                    BV.velocity = Vector3.new(0, 0, 0)
                end
                BG.cframe = workspace.CurrentCamera.CoordinateFrame
            end
        end
    )
end

local function NOFLY()
    FLYING = false
    local player = game:GetService("Players").LocalPlayer
    if player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.PlatformStand = false
        end

        local root = getRoot(player.Character)
        if root then
            for _, v in pairs(root:GetChildren()) do
                if v:IsA("BodyGyro") or v:IsA("BodyVelocity") then
                    v:Destroy()
                end
            end
        end
    end

    if flyKeyDown then
        flyKeyDown:Disconnect()
    end
    if flyKeyUp then
        flyKeyUp:Disconnect()
    end

    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
end

MiscTab:CreateToggle(
    {
        Name = "Fly",
        CurrentValue = false,
        Callback = function(Value)
            if Value then
                sFLY()
                Rayfield:Notify(
                    {
                        Title = "Fly",
                        Content = "Fly enabled! (WASD + Q/E)",
                        Duration = 3,
                        Image = 4483362458
                    }
                )
            else
                NOFLY()
                Rayfield:Notify(
                    {
                        Title = "Fly",
                        Content = "Fly disabled!",
                        Duration = 3,
                        Image = 4483362458
                    }
                )
            end
        end
    }
)

-- Fly Speed Slider
MiscTab:CreateSlider(
    {
        Name = "Fly Speed",
        Range = {50, 500},
        Increment = 10,
        Suffix = "Speed",
        CurrentValue = 200,
        Callback = function(Value)
            iyflyspeed = Value
        end
    }
)

local teleportBirdsEnabled = false
local teleportBirdsTargetPos = nil
local function teleportBirds()
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return
    end

    local hrp = character.HumanoidRootPart
    local targetPos = hrp.Position + hrp.CFrame.RightVector * 6 + Vector3.new(0, 5, 0)
    local regions = workspace:FindFirstChild("Regions")
    if not regions then
        return
    end

    for _, map in ipairs(regions:GetChildren()) do
        local clientBirds = map:FindFirstChild("ClientBirds")
        if clientBirds then
            for _, bird in ipairs(clientBirds:GetChildren()) do
                if bird:IsA("Model") then
                    for _, part in ipairs(bird:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Anchored = true
                            part.CanCollide = false
                        end
                    end
                    local root = bird.PrimaryPart or bird:FindFirstChildWhichIsA("BasePart")
                    if root then
                        bird:PivotTo(CFrame.new(targetPos))
                    end
                end
            end
        end
    end
end

-- Update the teleport birds toggle to use the improved function
OPTab:CreateToggle(
    {
        Name = "Teleport All Birds to You",
        CurrentValue = false,
        Callback = function(Value)
            teleportBirdsEnabled = Value
            if Value then
                Rayfield:Notify(
                    {
                        Title = "Teleport Birds",
                        Content = "Birds will be teleported to you every second and frozen in place",
                        Duration = 3,
                        Image = 4483362458
                    }
                )
                -- Start a loop to continuously teleport birds
                task.spawn(
                    function()
                        while teleportBirdsEnabled do
                            teleportBirds()
                            task.wait(1) -- Teleport every second
                        end
                    end
                )
            else
                -- Restore original properties when disabled
                for part, props in pairs(originalProperties) do
                    if part and part.Parent then
                        part.Anchored = props.Anchored
                        part.CanCollide = props.CanCollide
                        part.CFrame = props.CFrame
                    end
                end
                originalProperties = {}

                Rayfield:Notify(
                    {
                        Title = "Teleport Birds",
                        Content = "Stopped teleporting birds and restored original properties",
                        Duration = 3,
                        Image = 4483362458
                    }
                )
            end
        end
    }
)

-- Locations table
local Locations = {
    ["Beakwoods"] = CFrame.new(520, 160, 68),
    ["Deadlands"] = CFrame.new(-712, 25, -1486),
    ["Mount Beaks"] = CFrame.new(84, 240, 383),
    ["Quill Lake"] = CFrame.new(-303, 160, -488)
}

-- Create separate buttons for each location instead of dropdown
TeleportTab:CreateButton(
    {
        Name = "Teleport to Beakswood",
        Callback = function()
            local destination = Locations["Beakswood"]
            if destination then
                local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                local humanoid = character:WaitForChild("Humanoid")
                local hrp = character:WaitForChild("HumanoidRootPart")

                humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                task.wait(0.1)
                hrp.CFrame = destination + Vector3.new(0, 5, 0)
                task.wait()
                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

                Rayfield:Notify(
                    {
                        Title = "Teleport Success",
                        Content = "Teleported to Beakswood!",
                        Duration = 5,
                        Image = 4483362458
                    }
                )
            end
        end
    }
)

TeleportTab:CreateButton(
    {
        Name = "Teleport to Deadlands",
        Callback = function()
            local destination = Locations["Deadlands"]
            if destination then
                local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                local humanoid = character:WaitForChild("Humanoid")
                local hrp = character:WaitForChild("HumanoidRootPart")

                humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                task.wait(0.1)
                hrp.CFrame = destination + Vector3.new(0, 5, 0)
                task.wait()
                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

                Rayfield:Notify(
                    {
                        Title = "Teleport Success",
                        Content = "Teleported to Deadlands!",
                        Duration = 5,
                        Image = 4483362458
                    }
                )
            end
        end
    }
)

TeleportTab:CreateButton(
    {
        Name = "Teleport to Mount Beaks",
        Callback = function()
            local destination = Locations["Mount Beaks"]
            if destination then
                local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                local humanoid = character:WaitForChild("Humanoid")
                local hrp = character:WaitForChild("HumanoidRootPart")

                humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                task.wait(0.1)
                hrp.CFrame = destination + Vector3.new(0, 5, 0)
                task.wait()
                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

                Rayfield:Notify(
                    {
                        Title = "Teleport Success",
                        Content = "Teleported to Mount Beaks!",
                        Duration = 5,
                        Image = 4483362458
                    }
                )
            end
        end
    }
)

TeleportTab:CreateButton(
    {
        Name = "Teleport to Quill Lake",
        Callback = function()
            local destination = Locations["Quill Lake"]
            if destination then
                local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                local humanoid = character:WaitForChild("Humanoid")
                local hrp = character:WaitForChild("HumanoidRootPart")

                humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                task.wait(0.1)
                hrp.CFrame = destination + Vector3.new(0, 5, 0)
                task.wait()
                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

                Rayfield:Notify(
                    {
                        Title = "Teleport Success",
                        Content = "Teleported to Quill Lake!",
                        Duration = 5,
                        Image = 4483362458
                    }
                )
            end
        end
    }
)

-- Add teleport to random bird button with proper error handling
TeleportTab:CreateButton(
    {
        Name = "Teleport to Random Bird",
        Callback = function()
            if not ClientBirds then
                Rayfield:Notify(
                    {
                        Title = "Error",
                        Content = "ClientBirds not found!",
                        Duration = 3,
                        Image = 4483362458
                    }
                )
                return
            end

            local birds = {}

            -- Collect all valid birds
            for _, bird in ipairs(ClientBirds:GetChildren()) do
                if bird:IsA("Model") then
                    local primaryPart = bird.PrimaryPart or bird:FindFirstChildWhichIsA("BasePart")
                    if primaryPart then
                        table.insert(birds, bird)
                    end
                end
            end

            if #birds > 0 then
                local randomBird = birds[math.random(1, #birds)]
                local primaryPart = randomBird.PrimaryPart or randomBird:FindFirstChildWhichIsA("BasePart")

                local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                local hrp = character:WaitForChild("HumanoidRootPart")

                if hrp and primaryPart then
                    hrp.CFrame = CFrame.new(primaryPart.Position + Vector3.new(0, 5, 0))
                    Rayfield:Notify(
                        {
                            Title = "Teleport Success",
                            Content = "Teleported to random bird",
                            Duration = 3,
                            Image = 4483362458
                        }
                    )
                end
            else
                Rayfield:Notify(
                    {
                        Title = "Error",
                        Content = "No birds found in ClientBirds!",
                        Duration = 3,
                        Image = 4483362458
                    }
                )
            end
        end
    }
)

local function GetRandomBird(region)
    local clientBirds =
        workspace.Regions:FindFirstChild(region) and workspace.Regions[region]:FindFirstChild("ClientBirds")
    if not clientBirds then
        return nil
    end

    local validBirds = {}
    for _, bird in ipairs(clientBirds:GetChildren()) do
        if bird:IsA("Model") then
            local success, pivot =
                pcall(
                function()
                    return bird:GetPivot()
                end
            )
            if success and pivot then
                -- Only consider birds that are within reasonable Y level
                local playerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                if math.abs(pivot.Position.Y - playerPos.Y) <= 40 then
                    table.insert(validBirds, bird)
                end
            end
        end
    end

    if #validBirds > 0 then
        return validBirds[math.random(1, #validBirds)]
    end
    return nil
end

local function StartAutoFarm(region)
    local player = game.Players.LocalPlayer
    local Camera = workspace.CurrentCamera
    local tweenService = game:GetService("TweenService")
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local RunService = game:GetService("RunService")

    local CurrentBird, CurrentTween, LastBirdSwitch = nil, nil, 0
    local originalGravity = workspace.Gravity
    workspace.Gravity = 10

    local clientBirds =
        workspace.Regions:FindFirstChild(region) and workspace.Regions[region]:FindFirstChild("ClientBirds")
    if not clientBirds then
        return
    end

    while Settings.AutoFarm[region:gsub(" ", "")] do
        task.wait(0.05)
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local hrp = character.HumanoidRootPart
            local now = os.clock()

            -- Choose a new bird every 10 seconds
            if not CurrentBird or (now - LastBirdSwitch) > Settings.AutoFarm.BirdDuration then
                CurrentBird = GetRandomBird(region)
                LastBirdSwitch = now
                if CurrentTween then
                    CurrentTween:Cancel()
                end
            end

            if CurrentBird then
                local success, pivot =
                    pcall(
                    function()
                        return CurrentBird:GetPivot()
                    end
                )

                if success and pivot then
                    -- Tween to bird with offset
                    local offset = Vector3.new(0, 3, 8)
                    local targetPos = pivot.Position + offset
                    local targetCFrame = CFrame.new(targetPos, pivot.Position)

                    CurrentTween =
                        tweenService:Create(
                        hrp,
                        TweenInfo.new(
                            Settings.AutoFarm.TweenDuration,
                            Settings.AutoFarm.EasingStyle,
                            Settings.AutoFarm.EasingDirection
                        ),
                        {CFrame = targetCFrame}
                    )
                    CurrentTween:Play()

                    -- Follow the bird for up to 10 seconds
                    local followStart = os.clock()
                    while os.clock() - followStart < Settings.AutoFarm.BirdDuration and
                        Settings.AutoFarm[region:gsub(" ", "")] do
                        local pivotSuccess, pivotUpdate =
                            pcall(
                            function()
                                return CurrentBird:GetPivot()
                            end
                        )

                        if pivotSuccess then
                            -- Keep camera aimed at bird
                            local aimPos = pivotUpdate.Position
                            Camera.CFrame = CFrame.new(Camera.CFrame.Position, aimPos)

                            -- Auto shoot if enabled
                            if Settings.AutoFarm.AutoShoot then
                                local screenPoint = Camera:WorldToViewportPoint(aimPos)
                                local shootX =
                                    screenPoint.X +
                                    ((math.random() - 0.5) * Settings.AutoFarm.ShootVariance * 50)
                                local shootY =
                                    screenPoint.Y +
                                    ((math.random() - 0.5) * Settings.AutoFarm.ShootVariance * 30)

                                VirtualInputManager:SendMouseButtonEvent(shootX, shootY, 0, true, game, 1)
                                task.wait(0.02 + math.random() * 0.03)
                                VirtualInputManager:SendMouseButtonEvent(shootX, shootY, 0, false, game, 1)
                            end
                        end

                        task.wait(0.1)
                    end
                end
            end
        end
    end

    if CurrentTween then
        CurrentTween:Cancel()
    end
    workspace.Gravity = originalGravity
end

-- Connect to Heartbeat with pause detection
RunService.Heartbeat:Connect(
    function()
        -- Only run if game isn't paused
        if game:GetService("Workspace").DistributedGameTime then
            StartAutoFarmLoop()
        end
    end
)

-- Reset on character added
LocalPlayer.CharacterAdded:Connect(
    function(character)
        CurrentBird = nil
        if CurrentTween then
            CurrentTween:Cancel()
            CurrentTween = nil
        end
        task.wait(0.5) -- Brief delay after respawn
    end
)
