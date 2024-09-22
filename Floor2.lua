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
game:GetService("RunService").RenderStepped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.WalkSpeed
end)
Group:AddToggle("Toggle",{
    Text = "Instance Interact",
    Default = false,
    Callback = function(value, value2)
_G.Instance = value
while _G.Instance do wait(1)
for _,v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v:IsA("ProximityPrompt") then
v.HoldDuration = 0
v.Enabled = value2
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
spawn(function()								fireproximityprompt(v.ModulePrompt)
end)
end							
end
end					
elseif _G.SelectInteract == "Fuse" then
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "FuseObtain" or "Small_Locker" then
if Distance(v:FindFirstChildWhichIsA("BasePart")) and _G.AutoInteract then
spawn(function()								fireproximityprompt(v.ModulePrompt)
end)
end							
end
end
elseif _G.SelectInteract == "Gates Button" then
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "MinesGateButton" then
if Distance(v:FindFirstChildWhichIsA("BasePart")) and _G.AutoInteract then
spawn(function()								fireproximityprompt(v.ModulePrompt)
end)
end							
end
end
elseif _G.SelectInteract == "Generator" then
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "MinesGenerator" then
if Distance(v:FindFirstChildWhichIsA("BasePart")) and _G.AutoInteract then
spawn(function()								fireproximityprompt(v.ModulePrompt)
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
Group3:AddToggle("Toggle",{
    Text = "Fast Ladder",
    Default = false
})
Group3:AddSlider("Toggle",{
    Text = "Ladder Speed",
    Default = 50,
    Min = 16,
    Max = 100,
    Rounding = true,
    Compact = 1,
    Callback = function()
end})
Group3:AddDivider()
Group3:AddToggle("Toggle",{
    Text = "Enabled Jump",
    Default = false
})
Group3:AddDivider()
Group3:AddButton({
    Text = "Play Again",
    DoubleClick = true,
    Func = function()
game.ReplicatedStorage:WaitForChild("RemotesFolder").PlayAgain:FireServer()
end})
Group3:AddButton({
    Text = "Lobby",
    DoubleClick = true,
    Func = function()
game.ReplicatedStorage:WaitForChild("RemotesFolder").Lobby:FireServer()
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
game.ReplicatedStorage:WaitForChild("RemotesFolder").Revive:FireServer()
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
    Rounding = true,
    Compact = 1,
    Callback = function(value)
while true do
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
    Default = false
})
Group5:AddToggle("Toggle",{
    Text = "Notify Oxygen",
    Default = false
})
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
    Rounding = true,
    Compact = 1,
    Callback = function()
end})
Group7:AddToggle("Toggle",{
    Text = "No Camera Shake",
    Default = false
})
Group7:AddToggle("Toggle",{
    Text = "No Cutscenes",
    Default = false
})
Group7:AddToggle("Toggle",{
    Text = "No Light",
    Default = false
})
Group7:AddToggle("Toggle",{
    Text = "Low Mode",
    Default = false
})
Group7:AddToggle("Toggle",{
    Text = "Fullbright",
    Default = false
})
Group7:AddToggle("Toggle",{
    Text = "No Fog",
    Default = false
})
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
    Default = false
})
Group9:AddToggle("Toggle",{
    Text = "Fuse ESP",
    Default = false
})
Group9:AddToggle("Toggle",{
    Text = "Generator ESP",
    Default = false
})
Group9:AddToggle("Toggle",{
    Text = "Anchor ESP",
    Default = false
})
Group9:AddToggle("Toggle",{
    Text = "WaterPump ESP",
    Default = false
})
Group9:AddToggle("Toggle",{
    Text = "Toolbox ESP",
    Default = false
})
Group9:AddToggle("Toggle",{
    Text = "Items ESP",
    Default = false
})
Group9:AddToggle("Toggle",{
    Text = "Player ESP",
    Default = false
})
Group9:AddDivider()
Group9:AddDropdown('Dropdown',{
	Text = "Select Entity ESP",
        Values = {'Rush', 'Ambush', 'Giggle', 'Figure', 'Seek', 'Grumble'},
	Default = {'1','2','3','4','5','6'},
	Multi = true,
	Callback = function()
end})
Group9:AddToggle("Toggle",{
    Text = "Entity ESP",
    Default = false
})
local Group10 = Tab3:AddRightGroupbox("ESP Setting")
Group10:AddToggle("Toggle",{
    Text = "Show Distance",
    Default = false
})
Group10:AddToggle("Toggle",{
    Text = "Show Highlight",
    Default = false
})
Group10:AddSlider("Slider",{
    Text = "Fill Transparency",
    Default = 0.5,
    Min = 0,
    Max = 1,
    Rounding = true,
    Compact = 1,
    Callback = function()
end})
Group10:AddSlider("Slider",{
    Text = "Outline Transparency",
    Default = 0,
    Min = 0,
    Max = 1,
    Rounding = true,
    Compact = 1,
    Callback = function()
end})
