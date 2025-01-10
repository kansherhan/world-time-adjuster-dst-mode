local _G = GLOBAL

local PREV_KEY = _G["KEY_F9"]
local NEXT_KEY = _G["KEY_F10"]

local multipliers = { 0.25, 0.5, 1, 1.25, 1.5, 1.75, 2, 2.5, 3, 4, 5 }

local multiplierArraySize = #multipliers
local currentMultiplierIndex = 3

local function ToggleWorldTimeSpeedMode()
    local currentMultiplier = multipliers[currentMultiplierIndex]

    local text = string.format("Time speed: x%.2f", currentMultiplier)

    _G.TheSim:SetTimeScale(currentMultiplier)
    _G.ThePlayer.components.talker:Say(text)
end

_G.TheInput:AddKeyUpHandler(PREV_KEY, function(key)
    if currentMultiplierIndex - 1 >= 1 then
        currentMultiplierIndex = currentMultiplierIndex - 1

        ToggleWorldTimeSpeedMode()
    end
end)

_G.TheInput:AddKeyUpHandler(NEXT_KEY, function(key)
    if currentMultiplierIndex + 1 <= multiplierArraySize then
        currentMultiplierIndex = currentMultiplierIndex + 1

        ToggleWorldTimeSpeedMode()
    end
end)
