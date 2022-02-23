-- Instances:

if game.PlaceId == 979209050 then

local _ModCountFrame = Instance.new("ImageButton")
local ModIcon = Instance.new("ImageLabel")
local ModCount = Instance.new("TextLabel")

printconsole("NHC Mod Count UI: Successfully executed.", 76, 175, 80)

--Properties:

_ModCountFrame.Name = "_ModCountFrame"
	
local BankFrameChildren = game:GetService("Players").LocalPlayer.PlayerGui.Information.BottomLeftFrame.BankFrame:GetChildren()
for i = 2, #BankFrameChildren do
	_ModCountFrame.Parent = BankFrameChildren[i]
end
	
_ModCountFrame.BackgroundTransparency = 1.000
_ModCountFrame.BorderSizePixel = 0
_ModCountFrame.ClipsDescendants = true
_ModCountFrame.Size = UDim2.new(0, 67, 1, 0)
_ModCountFrame.Image = "rbxassetid://297827033"
_ModCountFrame.ImageColor3 = Color3.fromRGB(76, 175, 80)
_ModCountFrame.ImageTransparency = 0.600
_ModCountFrame.ScaleType = Enum.ScaleType.Slice
_ModCountFrame.SliceCenter = Rect.new(5, 5, 45, 45)

ModIcon.Name = "ModIcon"
ModIcon.Parent = _ModCountFrame
ModIcon.BackgroundTransparency = 1.000
ModIcon.Position = UDim2.new(0, 9, 0, 9)
ModIcon.Size = UDim2.new(0, 22, 0, 22)
ModIcon.Image = "rbxasset://textures/ui/PlayerList/developer.png"
ModIcon.ImageRectSize = Vector2.new(22, 22)

ModCount.Name = "ModCount"
ModCount.Parent = _ModCountFrame
ModCount.BackgroundTransparency = 1.000
ModCount.Position = UDim2.new(0, 39, 0, 8)
ModCount.Size = UDim2.new(1, -47, 1, -16)
ModCount.Font = Enum.Font.SourceSans
ModCount.Text = "0"
ModCount.TextColor3 = Color3.fromRGB(255, 255, 255)
ModCount.TextSize = 24.000
ModCount.TextXAlignment = Enum.TextXAlignment.Right

-- Scripts:

local function MZUMI_fake_script() -- ModCount.LocalScript 
	local script = Instance.new('LocalScript', ModCount)

	local u3 = require(game:GetService("Players").LocalPlayer.PlayerScripts.CoreClient.NotificationHandler)
	local IngameMods = 0
	local ModsNames = {}
	
	local mods = {
		--[ Admins ]--
		347046576,  	--cityWARE
		9822618,	--KarlXYZ
		1896312,	--PortcullisHouse/Ewan_JK
		33537354,	--FIoatmanjason 
		21604017,	--Daithi_McE
		237598509,	--Brian_McDoogle
		2300812, 	--harry33333
		
		--[ Mods ]--
		45374368,	--JamesPawley
		44560101, 	--Dino_Raf
		19170507,	--ERIC1978
		75555863, 	--FrancisHUnderwood
		3616260,	--frostbleed 
		16129523,	--LordHenryVonHenry
		125094086, 	--madbananakiller
		22752246, 	--unbecomingguy
		11658534, 	--USArmy30
		30283186,	--Mwalle921
		1367612,	--Larry_Gallahan
		21617604,	--tricknixon
		263126533,	--tripnixon
		36265249,	--Shad_A
		101506877,	--TTEMB
		68295197,	--DomdullahAinsley
		484765829,	--dj_13dj 
		42900508, 	--Dominic8u
		83047695,	--Timshep07
		25485871,	--Dobblo 
	}
	
	local function findValue(whichArray, value)
		for currentIndex = 1, #whichArray do
			if whichArray[currentIndex] == value then
				return currentIndex
			end
		end
	end
	
	for _, player in pairs(game.Players:GetPlayers()) do
		if table.find(mods, player.UserId) then 
			IngameMods = IngameMods + 1
			table.insert(ModsNames, player.Name)
		end
	end
	
	if IngameMods > 0 then
		_ModCountFrame.ImageColor3 = Color3.fromRGB(244,67,54)
		u3.NewNotification("A moderator is in game.", "Moderator in Game!", "Green")
		ModCount.Text = IngameMods
	elseif IngameMods == 0 then
		_ModCountFrame.ImageColor3 = Color3.fromRGB(76,175,80)
		u3.NewNotification("There are no moderators in game.", "No Moderator(s) in Game!", "Green")
		ModCount.Text = IngameMods
	end
	
	game.Players.PlayerAdded:Connect(function(player)
	
		if table.find(mods, player.UserId) then 
			IngameMods = IngameMods + 1
			table.insert(ModsNames, player.Name)
			u3.NewNotification(player.Name .. " has joined.", "Moderator Joined!", "Green")
			
			if IngameMods > 0 then
				_ModCountFrame.ImageColor3 = Color3.fromRGB(244,67,54)
				ModCount.Text = IngameMods
			elseif IngameMods == 0 then
				_ModCountFrame.ImageColor3 = Color3.fromRGB(76,175,80)
				ModCount.Text = IngameMods
			end
		end
	end)
	
	game.Players.PlayerRemoving:Connect(function(player)
		
		if table.find(mods, player.UserId) then 
			IngameMods = IngameMods - 1
			u3.NewNotification(player.Name .. " has left.", "Moderator Left!", "Green")
			
			local valueFound = findValue(ModsNames, player.Name)
			
			if valueFound then
				table.remove(ModsNames, valueFound)
			end
			
			if IngameMods > 0 then
				_ModCountFrame.ImageColor3 = Color3.fromRGB(244,67,54)
				ModCount.Text = IngameMods
			elseif IngameMods == 0 then
				_ModCountFrame.ImageColor3 = Color3.fromRGB(76,175,80)
				ModCount.Text = IngameMods
			end
		end
	end)
	
	_ModCountFrame.MouseButton1Click:Connect(function()
		if #ModsNames > 0 then
			local ListOfIngameMods = table.concat(ModsNames, "\n- ")
			u3.NewNotification("- " .. ListOfIngameMods, "Moderator(s) in Game:", "Green", true)
		elseif #ModsNames == 0 then
			u3.NewNotification("There are no moderators in game.", "No Moderator(s) in Game!", "Green", true)
		end
	end)
	
end
coroutine.wrap(MZUMI_fake_script)()
	
else
	printconsole("NHC Mod Count UI: This is not NHC. Unable to execute.", 244, 67, 54)
end
