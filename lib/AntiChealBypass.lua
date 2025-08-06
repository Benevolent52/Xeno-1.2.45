local ACB = {}

local Memory = require(game:GetService("ReplicatedStorage").Memory
local Detours = {}

function ACB:HookFunction(OriginalFunc, NewFunc)
    if Detours[OriginalFunc] then return false end
    Detours[OriginalFunc] = NewFunc
    return true
end

function ACB:DisableCheatDetection()
    -- Fake memory patching
    local success = pcall(function()
        Memory.WriteUInt(0x7FF00000, 0x90, 4) -- NOP
    end)
    
    if success then
        print("[Xeno] AC checks disabled")
    else
        warn("[Xeno] Failed to patch memory!")
    end
end

return ACB