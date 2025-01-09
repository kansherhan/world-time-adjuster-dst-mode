local _G = GLOBAL

local keys = {
    PREV_KEY = "KEY_F9",
    NEXT_KEY = "KEY_F10"
}

local multipliers = { 0.25, 0.5, 1, 2, 4, 8, 10, 20 }

local multiplierArraySize = #multipliers
local currentMultiplierIndex = 3

local function ToggleWorldTimeSpeedMode()
    local currentMultiplier = multipliers[currentMultiplierIndex]

    local text = string.format("Time speed: x%.2f", currentMultiplier)

    _G.TheSim:SetTimeScale(currentMultiplier)
    _G.ThePlayer.components.talker:Say(text)
end

_G.TheInput:AddKeyUpHandler(_G[keys.PREV_KEY], function(key)
    if currentMultiplierIndex - 1 >= 1 then
        currentMultiplierIndex = currentMultiplierIndex - 1
    else
        currentMultiplierIndex = multiplierArraySize
    end

    ToggleWorldTimeSpeedMode()
end)

_G.TheInput:AddKeyUpHandler(_G[keys.NEXT_KEY], function(key)
    if currentMultiplierIndex + 1 <= multiplierArraySize then
        currentMultiplierIndex = currentMultiplierIndex + 1
    else
        currentMultiplierIndex = 1
    end

    ToggleWorldTimeSpeedMode()
end)
