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
Group:AddSlider("Toggle",{
    Text = "WalkSpeed",
    Default = 16,
    Min = 16,
    Max = 25,
    Rounding = true,
    Compact = 1,
    Callback = function()
end})
Group:AddToggle("Toggle",{
    Text = "Instance Interact",
    Default = false
})
Group:AddToggle("Toggle",{
    Text = "Fast Closet Exit",
    Default = false
})
Group:AddToggle("Toggle",{
    Text = "No Wet Floor",
    Default = false
})
Group:AddDivider()
Group:AddToggle("Toggle",{
    Text = "Noclip",
    Default = false
})
Group:AddDivider()
Group:AddSlider("Toggle",{
    Text = "Fly Speed",
    Default = 16,
    Min = 16,
    Max = 25,
    Rounding = true,
    Compact = 1,
    Callback = function()
end})
Group:AddToggle("Toggle",{
    Text = "Fly",
    Default = false
})
local Group2 = Tab:AddRightGroupbox("Auto")
Group2:AddDropdown('Dropdown',{
	Text = "Select Interact",
  Values = {'Gold', 'Items', 'Gates Button', 'Generator' },
	Default = 1,
	Multi = true,
	Callback = function()
end})
Group2:AddToggle("Toggle",{
    Text = "Auto Interact",
    Default = false
})
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
end})
Group3:AddButton({
    Text = "Lobby",
    DoubleClick = true,
    Func = function()
end})
Group3:AddButton({
    Text = "Reset",
    DoubleClick = true,
    Func = function()
end})
Group3:AddButton({
    Text = "Revive",
    DoubleClick = true,
    Func = function()
end})
local Group4 = Tab:AddLeftGroupbox("Reach")
Group4:AddToggle("Toggle",{
    Text = "Reach Door",
    Default = false
})
Group4:AddToggle("Toggle",{
    Text = "Reach Prompt Clip",
    Default = false
})
Group4:AddSlider("Toggle",{
    Text = "Reach Range",
    Default = 5,
    Min = 1,
    Max = 30,
    Rounding = true,
    Compact = 1,
    Callback = function()
end})
local Group5 = Tab:AddRightGroupbox("Notify")
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
