game:HttpGet("https://getexploits.com/cexecution/662421792362876928")

local Executor = identifyexecutor()

getgenv().Ancestor_Loaded = false

local SupportedExecutors = {'Synapse X', 'ScriptWare', 'Krnl', 'Valyse', 'Fluxus'}
local Supported = table.find(SupportedExecutors, Executor) ~= nil

assert(Supported, 'Executor Not Supported')

repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild('PlayerGui') and game.Players.LocalPlayer.PlayerGui:FindFirstChild('OnboardingGUI') and game.Players.LocalPlayer.PlayerGui.OnboardingGUI.DoOnboarding.Loaded.Value

local Maid, Ancestor, GUISettings, Connections = loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/KhayneGleave/Ancestor/main/Maid.txt'))(), {

    SelectedTreeType             = 'Generic',
    BringTreeAmount              = 1,
    AutobuyAmount                = 1,
    AutobuySelectedItem          = 'Basic Hatchet',
    BringTreeSelectedPosition    = 'Current Position',
    RotatingObject               = false,
    Sprinting                    = false,
    ModerationType               = 'Vehicle',
    ModerationAction             = 'Kill',
    LatestSupportedVersion       = '2258',
    InventoryDuplicationAmount   = 1,
    PropertyToDuplicate          = 1,
    PlayerToDuplicatePropertyTo  = game.Players:GetPlayers()[1],
    ModWoodSawmill               = nil,
    AutofarmTrees                = false,
    CharacterGodMode             = 'FirstTimeExecutionProtection',
    IsClientFlying               = false,
    TreeToDismember              = false,
    SelectedVehicleColourToSpawn = 'Dark red',
    CurrentlySavingOrLoading     = nil,
    DonatingProperty             = false,
    SpawnItemsAmount             = 1,
    SpawnItemName                = 'BasicHatchet',
    ModdingWood                  = false

}, {
    
    WalkSpeed                          = 16,
    JumpPower                          = 50,
    HipHeight                          = 0,
    SprintSpeed                        = 20,
    FOV                                = 70,
    InfiniteJump                       = false,
    SelectedDropType                   = 'Both',
    Light                              = false,
    SprintKey                          = 'LeftShift',
    NoclipKey                          = 'LeftControl',
    KeyTP                              = 'G',
    FastCheckout                       = false,
    FixCashierRange                    = false,
    HardDragger                        = false,
    AxeRangeActive                     = false,
    AxeSwingActive                     = false,
    FlyKey                             = 'F',
    WaterWalk                          = false,
    WaterFloat                         = true,
    FlySprintSpeed                     = 10,
    AlwaysDay                          = false,
    AlwaysNight                        = false,
    NoFog                              = false,
    AxeSwing                           = 0,
    AxeRange                           = 0,
    FlySpeed                           = 200,
    CarSpeed                           = 1,
    CarPitch                           = 1,
    AntiAFK                            = (Executor ~= 'Krnl' and true) or false,
    TreesEnabled                       = true,
    StopPlayersLoading                 = false,
    SignDuplicationAmount              = 1,
    TeleportBackAfterBringTree         = true,
    FastRotate                         = false,
    XRotate                            = 1,
    YRotate                            = 1,
    SelectedTreeTypeSize               = 'Largest',
    ActivateVehicleModifications       = true,
    AutoSaveGUIConfiguration           = true,
    Brightness                         = 1,
    GlobalShadows                      = true,
    RejoinExecute                      = false,
    UnboxItems                         = false,
    FreeCamera                         = false,
    WaterGodMode                       = false,
    BetterGraphics                     = false,
    DropToolsAfterInventoryDuplication = false,
    InstantDropAxes                    = false,
    ClickDelete                        = false,
    SellPlankAfterMilling              = false,
    AutoStopOnPinkVehicle              = false,
    DeleteSpawnPadAfterVehicleSpawn    = false,
    AutoChopTrees                      = false,
    SitInAnyVehicle                    = false,
    ClickToSell                        = false

}, {}

local Players, TeleportService, UIS, CoreGui, StarterGui, Lighting, RunService, ReplicatedStorage, HttpService, PerformanceStats, UserInputService, Terrain = game:GetService('Players'), game:GetService('TeleportService'), game:GetService('UserInputService'), game:GetService('CoreGui'), game:GetService('StarterGui'), game:GetService('Lighting'), game:GetService('RunService'), game:GetService('ReplicatedStorage'), game:GetService('HttpService'), game:GetService('Stats').PerformanceStats, game:GetService('UserInputService'), workspace.Terrain

local Player = Players.LocalPlayer

local Mouse = Player:GetMouse()

getgenv().Character = Player.Character or Player.CharacterAdded:Wait()

local PlayerGui, Camera = Player.PlayerGui, workspace.CurrentCamera

local Properties, Stores, PlayerModels = Workspace.Properties:GetChildren(), Workspace.Stores:GetChildren(), Workspace.PlayerModels

local NPCChattingClient, CharacterFloat, PropertyPurchasingClient, LoadSaveClient, UserInput, SettingsClient, InteractionPermission = getsenv(PlayerGui.ChatGUI.NPCChattingClient), getsenv(PlayerGui.Scripts.CharacterFloat), getsenv(PlayerGui.PropertyPurchasingGUI.PropertyPurchasingClient), getsenv(PlayerGui.LoadSaveGUI.LoadSaveClient), getsenv(PlayerGui.Scripts.UserInput), getsenv(PlayerGui.SettingsGUI.SettingsClient), require(ReplicatedStorage.Interaction.InteractionPermission)

local RequestLoad, RequestSave, GetMetaData, ClientMayLoad, SendUserNotice, ClientGetUserPermissions, ClientExpandedProperty, ClientPurchasedProperty, ClientInteracted, ClientIsDragging, RemoteProxy, PromptChat, PlayerChatted, SetChattingValue, TestPing, UpdateUserSettings, ClientPlacedStructure, SelectLoadPlot, ClientPlacedBlueprint, DestroyStructure = ReplicatedStorage.LoadSaveRequests.RequestLoad, ReplicatedStorage.LoadSaveRequests.RequestSave, ReplicatedStorage.LoadSaveRequests.GetMetaData, ReplicatedStorage.LoadSaveRequests.ClientMayLoad, ReplicatedStorage.Notices.SendUserNotice, ReplicatedStorage.Interaction.ClientGetUserPermissions, ReplicatedStorage.PropertyPurchasing.ClientExpandedProperty, ReplicatedStorage.PropertyPurchasing.ClientPurchasedProperty, ReplicatedStorage.Interaction.ClientInteracted, ReplicatedStorage.Interaction.ClientIsDragging, ReplicatedStorage.Interaction.RemoteProxy, ReplicatedStorage.NPCDialog.PromptChat, ReplicatedStorage.NPCDialog.PlayerChatted, ReplicatedStorage.NPCDialog.SetChattingValue, ReplicatedStorage.TestPing, ReplicatedStorage.Interaction.UpdateUserSettings, ReplicatedStorage.PlaceStructure.ClientPlacedStructure, ReplicatedStorage.PropertyPurchasing.SelectLoadPlot,  ReplicatedStorage.PlaceStructure.ClientPlacedBlueprint, ReplicatedStorage.Interaction.DestroyStructure

local LoadPass = getupvalue(LoadSaveClient.saveSlot, 12)

local AxeFolder, LogModels, ClientItemInfo, Util = ReplicatedStorage.AxeClasses, workspace.LogModels, ReplicatedStorage.ClientItemInfo, ReplicatedStorage:WaitForChild('Util', 10) 

local TransientFunctionCache = require(Util:WaitForChild('TransientFunctionCache', 10))

local VehicleColours = {'Dark red','Sand red','Sand yellow metalic','Lemon metalic','Gun metalic','Earth orange','Earth yellow','Brick yellow','Rust','Really black','Faded green','Sand green','Black metalic','Dark grey metallic','Dark grey','Silver','Medium stone grey','Mid grey', 'Hot pink'}

local ConfigurationIsIntact = pcall(function()

    HttpService:JSONDecode(readfile('AncestorV2Configuration.cfg'))

end)

if not getgenv().UserCanInteract then

    getgenv().CharacterFloatOld = CharacterFloat.isInWater
    getgenv().UserCanInteract = InteractionPermission.UserCanInteract
    getgenv().BetterGraphicsEnabled = false

end

getgenv().LoadedTrees = {

    ['Update'] = function(_, Tree)

    LoadedTrees[#LoadedTrees + 1] = {

        Parent = Tree.Parent,
        Model  = Tree

    }

    Tree.Parent = (GUISettings.TreesEnabled and Tree.Parent) or Lighting
    
end}

if Ancestor.LatestSupportedVersion ~= tostring(game.PlaceVersion) then

    SendUserNotice:Fire(string.format('Version Mismatch: \n\nAncestor: V%s \nLumber Tycoon 2: V%s.', Ancestor.LatestSupportedVersion, tostring(game.PlaceVersion)))

end

if not isfile('AncestorSlotNames.cfg') then

    local DefaultSlotNames = {}

    DefaultSlotNames[tostring(Player)] = {

        Slot1 = 'Slot 1',
        Slot2 = 'Slot 2',
        Slot3 = 'Slot 3',
        Slot4 = 'Slot 4',
        Slot5 = 'Slot 5',
        Slot6 = 'Slot 6'

    }

    writefile('AncestorSlotNames.cfg', HttpService:JSONEncode(DefaultSlotNames))

end

local CashiersAutobuy = {}

local CashierIDConnection = PromptChat.OnClientEvent:Connect(function(_, Cashier)

    if CashiersAutobuy[Cashier.Name] == nil then

        CashiersAutobuy[Cashier.Name] = Cashier.ID

    end

end)

Maid.Threads:Create(function()  

    SetChattingValue:InvokeServer(1)

    repeat Maid.Timer:Wait() until CashiersAutobuy['Hoover'] ~= nil

    CashierIDConnection:Disconnect()
    CashierIDConnection = nil
    SetChattingValue:InvokeServer(0)

end)


local AncestorSlotNames = HttpService:JSONDecode(readfile('AncestorSlotNames.cfg'))
local DoesPlayerExist = AncestorSlotNames[tostring(Player)] ~= nil

if not DoesPlayerExist then

    local DefaultSlotNames = {}

    DefaultSlotNames = {

        Slot1 = 'Slot 1',
        Slot2 = 'Slot 2',
        Slot3 = 'Slot 3',
        Slot4 = 'Slot 4',
        Slot5 = 'Slot 5',
        Slot6 = 'Slot 6'

    }

    local SlotNamesOld = HttpService:JSONDecode(readfile('AncestorSlotNames.cfg'))
    SlotNamesOld[tostring(Player)] = DefaultSlotNames
    writefile('AncestorSlotNames.cfg', HttpService:JSONEncode(SlotNamesOld))

end

if not isfile('AncestorV2Configuration.cfg') then

    writefile('AncestorV2Configuration.cfg', HttpService:JSONEncode(GUISettings))

end

local DefaultSettings = GUISettings

GUISettings = HttpService:JSONDecode(readfile('AncestorV2Configuration.cfg'))

if not ConfigurationIsIntact then

    delfile('AncestorV2Configuration.cfg')
    writefile('AncestorV2Configuration.cfg', HttpService:JSONEncode(GUISettings))

    SendUserNotice:Fire('Configuration File Was Corrupted, Probably Due To Power Loss. Reverted To Default Settings.')

end

PlayerDropType = GUISettings.SelectedDropType

for Index, Value in next, DefaultSettings do 

    if GUISettings[Index] == nil then 

        GUISettings[Index] = Value 

        writefile('AncestorV2Configuration.cfg', HttpService:JSONEncode(GUISettings))

        SendUserNotice:Fire('Updated Configuration For Latest Ancestor Version.')
        
    end

end

local Slots = HttpService:JSONDecode(readfile('AncestorSlotNames.cfg'))
local SlotNames = Slots[tostring(Player)]

function Ancestor:GetModelByName(Name)

    local PlayerModels = workspace.PlayerModels:GetChildren()

    for i = 1, #PlayerModels do

        local Model = PlayerModels[i]

        if Model:FindFirstChild('Owner') and Model.Owner.Value == Player then

            local ItemType = Model:FindFirstChild('ItemName')

            if ItemType and tostring(ItemType.Value):match(Name) then

                return Model

            end

        end

    end

    return false

end

function Ancestor:DropTool(Axe)

    ClientInteracted:FireServer(Axe, 'Drop tool',Player.Character.PrimaryPart.CFrame)

end

function Ancestor:DropTools()

Player.Character.Humanoid:UnequipTools()

    if GUISettings.InstantDropAxes then 

    Player.Character.Humanoid.Health = 0

        return

    end

    local Axes = self:GetAxes()

    for i = 1, #Axes do 

        local Axe = Axes[i]

        self:DropTool(Axe)
        Maid.Timer:Wait(.125)

    end

end

function Ancestor:FastRotate(State)

    setconstant(UserInput.getSteerFromKeys, 1, (State and GUISettings.FastRotate and GUISettings.XRotate) or 1)
    setconstant(UserInput.getThrottleFromKeys, 1, (State and GUISettings.FastRotate and GUISettings.YRotate) or 1)

end

function Ancestor:SellSigns()

    self:BringAll('PropertySoldSign', CFrame.new(315, 3, 85))

end

Connections.RotateStarted = {Function = UserInputService.InputBegan:Connect(function(Key, Processed)

    if Key.KeyCode == Enum.KeyCode.LeftShift and not Processed then

        Ancestor.RotatingObject = true

    end

end)}

Connections.RotateEnded = {Function = UserInputService.InputEnded:Connect(function(Key, Processed)

    if Key.KeyCode == Enum.KeyCode.LeftShift and not Processed then

        Ancestor.RotatingObject = false

    end

end)}

function Ancestor:SaveSlotNames()

    local SlotNamesOld = HttpService:JSONDecode(readfile('AncestorSlotNames.cfg'))
    SlotNamesOld[tostring(Player)] = nil
    SlotNamesOld[tostring(Player)] = SlotNames
    writefile('AncestorSlotNames.cfg', HttpService:JSONEncode(SlotNamesOld))
    SendUserNotice:Fire('Saved Slot Names.')

end

function Ancestor:SaveConfigurationFile(Bypass)

    writefile('AncestorV2Configuration.cfg', HttpService:JSONEncode(GUISettings))

    if not Bypass then
    
        SendUserNotice:Fire('Saved Configuration File!')

    end

end

function Ancestor:DeleteConfigurationFile()

    GUISettings.AutoSaveGUIConfiguration = false
    delfile('AncestorV2Configuration.cfg')
    SendUserNotice:Fire('Deleted Configuration File!')

end

function Ancestor:CheckClientPrivilege(Player, Privilege)

    return TransientFunctionCache:New(function(...)
            
        return ClientGetUserPermissions:InvokeServer(...)

    end, 1, {
        
        ReturnOldResultInsteadOfYielding = true
    
    }).Callback(Player, Privilege)

end

function Ancestor:CheckPrivilege(Player, Privilege)

    return ClientGetUserPermissions:InvokeServer(Player.UserId, Privilege)

end

Connections.DeathFix = {Function = Player.CharacterAdded:Connect(function()

    repeat Maid.Timer:Wait() 

    until Player.Character:FindFirstChild('Humanoid')

    Ancestor:ApplyLight()
    Ancestor:Fly()

    if Ancestor.CharacterGodMode then 

        Ancestor:GodMode()

    end

    Connections.AxeModifier ={Function = Player.Character.ChildAdded:Connect(function(Tool)

        if Tool:IsA('Tool') then

            repeat Maid.Timer:Wait()until getconnections(Tool.Activated)[1]

            if GUISettings.AxeRangeActive then 

                Ancestor:SetAxeRange(true, GUISettings.AxeRange)

            end

            if GUISettings.AxeSwingActive then 

                Ancestor:SetSwingCooldown(true,GUISettings.AxeSwing)
            end

        end

    end)}

    Connections.CharacterDied = {Function = Player.Character.Humanoid:GetPropertyChangedSignal('Health'):Connect(function()

        if Player.Character.Humanoid.Health <= 0 then
        
            self:GetConnection('AxeModifier', true)

        end

    end)}

end)}

--// ANCESTOR API

function Ancestor:GetAllTrees()
    
    LoadedTrees = {

        ['Update'] = function(_, Tree)
    
        LoadedTrees[#LoadedTrees + 1] = {
    
            Parent = Tree.Parent,
            Model  = Tree
    
        }
    
        Tree.Parent = (GUISettings.TreesEnabled and Tree.Parent) or Lighting
    
    end}

    local Children = workspace:GetChildren()

    for i = 1, #Children do

        local TreeRegion = Children[i]

        if tostring(TreeRegion):match('TreeRegion') then

            local Trees = TreeRegion:GetChildren()

            for i = 1, #Trees do

                local Tree = Trees[i]

                if Tree:FindFirstChild('TreeClass') and #Tree:GetChildren() >= 4 then

                    LoadedTrees[#LoadedTrees + 1] = {

                        Parent = Tree.Parent,
                        Model  = Tree

                    }

                end
        
            end

        end

    end

    return LoadedTrees

end

function Ancestor:GetLava()
    
    local Lava = workspace['Region_Volcano']:GetChildren()
    
    for i = 1, #Lava do 
        
        local Lava = Lava[i]
        
        if Lava:FindFirstChild('Lava') and Lava.Lava.CFrame == CFrame.new(-1675.2002, 255.002533, 1284.19983, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268) then 
            
            return Lava
            
        end
        
    end
    
end

local LavaPart = Ancestor:GetLava()

function Ancestor:SetAxeRange(Active, Value)

    local Tool =Player.Character:FindFirstChildOfClass('Tool')

    if not Tool or not AxeRangeLabel then

        return

    end

    local AttemptChop = getconnections(Tool.Activated)[1].Function
    local OldStats = getupvalues(AttemptChop)
    local NewStats = OldStats[1]

    NewStats.Range = (Active and Value) or require(AxeFolder:FindFirstChild('AxeClass_'..tostring(Tool.ToolName.Value))).new().Range

    AxeRangeLabel:UpdateText('Range: ' .. tostring(NewStats.Range))
    setupvalue(AttemptChop, 1, NewStats)

end

function Ancestor:UpdateAxeInfo()

    if not AxeNameLabel or not AxeRangeLabel or not AxeCooldownLabel then

        return

    end

    if Player.Character:FindFirstChild('Tool') then

        local Tool =Player.Character:FindFirstChild('Tool')
        repeat Maid.Timer:Wait()

        until getconnections(Tool.Activated)[1] ~= nil

        local AttemptChop = getconnections(Tool.Activated)[1].Function
        local Stats = getupvalues(AttemptChop)[1]

        AxeNameLabel:UpdateText('Name: ' ..Player.Character.Tool.ToolName.Value)
        AxeRangeLabel:UpdateText('Range: ' .. tostring(Stats.Range))
        AxeCooldownLabel:UpdateText('Cooldown: ' .. tostring(Stats.SwingCooldown))

    else

        AxeNameLabel:UpdateText('Current Axe Not Found')
        AxeRangeLabel:UpdateText('Range: Not Currently Available')
        AxeCooldownLabel:UpdateText('Cooldown: Not Currently Available')

    end

end

Connections.UpdateAxeEquip = {Function = RunService.Stepped:Connect(function(Tool)

    pcall(function()

        Ancestor:UpdateAxeInfo()

    end)

end)}

function Ancestor:Rejoin()

    if GUISettings.RejoinExecute then

        if not syn then

            RejoinToggle:Toggle()
            return SendUserNotice:Fire('Re-Execution Is Only Supported On Synapse X.')

        end
        
        syn.queue_on_teleport([[

            repeat task.Wait() until game:IsLoaded()
            loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/KhayneGleave/Ancestor/main/AncestorV2'))()


        ]])

    end

    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, Player)

end

function Ancestor:SetThreadContext(Level)

    if Executor == 'Krnl' then 

        return SendUserNotice:Fire('Use Fluxus or a paid executor to use')

    end

    if syn then 

        syn.set_thread_identity(Level)

    else

        setthreadcontext(Level)

    end
    
end

function Ancestor:SetSwingCooldown(Active)

    local Tool = Player.Character:FindFirstChildOfClass('Tool')

    if not Tool or not AxeCooldownLabel then

        return

    end

    local AttemptChop = getconnections(Tool.Activated)[1].Function

    local OldStats = getupvalues(AttemptChop)
    local NewStats = OldStats[1]

    local Cooldown = require(AxeFolder:FindFirstChild('AxeClass_'..tostring(Tool.ToolName.Value))).new().SwingCooldown

    NewStats.SwingCooldown = (Active and Cooldown / 2) or Cooldown

    AxeCooldownLabel:UpdateText(string.format('Cooldown : %s', tostring(NewStats.SwingCooldown)))

    setupvalue(AttemptChop, 1, NewStats)

end

function Ancestor:ToggleTrees(State)

    Maid.Threads:Create(function()

        for i = 1, #LoadedTrees do 

            pcall(function()
            
                local Tree = LoadedTrees[i]

                if not Tree.Model:FindFirstChild('WoodSection') then 

                    Tree.Model:Destroy()

                    LoadedTrees[i] = nil

                end

                Tree.Model.Parent = (State and Tree.Parent) or Lighting

            end)
                
        end

    end)

end

function Ancestor:GetConnection(Name, DisconnectConnection)

    for Connection, Data in next, Connections do

        if tostring(Connection) == tostring(Name) then

            if DisconnectConnection then

                Data.Function:Disconnect()
                Connections[Name] = nil

                return false

            end

            return Data.Function

        end
        
    end

    return false

end

function Ancestor:FastCheckout(Value)

    setconstant(NPCChattingClient.advanceChat, 19, Value)

end

function Ancestor:MergeTables(Tbl, NewTbl)

    for Index, Value in next, Tbl do 

        NewTbl[#NewTbl + 1] = Value 

    end

    return NewTbl

end

function Ancestor:GetAxes()

    local Axes = {}
    local Tools = self:MergeTables(Player.Backpack:GetChildren(), Player.Character:GetChildren())

    for i = 1, #Tools do

        local Axe = Tools[i]

        if Axe:FindFirstChild('CuttingTool') then

            Axes[#Axes + 1] = Axe

        end

    end

    return Axes

end

function Ancestor:GetPlayersSlotInfo(Client)

    local Data = GetMetaData:InvokeServer(Players[tostring(Client)])

    local Info = {}

    for i = 1, #Data do

        if Data[i].SaveMeta[#Data[i].SaveMeta] then

            local Datasize = Data[i].SaveMeta[#Data[i].SaveMeta].NumKeys

            Info[#Info + 1] = Datasize

        end

    end

    return Info

end

function Ancestor:DoesAxeExist()

    return Ancestor:GetAxes()[1] ~= nil

end

function Ancestor:GetLoadedSlot()

    return Player.CurrentSaveSlot.Value

end

function Ancestor:SaveSlot()

    if self.CurrentlySavingOrLoading or self.DonatingProperty then 

        return SendUserNotice:Fire((self.CurrentlySavingOrLoading and 'You Are Currently Saving/Loading') or 'Cannot Perform This Action During Property Duplication.')

    end

    self.CurrentlySavingOrLoading = true
    RequestSave:InvokeServer(self:GetLoadedSlot(), Player)
    self.CurrentlySavingOrLoading = false

end

function Ancestor:DeleteSlot(SlotNumber)

    if self.CurrentlySavingOrLoading or self.DonatingProperty then 

        return SendUserNotice:Fire((self.CurrentlySavingOrLoading and 'You Are Currently Saving/Loading') or 'Cannot Perform This Action During Property Duplication.')

    end

    if Ancestor:GetLoadedSlot() ~= -1 then

        SendUserNotice:Fire('Unloading Current Slot... Please Wait.')

    end

    self.CurrentlySavingOrLoading = true
    RequestLoad:InvokeServer(math.huge, Player)
    Ancestor:Set(-1)
    RequestSave:InvokeServer(SlotNumber, Player)
    SendUserNotice:Fire(string.format('Deleted Slot %s.', tostring(SlotNumber)))
    self.CurrentlySavingOrLoading = false 

end

function Ancestor:GetSignClosestToPlayer()

    local Max, PlayerModels, ClosestSign = 9e9, PlayerModels:GetChildren(), nil

    for i = 1, #PlayerModels do

        local Sign = PlayerModels[i]

        if Sign:FindFirstChild('ItemName') and tostring(Sign.ItemName.Value) == 'PropertySoldSign' and Sign:FindFirstChild('Owner') and tostring(Sign.Owner.Value) == tostring(Player) then 
            
            if (Player.Character.PrimaryPart.CFrame.p - Sign.PrimaryPart.CFrame.p).Magnitude <= Max then 

                ClosestSign = Sign 
                Max = (Player.Character.PrimaryPart.CFrame.p - Sign.PrimaryPart.CFrame.p).Magnitude

            end

        end

    end

    return ClosestSign

end

function Ancestor:GetFreeLand()

    local Max, NearestProperty = 9e9

    for i = 1, #Properties do

        local Property = Properties[i]

        if Property.Owner.Value == nil and (Property.OriginSquare.CFrame.p - Player.Character.Head.CFrame.p).Magnitude < Max then

            NearestProperty = Property
            Max = (Property.OriginSquare.CFrame.p - Player.Character.Head.CFrame.p).Magnitude

        end

    end

    return NearestProperty

end

function Ancestor:GetOrphanedHillProperty()

    local Properties, HillProperties = workspace.Properties:GetChildren(), {
    
        ['-240, 19, 204, 1, 0, 0, 0, 1, 0, 0, 0, 1'] = true,
        ['-61, 19, 526, 1, 0, 0, 0, 1, 0, 0, 0, 1']  = true
        
    }
    
    for i = 1, #Properties do 
    
        local Property = Properties[i]
    
        if rawget(HillProperties, tostring(Property.OriginSquare.CFrame)) and Property.Owner.Value == nil then 
    
            return Property
            
        end
    
    end

    return false

end

--[[

    0, 0, 0 = Left
    0,-90,0 = front
    0,90,0  = back
    0,180,0 = right

]]

function Ancestor:ModSawmill()

    self.ModWoodSawmill = nil

    self:SelectSawmill('To Mod')

    repeat Maid.Timer:Wait() until self.ModWoodSawmill

    local Conveyor, Conveyors = nil, self.ModWoodSawmill.Conveyor.Model:GetChildren()

    local Orientation = self.ModWoodSawmill.Main.Orientation.Y

    for i = (self.ModWoodSawmill.ItemName.Value:match('Sawmill4L') and  #Conveyors - 1) or #Conveyors, #Conveyors do 
        
        Conveyor = Conveyors[i]

        break
        
    end

    local Offset = .4

    for i = 1, 4 do
        
        Offset += .2

        ClientPlacedBlueprint:FireServer('Floor2', CFrame.new(Conveyor.CFrame.p + Vector3.new((Orientation == 0 and -Offset) or (Orientation == 180 and Offset) or 0, 1.5, (Orientation == -90 and -Offset) or (Orientation == 90 and Offset))) * CFrame.Angles(math.rad(((Orientation == 180 or Orientation == 0) and 90) or 45), math.rad(((Orientation == 180 or Orientation == 0) and 0) or 90), math.rad(((Orientation == 180 or Orientation == 0) and 90) or 45)), Player)
        Maid.Timer:Wait(1.5)

    end

    SendUserNotice:Fire('Fill Blueprint To Complete Mod. \n\nThis Will Be Automated In The Future.')

end

function Ancestor:FreeLand(IgnoreTeleport, ForceHillLoad)

    -- if Ancestor:GetPlayersBase(Player) then

    --     return SendUserNotice:Fire('You already have a Property!')

    -- end

    local Property = ForceHillLoad and self:GetOrphanedHillProperty() or Ancestor:GetFreeLand()

    if ForceHillLoad and not Property then

        return SendUserNotice:Fire('Please Make Sure At Least One Property On The Hill Is Free.')

    end

    if not Property then 

        repeat Maid.Timer:Wait()

            Property = Ancestor:GetFreeLand()

        until Property 

    end

    ClientPurchasedProperty:FireServer(Property, Property.OriginSquare.CFrame.p)

    if not IgnoreTeleport then

        SendUserNotice:Fire('Free Land Acquired.')
        
    end

    if not ForceHillLoad then

        self:Teleport(CFrame.new(Property.OriginSquare.CFrame.p) + Vector3.new(0, 5, 0))

    end

    repeat Maid.Timer:Wait() until workspace.Effects:FindFirstChild('Particles') and (Player.Character.PrimaryPart.CFrame.p - Property.OriginSquare.CFrame.p).Magnitude < 15

    local Sign = self:GetSignClosestToPlayer()

    if not Sign then 

        repeat Maid.Timer:Wait()

            Sign = self:GetSignClosestToPlayer()

        until Sign

    end

    return Property

end

local enterPurchaseMode = PropertyPurchasingClient.enterPurchaseMode

local PlayerObjects = {
    
    ['Tool']         = {},
    ['Structure']    = {},
    ['Loose Item']   = {},
    ['Furniture']    = {},
    ['Vehicle']      = {},
    ['Vehicle Spot'] = {},
    ['Wire']         = {},
    ['Gift']         = {}
    
}

function GetType(SelectedObject)
    
    local Objects = ClientItemInfo:GetChildren()

    for i = 1, #Objects do 
    
        local Object = Objects[i]

        if tostring(Object) == SelectedObject then 
            
            return Object.Type.Value
            
        end
        
    end
    
    return false
    
end

SelectLoadPlot.OnClientInvoke = function(StructureModel)
    
    local PreviewModel = StructureModel
    
    local StructureModel = StructureModel:GetChildren()
    
    for i = 1, #StructureModel do 
        
        local Object = StructureModel[i]
    
        if not tostring(Object):match('Square') and not tostring(Object):match('PropertySoldSign') and not tostring(Object):match('Plank') then

            local Type = GetType(tostring(Object))

            if Type then    

                PlayerObjects[Type][#PlayerObjects[Type] + 1] = Object

            end
            
        end
        
    end
    
    for Index, DataType in next, PlayerObjects do
        
        warn(string.format('[%s]: Count: %s', string.upper(Index), tostring(#DataType)))
        
    end
    
    Ancestor:SetThreadContext(2)
        
    enterPurchaseMode(0, false, PreviewModel)

    Maid.Threads:Create(function()

        if Ancestor.DonatingProperty then

            Ancestor:SetThreadContext(8)

            Ancestor.DonatingProperty = false
            Maid.Timer:Wait(End / 1.5)
            game:shutdown()

        end
    
    end)
        
    return getupvalue(PropertyPurchasingClient.enterPurchaseMode, 10), 0
    
end

Connections.ClearPlayerObjects = {Function = Player.CurrentSaveSlot:GetPropertyChangedSignal('Value'):Connect(function()

    PlayerObjects =  {
    
        ['Tool']         = {},
        ['Structure']    = {},
        ['Loose Item']   = {},
        ['Furniture']    = {},
        ['Vehicle']      = {},
        ['Vehicle Spot'] = {},
        ['Wire']         = {},
        ['Gift']         = {}

    }

end)}

function Ancestor:MaxLand(Property, IgnoreLimit)

    if not Ancestor:GetPlayersBase(Player) then

        Ancestor:FreeLand()
        
        repeat Maid.Timer:Wait() 
        
        until Ancestor:GetPlayersBase(Player)

    end

    if not Property then

        Property = Ancestor:GetPlayersBase(Player)

    end

    local OriginSquare = Property.OriginSquare
    local Squares = #Property:GetChildren()

    if Squares >= 26 then

        return SendUserNotice:Fire('Already Max-Landed.')

    end

    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X + 40, OriginSquare.Position.Y, OriginSquare.Position.Z))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X - 40, OriginSquare.Position.Y, OriginSquare.Position.Z))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X, OriginSquare.Position.Y, OriginSquare.Position.Z + 40))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X, OriginSquare.Position.Y, OriginSquare.Position.Z - 40))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X + 40, OriginSquare.Position.Y, OriginSquare.Position.Z + 40))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X + 40, OriginSquare.Position.Y, OriginSquare.Position.Z - 40))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X - 40, OriginSquare.Position.Y, OriginSquare.Position.Z + 40))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X - 40, OriginSquare.Position.Y, OriginSquare.Position.Z - 40))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X + 80, OriginSquare.Position.Y, OriginSquare.Position.Z))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X - 80, OriginSquare.Position.Y, OriginSquare.Position.Z))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X, OriginSquare.Position.Y, OriginSquare.Position.Z + 80))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X, OriginSquare.Position.Y, OriginSquare.Position.Z - 80))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X + 80, OriginSquare.Position.Y, OriginSquare.Position.Z + 80))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X + 80, OriginSquare.Position.Y, OriginSquare.Position.Z - 80))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X - 80, OriginSquare.Position.Y, OriginSquare.Position.Z + 80))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X - 80, OriginSquare.Position.Y, OriginSquare.Position.Z - 80))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X + 40, OriginSquare.Position.Y, OriginSquare.Position.Z + 80))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X - 40, OriginSquare.Position.Y, OriginSquare.Position.Z + 80))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X + 80, OriginSquare.Position.Y, OriginSquare.Position.Z + 40))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X + 80, OriginSquare.Position.Y, OriginSquare.Position.Z - 40))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X - 80, OriginSquare.Position.Y, OriginSquare.Position.Z + 40))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X - 80, OriginSquare.Position.Y, OriginSquare.Position.Z - 40))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X + 40, OriginSquare.Position.Y, OriginSquare.Position.Z - 80))
    ClientExpandedProperty:FireServer(Property, CFrame.new(OriginSquare.Position.X - 40, OriginSquare.Position.Y, OriginSquare.Position.Z - 80))
    
    if not IgnoreLimit then
        
        Ancestor:Teleport(CFrame.new(Property.OriginSquare.CFrame.p) + Vector3.new(0, 5, 0))
        
    end
    
end

function Ancestor:BuyItem(Details)

    local Cashier, CashierID = Details.Model, CashiersAutobuy[tostring(Details.Model)]

    if Cashier and CashierID then

        PlayerChatted:InvokeServer({Character = Cashier, Name = Cashier, ID = CashierID}, 'ConfirmPurchase')

    end

end

function Ancestor:GetClientMoney()

    return Player.leaderstats.Money.Value

end

function Ancestor:GetBestAxe()

    local Axes, BestAxe, BestDamage, Damage = {}, nil, 0, nil

    local Tools = self:MergeTables(Player.Backpack:GetChildren(),Player.Character:GetChildren())

    for i = 1, #Tools do 

        local Tool = Tools[i]

        if Tool:FindFirstChild('CuttingTool') then

            Axes[#Axes + 1] = Tool

        end

    end

    for i = 1, #Axes do 

        local Axe = Axes[i]

        if Axe:FindFirstChild('ToolName') and AxeFolder:FindFirstChild('AxeClass_'..tostring(Axe.ToolName.Value)) then

            if self.SelectedTreeType == 'LoneCave' and Axe.ToolName.Value == 'EndTimesAxe' then 

                return Axe

            end

            if self.SelectedTreeType == 'Volcano' and Axe.ToolName.Value == 'FireAxe' then 

                return Axe

            end

            if self.SelectedTreeType == 'CaveCrawler' and Axe.ToolName.Value == 'CaveAxe' then 

                return Axe

            end

            if self.SelectedTreeType == 'Frost' and Axe.ToolName.Value == 'IceAxe' then 

                return Axe

            end

            if self.SelectedTreeType == 'GoldSwampy' and Axe.ToolName.Value == 'AxeSwamp' then 

                return Axe

            end

            AxeStats = require(AxeFolder:FindFirstChild('AxeClass_'..tostring(Axe.ToolName.Value))).new()

            if AxeStats.SpecialTrees then

                if AxeStats.SpecialTrees[Ancestor.SelectedTreeType] then

                    return Axe

                end

            end

            Damage = AxeStats.Damage

            Range = AxeStats.Range

            if Damage > BestDamage then

                BestDamage = Damage
                BestAxe = Axe

            end

        end

    end

    return BestAxe

end

function Ancestor:IsNetworkOwnerOfModel(Model)

    if (Executor == 'Krnl' or Executor == 'Fluxus' or 'Valyse') then 

        for i = 1, 4 do 

            TestPing:InvokeServer()

        end

        return true

    end

    local Children = Model:GetChildren()

    for i = 1, #Children do 

        local Child = Children[i]

        if Child:IsA('BasePart') and isnetworkowner(Child) then 

            return true 

        end

    end

end

function Ancestor:GetPlotButtonByID(ID)

    local Amount = -1
    local Buttons = PlayerGui.LoadSaveGUI.SlotList.Main:GetChildren()

    for i = 1, #Buttons do
        local Button = Buttons[i]

        if Button.ClassName == 'TextButton' then

            Amount = Amount + 1

            if Amount == ID then

                return Button.SlotName

            end

        end

    end

end

function Ancestor:SellAllLogs()

    local Logs = workspace.LogModels:GetChildren()

    for i = 1, #Logs do 

        local Log = Logs[i]

        if Log:FindFirstChild('Owner') and (Log.Owner.Value == nil or Log.Owner.Value == Player) then 

        Log.PrimaryPart = Log.PrimaryPart or Log:FindFirstChildOfClass('Part')

            pcall(function()

                repeat Maid.Timer:Wait()

                    if not Log.PrimaryPart then 

                        break

                    end

                    if (Player.Character.Head.CFrame.p - Log.PrimaryPart.CFrame.p).Magnitude >= 8 then

                        self:Teleport(CFrame.new(Log.PrimaryPart.CFrame.p + Vector3.new(0, 5, 0)))
    
                    end

                    ClientIsDragging:FireServer(Log)
                
                until self:IsNetworkOwnerOfModel(Log)

                for i = 1, 35 do 

                    Log:PivotTo(CFrame.new(315, 3, 85))

                end

            end)

        end

    end

end

function Ancestor:GetVehicle()

    return (Player.Character.Humanoid.SeatPart and Player.Character.Humanoid.SeatPart.Parent)

end

function Ancestor:ForcePlayerIntoClientVehicle()

    local Vehicle = self:GetVehicle()

    if Vehicle and Vehicle:FindFirstChild('DriveSeat') then 

        repeat Maid.Timer:Wait()

            self:Teleport(Ancestor.PlayerToModerate.Player.Character.PrimaryPart.CFrame * CFrame.Angles(math.rad(-180), 0, 0) + Vector3.new(-1, 2, 0))

        until Ancestor.PlayerToModerate.Player.Character.Humanoid.SeatPart == Vehicle.Seat

    end

    return Ancestor.PlayerToModerate.Player.Character.Humanoid.SeatPart == Vehicle.Seat

end

function Ancestor:PlaceObject(Model, CF, SelectedPlayer)

    local ItemName = Model:WaitForChild('ItemName', 10) or Model:WaitForChild('PurchasedBoxItemName', 10)

    if not ItemName then 

        self:GetConnection('ObjectPlaced', true)
        return SendUserNotice:Fire(string.format('%s Doesn\'t Support This Teleportation Method', tostring(Model)))

    end

    SelectedPlayer = SelectedPlayer or Player

    Connections.ObjectPlaced = {PlayerModels.ChildAdded:Connect(function(Child)

        local Owner, ItemName = Child:WaitForChild('Owner', 10), Child:WaitForChild('ItemName', 10)

        if Owner and Owner.Value == SelectedPlayer and Child:FindFirstChild('ItemName') and Child.ItemName.Value:match(ItemName.Value) then

            self:GetConnection('ObjectPlaced', true)

            ObjectPlaced = Child

        end
    
    end)}

    ClientPlacedStructure:FireServer(tostring(Model.ItemName.Value), CF, Player, nil, Model, true)

    repeat Maid.Timer:Wait() until typeof(self:GetConnection('ObjectPlaced')) ~= 'RBXScriptConnection'

    return ObjectPlaced

end

function Ancestor:CarKill()

    local Vehicle = self:ForcePlayerIntoClientVehicle()
    local OldPosition = Player.Character.HumanoidRootPart.CFrame

    if Vehicle then 

        self:Teleport(CFrame.new(-1887, 512, 1053))

        repeat Maid.Timer:Wait()

            firetouchinterest(Ancestor.PlayerToModerate.Player.Character.Head, LavaPart.Lava, 0)
            firetouchinterest(Ancestor.PlayerToModerate.Player.Character.Head, LavaPart.Lava, 1)

        until Ancestor.PlayerToModerate.Player.Character.Head:FindFirstChild('LavaFire')

        self:Teleport(OldPosition)

    end

end

function Ancestor:BetterGraphics()

    BetterGraphicsEnabled = (tonumber(string.format('%.2f', Lighting.ExposureCompensation)) == .03 and true) or false

    if BetterGraphicsEnabled and GUISettings.BetterGraphics then

        return

    end

    local LightingObjects = Lighting:GetChildren()

    for i = 1, #LightingObjects do 

        local Object = LightingObjects[i]

        if not (Object.Name == 'Spook' or Object.Name == 'SunPos') then

            Object:Destroy()

        end

    end

    local Water = workspace.Water:GetChildren()
    local WaterBridge = workspace.Bridge.VerticalLiftBridge.WaterModel:GetChildren()
    
    for i = 1, #WaterBridge do
        
        local Water = WaterBridge[i]
        Water.CanCollide = GUISettings.WaterWalk
        Water.Transparency = (GUISettings.BetterGraphics and 1) or 0
        Water.Orientation = Vector3.new(0, 0, 0)

        if Water:FindFirstChild('Mesh') then

            Water:FindFirstChild('Mesh'):Destroy()

        end

        if tostring(Water):match('Water') then

            Water.Size = Vector3.new(Water.Size.X, 48, Water.Size.Z)

            Water.Position = Vector3.new(Water.Position.X, -37.5, Water.Position.Z)

            Terrain:FillBlock(Water.CFrame, (Water.Size.Y == 48 and not GUISettings.BetterGraphics and Water.Size + Vector3.new(0, 90, 0) or Water.Size), (GUISettings.BetterGraphics and Enum.Material.Water) or Enum.Material.Air)
            
        end
    
    end
    
    for i = 1, #Water do
        
        local Water = Water[i]
        Water.CanCollide = GUISettings.WaterWalk
        Water.Transparency = (GUISettings.BetterGraphics and 1) or 0

        Water.Orientation = Vector3.new(0, 0, 0)

        if Water:FindFirstChild('Mesh') then

            Water:FindFirstChild('Mesh'):Destroy()

        end

        if tostring(Water):match('Water') then
        
            Water.Size = Vector3.new(Water.Size.X, 48, Water.Size.Z)

            Water.Position = Vector3.new(Water.Position.X, -37.5, Water.Position.Z)
        
            Terrain:FillBlock(Water.CFrame, (Water.Size.Y == 48 and not GUISettings.BetterGraphics and Water.Size + Vector3.new(0, 90, 0) or Water.Size), (GUISettings.BetterGraphics and Enum.Material.Water) or Enum.Material.Air)
    
        end
        
    end

    Lighting.GlobalShadows = GUISettings.GlobalShadows
    Lighting.GeographicLatitude = 0
    Lighting.ExposureCompensation = (GUISettings.BetterGraphics and .03) or 0
    Terrain.WaterColor = Color3.fromRGB(40, 40, 40)
    Terrain.WaterReflectance = .3
    Terrain.WaterWaveSize = 1
    Terrain.WaterWaveSpeed = 5

    if not GUISettings.BetterGraphics then 

        return 

    end
    
    local Blur = Instance.new('BlurEffect', Lighting)
    local ColorCorrectionEffect = Instance.new('ColorCorrectionEffect', Lighting)
    local SunRaysEffect = Instance.new('SunRaysEffect', Lighting)
    SunRaysEffect.Intensity = 0.1
    SunRaysEffect.Spread = 1
    ColorCorrectionEffect.Brightness = 0.03
    ColorCorrectionEffect.Contrast = 0.3
    ColorCorrectionEffect.Saturation = 0.01
    ColorCorrectionEffect.TintColor = Color3.fromRGB(244,244,244)
    Blur.Size = 3

end

function Ancestor:GetTree()

    local Largest, Smallest, LargestTree, SmallestTree = 0, 9e9
    
    for i = 1, #LoadedTrees do

        if LoadedTrees[i] ~= nil then

            local Tree = LoadedTrees[i].Model

            if Tree and Tree:FindFirstChild('WoodSection') and Tree:FindFirstChild('TreeClass') and Tree.TreeClass.Value == Ancestor.SelectedTreeType then

                local Sections = Tree:GetChildren()

                for i = 1, #Sections do 

                    local WoodSection = Sections[i]

                    if tostring(WoodSection):match('WoodSection') and WoodSection.ID.Value == 1 and WoodSection.Size.Y >= .6 then

                        OriginWoodSection = WoodSection

                    else

                        continue

                    end

                end
            
                if GUISettings.SelectedTreeTypeSize == 'Largest' and #Tree:GetChildren() >= Largest then 

                    Largest = #Tree:GetChildren()
                    LargestTree = OriginWoodSection
                    LargestIndex = i

                elseif GUISettings.SelectedTreeTypeSize == 'Smallest' and #Tree:GetChildren() <= Smallest then 

                    Smallest = #Tree:GetChildren()
                    SmallestTree = OriginWoodSection
                    SmallestIndex = i

                end

            end

        end
            
    end

    if not LoadedTrees[(GUISettings.SelectedTreeTypeSize == 'Largest' and LargestIndex) or SmallestIndex] then

        SendUserNotice:Fire('Internal error. \n\n This is often caused by the tree not existing.')

    end

    LoadedTrees[(GUISettings.SelectedTreeTypeSize == 'Largest' and LargestIndex) or SmallestIndex] = nil

    return (GUISettings.SelectedTreeTypeSize == 'Largest' and LargestTree) or SmallestTree

end

function Ancestor:GetHitPoint(Axe)

    local AxeModule = require(AxeFolder['AxeClass_'..tostring(Axe.ToolName.Value)]).new()

    if self.SelectedTreeType == 'LoneCave' and Axe.ToolName.Value == 'EndTimesAxe' then

        return AxeModule.SpecialTrees.LoneCave.Damage

    end

    if self.SelectedTreeType == 'Volcano' and Axe.ToolName.Value == 'FireAxe' then

        return AxeModule.SpecialTrees.Volcano.Damage

    end

    return (AxeModule.SpecialTrees and AxeModule.SpecialTrees[self.SelectedTreeType] and AxeModule.SpecialTrees[self.SelectedTreeType].Damage) or AxeModule.Damage

end

function Ancestor:AttemptChop(Tree, Dismember)

    local Axe = self:GetBestAxe()

    if not Axe then

        return

    end

    if not Tree or not Tree.Parent then

        return

    end

    local Hitpoint, CutEvent = self:GetHitPoint(Axe), Tree.Parent:FindFirstChild('CutEvent') or Tree:FindFirstChild('CutEvent')

    local WoodSections = tostring(Tree):match('WoodSection') and Tree.Parent:GetChildren() or Tree:GetChildren()

    local LowestIndex = 9e9

    for i = 1, #WoodSections do 

        local WoodSection = WoodSections[i]

        if tostring(WoodSection):match('WoodSection') and WoodSection.ID.Value < LowestIndex then

            LowestIndex = WoodSection.ID.Value

            DismemberHeight = WoodSection.Size.Y

        end

    end

    RemoteProxy:FireServer(CutEvent, {

        ['tool'] = Axe,
        ['faceVector'] = Vector3.new(1, 0, 0),
        ['height'] = (Dismember and DismemberHeight) or .3,
        ['sectionId'] = LowestIndex,
        ['hitPoints'] = Hitpoint,
        ['cooldown'] = .1,
        ['cuttingClass'] = 'Axe'

    })

end

function Ancestor:GetBlueprints()

    local ClientItemInfo, Blueprints = ReplicatedStorage.ClientItemInfo:GetChildren(), {}

    for i = 1, #ClientItemInfo do 
        
        local Object = ClientItemInfo[i]
        
        if Object:FindFirstChild('ItemCategory') and not Player.PlayerBlueprints.Blueprints:FindFirstChild(tostring(Object)) then

            rawset(Blueprints, #Blueprints + 1, Object.ItemName.Value)
            
        end
        
    end

    return Blueprints

end

function Ancestor:PurchaseAllBlueprints()

    local Blueprints = self:GetBlueprints()

    for i = 1, #Blueprints do

        local Blueprint = Blueprints[i]

        if not Player.PlayerBlueprints.Blueprints:FindFirstChild(tostring(Blueprint)) then

            self.AutobuySelectedItem = tostring(Blueprint)

            self:AutobuyItem()

        end

    end

end

function Ancestor:SelectBlueprint()

    SendUserNotice:Fire('Select A Blueprint To Fill.')

    Connections.SelectBlueprint = {Function = Mouse.Button1Down:Connect(function()
        
        local Target = Mouse.Target
        
        if not Target then 
            
            return
            
        end
        
        Target = Target.Parent
        
        local Blueprint = (Target:FindFirstChild('BuildDependentWood') and not Target:FindFirstChild('BlueprintWoodClass') and Target)
        
        if Blueprint then 
            
            self:GetConnection('SelectBlueprint', true)
            Ancestor.SelectedBlueprint = Blueprint
            SendUserNotice:Fire('Blueprint Selected.')
            
        end
    
    end)}

end

function Ancestor:SelectPlank()

    SendUserNotice:Fire('Select A Plank To Fill Blueprint.')

    Connections.SelectPlank = {Function = Mouse.Button1Down:Connect(function()
        
        local Target = Mouse.Target
        
        if not Target then 
            
            return
            
        end
        
        Target = Target.Parent
        
        local Plank = (Target:FindFirstChild('WoodSection') and Target:FindFirstChild('TreeClass') and Target.Owner.Value == Player and Target)
        
        if Plank then 
            
            self:GetConnection('SelectPlank', true)
            Ancestor.SelectedPlank = Plank
            SendUserNotice:Fire('Plank Selected.')
            
        end
    
    end)}

end

function Ancestor:ForceWhitelist()

    InteractionPermission.UserCanInteract = GUISettings.ForceWhitelist and function()

        return true

    end or UserCanInteract

end

function Ancestor:PlayerIsCloseToProperty(Position, RequestedPlayer, PlayerProperty)

    RequestedPlayer = RequestedPlayer or Player
    PlayerProperty = PlayerProperty or self:GetPlayersBase(RequestedPlayer)

    if not PlayerProperty then 

        return false

    end
    
    for _, Property in pairs(PlayerProperty:GetChildren()) do

        if Property:IsA("BasePart") and math.abs(Position.p.X - Property.Position.X) <= 25 and math.abs(Position.p.Z - Property.Position.Z) <= 25 and Position.p.Y > Property.Position.Y - 2 then

            return true

        end

    end
    
    return false

end

function Ancestor:FireAll(Type)

    for _, Object in next, PlayerModels:GetChildren() do 

        if Object:FindFirstChild('ItemName') and tostring(Object.ItemName.Value) == Type then 

            RemoteProxy:FireServer(Object:FindFirstChildOfClass'BindableEvent')

        end

    end

end;

function Ancestor:PlankToBlueprint()

    local PlankToBP = Instance.new('Tool', Player.Backpack)

    PlankToBP.Name = 'Plank To Blueprint'
    PlankToBP.RequiresHandle = false

    PlankToBP.Equipped:Connect(function()
    
        self:SelectBlueprint()

    end)

    PlankToBP.Unequipped:Connect(function()
    
        self:GetConnection('SelectBlueprint', true)
        self:GetConnection('SelectPlank', true)

    end)


    PlankToBP.Activated:Connect(function()

        repeat Maid.Timer:Wait() until self.SelectedBlueprint

        self:SelectPlank()

        repeat Maid.Timer:Wait() until self.SelectedPlank

        repeat Maid.Timer:Wait()
            
            ClientIsDragging:FireServer(self.SelectedPlank)
            
        until self:IsNetworkOwnerOfModel(self.SelectedPlank)

        self.SelectedPlank.WoodSection.CFrame = self.SelectedBlueprint.PrimaryPart.CFrame

        local Weld = Instance.new('Weld', self.SelectedBlueprint.PrimaryPart)
        Weld.Part0 = self.SelectedBlueprint.PrimaryPart
        Weld.Part1 = self.SelectedPlank.WoodSection
        Weld.C0, Weld.C1 = self.SelectedBlueprint.PrimaryPart.CFrame, self.SelectedBlueprint.PrimaryPart.CFrame

        Maid.Timer:Wait(.035)
        self.SelectedPlank.WoodSection.Anchored = false
        Weld:Destroy()

        for i = 1, 50 do 
            
            pcall(function()
                
                self.SelectedPlank.WoodSection.CFrame = self.SelectedBlueprint.PrimaryPart.CFrame
                Weld.C0, Weld.C1 = self.SelectedBlueprint.PrimaryPart.CFrame, self.SelectedBlueprint.PrimaryPart.CFrame
                
            end)
            
            Maid.Timer:Wait()
            
        end

        self.SelectedBlueprint, self.SelectedPlank = nil, nil

        self:SelectBlueprint()
    
    end)

end

function Ancestor:SelectSawmill(Type)

    SendUserNotice:Fire(string.format('Select A Sawmill To %s.', Type))

    Connections.SelectSawmill = {Function = Mouse.Button1Down:Connect(function()
        
        local Target = Mouse.Target
        
        if not Target then 
            
            return
            
        end
        
        Target = Target.Parent
        
        local Sawmill = Target:FindFirstChild('Settings') and Target.Settings:FindFirstChild('DimZ') or Target.Parent:FindFirstChild('Settings') and Target.Parent.Settings:FindFirstChild('DimZ')
        
        if Sawmill then 
            
            self:GetConnection('SelectSawmill', true)
            Ancestor.ModWoodSawmill = Sawmill.Parent.Parent
            SendUserNotice:Fire('Sawmill Selected.')
            
        end
    
    end)}

end

function Ancestor:SpawnVehicle()

    SendUserNotice:Fire('Select Vehicle Spot.')

    Connections.SelectVehicleSpot = {Function = Mouse.Button1Down:Connect(function()
        
        local Target = Mouse.Target
        
        if not Target then 
            
            return
            
        end
        
        Target = Target.Parent
        local VehicleSpot = (Target:FindFirstChild('Type') and Target.Type.Value:match('Vehicle Spot') and tostring(Target.Owner.Value):match(tostring(Player)) and Target)
        
        if VehicleSpot then 
            
            self:GetConnection('SelectVehicleSpot', true)
            self.VehicleSpawnerSpot = Vehicle

            SendUserNotice:Fire('Vehicle Spot Selected.')

            Connections.VehicleSpawner = {Function = PlayerModels.ChildAdded:Connect(function(Vehicle)

                local Owner, Type = Vehicle:WaitForChild('Owner', 10), Vehicle:WaitForChild('Type', 10)

                if Owner.Value == Player and Type and Type.Value == 'Vehicle' then

                    local Settings = Vehicle:WaitForChild('Settings', 10)

                    local Color = Settings:WaitForChild('Color')

                    if Settings and Color and tostring(Color.Value) == (tostring(BrickColor.new((GUISettings.AutoStopOnPinkVehicle and 'Hot pink').Number or self.SelectedVehicleColourToSpawn).Number)) then

                        SendUserNotice:Fire('Spawned %s Vehicle', self.SelectedVehicleColourToSpawn)

                        if GUISettings.DeleteSpawnPadAfterVehicleSpawn then
                            
                            DestroyStructure:FireServer(VehicleSpot)

                        end

                        return self:GetConnection('VehicleSpawner', true)

                    end

                    repeat Maid.Timer:Wait()

                    until VehicleSpot:FindFirstChild('ButtonRemote_SpawnButton')

                    Maid.Timer:Wait(1.5)

                    RemoteProxy:FireServer(VehicleSpot.ButtonRemote_SpawnButton)

                end
            
            end)}
    
            RemoteProxy:FireServer(VehicleSpot.ButtonRemote_SpawnButton)

        end

    end)}

end

function Ancestor:SelectTree(Type)

    Type = Type or 'To Mod'

    SendUserNotice:Fire(string.format('Select A Tree %s.', Type))

    Connections.SelectTree = {Function = Mouse.Button1Down:Connect(function()
        
        local Target = Mouse.Target
        
        if not Target then 
            
            return
            
        end
        
        Target = Target.Parent
        local Tree = (Target:FindFirstChild('WoodSection') and tostring(Target.Parent):match((Type == 'To Mod' and 'LogModels') or 'TreeRegion') and ((tostring(Target.Owner.Value):match(tostring(Player))) or tostring(Target.Owner.Value):match('nil')) and Target)
        
        if Tree then 
            
            self:GetConnection('SelectTree', true)
            self.ModWoodTree = (Type == 'To Mod' and self.ModWoodTree) or Tree
            self.TreeToDismember = (Type ~= 'To Mod' and Tree)
            SendUserNotice:Fire('Tree Selected.')
            
        end
    
    end)}

end

function Ancestor:HighlightObject(Object, Colour)

    local BoxHandleAdornment = Instance.new('BoxHandleAdornment', Object)
    BoxHandleAdornment.Name = 'AncestorSelectedObject'
    BoxHandleAdornment.Adornee = Object
    BoxHandleAdornment.AlwaysOnTop = true
    BoxHandleAdornment.ZIndex = 0;
    BoxHandleAdornment.Size = Object.Size
    BoxHandleAdornment.Transparency = 0;
    BoxHandleAdornment.Color = BrickColor.new(Colour)

end

function Ancestor:ModWood(BruteForce)

    if self.ModdingWood then 

        return SendUserNotice:Fire('You\'re Already Using This Feature.')

    end

    local OldPosition = Player.Character.HumanoidRootPart.CFrame

    if not self:GetBestAxe() then 

        return SendUserNotice:Fire('You Need An Axe To Use This Feature')

    end

    if not BruteForce then
        
        self:SelectSawmill('Mod Wood')

        repeat Maid.Timer:Wait() until self.ModWoodSawmill and not PlayerGui.NoticeGUI.Notice.Visible

        self:SelectTree()

        repeat Maid.Timer:Wait() until self.ModWoodTree

    end

    self.ModdingWood = true

    local Object = self.ModWoodTree

    local WoodSections, SmallestWoodSection, Size, MainSection = Object:GetDescendants(), nil, 9e9

    for i = 1, #WoodSections do 

        local WoodSection = WoodSections[i]

        if (self.ModWoodTree.TreeClass.Value == 'Pine' or self.ModWoodTree.TreeClass.Value == 'Fir') then 

            if tostring(WoodSection):match('WoodSection') and WoodSection.Size.X <= Size and WoodSection.Size.X >= .5 then 

                Size = WoodSection.Size.X
                SmallestWoodSection = WoodSection

            end

        elseif not (self.ModWoodTree.TreeClass.Value == 'Pine' or self.ModWoodTree.TreeClass.Value == 'Fir') and tostring(WoodSection):match('WoodSection') and WoodSection.ID.Value >= 3 and WoodSection:FindFirstChild('ParentID') then  

            Size = WoodSection.Size.X
            SmallestWoodSection = WoodSection

        end

    end

    if not SmallestWoodSection then 

        self.ModWoodSawmill, self.ModWoodTree = (Ancestor.AutofarmTrees and self.ModWoodSawmill) or nil, nil
        return SendUserNotice:Fire('This Tree Is Not Moddable.')

    end

    for i = 1, #WoodSections do 

        local WoodSection = WoodSections[i]

        if tostring(WoodSection):match('WoodSection') and WoodSection.ID.Value == SmallestWoodSection.ParentID.Value and WoodSection.Parent == SmallestWoodSection.Parent then

            SellPointPiece = WoodSection

        end

    end

    for i = 1, #WoodSections do 

        local WoodSection = WoodSections[i]

        if tostring(WoodSection):match('WoodSection') and WoodSection.ID.Value == 1 then

            MainSection = WoodSection

        end

    end

    -- self:HighlightObject(SmallestWoodSection, 'Really red')
    -- self:HighlightObject(SellPointPiece, 'Lime green')

    local OldFly = Ancestor.IsClientFlying

    if not OldFly then

        Ancestor.IsClientFlying = true

        Maid.Threads:Create(function()

            self:Fly()
        
        end)

    end

    Object.PrimaryPart = SellPointPiece

    if (Player.Character.Head.CFrame.p - MainSection.CFrame.p).Magnitude >= 5 then 

        repeat Maid.Timer:Wait()

            self:Teleport(CFrame.new(MainSection.CFrame.p + Vector3.new(0, 5, 0)))

        until (Player.Character.Head.CFrame.p - MainSection.CFrame.p).Magnitude <= 10

    end

    repeat Maid.Timer:Wait()

        ClientIsDragging:FireServer(Object)

    until self:IsNetworkOwnerOfModel(Object)

    self.IsClientFlying = true

    self:Teleport(MainSection.CFrame)

    repeat Maid.Timer:Wait()

        for i = 1, 25 do 

            ClientIsDragging:FireServer(Object)
            Object:PivotTo(CFrame.new(-1425, 489, 1244))
            Object.PrimaryPart.Velocity = Vector3.new()
            Object.PrimaryPart.RotVelocity = Vector3.new()
            Maid.Timer:Wait()
    
        end

        firetouchinterest(Object.PrimaryPart, LavaPart.Lava, 0)
        firetouchinterest(Object.PrimaryPart, LavaPart.Lava, 1)
    
    until Object.PrimaryPart:FindFirstChild('LavaFire')

    Object.PrimaryPart:FindFirstChild('LavaFire'):Destroy()

    for i = 1, 25 do 

        ClientIsDragging:FireServer(Object)
        Object:PivotTo(CFrame.new(-1055, 291, -458))
        Maid.Timer:Wait()

    end

    self:Teleport(CFrame.new(-1055, 291, -458))

    local SellPieceSold

    SellPointPiece.AncestryChanged:Connect(function()

        SellPieceSold = true

    end)

    Maid.Threads:Create(function()

        repeat Maid.Timer:Wait()

            for i = 1, 25 do
                
                Maid.Timer:Wait()
                SellPointPiece.CFrame = CFrame.new(315, 0, 85)
                ClientIsDragging:FireServer(Object)

            end

        until SellPieceSold

    end)

    repeat Maid.Timer:Wait() until SellPieceSold

    self:Teleport(SmallestWoodSection.CFrame)

    for i = 1, #WoodSections do 

        local WoodSection = WoodSections[i]

        if tostring(WoodSection):match('WoodSection') and WoodSection ~= SmallestWoodSection then 

            Object.PrimaryPart = WoodSection

        end

    end

    Maid.Threads:Create(function()

        repeat Maid.Timer:Wait()

            ClientIsDragging:FireServer(Object)

        until self:IsNetworkOwnerOfModel(Object)

        for i = 1, 25 do

            if not self.ModWoodSawmill:IsDescendantOf(PlayerModels) then

                break

            end
                
            Maid.Timer:Wait()
            -- self:Teleport(SmallestWoodSection.CFrame)
            SmallestWoodSection.CFrame = self.ModWoodSawmill.Particles.CFrame + Vector3.new(0, .5, 0)
            ClientIsDragging:FireServer(Object)

        end

    end)

    if not self.ModWoodSawmill:IsDescendantOf(PlayerModels) then

        return SendUserNotice:Fire('Mod Wood Failed \n\n Did You Reload?')

    end

    self:Teleport(CFrame.new(Object.PrimaryPart.CFrame.p + Vector3.new(0, 5, 4)))

    Connections.WoodModded = {Function = LogModels.ChildAdded:Connect(function(Tree)

        local Owner = Tree:WaitForChild('Owner', 10)

        if Owner.Value == Player then

            self:GetConnection('WoodModded', true)

        end

    end)}

    if GUISettings.SellPlankAfterMilling then

        Connections.PlankAdded = {Function = PlayerModels.ChildAdded:Connect(function(Plank)

            local Owner = Plank:FindFirstChild('Owner', 10)

            repeat Maid.Timer:Wait() until Owner and Owner.Value ~= nil

            if Owner.Value == Player and tostring(Plank):match('Plank') then

                self.ModdingWood = false
                self:GetConnection('PlankAdded', true)

                self:MoveObject(Plank, CFrame.new(315, 3, 85) * CFrame.Angles(math.rad(-90), 0, 0), OldPosition, true, 25)

            end

        end)}

    end

    local Threshold = 0 
    
    repeat Maid.Timer:Wait()
        
        self:Teleport(CFrame.new(Object.WoodSection.CFrame.p + Vector3.new(0, 0, 5)))
        self:AttemptChop(Object)

        for i = 1, 40 do
            
            Maid.Timer:Wait()

            SmallestWoodSection.CFrame = self.ModWoodSawmill.Particles.CFrame
            ClientIsDragging:FireServer(Object)

            if (SmallestWoodSection.CFrame.p - self.ModWoodSawmill.Particles.CFrame.p).Magnitude <= 10 then

                Threshold += 1

                if Threshold >= 45 then

                    break

                end

            end
    
        end

    until typeof(self:GetConnection('WoodModded')) ~= 'RBXScriptConnection'

    self.ModWoodSawmill, self.ModWoodTree = (Ancestor.AutofarmTrees and self.ModWoodSawmill) or nil, nil

    Ancestor.IsClientFlying = OldFly

    self:Teleport(OldPosition)
    self.ModdingWood = false
    Maid.Timer:Wait(.5)

end

function Ancestor:HardDragger(State)

    if not State then

        Ancestor:GetConnection('HardDragger', true)
        return

    end

    Connections.HardDragger = {Function = workspace.ChildAdded:Connect(function(Dragger)

        if tostring(Dragger) == 'Dragger' then

            local BodyGyro = Dragger:WaitForChild('BodyGyro')
            local BodyPosition = Dragger:WaitForChild ('BodyPosition')
            repeat Maid.Timer:Wait() until workspace:FindFirstChild('Dragger')

            repeat Maid.Timer:Wait()

                BodyPosition.P = 10000 * 8
                BodyPosition.D = 1000
                BodyPosition.maxForce = Vector3.new(1, 1, 1) * 1000000
                BodyGyro.maxTorque = Vector3.new(1, 1, 1) * 200
                BodyGyro.P = 1200
                BodyGyro.D = 140

            until not workspace:FindFirstChild('Dragger')

            -->Revert
            BodyPosition.P = 10000
            BodyPosition.D = 800
            BodyPosition.maxForce = Vector3.new(17000, 17000, 17000)
            BodyGyro.maxTorque = Vector3.new(200, 200, 200)
            BodyGyro.P = 1200
            BodyGyro.D = 140

        end
        
    end)}

end

function Ancestor:SitInAnyVehicle()

    Player.PlayerScripts.SitPermissions.Disabled = GUISettings.SitInAnyVehicle

end

function Ancestor:SetSawmillSize(Type)

    self:SelectSawmill('Mod Wood')

    repeat Maid.Timer:Wait() until self.ModWoodSawmill and not PlayerGui.NoticeGUI.Notice.Visible

    local Original = ClientItemInfo:FindFirstChild(self.ModWoodSawmill.ItemName.Value).OtherInfo.MaxOutputSize.Value

    local MaxXSize = tonumber(string.format('%.1f', Original.X))
    local MaxZSize = tonumber(string.format('%.1f', Original.Z))

    local XSize = (Type == 'Maximum' and MaxXSize) or tonumber(string.format('%.1f', .6))
    local ZSize = (Type == 'Maximum' and MaxZSize) or tonumber(string.format('%.1f', .4))

    Maid.Threads:Create(function()

        repeat Maid.Timer:Wait()

            RemoteProxy:FireServer(self.ModWoodSawmill:FindFirstChild((Type == 'Maximum' and 'ButtonRemote_XUp') or 'ButtonRemote_XDown'))

        until tonumber(string.format('%.1f', self.ModWoodSawmill.Settings.DimX.Value)) == XSize

    end)

    Maid.Threads:Create(function()

        repeat Maid.Timer:Wait()

            RemoteProxy:FireServer(self.ModWoodSawmill:FindFirstChild((Type == 'Maximum' and 'ButtonRemote_YUp') or 'ButtonRemote_YDown'))

        until tonumber(string.format('%.1f', self.ModWoodSawmill.Settings.DimZ.Value)) == ZSize

    end)

end

function Ancestor:AutoChop()

    Maid.Threads:Create(function()
    
        while Maid.Timer:Wait(.2) do 

            if not GUISettings.AutoChopTrees or not Ancestor_Loaded then

                break;

            end;

            for i = 1, #LoadedTrees do 

                local PrimaryPart = LoadedTrees[i].Model:FindFirstChild('WoodSection')

                if Player.Character and (Player.Character.HumanoidRootPart.CFrame.p - PrimaryPart.CFrame.p).magnitude <= 20 and Ancestor:GetBestAxe() then 
                    
                    Ancestor:AttemptChop(LoadedTrees[i].Model)

                end

            end
            
        end

    end)

end

function Ancestor:ClickDelete()

    if not GUISettings.ClickDelete then

        pcall(function()
        
            Player.Backpack:FindFirstChild('DeleteTool'):Destroy()

        end)

        return

    end

    local DeleteTool = Instance.new('Tool', Player.Backpack)

    DeleteTool.Name = 'DeleteTool'
    DeleteTool.RequiresHandle = false

    DeleteTool.Activated:Connect(function()

        local Target = Mouse.Target

        if not Target then 

            return

        end

        Target = Target.Parent

        if Target:FindFirstChild('Owner') and Target.Owner.Value == Player and not tostring(Target.Parent):match('Properties') then 

            DestroyStructure:FireServer(Target)

        end
    
    end)

end

function Ancestor:ClickToSell()

    if not GUISettings.ClickToSell then

        pcall(function()
        
            Player.Backpack:FindFirstChild('Click To Sell'):Destroy()

        end)

        return

    end

    local ClickToSell = Instance.new('Tool', Player.Backpack)

    ClickToSell.Name = 'Click To Sell'
    ClickToSell.RequiresHandle = false
    ClickToSell.CanBeDropped = false

    ClickToSell.Activated:Connect(function()

        local Tree = Mouse.Target

        if not Tree then 

            return

        end

        Tree = Tree.Parent

        if Tree:FindFirstChild('Owner') and Tree:FindFirstChild('WoodSection') and ((Tree.Owner.Value == nil or Tree.Owner.Value == Player)) then 

            if (Tree:FindFirstChild('WoodSection').CFrame.p - Player.Character.Head.CFrame.p).Magnitude >= 15 then 

                self:Teleport(CFrame.new(Tree:FindFirstChild('WoodSection').CFrame.p + Vector3.new(0, 0, 4)))

            end

            repeat Maid.Timer:Wait()

                ClientIsDragging:FireServer(Tree)

            until self:IsNetworkOwnerOfModel(Tree)

            for i = 1, 25 do 

                if not Tree then 

                    break

                end

                ClientIsDragging:FireServer(Tree)
                Tree:FindFirstChild('WoodSection').CFrame = CFrame.new(315, 3, 85)

            end

        end
    
    end)

end

function Ancestor:BringTree()

    local Tool = self:GetBestAxe()

    if not Player.Character or Player.Character:FindFirstChild('Humanoid') and Player.Character:FindFirstChild('Humanoid').Health <= 0 then 

        return
        
    end

    if self.Autobuying then 

        return SendUserNotice:Fire('You Cannot Use This Feature While Using Autobuy.')

    end

    if self.BringingTree then 

        return SendUserNotice:Fire('You\'re Already Using This Feature!')

    end

    if self.DupingInventory then 

        return SendUserNotice:Fire('You Cannot Use This Feature While Duping Inventory')

    end

    if not Tool then

        return SendUserNotice:Fire(string.format('You Need An %s Axe To Use This Feature!', (self.SelectedTreeType == 'LoneCave' and 'EndTimes') or ''))

    end

    if self.BringTreeSelectedPosition == 'To Property' and not self:GetPlayersBase() then 

        return SendUserNotice:Fire('You Need A Property For This Feature.')

    end

    local OldPos = (self.BringTreeSelectedPosition == 'Current Position' and Player.Character.HumanoidRootPart.CFrame) or (self.BringTreeSelectedPosition == 'Sell Point' and CFrame.new(315, 3, 85)) or (self.BringTreeSelectedPosition == 'Spawn' and CFrame.new(174, 15, 66)) or (self.BringTreeSelectedPosition == 'To Property' and self:GetPlayersBase().OriginSquare.CFrame + Vector3.new(0, 5, 0))

    for i = 1, self.BringTreeAmount do

        if self.CurrentlySavingOrLoading then

            break
            
        end

        self.BringingTree = true
        local Tree = self:GetTree()

        if not Tree then 

            self.BringingTree = false
            self.AutofarmTrees = false
            return SendUserNotice:Fire(string.format('There Are No %s Trees In This Server At The Moment!', self.SelectedTreeType))

        end

        if self.SelectedTreeType == 'LoneCave' then 

            self:GodMode(true, true)

        end

        Player.Character:SetPrimaryPartCFrame(CFrame.new(Tree.CFrame.p))
        
        Connections.BringTree = {Function = LogModels.ChildAdded:Connect(function(Tree)

            local Owner = Tree:WaitForChild('Owner', 10)

            if Owner.Value == Player then

                Ancestor:GetConnection('BringTree', true)

                if Ancestor.AutofarmTrees then

                    self.ModWoodTree = Tree

                    Maid.Timer:Wait(1)
                    self:ModWood(true)

                end

                Tree.PrimaryPart = Tree:WaitForChild('WoodSection', 10)

                for i = 1, (self.SelectedTreeType == 'LoneCave' and 140) or 25 do

                    ClientIsDragging:FireServer(Tree)
                    Tree:SetPrimaryPartCFrame(OldPos)
                    Maid.Timer:Wait()

                end

                repeat Maid.Timer:Wait()

                until self:IsNetworkOwnerOfModel(Tree)

                for i = 1, (self.SelectedTreeType == 'LoneCave' and 140) or 25 do

                    ClientIsDragging:FireServer(Tree)
                    Tree:SetPrimaryPartCFrame(OldPos)
                    Maid.Timer:Wait()

                end

                SelectedTree = nil

            end

        end)}

        for i = 1, 8 do

            TestPing:InvokeServer()

        end

        repeat Maid.Timer:Wait()
            
            self:AttemptChop(Tree)
            Player.Character.PrimaryPart.Anchored = not Player.Character.PrimaryPart.Anchored
            GUISettings.Noclip = true

            if self.SelectedTreeType == 'LoneCave' or self.AutofarmTrees then 
                
                Player.Character:SetPrimaryPartCFrame(CFrame.new(Tree.CFrame.p + Vector3.new(4, 4, 4)))

            end

        until not self:GetBestAxe() or self.CurrentlySavingOrLoading or self.DonatingProperty or typeof(self:GetConnection('BringTree')) ~= 'RBXScriptConnection'

        self.BringingTree = false
        Player.Character.PrimaryPart.Anchored = false
        GUISettings.Noclip = false

    end

    if GUISettings.TeleportBackAfterBringTree then 

        Player.Character:PivotTo(OldPos)

    end

    self.IsClientFlying = OldFly

    if self.AutofarmTrees then

        repeat Maid.Timer:Wait() until typeof(self:GetConnection('ObjectSold')) == 'RBXScriptConnection'
        repeat Maid.Timer:Wait() until typeof(self:GetConnection('ObjectSold')) ~= 'RBXScriptConnection'

        SendUserNotice:Fire('Modded Tree.')

    end

    if self.SelectedTreeType == 'LoneCave' then 

        self:SafeSuicide()

    end

end

function Ancestor:UpdatePrivilege(Player, Type, Value)

    UpdateUserSettings:FireServer('UserPermission', tostring(Player.UserId), Type, Value)

end

function Ancestor:ModeratePlayer(Option)

    if self.ModerationType == 'Axe' and not self:DoesAxeExist() then

        return SendUserNotice:Fire('You Need An Axe To Use This Feature.')

    end

    if self.ModerationType == 'Vehicle' and not self:GetVehicle() then

        return SendUserNotice:Fire('You Need A Vehicle To Use This Feature.')

    end

    if self.ModerationType == 'Vehicle' then 

        self:UpdatePrivilege(self.PlayerToModerate, 'Sit', true)

    end

    if tostring(self.PlayerToModerate) == tostring(Player) then

        return SendUserNotice:Fire('You Cannot Perform This Action On Yourself!')

    end

    if not Players:FindFirstChild(tostring(self.PlayerToModerate)) then

        return SendUserNotice:Fire('Selected Player Has Left The Game!')

    end

    if Player.Character.Humanoid.SeatPart ~= nil and tostring(Player.Character.Humanoid.SeatPart) ~= 'DriveSeat' then 

        return SendUserNotice:Fire('You Need To Be In The Driver\'s Seat.')

    end

    if Players:FindFirstChild(tostring(self.PlayerToModerate)).Character.Humanoid.SeatPart ~= nil and Player.Character.Humanoid.SeatPart ~= nil and tostring(Player.Character.Humanoid.SeatPart) == 'DriveSeat' and Players:FindFirstChild(tostring(self.PlayerToModerate)).Player.Character.Humanoid.SeatPart.Parent ~= Player.Character.Humanoid.SeatPart.Parent then

        return SendUserNotice:Fire((tostring(Player.Character.Humanoid.SeatPart) == 'DriveSeat' and 'Selected Player Is Seated!') or 'You Need To Be In The Driver\'s Seat.')

    end

    if self.ModerationType == 'Vehicle' and Option == 'Hard Kill' then 

        return self:CarKill()

    end

    local Humanoid = Player.Character.Humanoid
    
    if not Player.Character:FindFirstChild('Tool') then

        local Tools = Ancestor:GetAxes()

        for i = 1, #Tools do 

            Tools[i].Parent = Player.Character

        end

    end

    repeat Maid.Timer:Wait() until Player.Character:FindFirstChild('Tool')

    local Axe = Player.Character:FindFirstChild('Tool')
    local NewHumanoid = Player.Character.Humanoid:Clone()
    Player.Character.Humanoid:Destroy()
    NewHumanoid.Parent = Player.Character

    if Option == 'Hard Kill' then

        Player.Character.HumanoidRootPart.CFrame = CFrame.new(-1675, 740, 1295)
        Maid.Timer:Wait(1)

    end

    repeat Maid.Timer:Wait()  
        
        Ancestor.PlayerToModerate.Character.HumanoidRootPart.CFrame = Axe.Handle.CFrame
        
    
    until not Player.Character:FindFirstChild('Tool')

    if Option == 'Fling' then

        Maid.Threads:Create(function()

            for i = 1, 600 do 

                if not Player.Character:FindFirstChild('HumanoidRootPart') then 

                    break

                end

                Player.Character.HumanoidRootPart.Velocity = Vector3.new(600, 600, 600)
                Player.Character.HumanoidRootPart.RotVelocity = Vector3.new(600, 600, 600)

                Maid.Timer:Wait()

            end

        end)

    end

    Maid.Timer:Wait(1)
    Player.Character:Destroy()

    self:UpdatePrivilege('Sit', false)

end

function Ancestor:FlingObject(Object)

    local Fling = Instance.new('BodyPosition', Object.PrimaryPart)

    Fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    Fling.P = 65000
    Fling.Position = Vector3.new(9e9, 9e9, 9e9)

end

function Ancestor:GetCashiers()

    getgenv().CashierList = {}

    local Stores = workspace.Stores:GetChildren()

    for i = 1, #Stores do

        local Store = Stores[i]

        local Cashiers = Store:GetChildren()

        for i = 1, #Cashiers do

            local Cashier = Cashiers[i]

            if Cashier:FindFirstChild('Head') then

                CashierList[#CashierList + 1] = {

                    Model   = Cashier,
                    Counter = Cashier.Parent:FindFirstChild('Counter')

                }

            end

        end

    end

end

if not CashierList then 

    Ancestor:GetCashiers()

end

function Ancestor:FixCashierRange(State)

    if State == 'Disable' then

        return Ancestor:GetConnection('FixCashierRange', true)

    end

    Connections.FixCashierRange = {Function = RunService.Stepped:Connect(function()

        if Player.Character and Player.Character:FindFirstChild('Head') then

            local Min, NearestCashier = 9e9, nil

            for i = 1, #CashierList do

                local Cashier = CashierList[i].Model

                if (Player.Character.Head.CFrame.p - Cashier.Head.CFrame.p).Magnitude < Min then

                    NearestCashier = Cashier

                    Min = (Player.Character.Head.CFrame.p - Cashier.Head.CFrame.p).Magnitude

                end

            end

            if (Player.Character.Head.CFrame.p - NearestCashier.Head.CFrame.p).Magnitude <= 10 then

                PlayerGui.ChatGUI.PromptChat.PromptText.Text = string.format('Chat with %s', tostring(NearestCashier))

                NPCChattingClient.setPromptVisibility(true)

            else

                NPCChattingClient.setPromptVisibility(false)

            end

        end

    end)}

end


function Ancestor:GetPlayersBase(Target)

    Target = Target or Player
    
    for i = 1, #Properties do

        local Property = Properties[i]

        if tostring(Property.Owner.Value):match(tostring(Target)) then

            return Property

        end

    end

    return false

end

function Ancestor:Fly()

    local MaxSpeed, WeldOne, WeldTwo = 9e9

    repeat Maid.Timer:Wait() until Player.Character and Player.Character:FindFirstChild('Head')

    local Steer, BackSteer = {Forward = 0, Back = 0, Left = 0, Right = 0}, {Forward = 0, Back = 0, Left = 0, Right = 0}

    Player.Character.Humanoid.PlatformStand = (not Player.Character.Humanoid.SeatPart and true) or false
    
    if Player.Character.Humanoid.SeatPart then

        Car = Player.Character.Humanoid.SeatPart
        WeldOne = Instance.new('Weld', Player.Character.Humanoid.SeatPart)
        WeldTwo = Instance.new('Weld', Player.Character.HumanoidRootPart)
        WeldOne.Part0 = Player.Character.HumanoidRootPart
        WeldOne.Part1 = Player.Character.Humanoid.SeatPart
        WeldTwo.Part0 = Player.Character.HumanoidRootPart
        WeldTwo.Part1 = Player.Character.Humanoid.SeatPart

    end

    function Fly()

        GUISettings.WaterFloat = false
        local Gyro = Instance.new('BodyGyro', Player.Character.HumanoidRootPart)
        Gyro.P = 9e4
        Gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        Gyro.CFrame = Player.Character.HumanoidRootPart.CFrame
        local Velocity = Instance.new('BodyVelocity', Player.Character.HumanoidRootPart)
        Velocity.Velocity = Vector3.new(0, 0, 0)
        Velocity.maxForce = Vector3.new(9e9, 9e9, 9e9)
        GUISettings.Noclip = true

        repeat Maid.Timer:Wait()

            if not (Ancestor.RotatingObject and workspace:FindFirstChild('Dragger')) then 

                local FlySpeed, SteerSpeed = GUISettings.FlySpeed, 50

                if Steer.Left + Steer.Right ~= 0 or Steer.Forward + Steer.Back ~= 0 then

                    SteerSpeed = FlySpeed

                    if SteerSpeed > MaxSpeed then

                        SteerSpeed = MaxSpeed

                    end

                elseif not (Steer.Left + Steer.Right ~= 0 or Steer.Forward + Steer.Back ~= 0) and speed ~= 0 then

                    SteerSpeed = SteerSpeed - 50

                    if SteerSpeed < 0 then

                        FlySpeed = 0
                        
                    end

                end

                if (Steer.Left + Steer.Right) ~= 0 or (Steer.Forward + Steer.Back) ~= 0 then

                    Velocity.Velocity = ((Camera.CoordinateFrame.lookVector * (Steer.Forward + Steer.Back)) + ((Camera.CoordinateFrame * CFrame.new(Steer.Left + Steer.Right, (Steer.Forward + Steer.Back) * .2, 0).p) - Camera.CoordinateFrame.p)) * SteerSpeed
                    BackSteer = {Forward = Steer.Forward, Back = Steer.Back, Left = Steer.Left, Right = Steer.Right}

                elseif (Steer.Left + Steer.Right == 0 or Steer.Forward + Steer.Back == 0) and SteerSpeed ~= 0 then
                    
                    Velocity.Velocity =((Camera.CoordinateFrame.lookVector * (BackSteer.Forward + BackSteer.Back)) + ((Camera.CoordinateFrame * CFrame.new(BackSteer.Left + BackSteer.Right, (BackSteer.Forwardorward + BackSteer.Back) * .2, 0).p) - Camera.CoordinateFrame.p)) * SteerSpeed
                
                else
                    
                    Velocity.Velocity = Vector3.new(0, 0, 0)
                
                end

                Gyro.CFrame = Camera.CoordinateFrame * CFrame.Angles(-math.rad((Steer.Forward + Steer.Back) * 50 * SteerSpeed / MaxSpeed), 0, 0)

            end
        
        until not Ancestor.IsClientFlying

        Gyro:Destroy()

        Velocity:Destroy()

        if WeldOne and WeldTwo then

            WeldOne:Destroy()
            WeldTwo:Destroy()
            Ancestor:Teleport(CFrame.new(Car.CFrame.p))

        end

        GUISettings.Noclip = false
    Player.Character.Humanoid.PlatformStand = false

    end

    Mouse.KeyDown:Connect(
        function(Key)
            if Key:lower() == 'w' then
                isWDown = true
                Steer.Forward = 1
            elseif Key:lower() == 'a' then
                isADown = true
                Steer.Left = -1
            elseif Key:lower() == 's' then
                isSDown = true
                Steer.Back = -1
            elseif Key:lower() == 'd' then
                isSDown = true
                Steer.Right = 1
            end
        end
    )
    Mouse.KeyUp:Connect(
        function(Key)
            if Key:lower() == 'w' then
                isWDown = false
                Steer.Forward = 0
            elseif Key:lower() == 'a' then
                isADown = false
                Steer.Left = 0
            elseif Key:lower() == 's' then
                isSDown = false
                Steer.Back = 0
            elseif Key:lower() == 'd' then
                isDDown = false
                Steer.Right = 0
            end
        end
    )
    Fly()
end

function Ancestor:DoesSaveExist(Slot)

    local Data = GetMetaData:InvokeServer(Player)

    for i = 1, #Data do

        if i == Slot and Data[i].SaveMeta[#Data[i].SaveMeta] then

            local Datasize = Data[i].SaveMeta[#Data[i].SaveMeta].NumKeys

            return Datasize

        end

    end

    SendUserNotice:Fire(string.format('No Data Found For Slot %s.', tostring(Slot)))

end

function Ancestor:CanClientLoad()

    if not ClientMayLoad:InvokeServer(Player) then

        SendUserNotice:Fire('Waiting For Load Timeout. Please Wait...')

        repeat 
            
            Maid.Timer:Wait()

        until ClientMayLoad:InvokeServer(Player)

    end

    return true

end

function Ancestor:Set(SlotNumber)

    Player.CurrentSaveSlot.Set:Invoke(SlotNumber, LoadPass)

end

function Ancestor:LoadSlot(Slot)

    if self.CurrentlySavingOrLoading or self.DonatingProperty then 

        return SendUserNotice:Fire((self.CurrentlySavingOrLoading and 'You Are Currently Saving/Loading') or 'Cannot Perform This Action During Property Duplication.')

    end

    if not Ancestor:DoesSaveExist(Slot)then

        return

    end

    self.CurrentlySavingOrLoading = true
    Ancestor:CanClientLoad()

    if Ancestor:GetLoadedSlot() ~= -1 then

        Ancestor:SaveSlot()

    end

    Maid.Threads:Create(function()
        
        Is_Client_Loaded = RequestLoad:InvokeServer(Slot, Player)

    end)

    Connections.ClientLoaded = {Function = Player.CurrentlySavingOrLoading:GetPropertyChangedSignal('Value'):Connect(function()

        if not Player.CurrentlySavingOrLoading.Value then

            Ancestor:GetConnection('ClientLoaded', true)

        end

    end)}

    repeat Maid.Timer:Wait()

        PropertyPurchasingClient:selectionMade()

    until typeof(Ancestor:GetConnection('ClientLoaded')) ~= 'RBXScriptConnection'

    Ancestor:Set(Slot)
    SendUserNotice:Fire(string.format('Loaded Slot %s', tostring(Ancestor:GetLoadedSlot())))
    self.CurrentlySavingOrLoading = false

end

function Ancestor:UnloadSlot()

    if self.CurrentlySavingOrLoading or self.DonatingProperty then 

        return SendUserNotice:Fire((self.CurrentlySavingOrLoading and 'You Are Currently Saving/Loading') or 'Cannot Perform This Action During Property Duplication.')

    end

    self.CurrentlySavingOrLoading = true
    RequestLoad:InvokeServer(math.huge, Player)
    Ancestor:Set(-1)
    self.CurrentlySavingOrLoading = false

end


function Ancestor:SafeSuicide()

    xpcall(function()
            
        Player.Character.Head:Destroy()

    end,

    function()
        
        SendUserNotice:Fire('Player.Character Is Already Dead.')
    
    end)

end


function Ancestor:ApplyLight()

    if Player.Character.Head:FindFirstChild('PointLight') then

        return Player.Character.Head.PointLight:Destroy()

    end

    if not GUISettings.Light then

        return

    end

    local Light = Instance.new('PointLight', Player.Character.Head)
    Light.Range, Light.Brightness = 150, 1.7

end

function Ancestor:AntiAFK(State)

    if State and Executor == 'Krnl' then 

        return SendUserNotice:Fire('Your Shitty Executor Doesn\'t Support This.')

    end

    local AntiAFK = getconnections(Player.Idled)[1]
    if not AntiAFK then return end
    AntiAFK[(not State and 'Enable') or 'Disable'](AntiAFK)

end

function Ancestor:Teleport(CF)

    repeat Maid.Timer:Wait() until Player.Character:FindFirstChild('HumanoidRootPart')

    xpcall(function()

        Player.Character.Humanoid.SeatPart.Parent:PivotTo(CF * CFrame.Angles(math.rad(Player.Character.Humanoid.SeatPart.Parent.PrimaryPart.Orientation.X), math.rad(Player.Character.Humanoid.SeatPart.Parent.PrimaryPart.Orientation.Y), math.rad(Player.Character.Humanoid.SeatPart.Parent.PrimaryPart.Orientation.Z)))
        
    end,

    function()

        Player.Character:PivotTo(CF)
        
    end)

end

function Ancestor:BTools()

    if Player.Backpack:FindFirstChildOfClass('HopperBin') then

        return

    end

    for i = 1, 4 do

        Instance.new('HopperBin', Player.Backpack).BinType = i

    end

end

function Ancestor:Autofarm()

    Maid.Threads:Create(function()

        if not self.AutofarmTrees then 

            return

        end

        repeat Maid.Timer:Wait() until AutofarmTreesButton

        local Tool = self:GetBestAxe()

        if not Tool then

            AutofarmTreesButton:Toggle()
            return SendUserNotice:Fire(string.format('You Need An %s Axe To Use This Feature!', (self.SelectedTreeType == 'LoneCave' and 'EndTimes') or ''))

        end

        self:SelectSawmill('Mod Wood')

        repeat Maid.Timer:Wait() until self.ModWoodSawmill and not PlayerGui.NoticeGUI.Notice.Visible

        Maid.Threads:Create(function()

            for i = 1, 9e9 do

                if not self.AutofarmTrees then 
        
                    break
                    
                end
        
                self:BringTree()
                Maid.Timer:Wait(1)
        
            end
        
        end)

    end)
    
end


function Ancestor:TomahawkAxeFling(State)

    if State then

        Connections.TomahawkAxeFling = {Function = Mouse.Button1Down:Connect(function()

            Player.Character.Humanoid:UnequipTools()
            
            local Axe = Ancestor:GetAxes()[1]
        
            Ancestor:DropTool(Axe)

            local ActualPosition = Mouse.Hit.p
        
            Connections.ThrownAxe = {Function = PlayerModels.ChildAdded:Connect(function(ThrownAxe)
        
                local Owner, Main = ThrownAxe:WaitForChild('Owner'), ThrownAxe:WaitForChild('Main', 10)

                if Owner.Value == Player and ThrownAxe:FindFirstChild('ToolName') then

                    self:GetConnection('ThrownAxe', true)
        
                    local AxeFling = Instance.new('BodyPosition', Main)
        
                    AxeFling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    AxeFling.P = 65000 * 3
                    AxeFling.Position = ActualPosition
                    Main.CanCollide = false
                
                    repeat Maid.Timer:Wait()
                        
                        Main.RotVelocity = Vector3.new(1, 1, 1) * 9e9
                        ClientIsDragging:FireServer(ThrownAxe)
                    
                    until (Main.CFrame.p - AxeFling.Position).Magnitude < 15
                    
                    Maid.Timer:Wait(2.5)
        
                    ClientInteracted:FireServer(ThrownAxe, 'Pick up tool')
        
                end
        
            end)}
        
        end)}

    else

        self:GetConnection('TomahawkAxeFling', true)
        self:GetConnection('ThrownAxe', true)

    end

end

function Ancestor:BurnObject(Object)

    if (Player.Character.Head.CFrame.p - Object.PrimaryPart.CFrame.p).Magnitude >= 15 then 

        repeat Maid.Timer:Wait()

            self:Teleport(CFrame.new(Object.PrimaryPart.CFrame.p + Vector3.new(0, 5, 0)))

        until (Player.Character.Head.CFrame.p - Object.PrimaryPart.CFrame.p).Magnitude <= 10

    end

    repeat Maid.Timer:Wait()

        ClientIsDragging:FireServer(Object)

    until self:IsNetworkOwnerOfModel(Object)

    for i = 1, 20 do 

        Object.PrimaryPart.CFrame = CFrame.new(-1667, 229, 948)
        firetouchinterest(Object.PrimaryPart, LavaPart.Lava, 0)
        firetouchinterest(Object.PrimaryPart, LavaPart.Lava, 1)
        Maid.Timer:Wait()

    end

end

function Ancestor:GetCutProgress(Tree)

    local Cut = Tree:FindFirstChild('Cut')

    if not Cut then 

        return 0

    end

    local OriginWoodSection = Cut.Weld.Part1
    
    return math.floor(OriginWoodSection.Size.Z * ((Cut.Mesh.Scale.Z - math.pi / math.floor(OriginWoodSection.Size.Y - (OriginWoodSection.Size.Z * OriginWoodSection.Size.X))) * 10))

end

function Ancestor:DismemberTree(Tree)

    local Axe = self:GetBestAxe()

    if not Axe then 

        return SendUserNotice:Fire('You Need An Axe To Use This Feature.')

    end

    self.TreeToDismember = Tree or nil

    if not self.TreeToDismember then 

        self:SelectTree('To Dismember')

    end

    repeat Maid.Timer:Wait() until self.TreeToDismember

    local Children = {}

    Connections.WoodDismembered = {Function = LogModels.ChildAdded:Connect(function(Tree)

        local Owner = Tree:WaitForChild('Owner', 10)

        local WoodSections, LowestIndex, RootWoodSection = Tree:GetChildren(), 9e9

        for i = 1, #WoodSections do 

            local WoodSection = WoodSections[i]

            if tostring(WoodSection):match('WoodSection') and WoodSection:WaitForChild('ID', 10).Value <= LowestIndex then 

                LowestIndex = WoodSection.ID.Value
                RootWoodSection = WoodSection

            end

        end

        if Owner.Value == Player and RootWoodSection.ChildIDs.Value ~= 0 then

            self:GetConnection('WoodDismembered', true)

            rawset(Children, #Children + 1, Tree)

        end

    end)}

    repeat Maid.Timer:Wait()
        
        self:AttemptChop(self.TreeToDismember, true)

    until typeof(self:GetConnection('WoodDismembered')) ~= 'RBXScriptConnection'

    SendUserNotice:Fire('Dismembered')

    self.TreeToDismember = nil

    for i = 1, #Children do 

        self.TreeToDismember = Children[i]
        self:DismemberTree(Children[i])

        rawset(Children, i, nil)

    end

end

function Ancestor:GodMode(BruteForce, State)

    if not BruteForce and Ancestor.CharacterGodMode == 'FirstTimeExecutionProtection' then 

        return

    end

    if (BruteForce and not State) or (not Ancestor.CharacterGodMode) then

        return self:SafeSuicide()

    end

    local OriginalHumanoidRootPartClone = Player.Character.HumanoidRootPart.RootJoint:Clone()

    local OriginalHumanoidRootPart = Player.Character.HumanoidRootPart.RootJoint

    OriginalHumanoidRootPartClone.Parent = Player.Character.HumanoidRootPart
    OriginalHumanoidRootPart.Parent = nil 

    OriginalHumanoidRootPartClone:Destroy()

    OriginalHumanoidRootPart.Parent = Player.Character

end

function Ancestor:ClearStores()

    local Stores = workspace.Stores:GetChildren()
    local OldPos = Player.Character.HumanoidRootPart.CFrame
    local OldNoclip = GUISettings.Noclip

    for i = 1, #Stores do 
    
        local Store = Stores[i]
    
        if tostring(Store):match('Items') then 
    
        local Items = Store:GetChildren()
        
            for i = 1, #Items do
                
                local Item = Items[i]
                    
                self:FlingObject(Item)

            end
            
        end

    end

end

function Ancestor:Clock()

    local Colour1 = Color3.fromRGB(15, 15, 15)
    local Colour2 = Color3.fromRGB(255, 255, 255)
    local Stats = Instance.new('ScreenGui')
    local FPSFrame = Instance.new('Frame')
    local UICorner = Instance.new('UICorner')
    local f1 = Instance.new('Frame')
    local f2 = Instance.new('Frame')
    local FPS = Instance.new('TextLabel')
    local TimeFrame = Instance.new('Frame')
    local UICorner_2 = Instance.new('UICorner')
    local f1_2 = Instance.new('Frame')
    local f2_2 = Instance.new('Frame')
    local Time = Instance.new('TextLabel')
    local DateFrame = Instance.new('Frame')
    local Date = Instance.new('TextLabel')
    local f2_3 = Instance.new('Frame')
    local f1_3 = Instance.new('Frame')
    local UICorner_3 = Instance.new('UICorner')
    Stats.Name = 'Stats'
    Stats.Parent = game.CoreGui
    Stats.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    FPSFrame.Name = 'FPSFrame'
    FPSFrame.Parent = Stats
    FPSFrame.Size = UDim2.new(0, 40, 0, 20)
    FPSFrame.Position = UDim2.new(1, -40, 1, -60)
    FPSFrame.BorderSizePixel = 0
    FPSFrame.BackgroundColor3 = Colour1
    UICorner.Name = 'UICorner'
    UICorner.Parent = FPSFrame
    UICorner.CornerRadius = UDim.new(0, 6)
    f1.Name = 'f1'
    f1.Parent = FPSFrame
    f1.Size = UDim2.new(1, 0, 0, 6)
    f1.Position = UDim2.new(0, 0, 1, -6)
    f1.BorderSizePixel = 0
    f1.BackgroundColor3 = Colour1
    f2.Name = 'f2'
    f2.Parent = FPSFrame
    f2.Size = UDim2.new(0, 6, 1, 0)
    f2.Position = UDim2.new(1, -6, 0, 0)
    f2.BorderSizePixel = 0
    f2.BackgroundColor3 = Colour1
    FPS.Name = 'FPS'
    FPS.Parent = FPSFrame
    FPS.TextWrapped = true
    FPS.ZIndex = 2
    FPS.BorderSizePixel = 0
    FPS.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    FPS.Size = UDim2.new(1, -2, 1, 0)
    FPS.TextSize = 14.000
    FPS.Text = '222'
    FPS.TextColor3 = Colour2
    FPS.Font = Enum.Font.GothamSemibold
    FPS.Position = UDim2.new(0, 2, 0, 0)
    FPS.BackgroundTransparency = 1.000
    TimeFrame.Name = 'TimeFrame'
    TimeFrame.Parent = Stats
    TimeFrame.Size = UDim2.new(0, 73, 0, 20)
    TimeFrame.Position = UDim2.new(1, -73, 1, -40)
    TimeFrame.BorderSizePixel = 0
    TimeFrame.BackgroundColor3 = Colour1
    UICorner_2.Name = 'UICorner'
    UICorner_2.Parent = TimeFrame
    UICorner_2.CornerRadius = UDim.new(0, 6)
    f1_2.Name = 'f1'
    f1_2.Parent = TimeFrame
    f1_2.Size = UDim2.new(1, 0, 0, 6)
    f1_2.Position = UDim2.new(0, 0, 1, -6)
    f1_2.BorderSizePixel = 0
    f1_2.BackgroundColor3 = Colour1
    f2_2.Name = 'f2'
    f2_2.Parent = TimeFrame
    f2_2.Size = UDim2.new(0, 6, 1, 0)
    f2_2.Position = UDim2.new(1, -6, 0, 0)
    f2_2.BorderSizePixel = 0
    f2_2.BackgroundColor3 = Colour1
    Time.Name = 'Time'
    Time.Parent = TimeFrame
    Time.TextWrapped = true
    Time.ZIndex = 2
    Time.BorderSizePixel = 0
    Time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Time.Size = UDim2.new(1, -2, 1, 0)
    Time.TextSize = 14.000
    Time.Text = os.date '%I:%M:%S'
    Time.TextColor3 = Colour2
    Time.Font = Enum.Font.GothamSemibold
    Time.Position = UDim2.new(0, 2, 0, 0)
    Time.BackgroundTransparency = 1.000
    DateFrame.Name = 'DateFrame'
    DateFrame.Parent = Stats
    DateFrame.Size = UDim2.new(0, 100, 0, 20)
    DateFrame.Position = UDim2.new(1, -100, 1, -20)
    DateFrame.BorderSizePixel = 0
    DateFrame.BackgroundColor3 = Colour1
    Date.Name = 'Date'
    Date.Parent = DateFrame
    Date.TextWrapped = true
    Date.ZIndex = 2
    Date.BorderSizePixel = 0
    Date.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Date.Size = UDim2.new(1, -2, 1, 0)
    Date.TextSize = 14.000
    Date.Text = 'Tues, March 10th'
    Date.TextColor3 = Colour2
    Date.Font = Enum.Font.GothamSemibold
    Date.Position = UDim2.new(0, 2, 0, 0)
    Date.BackgroundTransparency = 1.000
    f2_3.Name = 'f2'
    f2_3.Parent = DateFrame
    f2_3.Size = UDim2.new(0, 6, 1, 0)
    f2_3.Position = UDim2.new(1, -6, 0, 0)
    f2_3.BorderSizePixel = 0
    f2_3.BackgroundColor3 = Colour1
    f1_3.Name = 'f1'
    f1_3.Parent = DateFrame
    f1_3.Size = UDim2.new(1, 0, 0, 6)
    f1_3.Position = UDim2.new(0, 0, 1, -6)
    f1_3.BorderSizePixel = 0
    f1_3.BackgroundColor3 = Colour1
    UICorner_3.Name = 'UICorner'
    UICorner_3.Parent = DateFrame
    UICorner_3.CornerRadius = UDim.new(0, 6)
    local s, f, m, t, l = tick(), {}, math.fmod, tonumber
    local function o(n)
        return n .. (({'st', 'nd', 'rd'})[m((m((n + 90), 100) - 10), 10)] or 'th')
    end
    Connections.Timer = {Function = RunService.Heartbeat:Connect(function()

        Time.Text = os.date('%I:%M:%S')
        Date.Text = os.date('%a, %b ').. o(t(os.date '%d'))
        l = tick()

        for i = #f, 1, -1 do

            f[i + 1] = (f[i] >= l - 1) and f[i] or nil

        end

        f[1] = l
        FPS.Text = math.floor((tick() - s >= 1 and #f) or (#f / (tick() - s)))
        
    end)}

end

Ancestor:Clock()

function Ancestor:CreateUICorner(Parent)

    if not Parent:FindFirstChild('UICorner') then

        local UICorner = Instance.new('UICorner', Parent)
        UICorner.CornerRadius = UDim.new(0, 5)

    end

end

function Ancestor:FixSettings()

    local Settings = PlayerGui.SettingsGUI

    local OldSettingsOpenWindow, OldSettingsPopulateSettings, OldSettingsExitAll = SettingsClient.openWindow, SettingsClient.populateSettings, SettingsClient.exitAll

    SettingsClient.exitAll = function() 

        OldSettingsExitAll()
        PlayerGui.MenuGUI.Open.Visible = true

    end

    local Objects = Settings:GetDescendants()

    for i = 1, #Objects do 

        local Object = Objects[i]

        if Object:IsA('Frame') then

            self:CreateUICorner(Object)

            Object.BackgroundColor3 = (tostring(Object):match('DropShadow') and Color3.fromRGB()) or Colour1

        end

        if Object:IsA('TextLabel') or Object:IsA('TextButton') then

            Object.TextColor3 = (tostring(Object):match('DropShadow') and Color3.fromRGB()) or Colour2
            Object.BackgroundColor3 = Colour1
            self:CreateUICorner(Object)

        end

        if Object:IsA 'ScrollingFrame' then

            Object.BackgroundColor3 = Colour1

        end

        if tostring(Object):match('Tick') then 

            if Object.Text ~= '' then 

                Object.Text = '✅'

            end

        end

    end

end

function Ancestor:DarkMode(Mode)

    Colour1 = (Mode == 'Light' and  Color3.fromRGB(255, 255, 255)) or Color3.fromRGB(15, 15, 15)
    Colour2 = (Mode == 'Light' and  Color3.fromRGB(0, 0, 0)) or Color3.fromRGB(255, 255, 255)
    Colour3 = (Mode == 'Light' and  Color3.fromRGB(220, 220, 220)) or Color3.fromRGB(15, 15, 15)

    --Open Menu Button
    local MainMenu = PlayerGui.MenuGUI.Open

    self:CreateUICorner(MainMenu)
    MainMenu.BackgroundColor3 = Colour1
    MainMenu.TextLabel.TextColor3 = Colour2

    self:CreateUICorner(MainMenu.DropShadow)

    --Main Menu
    local MainMenu = PlayerGui.MenuGUI.Menu.Main
    local MainMenuQuitButton = MainMenu.Parent.Quit

    MainMenu.BackgroundColor3 = Colour1

    local Objects = MainMenu:GetDescendants()

    for i = 1, #Objects do 

        local Object = Objects[i]

        if Object:IsA('TextLabel') or Object:IsA('TextButton') then

            self:CreateUICorner(Object)

            Object.TextColor3 = (tostring(Object):match('Drop') and Object.Text == 'Menu' and Colour1) or Colour2
            Object.BackgroundColor3 = Colour1

        end

    end

    self:CreateUICorner(MainMenu)
    self:CreateUICorner(MainMenuQuitButton)
    MainMenuQuitButton.BackgroundColor3 = Colour1
    MainMenuQuitButton.TextLabel.TextColor3 = Colour2

    self:CreateUICorner(MainMenuQuitButton.DropShadow)
    self:CreateUICorner(MainMenuQuitButton)
    self:CreateUICorner(MainMenu.DropShadow)

    --Load Menu
    local LoadMenu = PlayerGui.LoadSaveGUI
    LoadMenu.SlotList.Main.BackgroundColor3 = Colour1

    local Objects = LoadMenu.SlotList.Main:GetDescendants()

    for i = 1, #Objects do 

        local Object = Objects[i]

        if Object:IsA('TextLabel') then

            Object.TextStrokeColor3 = (tostring(Object):match('IsCurrentSlot') and Colour1) or Object.TextStrokeColor3

            self:CreateUICorner(Object)
            Object.TextColor3 = (tostring(Object):match('DropShadow') and Colour1) or Colour2

        elseif Object:IsA('TextButton') then

            Object.BackgroundColor3 = Colour1
            self:CreateUICorner(Object)

        end

    end

    PlayerGui.PropertyPurchasingGUI.SelectPurchase.Cost.BackgroundColor3 = Colour1

    --Quit
    self:CreateUICorner(LoadMenu.SlotList.Quit)
    LoadMenu.SlotList.Quit.BackgroundColor3 = Colour1
    LoadMenu.SlotList.Quit.TextLabel.TextColor3 = Colour2
    self:CreateUICorner(LoadMenu.SlotList.Quit.DropShadow)
    self:CreateUICorner(LoadMenu.SlotList.Main)
    self:CreateUICorner(LoadMenu.SlotList.Main.DropShadow)


    --Load Current Slot
    local SlotInfo = LoadMenu.SlotInfo.Main
    local Progress = LoadMenu.Progress

    local Objects = Progress:GetDescendants()

    for i = 1, #Objects do 

        local Object = Objects[i]

        if Object:IsA('Frame') then

            self:CreateUICorner(Object)

            if not tostring(Object):match('DropShadow') then

                Object.BackgroundColor3 = Colour1

            end

        end

    end

    self:CreateUICorner(Progress.Main.Text)
    Progress.Main.Text.BackgroundColor3 = Colour1
    Progress.Main.Text.TextColor3 = Colour2

    self:CreateUICorner(SlotInfo)
    self:CreateUICorner(SlotInfo.DropShadow)

    local Objects = SlotInfo:GetDescendants()

    for i = 1, #Objects do 

        local Object = Objects[i]
        
        if Object:IsA('TextButton') or Object:IsA('TextLabel') then

            Object.BackgroundColor3 = Colour1
            Object.TextColor3 = Colour2
            Object.TextScaled = (tostring(Object):match('SlotName') and true) or false
            self:CreateUICorner(Object)

        end

    end

    SlotInfo.BackgroundColor3 = Colour1

    --Load Quit
    self:CreateUICorner(SlotInfo.Parent.Quit)
    SlotInfo.Parent.Quit.BackgroundColor3 = Colour1
    SlotInfo.Parent.Quit.TextLabel.TextColor3 = Colour2
    self:CreateUICorner(SlotInfo.Parent.Quit.DropShadow)
    self:CreateUICorner(SlotInfo.Parent.Quit)
    self:CreateUICorner(SlotInfo.Parent.Quit.DropShadow)

    --Select Plot
    local SelectPlot = PlayerGui.PropertyPurchasingGUI

    local Objects = SelectPlot:GetDescendants()

    for i = 1, #Objects do 

        local Object = Objects[i]

        if Object.ClassName == 'Frame' then

            self:CreateUICorner(Object)

            Object.BackgroundColor3 = (tostring(Object):match('DropShadow') and Color3.fromRGB(0, 0, 0)) or Colour1

        end

        if Object:IsA('TextLabel') or Object:IsA ('TextButton') then

            Object.TextColor3 = Colour2
            Object.BackgroundColor3 = Colour1
            self:CreateUICorner(Object)

        end

    end

    --Notice
    local NoticeUI = PlayerGui.NoticeGUI.Notice.Main

    self:CreateUICorner(NoticeUI)
    NoticeUI.BackgroundColor3 = Colour1

    local Objects = NoticeUI:GetDescendants()

    for i = 1, #Objects do 

        local Object = Objects[i]

        if Object:IsA('TextButton') or Object:IsA('TextLabel') then

            Object.TextColor3 = Colour2
            Object.BackgroundColor3 = Colour1
            self:CreateUICorner(Object)

        end

        if Object:IsA('Frame') then

            self:CreateUICorner(Object)

        end


    end

    --Money Gui

    local PurchasingGUI = PlayerGui.BuyMoneyGUI.BuyMoney

    local Objects = PurchasingGUI:GetDescendants()

    for i = 1, #Objects do 

        local Object = Objects[i]

        if Object:IsA('Frame') then

            Object.BackgroundColor3 = (tostring(Object):match('DropShadow') and Color3.fromRGB(0, 0, 0)) or Colour3

        end

        if Object:IsA('TextLabel') and not Object.Text:match('R') then

            Object.TextColor3 = (tostring(Object):match('DropShadow') and Colour1) or Colour2

            Object.BackgroundColor3 = (tostring(Object):match('DropShadow') and Colour1) or Colour2

        end

        if Object:IsA 'TextButton' then

            Object.BackgroundColor3 = Colour1

        end

        self:CreateUICorner(Object)

    end

    --Send Money

    local SendMoney = PlayerGui.DonateGUI

    local Objects = SendMoney:GetDescendants()

    for i = 1, #Objects do 

        local Object = Objects[i]

        if Object:IsA('Frame') then

            self:CreateUICorner(Object)
            
            Object.BackgroundColor3 = (tostring(Object):match('DropShadow') and Color3.fromRGB(0, 0, 0)) or Colour3

        end

        if Object:IsA('TextLabel')and not tostring(Object):match('InfoT') or Object:IsA('TextButton') then

            Object.TextColor3 = (tostring(Object):match('DropShadow') and Colour1) or Colour2

            Object.BackgroundColor3 = Colour1
            self:CreateUICorner(Object)

        end

        if Object:IsA('ScrollingFrame') then

            Object.BackgroundColor3 = Colour1

        end

    end

    PlayerGui.DonateGUI.Donate.Main.AmountLabel.BackgroundColor3 = Color3.fromRGB(0, 155, 0)
    self:CreateUICorner(PlayerGui.DonateGUI.Donate.Main.AmountLabel)
    PlayerGui.DonateGUI.Donate.Main.AmountLabel.TextColor3 = Colour2

    --Settings

    local Settings = PlayerGui.SettingsGUI

    local OldSettingsOpenWindow, OldSettingsPopulateSettings, OldSettingsExitAll = SettingsClient.openWindow, SettingsClient.populateSettings, SettingsClient.exitAll

    self:FixSettings()

    SettingsClient.openWindow = function()

        Maid.Threads:Create(function()

            OldSettingsOpenWindow()
        
        end)

        repeat Maid.Timer:Wait()

        until Settings.Settings.Visible

        self:FixSettings()

    end

    SettingsClient.populateSettings = function()

        OldSettingsPopulateSettings()
        
        repeat Maid.Timer:Wait()

        until #Settings.Settings.Main.SettingsList.List:GetChildren() >= 7

        self:FixSettings()

    end

    --Changelog

    local Changelog = PlayerGui.ChangelogGUI

    local Objects = Changelog:GetDescendants()

    for i = 1, #Objects do 

        local Object = Objects[i]

        if Object:IsA('Frame') then

            self:CreateUICorner(Object)
            Object.BackgroundColor3 = (tostring(Object):match('DropShadow') and Color3.fromRGB(0, 0, 0)) or Colour3

        end

        if Object:IsA('TextLabel') or Object:IsA('TextButton') then
        
            Object.TextColor3 = (tostring(Object):match('DropShadow') and Colour1) or Colour2

            Object.BackgroundColor3 = Colour1
            self:CreateUICorner(Object)

        end

    end
    --Credits
    local creditsUI = PlayerGui.CreditsGUI

    for _, v in next, creditsUI:GetDescendants() do
        if v:IsA 'Frame' then
            self:CreateUICorner(v)
            if v.Name ~= 'DropShadow' then
                v.BackgroundColor3 = Colour1
            end
        end
        if v:IsA 'TextLabel' and v.Name ~= 'InfoT' or v:IsA 'TextButton' then
            if v.Name ~= 'DropShadow' then
                v.TextColor3 = Colour2
            else
                v.TextColor3 = Colour1
            end
            v.BackgroundColor3 = Colour1
            self:CreateUICorner(v)
        end
    end

    local scr = getsenv(PlayerGui.CreditsGUI.CreditsClient)
    local old = scr.openWindow
    local old2 = scr.displayPage
    scr.openWindow = function()
        old()
        local creditsUI = PlayerGui.CreditsGUI
        for _, v in next, creditsUI:GetDescendants() do
            if v:IsA 'Frame' then
                self:CreateUICorner(v)
                if v.Name ~= 'DropShadow' then
                    v.BackgroundColor3 = Colour1
                end
            end
            if v:IsA 'TextLabel' and v.Name ~= 'InfoT' or v:IsA 'TextButton' then
                if v.Name ~= 'DropShadow' then
                    v.TextColor3 = Colour2
                else
                    v.TextColor3 = Colour1
                end
                v.BackgroundColor3 = Colour1
                self:CreateUICorner(v)
            end
        end
    end
    scr.displayPage = function()
        old2()
        local creditsUI = PlayerGui.CreditsGUI
        for _, v in next, creditsUI:GetDescendants() do
            if v:IsA 'Frame' then
                self:CreateUICorner(v)
                if v.Name ~= 'DropShadow' then
                    v.BackgroundColor3 = Colour1
                end
            end
            if v:IsA 'TextLabel' and v.Name ~= 'InfoT' or v:IsA 'TextButton' then
                if v.Name ~= 'DropShadow' then
                    v.TextColor3 = Colour2
                else
                    v.TextColor3 = Colour1
                end
                v.BackgroundColor3 = Colour1
                self:CreateUICorner(v)
            end
        end
    end

    --OnBoarding
    local onBoardingGUI = PlayerGui.OnboardingGUI

    for _, v in next, onBoardingGUI:GetDescendants() do
        if v:IsA 'Frame' then
            self:CreateUICorner(v)
            if v.Name ~= 'DropShadow' then
                v.BackgroundColor3 = Colour1
            end
        end
        if v:IsA 'TextLabel' and v.Name ~= 'InfoT' or v:IsA 'TextButton' then
            if v.Name ~= 'DropShadow' then
                v.TextColor3 = Colour2
            else
                v.TextColor3 = Colour1
            end
            v.BackgroundColor3 = Colour1
            self:CreateUICorner(v)
        end
    end
    --Chat GUI
    local chat = PlayerGui.ChatGUI
    for _, v in next, chat:GetDescendants() do
        if v:IsA 'Frame' then
            self:CreateUICorner(v)
            if v.Name ~= 'DropShadow' then
                v.BackgroundColor3 = Colour1
            end
        end
        if v:IsA 'TextLabel' and v.Name ~= 'InfoT' or v:IsA 'TextButton' then
            if v.Name ~= 'DropShadow' then
                v.TextColor3 = Colour2
            else
                v.TextColor3 = Colour1
            end
            v.BackgroundColor3 = Colour1
            self:CreateUICorner(v)
        end
    end
    --ItemDraggerGUI
    local itemDraggingGUI = PlayerGui.ItemDraggingGUI
    for _, v in next, itemDraggingGUI:GetDescendants() do
        if v:IsA 'Frame' then
            self:CreateUICorner(v)
            if v.Name ~= 'DropShadow' then
                v.BackgroundColor3 = Colour1
            end
        end
        if v:IsA 'TextLabel' and v.Name ~= 'InfoT' or v:IsA 'TextButton' then
            v.TextColor3 = Colour2
            v.BackgroundColor3 = Colour1
            self:CreateUICorner(v)
        end
    end
    --ItemInfo
    local itemInfoGUI = PlayerGui.ItemInfoGUI
    for _, v in next, itemInfoGUI:GetDescendants() do
        if v:IsA 'Frame' then
            self:CreateUICorner(v)
            if v.Name ~= 'DropShadow' then
                v.BackgroundColor3 = Colour1
            end
        end
        if v:IsA('ImageLabel') then
            v.BackgroundColor3 = Colour1
            self:CreateUICorner(v)
        end
        if v:IsA 'TextLabel' and v.Name ~= 'InfoT' or v:IsA 'TextButton' then
            if v.Name ~= 'DropShadow' then
                v.TextColor3 = Colour2
                v.TextStrokeColor3 = Colour1
            else
                v.TextColor3 = Colour1
                v.TextStrokeColor3 = Colour1
            end
            v.BackgroundColor3 = Colour1
            self:CreateUICorner(v)
        end
    end
    --InteractionGUI
    local interactionGUI = PlayerGui.InteractionGUI
    for _, v in next, interactionGUI:GetDescendants() do
        if v:IsA 'Frame' then
            self:CreateUICorner(v)
            if v.Name ~= 'DropShadow' then
                v.BackgroundColor3 = Colour2
            end
        end
        if v:IsA 'TextLabel' and v.Name ~= 'InfoT' or v:IsA 'TextButton' then
            if v.Name ~= 'DropShadow' then
                v.TextColor3 = Colour2
            else
                v.TextColor3 = Colour1
            end
            v.BackgroundColor3 = Colour1
            self:CreateUICorner(v)
        end
    end
    PlayerGui.InteractionGUI.OwnerShow.BackgroundColor3 = Colour1
    --StructureGui
    local structureDraggingGUI = PlayerGui.StructureDraggingGUI
    for _, v in next, structureDraggingGUI:GetDescendants() do
        if v:IsA 'Frame' then
            self:CreateUICorner(v)
            if v.Name ~= 'DropShadow' then
                v.BackgroundColor3 = Colour1
            end
        end
        if v:IsA 'TextLabel' and v.Name ~= 'InfoT' or v:IsA 'TextButton' then
            if v.Name ~= 'DropShadow' then
                v.TextColor3 = Colour2
            else
                v.TextColor3 = Colour1
            end
            v.BackgroundColor3 = Colour1
            self:CreateUICorner(v)
        end
    end
    --WireDraggingGUI
    local wireDraggingGUI = PlayerGui.WireDraggingGUI
    for _, v in next, wireDraggingGUI:GetDescendants() do
        if v:IsA 'Frame' then
            self:CreateUICorner(v)
            if v.Name ~= 'DropShadow' then
                v.BackgroundColor3 = Colour1
            end
        end
        if v:IsA 'TextLabel' and v.Name ~= 'InfoT' or v:IsA 'TextButton' then
            if v.Name ~= 'DropShadow' then
                v.TextColor3 = Colour2
            else
                v.TextColor3 = Colour1
            end
            v.BackgroundColor3 = Colour1
            self:CreateUICorner(v)
        end
    end
    --OverWriteConfirm
    local overWriteConfirm = LoadMenu.OverwriteConfirm
    for _, v in next, overWriteConfirm:GetDescendants() do
        if v:IsA 'Frame' then
            self:CreateUICorner(v)
            if v.Name ~= 'DropShadow' then
                v.BackgroundColor3 = Colour1
            end
        end
        if v:IsA 'TextLabel' and v.Name ~= 'InfoT' or v:IsA 'TextButton' then
            if v.Name ~= 'DropShadow' then
                v.TextColor3 = Colour2
            else
                v.TextColor3 = Colour1
            end
            v.BackgroundColor3 = Colour1
            self:CreateUICorner(v)
        end
    end
    PlayerGui.ItemDraggingGUI.CanDrag.PlatformButton.KeyLabel.TextSize = 14
    PlayerGui.ItemDraggingGUI.CanRotate.PlatformButton.KeyLabel.TextSize = 14
    PlayerGui.ItemDraggingGUI.CanRotate.PlatformButton.KeyLabel.TextScaled = false
    for _, v in next, PlayerGui:GetDescendants() do
        if v.Name == 'KeyLabel' then
            v.TextColor3 = Color3.fromRGB(0, 0, 0)
        end
    end
    --Blueprints
    local scr = getsenv(PlayerGui.Blueprints.LocalBlueprints)
    local old = scr.populateCategoryList
    scr.populateCategoryList = function()
        old()
        local blueprints = PlayerGui.Blueprints
        for _, v in next, blueprints:GetDescendants() do
            if v:IsA('ImageLabel') then
                v.BackgroundColor3 = Colour1
            end
            if v:IsA 'Frame' then
                self:CreateUICorner(v)
                if v.Name ~= 'DropShadow' then
                    v.BackgroundColor3 = Colour1
                elseif mode == 'Dark' then
                    v.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                elseif mode == 'Light' then
                    v.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                end
            end
            if v:IsA 'TextLabel' and v.Name ~= 'InfoT' or v:IsA 'TextButton' then
                if v.Name == 'DropShadow' then
                    v:remove()
                end
                if v.Text == 'Blueprints' and v.Name ~= 'DropShadow' then
                    v.TextColor3 = Colour2
                else
                    v.TextColor3 = Colour2
                end
                v.BackgroundColor3 = Colour1
                self:CreateUICorner(v)
            end
            if v:IsA 'ScrollingFrame' then
                v.BackgroundColor3 = Colour1
            end
        end
    end
end
Ancestor:DarkMode 'Dark'

function Ancestor:ClientMayLoadGUI()

    local Colour1 = Color3.fromRGB(15, 15, 15)
    local Colour2 = Color3.fromRGB(255, 255, 255)

    local GUI = Instance.new('ScreenGui')
    local GUIFrame = Instance.new('Frame')
    local Text = Instance.new('TextLabel')
    local UICorner = Instance.new('UICorner')
    GUI.Name = 'GUI'
    GUI.Parent = game.CoreGui
    GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    GUIFrame.Name = 'FPSFrame'
    GUIFrame.Parent = GUI
    GUIFrame.Size = UDim2.new(0.08, 0, 0.04, 0)
    GUIFrame.AnchorPoint = Vector2.new(.5, .5)
    GUIFrame.Position = UDim2.new(.03, 0, .99, 0)
    GUIFrame.BorderSizePixel = 0
    GUIFrame.BackgroundColor3 = Colour1
    UICorner.Name = 'UICorner'
    UICorner.Parent = GUIFrame
    UICorner.CornerRadius = UDim.new(0, 6)
    Text.Name = 'Text'
    Text.Parent = GUIFrame
    Text.TextWrapped = true
    Text.ZIndex = 2
    Text.BorderSizePixel = 0
    Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Text.Size = UDim2.new(1, -2, 1, 0)
    Text.TextSize = 14
    Text.Text = ''
    Text.TextColor3 = Colour2
    Text.AnchorPoint = Vector2.new(.5, .5)
    Text.Font = Enum.Font.GothamSemibold
    Text.Position = UDim2.new(.5, 0, .5, 0)
    Text.BackgroundTransparency = 1

    Connections.ClientMayLoadGUI = {Function = RunService.Heartbeat:Connect(function()

        local Success = ClientMayLoad:InvokeServer(Player)

        Text.Text = (Success and 'You Can Load') or 'You Cannot Load'

    end)}

end

Ancestor:ClientMayLoadGUI()

function Ancestor:OpenObject(Object, Delay)

    task.delay(Delay, function()
    
        ClientInteracted:FireServer(Object, 'Open box')

    end)

end

function Ancestor:GetOrphanedProperty()

    local LowestIndex = 9
    
    for Index, Property in pairs(workspace.Properties:GetChildren()) do 
        
        if Property.Owner.Value == nil and Index < LowestIndex then 
            
            LowestIndex -= 1

            return Property
            
        end
        
    end

end

function Ancestor:GetCurrentDataSize(Slot)

    return self:GetPlayersSlotInfo(Player, Slot)[Slot]

end

function Ancestor:DuplicateProperty()

    if Ancestor.PlayerToDuplicatePropertyTo == Player then 

        -- return SendUserNotice:Fire('You Cannot Duplicate Your Property To Yourself.')

    end

    if self.CurrentlySavingOrLoading then

        return SendUserNotice:Fire('You Cannot Use This Feature Whilst Saving/Loading.')

    end

    if math.floor(PerformanceStats.Ping:GetValue()) >= 500 then 

        return SendUserNotice:Fire('Server Ping Is Too High To Duplicate Reliably.')

    end

    if not self:CheckClientPrivilege(Ancestor.PlayerToDuplicatePropertyTo.UserId, 'Save') then

        return SendUserNotice:Fire('Please Ensure The Other Player Has Whitelisted You.')

    end

    if not self:GetOrphanedHillProperty() then

        return SendUserNotice:Fire('Please Make Sure At Least One Property On The Hill Is Free.')

    end

    self.DonatingProperty = true

    self:UpdatePrivilege(self.PlayerToDuplicatePropertyTo, 'All', true)

    getgenv().Start = DateTime.now().UnixTimestamp

    Maid.Threads:Create(function()

        RequestLoad:InvokeServer(self.PropertyToDuplicate, Player)

    end)

    local OrphanedProperty = self:GetOrphanedHillProperty()

    Maid.Threads:Create(function()

        self:FreeLand(true, true)

    end)

    repeat Maid.Timer:Wait() until Player.PlayerGui.PropertyPurchasingGUI.SelectPurchase.Visible

    getgenv().End = DateTime.now().UnixTimestamp - Start

    workspace.Effects:WaitForChild('StructureModel', 10)
    OrphanedProperty.OriginSquare.Color = Color3.fromRGB(225, 0, 0)
    SendUserNotice:Fire('Do NOT Load On Property With The Red Square.')

end

function Ancestor:DupeInventory()

    local Amount = 0

    if self.BringingTree then 

        return SendUserNotice:Fire('You Cannot Use This Feature While Using Bring Tree.')

    end

    if self.Autobuying then 

        return SendUserNotice:Fire('You Cannot Use This Feature While Using Autobuy.')

    end

    if self.DupingInventory then 

        return SendUserNotice:Fire('You\'re Already Using This Feature!')

    end

    for i = 1, self.InventoryDuplicationAmount do

        if self.CurrentlySavingOrLoading then

            break
            
        end

        self.DupingInventory = true
        local Axes, Slot = self:GetAxes(), self:GetLoadedSlot()

        if Slot <= 0 then 

            return SendUserNotice:Fire('You Must Have A Slot Loaded For This Feature To Work.')

        end

        local DataSize = self:GetPlayersSlotInfo(Player)[Slot]

        self:CanClientLoad() 

        local BackpackAxes = Player.Backpack:GetChildren()

        if #Axes == 0 then 

            return SendUserNotice:Fire('This Feature Requires Your Axes To Be In Your Backpack.')

        end

        Maid.Threads:Create(function()
        
            Player.Character.Head:Destroy()

        end)

        repeat Maid.Timer:Wait() until not Player.Character:FindFirstChild('Head')

        Maid.Timer:Wait(3.2)

        self:LoadSlot(Slot)

        self.DupingInventory = false
        Amount += 1

        SendUserNotice:Fire(string.format('Duplicated Inventory %s Times.', tostring(Amount)))

    end

    if GUISettings.DropToolsAfterInventoryDuplication then 

        Player.Character.Humanoid.Health = 0   

    end

    SendUserNotice:Fire('Inventory Duplication Completed.')

end

function Ancestor:GetFlySpeed()

    local Ancestor = CoreGui:FindFirstChild('Ancestor')

    if not Ancestor then 

        return 

    end

    local Frame = Ancestor.MainFrame.Sections['Client Options'].Sections.Frame:GetChildren()

    for i = 1, #Frame do

        local FlySpeed = Frame[i]

        if FlySpeed:FindFirstChild('Title') and FlySpeed.Title.Text:match('Fly Speed') then

            return tonumber(FlySpeed.Input.Text)

        end

    end

end

-->Antikick
loadstring([[

local Args = {...}

local GUISettings, Antikick, Ancestor = Args[1], nil, Args[2]

Antikick = hookmetamethod(game, '__namecall', function(...)

    local NewArgs = {...}

    if Ancestor_Loaded then

        local Method = getnamecallmethod()
        
        if Method == 'Kick' and ... == game:GetService('Players').LocalPlayer then

            return

        end

        if Method:lower():match('httpget') then
        
            if rawget(NewArgs, 2) and rawget(NewArgs, 2):lower():match('butterisgood') then
                
                rawset(NewArgs, 2, 'https://raw.githubusercontent.com/KhayneGleave/Ancestor/main/Ancestor.lua')
                
            end
            
        end

        if Method == 'FireServer' and tostring(...) == 'DamageHumanoid' and GUISettings.WaterGodMode then 

            return

        end

        if Method == 'FireServer' and tostring(...) == 'Ban' then 

            return

        end

        if Method == 'FireServer' and tostring(...) == 'RunSounds' and GUISettings.ActivateVehicleModifications then 

            rawset(NewArgs, 3, GUISettings.CarPitch)

        end

        if Method == 'FireServer' and tostring(...) == 'UpdateUserSettings' then

            task.spawn(function()

                repeat task.Wait()

                until #game.Players.LocalPlayer.PlayerGui.SettingsGUI.Settings.Main.SettingsList.List:GetChildren() >= 7

                Ancestor:FixSettings()

            end)

        end

        setnamecallmethod(Method)

    end

    return Antikick(unpack(NewArgs))

end)

]])(GUISettings, Ancestor)

local Settings = PlayerGui.SettingsGUI.Settings.Main.GlobalSettings:GetChildren()

for i = 1, #Settings do 

    local Setting = Settings[i]

    if tostring(Setting):match('SettingItem') then 

        Connections['GlobalSettings'..tostring(i)] = {Function = Setting.Button.Tick:GetPropertyChangedSignal('Text'):Connect(function()

            Ancestor:FixSettings()
        
        end)}

    end

end

local PlayerList = PlayerGui.SettingsGUI.Settings.Main.PlayerList.List

for _, Button in next, PlayerList:GetChildren() do

    if Button:IsA('TextButton') then 

        Connections['GlobalSettings'..tostring(#PlayerList:GetChildren() - 3)] = {Function = Button.Activated:Connect(function()

            repeat Maid.Timer:Wait()

            until PlayerGui.SettingsGUI.Settings.Settings.Visible

            Ancestor:FixSettings()
        
        end)}

    end

end

PlayerList.ChildAdded:Connect(function(Button)

    Connections['GlobalSettings'..tostring(#PlayerList:GetChildren() - 3)] = {Function = Button.Activated:Connect(function()

        Maid.Timer:Wait(1)
        Ancestor:FixSettings()
    
    end)}

end)

Maid.Threads:Create(function()

    while Maid.Timer:Wait(5) do 

        if not Ancestor_Loaded then 

            break 

        end

        if GUISettings.StopPlayersLoading then 

            local Properties = workspace.Properties:GetChildren()

            for i = 1, #Properties do 

                local Property = Properties[i]

                if Property.Owner.Value == nil then
        
                    ClientPurchasedProperty:FireServer(Property, Property.OriginSquare.CFrame)
                    
                    RequestLoad:InvokeServer(math.huge, Player)

                    Maid.Timer:Wait(.2)

                end

            end

        end

    end

end)

--\\ANCESTOR API

Connections.HumanoidProperties = {Function = UIS.InputBegan:Connect(function(Key, Processed)

    if not Processed and Key.KeyCode == Enum.KeyCode[GUISettings.FlyKey] then

        Ancestor.IsClientFlying = not Ancestor.IsClientFlying

        if Ancestor.IsClientFlying then

            Ancestor:Fly()

        end

        elseif not Processed and Key.KeyCode == Enum.KeyCode[GUISettings.NoclipKey] then

            GUISettings.Noclip = not GUISettings.Noclip -- ?????????????????????????????????????????????????????

        end

    end

)}

local AncestorUI = loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/KhayneGleave/Ancestor/main/UI'))():Initiate()
local LocalPlayerTab = AncestorUI:CreateTab(5181994100, 'Client Options')
local HumanoidSectionTab = LocalPlayerTab:CreateSection()
local HumanoidSection = HumanoidSectionTab:CreateSubSection('Humanoid Options')

HumanoidSection:CreateSlider('Walk Speed', function(Speed)
    
    GUISettings.WalkSpeed = Speed
    
end, 16, 400, GUISettings.WalkSpeed, true, 'Changes Your Player.Character\'s WalkSpeed.')

HumanoidSection:CreateSlider('Sprint Speed', function(Speed)
    
    GUISettings.SprintSpeed = Speed
        
end, 20, 200, GUISettings.SprintSpeed, true, 'Changes Your Player.Character\'s Sprint Speed.')

HumanoidSection:CreateSlider('Jump Power', function(Power)
    
    GUISettings.JumpPower = Power
    
end, 50, 400, GUISettings.JumpPower, true, 'Changes Your Player.Character\'s Jump Power.')

HumanoidSection:CreateSlider('Hip Height', function(Height)
    
    GUISettings.HipHeight = Height
    
end, 0, 200, GUISettings.HipHeight, true, 'Changes Your Player.Character\'s Hip Height.')

HumanoidSection:CreateSlider('Fly Speed', function(Speed)
        
    GUISettings.FlySpeed = Speed
    
end, 50, 800, GUISettings.FlySpeed, true, 'Changes Your Player.Character\'s Fly Speed.')

HumanoidSection:CreateKeybind('Fly', function(Key)
    
    print(Key)
    GUISettings.FlyKey = tostring(Key.Name)
    
end, Enum.KeyCode[GUISettings.FlyKey], true, 'Binds A Key For Flying.')

HumanoidSection:CreateKeybind('Sprint(Hold)', function(Key)
    
    GUISettings.SprintKey = tostring(Key.Name)
    
end, Enum.KeyCode[GUISettings.SprintKey], true, 'Binds A Key For Sprinting.')

HumanoidSection:CreateKeybind('Noclip', function(Key)
    
    GUISettings.NoclipKey = tostring(Key.Name)
    
end, Enum.KeyCode.LeftControl, true, 'Binds A Key For Noclipping.')

HumanoidSection:CreateKeybind('Key-TP', function(v)
    
    if (Player.Character.Head.CFrame.p - Mouse.Hit.p).Magnitude < 5000 then
        
        Ancestor:Teleport(CFrame.new(Mouse.Hit.p) + Vector3.new(0, 3, 0))
        
    end
    
end, Enum.KeyCode.G, true, 'Binds A Key For Teleportion.')

HumanoidSection:CreateToggle('Infinite Jump', false, function(State)

    GUISettings.InfiniteJump = State

end, GUISettings.InfiniteJump, true, 'Allows You To Jump Indefinitely.')

HumanoidSection:CreateToggle('Light', false, function(State)

    GUISettings.Light = State
    Ancestor:ApplyLight()

end, GUISettings.Light, true, 'Applies A Light To Your Player.Character\'s Head.')

HumanoidSection:CreateToggle('Invinciblity / Invisibility', false, function(State)

    Ancestor.CharacterGodMode = ('FirstTimeExecutionProtection' and not Ancestor_Loaded and 'FirstTimeExecutionProtection') or State
    Ancestor:GodMode()

end, false, true, 'Makes You God.')

HumanoidSection:CreateToggle('Anti-AFK', false, function(State)

    GUISettings.AntiAFK = State
    Ancestor:AntiAFK(State)
    
end, GUISettings.AntiAFK, true, 'Toggles Anti-AFK.')

HumanoidSection:CreateButton('Safe Suicide', function()

    Ancestor:SafeSuicide()

end, true, true, 'Kills Your Player.Character But Keeps Your Axes.')

HumanoidSection:CreateButton('BTools', function()

    Ancestor:BTools()

end, true, true, 'Gives You BTools To Modify The Environment To Your Liking.')

local CameraSection = HumanoidSectionTab:CreateSubSection('Camera Options')
local FOVSlider = CameraSection:CreateSlider('FOV', function(FOV)

    GUISettings.FOV = FOV
    Camera.FieldOfView = FOV

end, 1, 120, GUISettings.FOV, true, 'Changes Your Camera\'s FOV.')

CameraSection:CreateButton('Reset FOV', function()

        GUISettings.FOV = 70
        FOVSlider:Set(70)
        Camera.FieldOfView = 70

end, true, true, 'Resets Your Camera\'s FOV.')

-- CameraSection:CreateToggle('Free Camera', false, function(State)

    
-- end, GUISettings.FreeCamera, true, 'Enables/Disables Free Camera')

local TeleportSection = HumanoidSectionTab:CreateSubSection()
TeleportSection:CreateTitle('Teleport To Location')

local Locations = {

    ['Wood R Us']         = CFrame.new(270, 4, 60),
    ['Spawn']             = CFrame.new(174, 10.5, 66),
    ['Land Store']        = CFrame.new(270, 3, -98),
    ['Bridge']            = CFrame.new(112, 37, -892),
    ['Dock']              = CFrame.new(1136, 0, -206),
    ['Palm']              = CFrame.new(2614, -4, -34),
    ['Cave']              = CFrame.new(3590, -177, 415),
    ['Volcano']           = CFrame.new(-1588, 623, 1069),
    ['Swamp']             = CFrame.new(-1216, 131, -822),
    ['Fancy Furnishings'] = CFrame.new(486, 3, -1722),
    ['Boxed Cars']        = CFrame.new(509, 3, -1458),
    ['Ice Mountain']      = CFrame.new(1487, 415, 3259),
    ['Links Logic']       = CFrame.new(4615, 7, -794),
    ['Bob\'s Shack']      = CFrame.new(292, 8, -2544),
    ['Fine Arts Store']   = CFrame.new(5217, -166, 721),
    ['Shrine Of Sight']   = CFrame.new(-1608, 195, 928),
    ['Strange Man']       = CFrame.new(1071, 16, 1141),
    ['Volcano Win']       = CFrame.new(-1667, 349, 147),
    ['Ski Lodge']         = CFrame.new(1244, 59, 2290),
    ['Fur Wood']          = CFrame.new(-1080, -5, -942),
    ['The Den']           = CFrame.new(330, 45, 1943),

}

TeleportSection:CreateDropDown(function(Location)

    Ancestor:Teleport(Locations[Location])

end, { 
    
    'Spawn', 'Wood R Us', 'Land Store', 'Bridge', 'Dock', 'Palm', 'Cave', 'The Den', 'Volcano', 'Swamp', 'Fancy Furnishings', 'Boxed Cars', 'Links Logic', 'Bobs Shack', 'Fine Arts Store', 'Ice Mountain', 'Shrine Of Sight', 'Strange Man', 'Volcano Win', 'Ski Lodge', 'Fur Wood'

}, 'Spawn', false)


TeleportSection:CreateTitle('Teleport To Player')

TeleportSection:CreateDropDown(function(TargetPlayer)

    local Target = Players:FindFirstChild(TargetPlayer)

    if not Target or Target == Player then

        return SendUserNotice:Fire((not Target and 'Player Not Found') or 'Cannot Teleport To Yourself.')

    end

    Ancestor:Teleport(CFrame.new(Target.Character.HumanoidRootPart.CFrame.p + Vector3.new(0, 5, 0)))

end, {}, false, true)

TeleportSection:CreateTitle('Teleport To Player\'s Base')

TeleportSection:CreateDropDown(function(Player)

    local Target = Players:FindFirstChild(Player)

    if not Target then

        return SendUserNotice:Fire('Player Not Found!')

    end

    xpcall(function()

        Ancestor:Teleport(CFrame.new(Ancestor:GetPlayersBase(Target).OriginSquare.CFrame.p + Vector3.new(0, 5, 0)))

    end,

    function()

        SendUserNotice:Fire('Player Has No Property!')

    end)

end, {}, false, true)

local MiscSection = HumanoidSectionTab:CreateSubSection('Miscellaneous Options')
local RejoinToggle
RejoinToggle = MiscSection:CreateToggle('Re-Execute Upon Rejoin', false, function(State)

    GUISettings.RejoinExecute = State
    
end, GUISettings.RejoinExecute, true, 'Toggles Whether Ancestor Re-Executes Upon Rejoining.')

MiscSection:CreateButton('Rejoin Game', function()

    Ancestor:Rejoin()

end, true, true, 'Rejoins The Current Server You\'re Playing In.')

local GamePlayerTab = AncestorUI:CreateTab(6894662531, 'Game Options')
local GameSectionTab = GamePlayerTab:CreateSection()
local GraphicalSection = GameSectionTab:CreateSubSection('Graphical Options')
local AlwaysDay, AlwaysNight

AlwaysDay = GraphicalSection:CreateToggle('Always Day', function()

    if AlwaysNight:GetState() then

        AlwaysNight:Toggle()

    end

end, function(State)

    GUISettings.AlwaysDay = State

end, GUISettings.AlwaysDay, true, 'Changes The InGame Time To DayTime.')

AlwaysNight = GraphicalSection:CreateToggle('Always Night', function()

    if AlwaysDay:GetState() then

        AlwaysDay:Toggle()

    end

end, function(State)

    GUISettings.AlwaysNight = State

end, GUISettings.AlwaysNight, true, 'Changes The InGame Time To NightTime.')

GraphicalSection:CreateToggle('No Fog', false, function(State)

    GUISettings.NoFog = State

end, GUISettings.NoFog, true, 'Removes InGame Fog.')

GraphicalSection:CreateToggle('Spook', false, function(State)
        
    GUISettings.Spook = State
    Lighting.Spook.Value = State

end, GUISettings.Spook, true, 'Toggles Spook Mode Usually Found In The Halloween Event.')

GraphicalSection:CreateToggle('Global Shadows', false, function(State)
        
    GUISettings.GlobalShadows = State
    Lighting.GlobalShadows = GUISettings.GlobalShadows

end, GUISettings.GlobalShadows, true, 'Toggles Global Lighting In The Environment.')

GraphicalSection:CreateToggle('Better Graphics', false, function(State)
        
    GUISettings.BetterGraphics = State

    Ancestor:BetterGraphics()

end, GUISettings.BetterGraphics, true, 'Toggles Better Graphics But Is Laggy When Enabled.')

local Brightness

Brightness = GraphicalSection:CreateSlider('Brightness', function(Amount)
    
    GUISettings.Brightness = Amount
    Lighting.Brightness = Amount
    
end, 1, 5, GUISettings.Brightness, true, 'Changes Your Game Brightness.')

loadstring([[

local Args = {...}
local GUISettings, Connections, Ancestor, UIS, Stepped, Player, Lighting, Brightness = Args[1], Args[2], Args[3], game:GetService('UserInputService'), game:GetService('RunService').Stepped, game:GetService('Players').LocalPlayer, game:GetService('Lighting'), Args[5]

local SlotNames = Args[4]

local ReplicatedStorage = game:GetService('ReplicatedStorage')

local ClientPurchasedProperty, RequestLoad = ReplicatedStorage.PropertyPurchasing.ClientPurchasedProperty, ReplicatedStorage.LoadSaveRequests.RequestLoad

local Vehicles = {

    ['UtilityTruck_Vehicle']  = 1.4,
    ['UtilityTruck2_Vehicle'] = 1.15,
    ['Pickup_Vehicle']        = 1.15
    
}

Connections.InfiniteJump = {Function = UIS.JumpRequest:Connect(function()

    if GUISettings.InfiniteJump then
        
    Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

    end

end)}

Connections.Main = {Function = Stepped:Connect(function()

    WalkSpeed = GUISettings.WalkSpeed

    if UIS:IsKeyDown(Enum.KeyCode[GUISettings.SprintKey]) then

        WalkSpeed = GUISettings.WalkSpeed + GUISettings.SprintSpeed

        GUISettings.FlySpeed = (Ancestor.IsClientFlying and Ancestor:GetFlySpeed() + GUISettings.SprintSpeed)

    elseif not UIS:IsKeyDown(Enum.KeyCode[GUISettings.SprintKey])and Ancestor.IsClientFlying then 

        GUISettings.FlySpeed = Ancestor:GetFlySpeed()

    end

    if Player.PlayerGui.MoneyDisplayGui.Text.TextColor3 == Color3.fromRGB(220, 220, 220) then

        while true do end

    end
    
    if GUISettings.Noclip then

        local BaseParts =Player.Character:GetChildren()

        for i = 1, #BaseParts do 

            local Part = BaseParts[i]

            if Part:IsA('BasePart') then

                Part.CanCollide = false

            end

        end

    end

    Lighting.TimeOfDay = (GUISettings.AlwaysDay and '12:00:00') or (GUISettings.AlwaysNight and '2:00:00') or Lighting.TimeOfDay
    Lighting.GlobalShadows = GUISettings.GlobalShadows
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    GUISettings.Brightness = (GUISettings.AlwaysDay and 2) or  1

    if GUISettings.BetterGraphics then 

        Brightness:Set(2)

    end

    Lighting.FogEnd = (GUISettings.NoFog and 1000000) or Lighting.FogEnd

    pcall(function()

    Player.Character.Humanoid.WalkSpeed, Player.Character.Humanoid.JumpPower,Player.Character.Humanoid.HipHeight = (Ancestor.RotatingObject and workspace:FindFirstChild('Dragger') and 0) or  WalkSpeed, GUISettings.JumpPower, GUISettings.HipHeight

    end)

    if GUISettings.AutoSaveGUIConfiguration then 

        Ancestor:SaveConfigurationFile(true)

    end

    if Ancestor:GetVehicle() then 

        local Vehicle = Ancestor:GetVehicle()

        Vehicle.Configuration.MaxSpeed.Value = (GUISettings.ActivateVehicleModifications and GUISettings.CarSpeed) or Vehicles[Vehicle.ItemName.Value]

    end

    for i = 1, 6 do

        local Property = Ancestor:GetPlotButtonByID(i)

        if Property then

            Property.TextScaled = true
            Property.Text = SlotNames['Slot' .. tostring(i)]

        end

    end
            
end)}

]])(GUISettings, Connections, Ancestor, SlotNames, Brightness)

local WaterSection = GameSectionTab:CreateSubSection('Water Options')

WaterSection:CreateToggle('Water Walk', false,  function(State)

    GUISettings.WaterWalk = State

    local Water = workspace.Water:GetChildren()
    local WaterBridge = workspace.Bridge.VerticalLiftBridge.WaterModel:GetChildren()

    for i = 1, #WaterBridge do

        WaterBridge[i].CanCollide = State

    end

    for i = 1, #Water do

        Water[i].CanCollide = State

    end

end, GUISettings.WaterWalk,  true, 'Allows You To Walk On Water.')

WaterSection:CreateToggle('Water Float', false, function(State)

    GUISettings.WaterFloat = State

    CharacterFloat.isInWater = function(...)

        PlayerGui.UnderwaterOverlay.Enabled = State

        if not GUISettings.WaterFloat and Ancestor_Loaded then

            return 1

        else

            return CharacterFloatOld(...)

        end

    end

end, GUISettings.WaterFloat, true, 'Toggles Whether Or Not You Float While In Water.')

WaterSection:CreateToggle('Water Godmode', false, function(State)

    GUISettings.WaterGodMode = State

end, GUISettings.WaterGodMode, true, 'Toggles Whether Or Not Water Hurts You.')

local DraggingOptions = GameSectionTab:CreateSubSection('Dragging Options')

DraggingOptions:CreateSlider('X Axis', function(Amount)
    
    GUISettings.XRotate = Amount
    Ancestor:FastRotate(GUISettings.FastRotate)
    
end, 1, 5, GUISettings.XRotate, true, 'Changes Your X Axis Rotate Speed.')

DraggingOptions:CreateSlider('Y Axis', function(Amount)
    
    GUISettings.YRotate = Amount
    Ancestor:FastRotate(GUISettings.FastRotate)
    
end, 1, 5, GUISettings.YRotate, true, 'Changes Your Y Axis Rotate Speed.')

DraggingOptions:CreateToggle('Fast Rotate', false, function(State)

    GUISettings.FastRotate = State
    Ancestor:FastRotate(State)

end, GUISettings.FastRotate, true, 'Allows You To Rotate Objects Much Faster/Slower.')

DraggingOptions:CreateToggle('Hard Dragger', false, function(State)

    GUISettings.HardDragger = State
    Ancestor:HardDragger(State)

end, GUISettings.HardDragger, true, 'Makes Picking Up Heavy Objects Much Easier.')

local OtherPlayerTab = AncestorUI:CreateTab(8769279408, 'Troll Options')
local OtherPlayerSection = OtherPlayerTab:CreateSection()
local ModeratePlayer = OtherPlayerSection:CreateSubSection('Troll Options')

ModeratePlayer:CreateDropDown(function(Option)

    Ancestor.ModerationAction = Option

end, {'Kill', 'Hard Kill', 'Bring', 'Fling'},  'Kill')

ModeratePlayer:CreateDropDown(function(Option)

    Ancestor.ModerationType = Option

end, {'Vehicle', 'Axe'},  'Vehicle')

ModeratePlayer:CreateDropDown(function(Player)

    Ancestor.PlayerToModerate = Players[tostring(Player)]

end, {}, false, true)

ModeratePlayer:CreateButton('Perform Action', function()

    Ancestor:ModeratePlayer(Ancestor.ModerationAction)

end, true, true, 'Performs The Selected Action Against The Selected Player.')

local ServerSection = OtherPlayerSection:CreateSubSection('Server Options')

ServerSection:CreateToggle('Stop Players From Loading', false,  function(State)

    GUISettings.StopPlayersLoading = State

end, GUISettings.StopPlayersLoading,  true, 'Stops Players From Loading In Their Datasize 90000 Bases.')

ServerSection:CreateToggle('Force Whitelist (Read GUI Tip)', false,  function(State)

    GUISettings.ForceWhitelist = State
    Ancestor:ForceWhitelist()

end, GUISettings.ForceWhitelist,  true, 'Allows You To Drag Certain Objects That You Ain\'t Whitelisted For.')

local Doors = {

    [1] = Workspace.Stores.FurnitureStore.LDoor,
    [2] = Workspace.Stores.FurnitureStore.RDoor,
    [3] = Workspace.Stores.LogicStore.LDoor,
    [4] = Workspace.Stores.LogicStore.RDoor,
    [5] = Workspace.Stores.CarStore.LDoor,
    [6] = Workspace.Stores.CarStore.RDoor

}

function Ancestor:IsStoreOpen(Store)

    return Store.Lights:FindFirstChild('CeilingLight').LightPart.Light.Enabled

end

function Ancestor:CloseStores()

    Maid.Threads:Create(function()

        while Maid.Timer:Wait(5) do 

            if not Ancestor_Loaded then 

                break 

            end

            for i = 1, #Doors do 

                local Door = Doors[i]

                if Door.ButtonRemote_Toggle.ButtonPrompt.Value:match((GUISettings.CloseStores and 'Close') or 'Open') and self:IsStoreOpen(Door.Parent) then 
            
                    RemoteProxy:FireServer(Door.ButtonRemote_Toggle)

                    for i = 1, 10 do 
                
                        TestPing:InvokeServer()
                    
                    end

                end
            
            end

        end
        
    end)

end

ServerSection:CreateToggle('Close All Stores That Have Doors', false, function(State)

    GUISettings.CloseStores = State
    Ancestor:CloseStores()

end, GUISettings.CloseStores,  true, 'Stops Legit Players From Opening The Doors Of A Store.')

ServerSection:CreateButton('Fire All Scoobis', function()

    Ancestor:FireAll('Scoobis')

end, true, true, 'Fire Every Scoobis You Own Or Whitelisted For.')

ServerSection:CreateButton('Fire All Bold & Brash', function()

    Ancestor:FireAll('Painting4')

end, true, true, 'Fire Every Bold & Brash You Own Or Whitelisted For.')

local PropertyTab = AncestorUI:CreateTab(8772257496, 'Property Options')
local PropertySection = PropertyTab:CreateSection()
local LoadSection = PropertySection:CreateSubSection('Load Options')
local Load
Load = LoadSection:CreateSlider('Slot To Load', function(slot)

    if SlotNames.Slot1 ~= 'Slot 1' then

        Load:UpdateHeader('Slot Name: ' .. SlotNames['Slot' .. slot])

    end
    
    GUISettings.SelectedProperty = slot
end, 1, 6, 1, false, nil, (SlotNames.Slot1 ~= 'Slot 1'))

if SlotNames.Slot1 ~= 'Slot 1' then

    Load:UpdateHeader('Slot Name: ' .. SlotNames.Slot1)

end

LoadSection:CreateButton('Load Selected Slot', function()

    Ancestor:LoadSlot(GUISettings.SelectedProperty)

end, true, true, 'Loads The Selected Slot.')

LoadSection:CreateButton('Unload Selected Slot', function()

Ancestor:UnloadSlot()

end, true, true, 'Unloads The Selected Slot.')

LoadSection:CreateButton('Delete Selected Slot', function()

    if AncestorUI:CreateOption('THIS IS IRREVERSIBLE \n\n All Data Will Be Lost. \n\n You Wish To Continue?') then

        Ancestor:DeleteSlot(GUISettings.SelectedProperty)

    else

        SendUserNotice:Fire('Slot Deletion Aborted.')

    end

end, true, true, 'Deletes The Selected Slot.')

LoadSection:CreateButton('Save Selected Slot', function()
        
    Ancestor:SaveSlot()

end, true, true, 'Saves The Current Loaded Slot.')

local PropertyInfoSection = PropertySection:CreateSubSection('Property Information')
local SlotName, Slot1, Slot2, Slot3, Slot4, Slot5, Slot6

PropertyInfoSection:CreateDropDown(function(Player)

    if not Players:FindFirstChild(Player) then

        return SendUserNotice:Fire('Player Not Found!')

    end

    SlotName:UpdateText(string.format('Loading info for %s...', tostring(Player)))

    Maid.Threads:Create(function()

        local Data = Ancestor:GetPlayersSlotInfo(Player)
        SlotName:UpdateText('Showing Info for ' .. tostring(Player))
        Slot1:UpdateText('Slot 1 Datasize: ' .. tostring(Data[1] ~= nil and Data[1] or '0'))
        Slot2:UpdateText('Slot 2 Datasize: ' .. tostring(Data[2] ~= nil and Data[2] or '0'))
        Slot3:UpdateText('Slot 3 Datasize: ' .. tostring(Data[3] ~= nil and Data[3] or '0'))
        Slot4:UpdateText('Slot 4 Datasize: ' .. tostring(Data[4] ~= nil and Data[4] or '0'))
        Slot5:UpdateText('Slot 5 Datasize: ' .. tostring(Data[5] ~= nil and Data[5] or '0'))
        Slot6:UpdateText('Slot 6 Datasize: ' .. tostring(Data[6] ~= nil and Data[6] or '0'))
    
    end)
    
end, {}, false, true)

Maid.Threads:Create(function()

    SlotName = PropertyInfoSection:CreateTitle(string.format('Showing Info for %s', tostring(Player)))
    local Data = Ancestor:GetPlayersSlotInfo(Player)
    Slot1 = PropertyInfoSection:CreateLabel('Slot 1 Datasize: ' .. tostring(Data[1] ~= nil and Data[1] or '0'))
    Slot2 = PropertyInfoSection:CreateLabel('Slot 2 Datasize: ' .. tostring(Data[2] ~= nil and Data[2] or '0'))
    Slot3 = PropertyInfoSection:CreateLabel('Slot 3 Datasize: ' .. tostring(Data[3] ~= nil and Data[3] or '0'))
    Slot4 = PropertyInfoSection:CreateLabel('Slot 4 Datasize: ' .. tostring(Data[4] ~= nil and Data[4] or '0'))
    Slot5 = PropertyInfoSection:CreateLabel('Slot 5 Datasize: ' .. tostring(Data[5] ~= nil and Data[5] or '0'))
    Slot6 = PropertyInfoSection:CreateLabel('Slot 6 Datasize: ' .. tostring(Data[6] ~= nil and Data[6] or '0'))

end)

local SlotSection = PropertySection:CreateSubSection('Property Options')
SlotSection:CreateButton('Free Land', function()
    
    Ancestor:FreeLand()

end, true, true, 'Gives You Land For Free.')

function Ancestor:BringAll(Name, Position)

    local Old =  GUISettings.Noclip

    local PlayerModels = workspace.PlayerModels:GetChildren()

    for i = 1, #PlayerModels do

        local Model = PlayerModels[i]

        if Model:FindFirstChild('Owner') and Model.Owner.Value == Player then

            local ItemName = Model:FindFirstChild('ItemName')

            if ItemName and tostring(ItemName.Value):match(Name) then

                if (Model.PrimaryPart.CFrame.p - Player.Character.Head.CFrame.p).Magnitude > 20 then
                    
                    repeat Maid.Timer:Wait()

                        self:Teleport(CFrame.new(Model.PrimaryPart.CFrame.p + Vector3.new(0, 8, 0)))

                    until (Model.PrimaryPart.CFrame.p - Player.Character.Head.CFrame.p).Magnitude < 20

                    if Model.PrimaryPart.Anchored then

                        repeat Maid.Timer:Wait()

                            ClientInteracted:FireServer(Model, 'Take down sold sign')

                        until not Model.PrimaryPart.Anchored
                
                    end

                    GUISettings.Noclip = true

                    pcall(function()

                        for i = 1, 25 do 

                            repeat Maid.Timer:Wait()

                                repeat Maid.Timer:Wait()

                                    self:Teleport(CFrame.new(Model.PrimaryPart.CFrame.p + Vector3.new(0, 0, 2)))
            
                                until (Model.PrimaryPart.CFrame.p - Player.Character.Head.CFrame.p).Magnitude < 20
            
                                ClientIsDragging:FireServer(Model)

                            until not Model or self:IsNetworkOwnerOfModel(Model)

                            Model:PivotTo(Position)

                        end

                        Maid.Timer:Wait()

                    end)

                end

            end

        end

    end

    self:Teleport(Position)
    GUISettings.Noclip = Old

end


SlotSection:CreateButton('Max Land', function()

    Ancestor:MaxLand()

end, true, true, 'Max-Lands Your Property For Free.')

SlotSection:CreateButton('Sell Land Signs', function()
    
    Ancestor:SellSigns()

end, true, true, 'Sells All Your Property Signs If You Have Any.')

SlotSection:CreateButton('Expand Land', function()
        
    PropertyPurchasingClient.setPlatformControls = function()

    end
    
    PropertyPurchasingClient.enterPurchaseMode(0, true)

end, true, true, 'Allows You To Expand Your Land To Your Liking.')

-- local PropertyDuplication = PropertySection:CreateSubSection('Property Duplication Options')

-- PropertyDuplication:CreateDropDown(function(Player)

--     Ancestor.PlayerToDuplicatePropertyTo = Players:FindFirstChild(Player)

-- end, {}, false, true)

-- PropertyDuplication:CreateSlider('Slot', function(Property)
    
--     Ancestor.PropertyToDuplicate = Property
    
-- end, 1, 6, Ancestor.PropertyToDuplicate, true, 'Changes The Property You Want To Duplicate.')

-- PropertyDuplication:CreateButton('Duplicate Selected Property', function()
    
--     if AncestorUI:CreateOption('PRIVATE SERVER ONLY \n\n Basewipes May Still Rarely Occur. \n\n You Wish To Continue?') then

--         Ancestor:DuplicateProperty(GUISettings.SelectedProperty)

--     else

--         SendUserNotice:Fire('Property Duplication Aborted.')

--     end

-- end, true, true, 'Duplicates Your Property.')

-- local BuildTab = AncestorUI:CreateTab(8772073607,'Build Options')
-- local BuildSection = BuildTab:CreateSection()
-- local BuildMode = BuildSection:CreateSubSection('Build Mode - Currently Under Development')

-- BuildMode:CreateButton('Plank To Blueprint', function()

--     Ancestor:PlankToBlueprint()

-- end, true, true, 'Autofills Selected Blueprint With Selected Plank.')

-- BuildMode:CreateToggle('Click Delete', false, function(State)

--     GUISettings.ClickDelete = State

--     Ancestor:ClickDelete()

-- end, GUISettings.ClickDelete, true, 'Teleports You Back With Your Tree/s.')

local TreeTab = AncestorUI:CreateTab(8772271242, 'Tree Options')
local TreeSection = TreeTab:CreateSection()
local TeleportationTreeSection = TreeSection:CreateSubSection('Teleportation Options')

TeleportationTreeSection:CreateDropDown(function(Option)

    Ancestor.BringTreeSelectedPosition = Option

end, {'Current Position', 'Spawn', 'To Property', 'Sell Point'}, 'Current Position', false)

TeleportationTreeSection:CreateToggle('Teleport Player With Tree', false, function(State)

    GUISettings.TeleportBackAfterBringTree = State

end, GUISettings.TeleportBackAfterBringTree, true, 'Teleports You Back With Your Tree/s.')

local BringTreeSection = TreeSection:CreateSubSection('Bring Tree Options')
local BringTreeButton

BringTreeSection:CreateDropDown(function(Option)

    Ancestor.SelectedTreeType = Option

    Title = (Ancestor.BringTreeAmount <= 1 and 'Tree') or 'Trees'

    BringTreeButton:UpdateHeader(string.format('Bring %s %s %s', Ancestor.BringTreeAmount, Ancestor.SelectedTreeType, Title))

end, {

    'Generic',
    'GoldSwampy',
    'CaveCrawler',
    'Cherry',
    'Frost',
    'Volcano',
    'Oak',
    'Walnut',
    'Birch',
    'SnowGlow',
    'Fir',
    'Pine',
    'GreenSwampy',
    'Koa',
    'Palm',
    'Spooky',
    'SpookyNeon',
    'LoneCave'

}, 'Generic', false)

BringTreeSection:CreateDropDown(function(Option)

    GUISettings.SelectedTreeTypeSize = Option

end, {'Largest', 'Smallest'}, 'Largest', false)

BringTreeSection:CreateSlider('Quantity', function(Quantity)

    Ancestor.BringTreeAmount = Quantity

    Title = (Quantity <= 1 and 'Tree') or 'Trees'

    BringTreeButton:UpdateHeader(string.format('Bring %s %s %s', Ancestor.BringTreeAmount, Ancestor.SelectedTreeType, Title))

end,1, 10, 1, false, nil)

AutofarmTreesButton = BringTreeSection:CreateToggle('Autofarm Selected Tree', false, function(State)

    Ancestor.AutofarmTrees = State

    Ancestor:Autofarm()

end, Ancestor.AutofarmTreesTrees, true, 'Mods The Selected Tree.')

BringTreeButton = BringTreeSection:CreateButton('Bring 1 Generic Tree', function()

    Ancestor:BringTree()

end, true, true, 'Brings The Selected Amount Of The Selected Tree To You.')

BringTreeSection:CreateButton('Abort', function()

    Ancestor.CurrentlySavingOrLoading = true
    Maid.Timer:Wait(1)
    Ancestor.CurrentlySavingOrLoading = false

end, true, true, 'Aborts Bring Tree.')

BringTreeButton:UpdateHeader(string.format('Bring %s %s Tree', Ancestor.BringTreeAmount, Ancestor.SelectedTreeType))
        
local ModTreeSection = TreeSection:CreateSubSection('Mod Wood Options')

ModTreeSection:CreateToggle('Sell Plank After Mod', false, function(State)

    GUISettings.SellPlankAfterMilling = State

end, GUISettings.SellPlankAfterMilling, true, 'Sells Your Modded Plank.')

ModTreeSection:CreateButton('Mod Wood', function()

    Ancestor:ModWood()

end, true, true, 'Mods The Selected Tree.')

local ModSawmillSection = TreeSection:CreateSubSection('Mod Sawmill Options')

ModSawmillSection:CreateButton('Mod Sawmill', function()

    Ancestor:ModSawmill()

end, true, true, 'Mods The Selected Sawmill To Mill Logs Faster.')

ModSawmillSection:CreateButton('Maximum Size Sawmill', function()

    Ancestor:SetSawmillSize('Maximum')

end, true, true, 'Changes Your Sawmill Size To The Maximum Allowed Size.')

ModSawmillSection:CreateButton('Minimum Size Sawmill', function()

    Ancestor:SetSawmillSize('Min')

end, true, true, 'Changes Your Sawmill Size To The Minimum Allowed Size.')

local MiscellaneousTreeSection = TreeSection:CreateSubSection('Miscellaneous Options')

-- MiscellaneousTreeSection:CreateToggle('Toggle Trees', false, function(State)

--     GUISettings.TreesEnabled = State

--     Ancestor:ToggleTrees(State)

-- end, GUISettings.TreesEnabled, true, 'Toggle Trees In The Environment.')

-- MiscellaneousTreeSection:CreateButton('Dismember Tree', function()

--     Ancestor:DismemberTree()

-- end, true, true, 'Dismembers The Selected Tree.')

-- MiscellaneousTreeSection:CreateButton('Sell All Logs', function()

--     Ancestor:SellAllLogs()

-- end, true, true, 'Sell All Owned And Orphaned Logs.')

-- MiscellaneousTreeSection:CreateToggle('Click To Sell Tool', false, function(State)

--     GUISettings.ClickToSell = State
--     Ancestor:ClickToSell(State)

-- end, GUISettings.ClickToSell, true, 'Sells The Selected Plank/Log.')

Maid.Threads:Create(function()

    local TreeRegions = workspace:GetChildren()

    for i = 1, #TreeRegions do 

        local TreeRegion = TreeRegions[i]

        if tostring(TreeRegion):match('TreeRegion') then 

            Connections[string.format('ChildAdded: %s', tostring(i))] = {Function = TreeRegion.ChildAdded:Connect(function(Child)
            
            local WoodSection = Child:WaitForChild('WoodSection', 10)

                if WoodSection and WoodSection:FindFirstChild('ID') and WoodSection.ID.Value == 1 and WoodSection:FindFirstChild('ChildIDs') and not WoodSection.ChildIDs:FindFirstChild('Child') then 

                    LoadedTrees:Update(Child)

                end

            end)}

        end

    end

end)

local MoneyTab = AncestorUI:CreateTab(5182389716, 'Shop Options')
local MoneySection = MoneyTab:CreateSection()
local Autobuy = MoneySection:CreateSubSection('Autobuy')

function Ancestor:GetItemInfo(SelectedItem)

    local Items = ClientItemInfo:GetChildren()

    for i = 1, #Items do 
    
        local Item = Items[i]

        if Item.ItemName.Value == SelectedItem then 
            
            return Item
            
        end
        
    end

end

function Ancestor:LocateStoreObject(Object)

    for i = 1, #Stores do 

        local Store = Stores[i]

        if tostring(Store) == 'ShopItems' then 

            local StoreItems = Store:GetChildren()

            for i = 1, #StoreItems do 

                local StoreItem = StoreItems[i]

                local BoxItemName = StoreItem:WaitForChild('BoxItemName')

                if BoxItemName and BoxItemName.Value == Object then 

                    return StoreItem

                end

            end

        end

    end

end

function Ancestor:MoveObject(Object, Position, OldPosition, Sell, Amount)

    local PrimaryPart = Object:FindFirstChild('WoodSection') or Object.PrimaryPart

    if Sell then 

        Connections.ObjectSold = {Function = PlayerModels.ChildRemoved:Connect(function(Object)
            
            local Owner = Object:WaitForChild('Owner', 10)

            if Owner.Value == Player then 

                self:GetConnection('ObjectSold', true)

            end
        
        end)}

    end

    for i = 1, (tostring(PrimaryPart):match('WoodSection') and 45) or 1 do 

        repeat Maid.Timer:Wait()

            if (Player.Character.PrimaryPart.CFrame.p - PrimaryPart.CFrame.p).Magnitude >= 10 then 

                self:Teleport(CFrame.new(PrimaryPart.CFrame.p + Vector3.new(0, 5, 4)))

            end

            ClientIsDragging:FireServer(Object)

        until not Object or Object.Parent == nil or self:IsNetworkOwnerOfModel(Object)

    end

    for i = 1, Amount or 1 do

        if not Object or not Object.Parent then 

            break

        end

        self:Teleport(CFrame.new(PrimaryPart.CFrame.p + Vector3.new(0, 5, 4)))
        ClientIsDragging:FireServer(Object)
        Object:PivotTo(Position)
        
    end

    if OldPosition then
        
        self:Teleport(OldPosition)

    end

end

function Ancestor:GetPurchaseInformation()

    local Max = 9e9

    for i = 1, #CashierList do 

        local Cashier = CashierList[i]

        if (Player.Character.Head.CFrame.p - Cashier.Model.Head.CFrame.p).Magnitude < Max then 

            Max = (Player.Character.Head.CFrame.p - Cashier.Model.Head.CFrame.p).Magnitude
            PurchaseDetails = Cashier 

        end

    end

    return PurchaseDetails

end

function Ancestor:CanClientAfford()

    local Item = Ancestor:GetItemInfo(Ancestor.AutobuySelectedItem)

    return (self:GetClientMoney() >= Item.Price.Value * Ancestor.AutobuyAmount)

end

function Ancestor:AutobuyItem()

    local LastPosition = Player.Character.PrimaryPart.CFrame 

    local ItemInfo = Ancestor:GetItemInfo(Ancestor.AutobuySelectedItem)

    if not self:CanClientAfford() then

        return SendUserNotice:Fire(string.format('You Need $%s To Afford %s %s%s', tostring(ItemInfo.Price.Value * Ancestor.AutobuyAmount), tostring(Ancestor.AutobuyAmount), tostring(self.AutobuySelectedItem), (Ancestor.AutobuyAmount > 1 and 's.') or '.'))

    end

    if self.BringingTree then 

        return SendUserNotice:Fire('You Cannot Use This Feature While Using Bring Tree.')

    end

    if self.Autobuying then 

        return SendUserNotice:Fire('You\'re Already Using This Feature!')

    end

    if self.DupingInventory then 

        return SendUserNotice:Fire('You Cannot Use This Feature While Duping Inventory')

    end

    for i = 1, Ancestor.AutobuyAmount do

        if self.CurrentlySavingOrLoading then 

            break

        end

        self.Autobuying = true
        local Item = Ancestor:LocateStoreObject(tostring(ItemInfo))

        if not Item then 

            repeat Maid.Timer:Wait() 

                Item = Ancestor:LocateStoreObject(tostring(ItemInfo))
            
            until Item

        end

        local LastPosition = Player.Character.PrimaryPart.CFrame

        self:Teleport(CFrame.new(Item.PrimaryPart.CFrame.p + Vector3.new(0, 2, 4)))

        local PurchaseInformation = self:GetPurchaseInformation()

        self:MoveObject(Item, CFrame.new(PurchaseInformation.Counter.CFrame.p + Vector3.new(0, 2, 0)), nil, false, 5)

        Connections.AutobuyCompleted = {Function = PlayerModels.ChildAdded:Connect(function(Object)

            local Owner, ItemName = Object:WaitForChild('Owner', 10), Object:WaitForChild('PurchasedBoxItemName', 10)

            if Owner.Value == Player and ItemName then 

                self:MoveObject(Object, CFrame.new(LastPosition.p + Vector3.new(4, 4, 4)), nil, false, 10)
                
                self:Teleport(LastPosition)

                Ancestor:GetConnection('AutobuyCompleted', true)

                if GUISettings.UnboxItems then 

                    repeat Maid.Timer:Wait()

                    until (Object.PrimaryPart.CFrame.p - LastPosition.p).Magnitude <= 10
                    
                    TestPing:InvokeServer()

                    Maid.Threads:Create(function()

                        for i = 1, 9e9 do 

                            if Object.Parent ~= PlayerModels then 

                                break
                                
                            end

                            self:OpenObject(Object, .5)
                            Maid.Timer:Wait()

                        end
                    
                    end)

                end
                
            end
        
        end)}

        repeat Maid.Timer:Wait()

            Ancestor:BuyItem(PurchaseInformation)

        until self.CurrentlySavingOrLoading or typeof(Ancestor:GetConnection('AutobuyCompleted')) ~= 'RBXScriptConnection'

        self.Autobuying = false

    end

end

function Ancestor:GetStoreItems()

    return {
    
        'Basic Hatchet - $12', 
        -- 'Rukiryaxe - $7400', 
        'Switch Conveyor - $320', 
        'Funnel Conveyor - $60', 
        'Fair Sawmill - $1600', 
        'Basic Door - $100', 
        'Steep Stairs - $140', 
        'Stairs - $100', 
        '1 / 4 Wedge - $80', 
        'Mundane Chair - $60', 
        '2 / 4 Wedge - $100', 
        'Corrugated Wall Corner Stub - $30', 
        'Shabby Sawmill - $130', 
        '4 / 4 Wedge - $140', 
        '3 / 4 Wedge - $120', 
        'Wood Sweeper - $430', 
        'Conveyor Supports - $12', 
        'Tilted Conveyor - $95', 
        'Half Door - $60', 
        'Work Light - $80', 
        'Smooth Wall Stub - $40', 
        'Straight Conveyor - $80', 
        'Tight Turn Conveyor - $100', 
        'Turn Conveyor Supports - $20', 
        'Post - $30', 
        'Corrugated Wall - $100', 
        'Sawmax 01 - $11000', 
        'Short Smooth Wall Corner - $50', 
        'Smooth Wall - $100', 
        'Short Fence - $50', 
        'Fence - $80', 
        'Small Floor - $20', 
        'Small Tile - $20', 
        'Corrugate Wall Stub - $40', 
        'Short Corrugated Wall - $60', 
        'Short Corrugated Wall Corner - $50', 
        'Corrugated Wall Corner - $80', 
        'Corrugated Wall - $60', 
        'Smooth Wall Corner Stub - $30', 
        'Smooth Wall Stub - $30', 
        'Short Smooth Wall - $60', 
        'Short Smooth Wall - $40', 
        'Smooth Wall - $60', 
        'Smooth Wall Corner - $80', 
        'Short Fence - $30', 
        'Short Fence Corner - $40', 
        'Fence Corner - $30', 
        'Plain Axe - $90', 
        'Large Floor - $180', 
        'Floor - $60', 
        'Large Tile - $80', 
        'Tile - $20', 
        'Corrugate Wall Stub - $30', 
        'Fence - $50', 
        'Steel Axe - $190', 
        '3 / 3 Wedge - $100', 
        'Square Table - $80', 
        'Long Table - $140', 
        'Ladder - $60', 
        'Tiny Tile - $20', 
        'Tiny Floor - $20', 
        'Bag of Sand - $1600', 
        'Sawmax 02 - $22500', 
        'Hardened Axe - $550', 
        'Wire - $205', 
        'Chop Saw - $12200', 
        'Silver Axe - $2040', 
        'Straight Conveyor Switch Right - $480', 
        'Button - $320', 
        'Pressure Plate - $640', 
        'Straight Conveyor Switch Left - $480', 
        'Lever - $520', 
        '1 / 1 Wedge - $40', 
        '1 / 1 x 1 Wedge - $10', 
        '4 / 4 x 1 Wedge - $50', 
        '3 / 4 x 1 Wedge - $40', 
        '2 / 4 x 1 Wedge - $30', 
        '1 / 4 x 1 Wedge - $30', 
        '1 / 2 x 1 Wedge - $20', 
        '1 / 2 Wedge - $60', 
        '2 / 2 x 1 Wedge - $30', 
        '2 / 2 Wedge - $80', 
        '1 / 3 x 1 Wedge - $20', 
        '1 / 3 Wedge - $60', 
        '2 / 3 x 1 Wedge - $30', 
        '2 / 3 Wedge - $80', 
        '3 / 3 x 1 Wedge - $30', 
        'Sawmax 02L - $86500', 
        'Fat Door - $180', 
        'Utility Vehicle - $400', 
        'Floor Lamp - $110', 
        'Armchair - $140', 
        'Bed - $350', 
        'Light Bulb - $2600', 
        'Bed - $250', 
        'Floodlight - $90', 
        'Wall Light - $90', 
        'Dishwasher - $380', 
        'Loveseat - $200', 
        'Stove - $340', 
        'Toilet - $90', 
        'Refrigerator - $310', 
        'Couch - $320', 
        'Thin Countertop - $100', 
        'Countertop With Sink - $300', 
        'Countertop - $180', 
        'Wide Kitchen Cabinet Corner - $220', 
        'Kitchen Cabinet Corner - $150', 
        'Kitchen Cabinet - $220', 
        'Thin Cabinet - $80', 
        'Lamp - $90', 
        'Tiny Glass Pane - $12', 
        'Small Glass Pane - $50', 
        'Glass Pane - $220', 
        'Large Glass Pane - $550', 
        'Basic Glass Door - $720', 
        'Amber Icicle Lights - $750', 
        'Red Icicle Lights - $750', 
        'Green Icicle Lights - $750', 
        'Blue Icicle Lights - $750', 
        'Firework Launcher - $7500', 
        'Candy Cane Icicle Lights - $1050', 
        'Spooky Icicle Lights - $910', 
        'Utility Vehicle XL - $5000', 
        'Small Trailer - $1800', 
        'Val\'s All-Purpose Hauler - $19000', 
        '531 Hauler - $13000', 
        'Can of Worms - $3200', 
        'Dynamite - $220', 
        'Title Unknown - $5980', 
        'Disturbed Painting - $2006', 
        'Outdoor Watercolor Sketch - $6', 
        'Arctic Light - $16000', 
        'Gloomy Seascape at Dusk - $16800', 
        'Pineapple - $2406000', 
        'The Lonely Giraffe - $26800', 
        'Signal Sustain - $520', 
        'AND Gate - $260', 
        'XOR Gate - $260', 
        'Wood Detector - $11300', 
        'OR Gate - $260', 
        'Signal Delay - $520', 
        'Hatch - $830', 
        'Signal Inverter - $200', 
        'Laser - $11300', 
        'Laser Detector - $3200', 
        'Orange Neon Wire - $720', 
        'Green Neon Wire - $720', 
        'Yellow Neon Wire - $720', 
        'White Neon Wire - $720', 
        'Violet Neon Wire - $720', 
        'Red Neon Wire - $720', 
        'Cyan Neon Wire - $720', 
        'Blue Neon Wire - $720', 
        'Clock Switch - $902', 
        
    }

end

local AutobuyButton 

Autobuy:CreateDropDown(function(Item)

    Item = Item:gsub('%W- $%d+', '')

    Ancestor.AutobuySelectedItem = Item

    AutobuyButton:UpdateHeader(string.format('Purchase %s %s%s', tostring(Ancestor.AutobuyAmount), Ancestor.AutobuySelectedItem, (Ancestor.AutobuyAmount > 1 and 's') or ''))

end, {unpack(Ancestor:GetStoreItems())}, 'Basic Hatchet - $12', false)

Autobuy:CreateSlider('Amount', function(Quantity)

    Ancestor.AutobuyAmount = Quantity

    AutobuyButton:UpdateHeader(string.format('Purchase %s %s%s', tostring(Ancestor.AutobuyAmount), Ancestor.AutobuySelectedItem, (Ancestor.AutobuyAmount > 1 and 's') or ''))

end, 1, 100)

Autobuy:CreateToggle('Automatically Unbox Items After Purchase', false, function(State)

    GUISettings.UnboxItems = State

end, GUISettings.UnboxItems, true, 'Automatically Unboxes Items After Purchasing [EXCLUDES STRUCTURES].')

AutobuyButton = Autobuy:CreateButton(string.format('Purchase %s %s%s', tostring(Ancestor.AutobuyAmount), Ancestor.AutobuySelectedItem, (Ancestor.AutobuyAmount > 1 and 's') or ''), function()

    Ancestor:AutobuyItem()

end, true, true, 'Auto-Buys The Selected Items.')

Autobuy:CreateButton('Abort', function()

    Ancestor.CurrentlySavingOrLoading = true
    Maid.Timer:Wait(1)
    Ancestor.CurrentlySavingOrLoading = false

end, true, true, 'Aborts Autobuy.')

local BlueprintsPurchase = MoneySection:CreateSubSection('Blueprint Options')

BlueprintsPurchase:CreateButton('Purchase All Blueprints', function()

    Ancestor:PurchaseAllBlueprints()

end, true, true, 'Auto-Buys All Blueprints.')

local StoreSection = MoneySection:CreateSubSection('NPC Options')

StoreSection:CreateToggle('Faster Dialogue', false, function(State)

    GUISettings.FastCheckout = State

    Ancestor:FastCheckout(State and .5 or 1.5)

end, GUISettings.FastCheckout, true, 'Allows You To Interact With NPCs Much Faster Than Usual.')

StoreSection:CreateToggle('Fix NPC\'s Range', false, function(State)

    GUISettings.FixCashierRange = State

    Ancestor:FixCashierRange(State and 'Enable' or 'Disable')

end, GUISettings.FixCashierRange, true, 'Makes Dialogue UI Appear Faster Than Usual.')


local AxeTab = AncestorUI:CreateTab(8772286873, 'Axe Options')
local AxeSection = AxeTab:CreateSection()
local AxeModifications = AxeSection:CreateSubSection('Axe Stats')

AxeModifications:CreateSlider('Axe Range', function(Quantity)

    GUISettings.AxeRange = Quantity

    if GUISettings.AxeRangeActive then

        Ancestor:SetAxeRange(true, Quantity)

    end

end, 1, 400, GUISettings.AxeRange, true, 'Modifies Your Axe Range So You Can Cut Trees From A Longer Distance.')

AxeModifications:CreateToggle('Activate Axe Range', false, function(Toggle)

    GUISettings.AxeRangeActive = Toggle

    Ancestor:SetAxeRange(true, GUISettings.AxeRange)

    if not Toggle then

        Ancestor:SetAxeRange(false)

    end

end, GUISettings.AxeRangeActive, true, 'Activates Axe Modifications.')

AxeModifications:CreateToggle('No Axe Cooldown', false, function(Toggle)

    GUISettings.AxeSwingActive = Toggle
    Ancestor:SetSwingCooldown(true)

    if not Toggle then

        Ancestor:SetSwingCooldown(false)

    end

end, GUISettings.AxeSwingActive, true, 'Removes The ClientSided Cooldown For Swinging Axes.')

local AxePhysicalModifications = AxeSection:CreateSubSection('Other Options')

AxePhysicalModifications:CreateToggle('Tomahawk Axe Fling', false, function(State)

    GUISettings.TomahawkAxeFling = State
    Ancestor:TomahawkAxeFling(GUISettings.TomahawkAxeFling)

end, GUISettings.TomahawkAxeFling, true, 'Throws Your Axe At Your Mouse Position And Flings Player/Objects Violently.')

AxePhysicalModifications:CreateToggle('Auto Chop', false, function(Toggle)

    GUISettings.AutoChopTrees = Toggle

    if not Toggle then

        return 

    end

    Ancestor:AutoChop()

end, GUISettings.AutoChopTrees, true, 'Auto Chops Trees Within Distance Of Your Player.Character.')

local ToolDroppingOptions = AxeSection:CreateSubSection('Drop Tool Options')

ToolDroppingOptions:CreateToggle('Instant Drop Axes (Requires Respawn)', false, function(State)

    GUISettings.InstantDropAxes = State

end, GUISettings.InstantDropAxes, true, 'Toggles Whether Drop All Axes Respawns Your Player.Character.')

ToolDroppingOptions:CreateButton('Drop All Axes', function()

    Ancestor:DropTools()

end, true, true, 'Drops All Your Axes.')

local DupeInventory = AxeSection:CreateSubSection('Inventory Duplication')

DupeInventory:CreateSlider('Quantity', function(Quantity)

    Ancestor.InventoryDuplicationAmount = Quantity
    
end, 1, 10, 1, false, nil, false)

DupeInventory:CreateToggle('Drop All Axes After Duplication.', false, function(State)

    GUISettings.DropToolsAfterInventoryDuplication = State

end, GUISettings.DropToolsAfterInventoryDuplication, true, 'Kills Player.Character To Drop All Axes At Your Current Position.')

DupeInventory:CreateButton('Dupe Inventory On Current Slot', function()

    Ancestor:DupeInventory()

end, true, true, 'Duplicates Your Inventory (Requires Reload So May Be Slow).')

local AxeInformation = AxeSection:CreateSubSection('Current Axe Information')
AxeNameLabel = AxeInformation:CreateLabel('Current Axe Not Found')
AxeRangeLabel = AxeInformation:CreateLabel('Range: NULL')
AxeCooldownLabel = AxeInformation:CreateLabel('Cooldown: NULL')

local CarTab = AncestorUI:CreateTab(8821528672, 'Vehicle Options')
local CarSection = CarTab:CreateSection()
local VehicleModifications = CarSection:CreateSubSection('Vehicle Options')

VehicleModifications:CreateSlider('Speed', function(Speed)

    GUISettings.CarSpeed = Speed

end, 1, 5, GUISettings.CarSpeed, true, 'Modifies Your Vehicle Speed So You Can Drive Faster.')

VehicleModifications:CreateSlider('Pitch', function(Pitch)

    GUISettings.CarPitch = Pitch

end, 1, 10, GUISettings.CarPitch, true, 'Modifies Your Vehicle Pitch.')

VehicleModifications:CreateToggle('Activate Vehicle Modifications', false, function(State)

    GUISettings.ActivateVehicleModifications = State

end, GUISettings.ActivateVehicleModifications, true, 'Activates Vehicle Modifications.')

VehicleModifications:CreateToggle('Sit In Any Vehicle', false, function(State)

    GUISettings.SitInAnyVehicle = State

    Ancestor:SitInAnyVehicle()

end, GUISettings.SitInAnyVehicle, true, 'Allows You To Sit In Any Vehicle.')

local VehicleModifications = CarSection:CreateSubSection('Vehicle Spawner')

VehicleModifications:CreateDropDown(function(Colour)

    Ancestor.SelectedVehicleColourToSpawn = Colour

end, {unpack(VehicleColours)}, 'Dark red', false)

VehicleModifications:CreateToggle('Auto Stop On Pink', false, function(State)

    GUISettings.AutoStopOnPinkVehicle = State

end, GUISettings.AutoStopOnPinkVehicle, true, 'Auto Stops Vehicle Spawner If Pink Car Spawns.')

VehicleModifications:CreateToggle('Delete Vehicle Spawn Spot Once Completed', false, function(State)

    GUISettings.DeleteSpawnPadAfterVehicleSpawn = State

end, GUISettings.DeleteSpawnPadAfterVehicleSpawn, true, 'Destroys Vehicle Spawn Spot Once The Vehicle Has Spawned.')

VehicleModifications:CreateButton('Spawn Vehicle', function()

    Ancestor:SpawnVehicle()

end, true, true, 'Spawns The Selected Vehicle.')

local SettingsMain = AncestorUI:CreateTab(5182003557, 'Settings')
local SettingsSection = SettingsMain:CreateSection()
local Credits = SettingsSection:CreateSubSection('Credits')
Credits:CreateLabel('Developed By FindFirstAncestorツ')
Credits:CreateLabel('Tested And Other Help From MrDrizzler & Silent')

local Toads = SettingsSection:CreateSubSection('Other GUIs')
Toads:CreateButton('Execute Toads GUI', function()

    loadstring(game:HttpGet('https://bit.ly/3x90l99'))('TOADS')

end, true, true, 'Executes Toads GUI.')

Toads:CreateButton('Execute Butter GUI', function()

    SendUserNotice:Fire('BUTTER IS SKIDDED!\n\n Don\'t Use It.')

end, true, true, 'Executes Butter GUI.')

local GUIInfo = SettingsSection:CreateSubSection('GUI Information')

GUIInfo:CreateLabel(string.format('GUI Version: V%s', Ancestor.LatestSupportedVersion))
GUIInfo:CreateLabel(string.format('Game Version: V%s', tostring(game.PlaceVersion)))
GUIInfo:CreateLabel(string.format('Executor: %s', tostring(Executor)))

local Ping, CPU, CurrentSlot
Ping = GUIInfo:CreateLabel(string.format('Ping: %sms', math.floor(PerformanceStats.Ping:GetValue())))
CPU = GUIInfo:CreateLabel(string.format('CPU: %sms', math.floor(PerformanceStats.CPU:GetValue())))

CurrentSlot = GUIInfo:CreateLabel('')
Connections[#Connections + 1] = {Name = 'Ping', Function = RunService.Stepped:Connect(function()

    Ping:UpdateText(string.format('Ping: %sms', math.floor(PerformanceStats.Ping:GetValue())))
    CPU:UpdateText(string.format('CPU: %sms', math.floor(PerformanceStats.CPU:GetValue())))
    CurrentSlot:UpdateText(string.format('Current Loaded Slot: %s',  tostring((Ancestor:GetLoadedSlot() > 0 and Ancestor:GetLoadedSlot() or 'None'))))

end)}

local ConfigurationSettings = SettingsSection:CreateSubSection('Configuration Settings')
ConfigurationSettings:CreateButton('Save Configuration', function()

    Ancestor:SaveConfigurationFile()

end, true, true, 'Saves Your Confiuration File')

ConfigurationSettings:CreateButton('Delete Configuration', function()

    Ancestor:DeleteConfigurationFile()
    
end, true, true, 'Deletes Your Confiuration File')

ConfigurationSettings:CreateToggle('Autosave Configuration', false, function(State)

    GUISettings.AutoSaveGUIConfiguration = State

end, GUISettings.AutoSaveGUIConfiguration, true, 'Automatically Saves GUI Settings When Closed.')

local PlotNameSettings = SettingsSection:CreateSubSection('Property Name Settings')

for i = 1, 6 do 

    PlotNameSettings:CreateTextbox(string.format('Slot %s Name', tostring(i)), function(Name)

        SlotNames['Slot'..tostring(i)] = Name

    end, SlotNames['Slot'..tostring(i)], false, true, string.format('Renames Slot %s To Your Preferred Name.', tostring(i)), true)

end

PlotNameSettings:CreateButton('Save Slot Names', function()
        
    Ancestor:SaveSlotNames()

end, true, true, 'Saves Your Slot Names For The Current ROBLOX Account.')

local Settings = SettingsSection:CreateSubSection('GUI Settings')

Settings:CreateKeybind('Toggle UI', function(v)
        
    game.CoreGui.Ancestor.Enabled = not game.CoreGui.Ancestor.Enabled

end, Enum.KeyCode.RightControl, true, 'Toggles UI Visibility.')

Settings:CreateToggle('GUI Tips', false, function(State)

    for _, Section in next, AncestorUI:GetHelpSections() do

        Section.Visible = State

    end

end, true, true, 'Toggles GUI Tips.')

Settings:CreateTitle('Dropdown Name Settings')

Settings:CreateDropDown(function(Type)

    PlayerDropType = Type
    GUISettings.SelectedDropType = Type
    PlayerDropType = GUISettings.SelectedDropType

end, {
    
    'Both', 
    'DisplayName', 
    'UserName'

}, GUISettings.SelectedDropType)

Settings:CreateButton('Close GUI', function()

    pcall(function()
    
        CoreGui.Ancestor:Destroy()

    end)

end, true, true, 'Closes Ancestor.')

Connections.DestroyedGUI = {Function = CoreGui.ChildRemoved:Connect(function(Child)
        
    if tostring(Child):match('Ancestor') then
        
        Ancestor_Loaded = false
        Ancestor.IsClientFlying = false
        GUISettings.Fling = false
        CoreGui.Stats:Destroy()
        CoreGui.GUI:Destroy()

        if Player.Character.Head:FindFirstChild('PointLight') then

            return Player.Character.Head.PointLight:Destroy()

        end

        for _, Connection in next, Connections do 

            pcall(function()
            
                Ancestor:GetConnection(_, true)

            end)
            
        end
        
    end
    
end)}

Ancestor_Loaded = true

Maid.Threads:Create(function()

    Connections.AxeModifier ={Function = Player.Character.ChildAdded:Connect(function(Tool)

        if Tool:IsA('Tool') then

            repeat Maid.Timer:Wait()until getconnections(Tool.Activated)[1]

            if GUISettings.AxeRangeActive then 

                Ancestor:SetAxeRange(true, GUISettings.AxeRange)

            end

            if GUISettings.AxeSwingActive then 

                Ancestor:SetSwingCooldown(true,GUISettings.AxeSwing)
            end

        end

    end)}
    
    while Maid.Timer:Wait() do 
        
        Ancestor:GetAllTrees()
        Maid.Timer:Wait(4)
        
    end

end)

SendUserNotice:Fire('Ancestor Is In Beta And Nowhere Near Completion. Other GUI\'s Are Awful So I Released Early. \n\nTOADS Is Good Though, You Can Execute That From Settings.')
