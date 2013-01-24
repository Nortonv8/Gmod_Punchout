/*-------------------------------------------------------------------------------------------------------------------------
	Achievements!
-------------------------------------------------------------------------------------------------------------------------*/

local PLUGIN = {}
PLUGIN.Title = "Achievements"
PLUGIN.Description = "To see what achievements you have!"
PLUGIN.Author = "Matt J"
PLUGIN.ChatCommand = "achievements"
PLUGIN.Usage = "[name]"

function PLUGIN:Call( ply, args )
	local arg = string.Implode(" ", args)
	
	if not args[1] then
		GPO:Notify(ply, GPO.colors.white, "Achievements:")
		for k,v in ipairs(GPO.Achievements) do
			timer.Simple((k/2), function()
				if ply:Achieved(v) then
					GPO:Notify(ply, GPO.colors.white, v.name .. ": ", GPO.colors.blue, "Achieved", GPO.colors.white, ".")
				else
					GPO:Notify(ply, GPO.colors.white, v.name .. ": ", GPO.colors.red, "Not Achieved", GPO.colors.white, ".")
				end
			end)
		end
		return
	end
	
	for k,v in pairs(GPO.Achievements) do
		if string.lower(arg) == string.lower(v.name) then
			GPO:Notify(ply, GPO.colors.white, "Name: ", GPO.colors.blue, v.name)
			GPO:Notify(ply, GPO.colors.white, "Description: ", GPO.colors.blue, v.desc)
			GPO:Notify(ply, GPO.colors.white, "Reward: ", GPO.colors.blue,  "$" .. v.reward)
			if v.total then
				GPO:Notify(ply, GPO.colors.white, "Progress: ", GPO.colors.blue, tostring(ply:GetPData("GPOAch-"..v.name.."-Progress", 0)), GPO.colors.white, "/", GPO.colors.blue, tostring(v.total))
			end
			if ply:Achieved(v) then
				GPO:Notify(ply, GPO.colors.white, "Achieved: ", GPO.colors.blue, "Yes")
			else
				GPO:Notify(ply, GPO.colors.white, "Achieved: ", GPO.colors.red, "No")
			end
			return
		end
	end
end

GPO:AddPlugin( PLUGIN )