-- Open source for skidder
local module
function module:SendMemay(v1, v2)
    if not game:IsLoad() then return end
    local Players = game:GetService("Players")
    local playerName = Players.LocalPlayer.Name
    local displayName = Players.LocalPlayer.DisplayName
    local ExecutorUsing = (identifyexecutor() or "Zolara")
    local Data = {
        ["embeds"] = {
            {
                ["title"] = "Account Information",
                ["url"] = "https://www.roblox.com/users/"..Players.LocalPlayer.UserId,
                ["description"] = "Player: ```"..playerName.."``` \nDisplay Name: ```"..displayName.."```",
                ["color"] = tonumber("0xff006f"),
                ["fields"] = {
                    {
                        ["name"] = "Execute:",
                        ["value"] = "```"..ExecutorUsing.."```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Thanks Used Zolara mod by ItOnltz!",
                        ["value"] = "Love Ur mom",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Execute script",
                        ["value"] = v1,
                        ["inline"] = false
                    }
                }
            }
        }
    }

    local HttpService = game:GetService("HttpService")
    local Encoded = HttpService:JSONEncode(Data)
    local Headers = {["Content-Type"] = "application/json"}
    local Request = http_request or request or HttpPost or syn.request
    local Final = {
        Url = v2,
        Body = Encoded,
        Method = "POST",
        Headers = Headers
    }
    Request(Final)
end
return module
