--coded by cub :3--
--coded by cub :3--
--coded by cub :3--
--coded by cub :3--
--coded by cub :3--
--coded by cub :3--


local Settings = {
    Enabled = false, -- if true it will be on when you join game false it will be off and you can turn it on with the keybind
    Keybind = Enum.KeyCode.T
}

local Players      = game:GetService("Players")
local lp           = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() and Players.LocalPlayer
local mouse        = lp:GetMouse()
local InputService = game:GetService("UserInputService")

local function gettarget(instance)
   for i,v in ipairs(Players:GetPlayers()) do
      if v.Character and (instance == v.Character or instance:IsDescendantOf(v.Character)) then
         return true
      end
   end
   return false
end

local con
con = game:GetService("RunService").Heartbeat:Connect(function()
    if Settings.Enabled == true then
        if gettarget(mouse.Target) then
            mouse1press()
            task.wait()
            mouse1release()
        end
    end
end)

getgenv().disable = function()
   warn("Disconnecting:",con)
   con:Disconnect()
end

InputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent then
        if input.KeyCode == Settings.Keybind then
            Settings.Enabled = not Settings.Enabled
        end
    end
end)
