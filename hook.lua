task.delay(15, function()
	if hookfunction and not islclosure(hookfunction) then
		workspace._WorldOrigin.ChildAdded:Connect(function(obj)
			if obj.Name == 'DamageCounter' then
				obj.Enabled = false
			end
		end)
		hookfunction(require(game:GetService("ReplicatedStorage").Effect.Container.Death), function() end)
		hookfunction(require(game:GetService("ReplicatedStorage").Effect.Container.Respawn), function() end)
		hookfunction(require(game:GetService("ReplicatedStorage"):WaitForChild("GuideModule")).ChangeDisplayedNPC, function() end)
        task.spawn(function()
			local _v1, _v2
			repeat
				_v1, _v2 = pcall(function()
					for i, v in pairs(getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))[2].activeController.data) do
						if typeof(v) == 'function' then
							hookfunction(v, function()
							end)
						end
					end
				end)
				task.wait(1.5)
			until _v1
		end)
	end
end)

