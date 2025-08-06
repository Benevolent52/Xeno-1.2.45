local FlyLib = {}

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Character = nil
local Humanoid = nil
local FlyActive = false
local FlyVelocity = Vector3.new(0, 0, 0)

function FlyLib:ToggleFly()
    if not Character then
        Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        Humanoid = Character:WaitForChild("Humanoid")
    end

    FlyActive = not FlyActive

    if FlyActive then
        Humanoid:ChangeState(Enum.HumanoidStateType.Flying)
        print("[Xeno] Fly enabled")
    else
        Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
        print("[Xeno] Fly disabled")
    end
end

UIS.InputBegan:Connect(function(Input, GameProcessed)
    if not GameProcessed then
        if Input.KeyCode == Enum.KeyCode.F then
            FlyLib:ToggleFly()
        end
    end
end)

return FlyLib