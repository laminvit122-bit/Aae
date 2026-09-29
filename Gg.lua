local RS = game:GetService("ReplicatedStorage")
local gunBeam = RS.WeaponEvents:WaitForChild("GunBeam")
local knifeStab = RS.WeaponEvents:WaitForChild("KnifeStabbed")
local knifeThrow = RS.WeaponEvents:WaitForChild("KnifeThrown")

if hookmetamethod then
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        if self == gunBeam and method == "FireServer" then
            print("=== GunBeam:FireServer ===")
            for i, arg in ipairs({...}) do
                print("  [" .. i .. "]:", typeof(arg), tostring(arg))
            end
        elseif self == knifeStab and method == "FireServer" then
            print("=== KnifeStabbed:FireServer ===")
            for i, arg in ipairs({...}) do
                print("  [" .. i .. "]:", typeof(arg), tostring(arg))
            end
        elseif self == knifeThrow and method == "FireServer" then
            print("=== KnifeThrown:FireServer ===")
            for i, arg in ipairs({...}) do
                print("  [" .. i .. "]:", typeof(arg), tostring(arg))
            end
        end
        return oldNamecall(self, ...)
    end)
    print("[Bonny Hub] Hook установлен! Стреляй / бей ножом")
end
