local ESP = {}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local ESPCache = {}

function ESP:Toggle(State)
    if State then
        for _, Player in pairs(Players:GetPlayers()) do
            if Player ~= Players.LocalPlayer then
                local Highlight = Instance.new("Highlight")
                Highlight.Parent = Player.Character
                ESPCache[Player] = Highlight
            end
        end
    else
        for Player, Highlight in pairs(ESPCache) do
            Highlight:Destroy()
        end
        table.clear(ESPCache)
    end
end

return ESP