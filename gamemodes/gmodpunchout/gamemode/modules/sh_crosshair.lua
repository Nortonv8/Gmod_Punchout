if CLIENT then
	function GPO:ShouldDrawCrosshair()
		if LocalPlayer():InVehicle() then return false end
		
		return true
	end

	hook.Add( "HUDPaint", "Crosshair-GmodPunchout", function()
		if GPO:ShouldDrawCrosshair() then
			local pos = LocalPlayer():GetEyeTraceNoCursor().HitPos:ToScreen()
			surface.SetDrawColor(Color(255,255,255))
			surface.DrawLine( pos.x, pos.y + 12, pos.x, pos.y - 12 )
			surface.DrawLine( pos.x - 12, pos.y, pos.x + 12, pos.y )
		end
	end)
elseif SERVER then
	hook.Add( "PlayerLeaveVehicle", "Crosshair-GmodPunchout", function(ply,veh)
		timer.Simple(0.5,function()
			ply:CrosshairDisable()
		end)
	end)

	hook.Add( "PlayerSpawn", "Crosshair-GmodPunchout", function(ply)
		ply:CrosshairDisable()
	end)
end