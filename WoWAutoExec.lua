---@diagnostic disable: undefined-global

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")

f:SetScript("OnEvent", function()
    local delayFrame = CreateFrame("Frame")
    local startTime = GetTime()

    delayFrame:SetScript("OnUpdate", function()
        if GetTime() - startTime >= 1 then
            delayFrame:SetScript("OnUpdate", nil)

            local profileStart = debugprofilestop()

            -- Execute the command
            ChatFrame1.editBox:SetText("/db taxi")
            ChatEdit_SendText(ChatFrame1.editBox, 0)

            -- Close the map (if it opened)
            local closeMapFrame = CreateFrame("Frame")
            local closeStart = GetTime()

            closeMapFrame:SetScript("OnUpdate", function()
                if GetTime() - closeStart >= 0.1 then
                    closeMapFrame:SetScript("OnUpdate", nil)
                    if WorldMapFrame:IsShown() then
                        HideUIPanel(WorldMapFrame)
                    end
                end
            end)

            local profileEnd = debugprofilestop()
            ChatFrame1:AddMessage(string.format("Command ran in %.3f ms", profileEnd - profileStart))
        end
    end)
end)
