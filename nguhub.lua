local plr = game:GetService("Players").LocalPlayer
local old;
local i = 0
request  = (syn and syn.request or http_request or http.request)
old = hookfunction(request, newcclosure(function(newreq)
    if newreq.Url:find("discord") or newreq.Url:find("webhook") then
        i = i + 1
        writefile("Webhook " .. tostring(i), newreq.Url)
        print("\n")
        print(newreq.Url)
        setclipboard(newreq.Url)
        warn("Blocked webhook!")
        return
    end
    return old(newreq)
end))

local i2 = 0
local old;
old = hookfunction(game.HttpGet, newcclosure(function(olgame, url)
    if url and string.find(url, "http") and url ~= "https://raw.githubusercontent.com/menucathub/Scripthub/refs/heads/main/KaitunCattaihub.lua" then
        writefile("http log", tostring(url))
        i2 = i2 + 1
        return old(olgame, url)
    end
    return old(olgame, url)
end))
loadstring(game:HttpGet("https://raw.githubusercontent.com/menucathub/Scripthub/refs/heads/main/KaitunCattaihub.lua"))()
