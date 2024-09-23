local function Billboard(child, name, color, title)
local Billboard = Instance.new("BillboardGui");do
Billboard.Active = true;
Billboard.AlwaysOnTop = true;
Billboard.ClipsDescendants = true;
Billboard.LightInfluence = 1;
Billboard.Size = UDim2.new(10000, 0, 10000, 0);
Billboard.ResetOnSpawn = false;
Billboard.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
Billboard.Parent = child;
Billboard.Name = title;
local Title = Instance.new("TextLabel");
Title.TextSize = 15;
Title.Font = "RobotoCondensed";
Title.TextColor3 = color;
Title.BackgroundColor3 = Color3.new(1, 1, 1);
Title.BackgroundTransparency = 1;
Title.BorderColor3 = Color3.new(0, 0, 0);
Title.BorderSizePixel = 0;
Title.Size = UDim2.new(1, 0, 1, 0);
Title.Visible = true;
Title.Parent = Billboard;
local uistroke = Instance.new("UIStroke");
uistroke.Thickness = 1;
uistroke.Parent = Title;
task.spawn(function()
game:GetService("RunService").RenderStepped:Connect(function()
Title.Text = string.format("%s\n[%sm]", name or child.Name, math.floor((workspace.CurrentCamera.CFrame.Position - child:GetPivot().Position).Magnitude));
end);
end);
end
end
local function CylinderESP(child, name, color, title)
Billboard(child, name, color, title)
local Adornment = Instance.new("CylinderHandleAdornment")
Adornment.Height = child.Size.Y * 2
Adornment.Radius = child.Size.X * 0.75
Adornment.CFrame = CFrame.new(0,0,0) * CFrame.Angles(math.rad(90), 0, 0)
Adornment.Color3 = color
Adornment.Transparency = 0.6
Adornment.AlwaysOnTop = true
Adornment.ZIndex = 10
Adornment.Adornee = child
Adornment.Name = title
Adornment.Parent = child
end
local function BoxESP(child, name, color, title)
Billboard(child, name, color, title)
local Adornment = Instance.new("BoxHandleAdornment")
Adornment.Size = child.Size
Adornment.Color3 = color
Adornment.Transparency = 0.6
Adornment.AlwaysOnTop = true
Adornment.ZIndex = 10
Adornment.Adornee = child
Adornment.Name = title
Adornment.Parent = child
end
local function SphereESP(child, name, color, title)
Billboard(child, name, color, title)
local Adornment = Instance.new("SphereHandleAdornment", child)
Adornment.Radius = child.Size.X * 1.085
Adornment.CFrame = CFrame.new() * CFrame.Angles(math.rad(90), 0, 0)
Adornment.Color3 = color
Adornment.Transparency = 0.6
Adornment.AlwaysOnTop = true
Adornment.ZIndex = 10
Adornment.Adornee = child
Adornment.Name = title
Adornment.Parent = child
end
local function Highlight(child, name, color, title)
Billboard(child, name, color, title)
local Highlight = Instance.new("Highlight")
Highlight.FillColor = color
Highlight.OutlineColor = color
Highlight.FillTransparency = 0.75
Highlight.OutlineTransparency = 0
Highlight.Name = title
Highlight.Adornee = child
Highlight.Parent = child
end

function Distance(part, extra)
	if not extra then extra = 15 end
	if not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or not part then
		return false
	end
	local distanceToPart = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - part.Position).magnitude
	if distanceToPart <= extra then
		return true
	end
	return false
end
local repo = "https://raw.githubusercontent.com/mstudio45/LinoriaLib/main/"

local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()
local Options = getgenv().Linoria.Options
local Toggles = getgenv().Linoria.Toggles

local Window = Library:CreateWindow({
	Title = "YPoint",
	Center = true,
	AutoShow = true,
	Resizable = true,
	ShowCustomCursor = true,
	TabPadding = 2,
	MenuFadeTime = 0
})
local Tab = Window:AddTab("Main")
local Tab2 = Window:AddTab("Explosive")
local Tab3 = Window:AddTab("ESP")
local Tab4 = Window:AddTab("Configs")

local Group = Tab:AddLeftGroupbox("Players")
_G.WalkSpeed = 16
Group:AddSlider("Slider",{
    Text = "WalkSpeed",
    Default = 16,
    Min = 16,
    Max = 25,
    Rounding = 1,
    Compact = true,
    Callback = function(value)
_G.WalkSpeed = value
end})
Group:AddToggle("Toggle",{
    Text = "Instance Interact",
    Default = false,
    Callback = function(value)
_G.Instance = value
while _G.Instance do wait(1)
for _,v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v:IsA("ProximityPrompt") then
v.HoldDuration = 0
v.Enabled = true
end
end
end
end})
game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function()
if _G.FastCloset and game.Players.LocalPlayer.Character:GetAttribute("Hiding")==true then 
game:GetService("ReplicatedStorage").EntityInfo.CamLock:FireServer()end end)
Group:AddToggle("Toggle",{
    Text = "Fast Closet Exit",
    Default = false,
    Callback = function(value)
_G.FastCloset = value
end})

Group:AddToggle("Toggle",{
    Text = "No Wet Floor",
    Default = false,
    Callback = function(value)
game.Players.LocalPlayer.Character.Head.Massless = not value;
game.Players.LocalPlayer.Character.LeftFoot.Massless = not value;
game.Players.LocalPlayer.Character.LeftHand.Massless = not value;
game.Players.LocalPlayer.Character.LeftLowerArm.Massless = not value;
game.Players.LocalPlayer.Character.LeftLowerLeg.Massless = not value;
game.Players.LocalPlayer.Character.LeftUpperArm.Massless = not value;
game.Players.LocalPlayer.Character.LeftUpperLeg.Massless = not value;
game.Players.LocalPlayer.Character.LowerTorso.Massless = not value;
game.Players.LocalPlayer.Character.RightFoot.Massless = not value;
game.Players.LocalPlayer.Character.RightFoot.Massless = not value;
game.Players.LocalPlayer.Character.RightHand.Massless = not value;
game.Players.LocalPlayer.Character.RightLowerArm.Massless = not value;
game.Players.LocalPlayer.Character.RightLowerLeg.Massless = not value;
game.Players.LocalPlayer.Character.RightUpperArm.Massless = not value;
game.Players.LocalPlayer.Character.RightUpperLeg.Massless = not value;
game.Players.LocalPlayer.Character.UpperTorso.Massless = not value;			
end})
Group:AddDivider()
game:GetService("RunService").RenderStepped:Connect(function()
pcall(function()
for _,v in next,game.Players.LocalPlayer.Character:GetDescendants() do 
if v:IsA("BasePart", v) and _G.Noclip then 
v.CanCollide = false
end
end
end)
end)
Group:AddToggle("Toggle",{
	Text = "Noclip",
	Default = false,
	Callback = function(value)
_G.Noclip = value
if _G.Noclip == false then				
v:IsA("BasePart")
v.CanCollide = true
end 
end})
Group:AddDivider()
Group:AddSlider("Slider",{
    Text = "Fly Speed",
    Default = 16,
    Min = 16,
    Max = 25,
    Rounding = 1,
    Compact = true,
    Callback = function()
end})
Group:AddToggle("Toggle",{
    Text = "Fly",
    Default = false
})
local Group2 = Tab:AddRightGroupbox("Auto")
Group2:AddDropdown('Dropdown',{
	Text = "Select Interact",
        Values = {'Gold', 'Fuse', 'Gates Button', 'Generator'},
	Default = 1,
	Multi = true,
	Callback = function(value)
_G.SelectInteract = value
if _G.SelectInteract == "Gold" then
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "GoldPile" or "DrawerContainer" then
if Distance(v:FindFirstChildWhichIsA("BasePart")) and _G.AutoInteract then
spawn(function()
fireproximityprompt(v)									fireproximityprompt(v.ModulePrompt)
end)
end							
end
end					
elseif _G.SelectInteract == "Fuse" then
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "FuseObtain" or "Small_Locker" then
if Distance(v:FindFirstChildWhichIsA("BasePart")) and _G.AutoInteract then
spawn(function()
fireproximityprompt(v)									fireproximityprompt(v.ModulePrompt)
end)
end							
end
end
elseif _G.SelectInteract == "Gates Button" then
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "MinesGateButton" then
if Distance(v:FindFirstChildWhichIsA("BasePart")) and _G.AutoInteract then
spawn(function()
fireproximityprompt(v)									fireproximityprompt(v.ModulePrompt)
end)
end							
end
end
elseif _G.SelectInteract == "Generator" then
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "MinesGenerator" then
if Distance(v:FindFirstChildWhichIsA("BasePart")) and _G.AutoInteract then
spawn(function()
fireproximityprompt(v)									fireproximityprompt(v.ModulePrompt)
end)
end							
end
end
end	
end})
Group2:AddToggle("Toggle",{
    Text = "Auto Interact",
    Default = false,
    Callback = function(value)
_G.AutoInteract = value
end})
Group2:AddToggle("Toggle",{
    Text = "Auto Anchor Code",
    Default = false
})
Group2:AddToggle("Toggle",{
    Text = "Auto WaterPump",
    Default = false
})
local Group3 = Tab:AddRightGroupbox("Misc")

Group3:AddSlider("MaxSlopeAngle",{
    Text = "Max Slope Angle",
    Default = 50,
    Min = 16,
    Max = 100,
    Rounding = 1,
    Compact = true,
    Callback = function(value)
_G.MaxAngle = value
end})

Group3:AddDivider()
Group3:AddToggle("EnableJump",{
    Text = "Enabled Jump",
    Default = false
})
Toggles.EnableJump:OnChanged(function(value)
game.Players.LocalPlayer.Character:SetAttribute("CanJump", value)
end)
Group3:AddDivider()
Group3:AddButton({
    Text = "Play Again",
    DoubleClick = true,
    Func = function()
game.ReplicatedStorage.RemotesFolder.PlayAgain:FireServer()
end})
Group3:AddButton({
    Text = "Lobby",
    DoubleClick = true,
    Func = function()
game.ReplicatedStorage.RemotesFolder.Lobby:FireServer()
end})
Group3:AddButton({
    Text = "Reset",
    DoubleClick = true,
    Func = function()
game.Players.LocalPlayer.Character.Humanoid.Health = 0
end})
Group3:AddButton({
    Text = "Revive",
    DoubleClick = true,
    Func = function()
game.ReplicatedStorage.RemotesFolder.Revive:FireServer()
end})
local Group4 = Tab:AddLeftGroupbox("Reach")
game:GetService("RunService").RenderStepped:Connect(function()
pcall(function()
if _G.OpenDoorFar then game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").ClientOpen:FireServer()
end 
end)
end)
Group4:AddToggle("Toggle",{
    Text = "Reach Door",
    Default = false,
    Callback = function(value)
_G.OpenDoorFar = value
end})
game:GetService("RunService").RenderStepped:Connect(function()
pcall(function()
for _,v in pairs(workspace:GetDescendants()) do 
if v:IsA("ProximityPrompt", v) and _G.PromptClip then 
v.RequiresLineOfSight = true
end
end
end)
end)
Group4:AddToggle("Toggle",{
    Text = "Reach Clip",
    Default = false,
    Callback = function(value)
_G.PromptClip = value
if _G.PromptClip == false then				
v:IsA("ProximityPrompt")
v.RequiresLineOfSight = false
end 
end})
Group4:AddSlider("Slider",{
    Text = "Reach Range",
    Default = 1,
    Min = 1,
    Max = 30,
    Rounding = 1,
    Compact = true,
    Callback = function(value)
while wait(1) do
for _,v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v:IsA("ProximityPrompt") then
v.MaxActivationDistance = value
end
end
end
end})
local Group5 = Tab:AddLeftGroupbox("Notify")
Group5:AddToggle("Toggle",{
    Text = "Notify Entity",
    Default = false,
})
Group5:AddToggle("NotifyOxygen",{
    Text = "Notify Oxygen",
    Default = false
})
Toggles.NotifyOxygen:OnChanged(function(value)
game.Players.LocalPlayer.Character:GetAttributeChangedSignal("Oxygen"):Connect(function()
if game.Players.LocalPlayer.Character:GetAttribute("Oxygen") < 100 then
firesignal(game.ReplicatedStorage:WaitForChild("RemotesFolder").Caption.OnClientEvent, string.format("Oxygen: %.1f", game.Players.LocalPlayer.Character:GetAttribute("Oxygen")))
end 
end)				
end)
Group5:AddDivider()
Group5:AddDropdown('Dropdown',{
	Text = "Select Volume",
        Values = {'1', '2', '3', '4'},
	Default = 1,
	Multi = false,
	Callback = function()
end})
Group5:AddToggle("Toggle",{
    Text = "Play Sound",
    Default = true
})
local Group6 = Tab2:AddLeftGroupbox("Anti-Entity")
Group6:AddToggle("Toggle",{
    Text = "Anti-Eyes",
    Default = false
})
Group6:AddToggle("Toggle",{
    Text = "Anti-Dupe",
    Default = false
})
Group6:AddToggle("Toggle",{
    Text = "Anti-Halt",
    Default = false
})
Group6:AddToggle("Toggle",{
    Text = "Anti-Screech",
    Default = false
})
Group6:AddToggle("Toggle",{
    Text = "Anti-Grumble",
    Default = false
})
Group6:AddToggle("Toggle",{
    Text = "Anti-Giggle",
    Default = false
})
Group6:AddToggle("Toggle",{
    Text = "Anti-Seek Chase",
    Default = false
})
Group6:AddToggle("Toggle",{
    Text = "Anti-Seek Brigde Animation",
    Default = false
})
Group6:AddToggle("Toggle",{
    Text = "Anti-Figure Hear",
    Default = false
})
local Group7 = Tab2:AddRightGroupbox("Camera")
Group7:AddToggle("Toggle",{
    Text = "Third Person",
    Default = false
})
Group7:AddSlider("Slider",{
    Text = "Field Of View",
    Default = 70,
    Min = 70,
    Max = 120,
    Rounding = 1,
    Compact = true,
    Callback = function(value)
_G.FOV = value
end})
Group7:AddToggle("Toggle",{
    Text = "No Camera Shake",
    Default = false
})

Group7:AddToggle("Toggle",{
    Text = "No Light",
    Default = false
})
Group7:AddToggle("AntiLag",{
    Text = "Low Mode",
    Default = false,
    Callback = function(value)
for _, object in pairs(workspace:GetDescendants()) do
        if object:IsA("BasePart") then
            if not object:GetAttribute("Material") then object:SetAttribute("Material", object.Material) end
            if not object:GetAttribute("Reflectance") then object:SetAttribute("Reflectance", object.Reflectance) end

            object.Material = value and Enum.Material.Plastic or object:GetAttribute("Material")
            object.Reflectance = value and 0 or object:GetAttribute("Reflectance")
        elseif object:IsA("Decal") then
            if not object:GetAttribute("Transparency") then object:SetAttribute("Transparency", object.Transparency) end
        end
    end

    workspace.Terrain.WaterReflectance = value and 0 or 1
    workspace.Terrain.WaterTransparency = value and 0 or 1
    workspace.Terrain.WaterWaveSize = value and 0 or 0.05
    workspace.Terrain.WaterWaveSpeed = value and 0 or 8
    game.Lighting.GlobalShadows = not value			
end})
Group7:AddToggle("Toggle",{
    Text = "Fullbright",
    Default = false,
    Callback = function(value)
if value then
game.Lighting.Brightness = 3
game.Lighting.GlobalShadows = false
game.Lighting.OutdoorAmbient = Color3.new(1,1,1)
else
game.Lighting.Brightness = 1
game.Lighting.GlobalShadows = true
game.Lighting.OutdoorAmbient = Color3.new(0,0,0)
end
end})
Group7:AddToggle("NoFog",{
    Text = "No Fog",
    Default = false,
    Callback = function(value)
if not game.Lighting:GetAttribute("FogStart") then game.Lighting:SetAttribute("FogStart", game.Lighting.FogStart) end
    if not game.Lighting:GetAttribute("FogEnd") then game.Lighting:SetAttribute("FogEnd", game.Lighting.FogEnd) end

    game.Lighting.FogStart = value and 0 or Lighting:GetAttribute("FogStart")
    game.Lighting.FogEnd = value and math.huge or game.Lighting:GetAttribute("FogEnd")

    local fog = game.Lighting:FindFirstChildOfClass("Atmosphere")
    if fog then
        if not fog:GetAttribute("Density") then fog:SetAttribute("Density", fog.Density) end

        fog.Density = value and 0 or fog:GetAttribute("Density")
	end
end})
Toggles.NoFog:OnChanged(function(value)
    
end)
Group7:AddToggle("Toggle",{
    Text = "Show FPS",
    Default = false
})
Group7:AddToggle("Toggle",{
    Text = "Show PING",
    Default = false
})
Group7:AddDivider()
Group7:AddSlider("Slider",{
    Text = "Transparency",
    Default = 0.5,
    Min = 0,
    Max = 1,
    Rounding = true,
    Compact = 1,
    Callback = function()
end})
Group7:AddToggle("Toggle",{
    Text = "Hiding Transparency",
    Default = false
})
local Group8 = Tab2:AddRightGroupbox("Troll")
Group8:AddToggle("Toggle",{
    Text = "Spam Emote",
    Default = false
})
Group8:AddToggle("Toggle",{
    Text = "Figure Cant Move",
    Default = false
})
Group8:AddToggle("Toggle",{
    Text = "Bypass Anticheat",
    Default = false
})
local Group9 = Tab3:AddLeftGroupbox("ESP")
Group9:AddToggle("Toggle",{
    Text = "Door ESP",
    Default = false,
    Callback = function(value)
if value then               
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "Door" and v.Parent.Name == "Door" then
Highlight(v, "Door", Color3.fromRGB(80,255,200), "DoorESP")
end		
end					
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "Door" and v.Parent.Name == "Door" then
Highlight(v, "Door", Color3.fromRGB(80,255,200), "DoorESP")
end
end                
ESP1 = workspace.CurrentRooms.ChildAdded:Connect(function(child)                       
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "Door" and v.Parent.Name == "Door" then
Highlight(v, "Door", Color3.fromRGB(80,255,200), "DoorESP")
end
end
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "Door" and v.Parent.Name == "Door" then
Highlight(v, "Door", Color3.fromRGB(80,255,200), "DoorESP")
end
end                        
end)
else
ESP1:Disconnect()
for _, v in pairs(workspace:GetDescendants()) do
if v.Name == "DoorESP" then
v:Destroy()
end
end
end			
end})
Group9:AddToggle("Toggle",{
    Text = "Fuse ESP",
    Default = false,
    Callback = function(value)
if value then               
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "FuseObtain" then
Highlight(v, "Fuse", Color3.fromRGB(80,255,200), "FuseESP")
end		
end					                
ESP2 = workspace.CurrentRooms.ChildAdded:Connect(function(child)                       
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "FuseObtain" then
Highlight(v, "Fuse", Color3.fromRGB(80,255,200), "FuseESP")
end
end                        
end)
else
ESP2:Disconnect()
for _, v in pairs(workspace:GetDescendants()) do
if v.Name == "FuseESP" then
v:Destroy()
end
end
end			
end})
Group9:AddToggle("Toggle",{
    Text = "Generator ESP",
    Default = false,
    Callback = function(value)
if value then               
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "MinesGenerator" then
Highlight(v, "Generator", Color3.fromRGB(80,255,200), "MGESP")
end		
end					                
ESP3 = workspace.CurrentRooms.ChildAdded:Connect(function(child)                       
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "MinesGenerator" then
Highlight(v, "Generator", Color3.fromRGB(80,255,200), "MGESP")
end
end                        
end)
else
ESP3:Disconnect()
for _, v in pairs(workspace:GetDescendants()) do
if v.Name == "MGESP" then
v:Destroy()
end
end
end			
end})
Group9:AddToggle("Toggle",{
    Text = "Fuse ESP",
    Default = false,
    Callback = function(value)
if value then               
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "MinesAnchor" then
Highlight(v, "Anchor", Color3.fromRGB(80,255,200), "MAESP")
end		
end					                
ESP4 = workspace.CurrentRooms.ChildAdded:Connect(function(child)                       
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "MinesAnchor" then
Highlight(v, "Anchor", Color3.fromRGB(80,255,200), "MAESP")
end
end                        
end)
else
ESP4:Disconnect()
for _, v in pairs(workspace:GetDescendants()) do
if v.Name == "MAESP" then
v:Destroy()
end
end
end			
end})
Group9:AddToggle("Toggle",{
    Text = "Pump ESP",
    Default = false,
    Callback = function(value)
if value then               
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "WaterPump" then
Highlight(v, "Pump", Color3.fromRGB(80,255,200), "WPESP")
end		
end					                
ESP5 = workspace.CurrentRooms.ChildAdded:Connect(function(child)                       
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "WaterPump" then
Highlight(v, "Pump", Color3.fromRGB(80,255,200), "WPESP")
end
end                        
end)
else
ESP5:Disconnect()
for _, v in pairs(workspace:GetDescendants()) do
if v.Name == "WPESP" then
v:Destroy()
end
end
end			
end})
Group9:AddToggle("Toggle",{
    Text = "Player ESP",
    Default = false
})
Group9:AddDivider()

Group.Right3:AddToggle('',{
    Text = "Entity ESP", 
    Callback = function(value)
if value then
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "RushNew" and v.Parent.Name == "RushMoving" then
CylinderESP(v, "Rush", v.Color, "RushESP")
elseif v.Name == "RushNew" and v.Parent.Name == "AmbushMoving" then
CylinderESP(v, "Ambush", v.Color, "AmbushESP")
elseif v.Name == "Hitbox" and v.Parent.Name == "FigureRig" then
CylinderESP(v, "Figure", Color3.fromRGB(255, 60, 60), "FigureESP")
elseif v.Name == "Handle" and v.Parent.Name == "GiggleCeiling" then
CylinderESP(v, "Giggle", Color3.fromRGB(255,0,0), "TrapGiggleESP")
elseif v.Name == "SeekMovingNewClone" then
Highlight(v, "Seek", Color3.fromRGB(30,30,30), "SeekESP")
elseif v.Name == "Core" and v.Parent.Name == "Eyes" then
SphereESP(v, "Eyes", v.Color, "EyesESP")						
end
end
ESP8 = workspace.CurrentRooms.ChildAdded:Connect(function(child)
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "RushNew" and v.Parent.Name == "RushMoving" then
CylinderESP(v, "Rush", v.Color, "RushESP")
elseif v.Name == "RushNew" and v.Parent.Name == "AmbushMoving" then
CylinderESP(v, "Ambush", v.Color, "AmbushESP")
elseif v.Name == "Hitbox" and v.Parent.Name == "FigureRig" then
CylinderESP(v, "Figure", Color3.fromRGB(255, 60, 60), "FigureESP")
elseif v.Name == "Handle" and v.Parent.Name == "GiggleCeiling" then
CylinderESP(v, "Giggle", Color3.fromRGB(255,0,0), "TrapGiggleESP")
elseif v.Name == "SeekMovingNewClone" then
Highlight(v, "Seek", Color3.fromRGB(30,30,30), "SeekESP")
elseif v.Name == "Core" and v.Parent.Name == "Eyes" then
SphereESP(v, "Eyes", v.Color, "EyesESP")						
end
end
end)
else
ESP8:Disconnect()
for _, v in pairs(workspace:GetDescendants()) do
if v.Name == "RushESP" then
v:Destroy()
elseif v.Name == "AmbushESP" then
v:Destroy()
elseif v.Name == "FigureESP" then
v:Destroy()
elseif v.Name == "TrapGiggleESP" then
v:Destroy()
elseif v.Name == "SeekESP" then
v:Destroy()
elseif v.Name == "EyesESP" then
v:Destroy()	
end
end
end 
end})
local Group10 = Tab3:AddRightGroupbox("ESP Setting")
Group10:AddToggle("Toggle",{
    Text = "Show Highlight",
    Default = false
})
Group10:AddSlider("Slider",{
    Text = "Fill Transparency",
    Default = 0.5,
    Min = 0,
    Max = 1,
    Rounding = 1,
    Compact = true,
    Callback = function()
end})
Group10:AddSlider("Slider",{
    Text = "Outline Transparency",
    Default = 0,
    Min = 0,
    Max = 1,
    Rounding = 1,
    Compact = true,
    Callback = function()
end})
game:GetService("RunService").RenderStepped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.WalkSpeed
game.Players.LocalPlayer.Character.Humanoid.MaxSlopeAngle = _G.MaxAngle
workspace.CurrentCamera.FieldOfView = _G.FOV or 70
end)
