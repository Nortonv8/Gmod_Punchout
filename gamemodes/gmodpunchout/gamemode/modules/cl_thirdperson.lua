// Third person module

function GPO:ShouldThirdPerson( ply )
	if ply:InVehicle() then return false end
	
	return true
end

hook.Add("CalcView", "ThirdPerson-GmodPunchout", function( ply, pos, angles, fov )
	if GPO:ShouldThirdPerson( ply ) then
		return {
			origin = pos-(angles:Forward()*80)+(angles:Up()*30),
			angles = angles,
			fov = fov
		}
	end
end)
 
hook.Add("ShouldDrawLocalPlayer","ThirdPerson-GmodPunchout", function( ply )
    if GPO:ShouldThirdPerson( ply ) then return true end
end)