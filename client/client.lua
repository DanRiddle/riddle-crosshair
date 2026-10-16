-- Config
local CUSTOM_CROSSHAIR = true            -- true = plain dot crosshair, false = GTA crosshair hidden briefly after kills
local DOT_SIZE = 0.004
local DOT_COLOR = { 255, 255, 255, 200 }
local BORDER_SIZE = 0.001                -- 0 = no border
local BORDER_COLOR = { 0, 0, 0, 200 }
local HIDE_TIME = 1000                   -- ms, only used when CUSTOM_CROSSHAIR = false

local hideUntil = 0

local function hideReticle()
    local wasHiding = hideUntil > GetGameTimer()
    hideUntil = GetGameTimer() + HIDE_TIME
    if wasHiding then return end

    CreateThread(function()
        while GetGameTimer() < hideUntil do
            HideHudComponentThisFrame(14)
            Wait(0)
        end
    end)
end

local SNIPER_GROUP = `GROUP_SNIPER`

if CUSTOM_CROSSHAIR then
    CreateThread(function()
        local playerId = PlayerId()
        while true do
            local ped = PlayerPedId()
            local _, weapon = GetCurrentPedWeapon(ped, true)
            local aiming = IsPlayerFreeAiming(playerId) and GetWeapontypeGroup(weapon) ~= SNIPER_GROUP

            if aiming then
                HideHudComponentThisFrame(14)
                local aspect = GetAspectRatio(false)
                local w = DOT_SIZE / aspect
                if BORDER_SIZE > 0 then
                    local bh = DOT_SIZE + BORDER_SIZE * 2
                    DrawRect(0.5, 0.5, bh / aspect, bh, BORDER_COLOR[1], BORDER_COLOR[2], BORDER_COLOR[3], BORDER_COLOR[4])
                end
                DrawRect(0.5, 0.5, w, DOT_SIZE, DOT_COLOR[1], DOT_COLOR[2], DOT_COLOR[3], DOT_COLOR[4])
                Wait(0)
            else
                Wait(150)
            end
        end
    end)
end

AddEventHandler('gameEventTriggered', function(name, args)
    if CUSTOM_CROSSHAIR then return end
    if name ~= 'CEventNetworkEntityDamage' then return end

    local victim, attacker = args[1], args[2]
    if attacker ~= PlayerPedId() then return end
    if not DoesEntityExist(victim) or not IsEntityAPed(victim) then return end
    if not IsEntityDead(victim) then return end

    hideReticle()
end)
