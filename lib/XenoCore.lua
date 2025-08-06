local XenoCore = {}

function XenoCore:Init()
    if not _G.XenoLoaded then
        _G.XenoLoaded = true
        self.Hooks = {}
        self.Modules = {}
        print("[Xeno] Core initialized successfully")
    else
        warn("[Xeno] Core already running!")
    end
end

function XenoCore:AddHook(HookName, Callback)
    if typeof(Callback) == "function" then
        self.Hooks[HookName] = Callback
        return true
    end
    return false
end

function XenoCore:LoadModule(ModuleScript)
    local success, mod = pcall(require, ModuleScript)
    if success then
        table.insert(self.Modules, mod)
        return mod
    end
    return nil
end

return XenoCore