local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("dansUI", "BloodTheme")

if game.PlaceId == 11708967881 then
    getgenv().Stars = false;
    function Collect()
        spawn(function ()
            while getgenv().Stars do
                for i, v in pairs(game:GetService("Workspace").Stars:GetChildren()) do
    local args = {[1] = v.Name} game:GetService("ReplicatedStorage").Remote.Star.Server.Collect:FireServer(unpack(args))
                end wait()
            end
        end)
    end
    local Main = Window:NewTab("Main")
    local Farming = Main:NewSection("Farming")
    Farming:NewToggle("Auto Collect Stars", "Auto collects stars.", function(state)
        if state then
            getgenv().Stars = val
            Collect()
        else
            getgenv().Stars = false
        end
    end)
else
    local Tab = Window:NewTab("")
    local Section = Tab:NewSection("Not Supported.")
end

local Other = Window:NewTab("Other")
local Speed = Other:NewSection("Speed Hacks")
local Misc = Other:NewSection("Miscellaneous")
Speed:NewButton("Go Fast", "Sets your speed to 70.", function()
    local speed = 70

	local function setSpeedForPlayer(player)
		local character = player.Character
		if character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				humanoid.WalkSpeed = speed
				humanoid.JumpPower = speed * 1.5
			end
		end
	end

	local function onPlayerAdded(player)
		if player == game:GetService("Players").LocalPlayer then
			setSpeedForPlayer(player)
		end
	end

	game:GetService("Players").PlayerAdded:Connect(onPlayerAdded)

	-- Example usage: set speed for the LocalPlayer
	if game:GetService("Players").LocalPlayer then
		setSpeedForPlayer(game:GetService("Players").LocalPlayer)
	end
end)
Speed:NewButton("Go Faster", "Sets your speed to 100.", function()
    local speed = 100

	local function setSpeedForPlayer(player)
		local character = player.Character
		if character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				humanoid.WalkSpeed = speed
				humanoid.JumpPower = speed * 1.5
			end
		end
	end

	local function onPlayerAdded(player)
		if player == game:GetService("Players").LocalPlayer then
			setSpeedForPlayer(player)
		end
	end

	game:GetService("Players").PlayerAdded:Connect(onPlayerAdded)

	-- Example usage: set speed for the LocalPlayer
	if game:GetService("Players").LocalPlayer then
		setSpeedForPlayer(game:GetService("Players").LocalPlayer)
	end
end)
Misc:NewKeybind("ToggleUI Keybind", "Sets the Keybind that toggles the UI.", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)
