function GM:PlayerConnect( name, ip )
	GPO:Notify(GPO.colors.white, "Player ", GPO.colors.blue, name, GPO.colors.white, " has connected to the punchout.")
end

function GetPlayerModel()
	local t={
		"models/player/group01/female_01.mdl",
		"models/player/group01/female_02.mdl",
		"models/player/group01/female_03.mdl",
		"models/player/group01/female_04.mdl",
		"models/player/group01/female_05.mdl",
		"models/player/group01/female_06.mdl",
		"models/player/group01/male_01.mdl",
		"models/player/group01/male_02.mdl",
		"models/player/group01/male_03.mdl",
		"models/player/group01/male_04.mdl",
		"models/player/group01/male_05.mdl",
		"models/player/group01/male_06.mdl",
		"models/player/group01/male_07.mdl",
		"models/player/group01/male_08.mdl",
		"models/player/group01/male_09.mdl"
	}
	return t[math.random(1,#t)]
end

function GM:PlayerInitialSpawn( ply )
	GPO:Notify(GPO.colors.white, "Player ", GPO.colors.blue, ply:Nick(), GPO.colors.white, " has entered the punchout.")
	
	ply.model=GetPlayerModel()
end

function GM:PlayerSpawn( ply )
	player_manager.SetPlayerClass( ply, "player_default" )
	if ply.model then ply:SetModel(ply.model)
	ply:Give("hl2_combo_fists")	end
end

function GM:PlayerDeath( ply )
	
	GPO:Notify(GPO.colors.white, "Player ", GPO.colors.red, ply:Nick(), GPO.colors.white, " lost the match. Better luck next time!") 
	end
	
hook.Add("HUDPaint", "CreateGmodPunchoutHUD", function()
	function GM:PlayerDeath( ply, HUDPaint )
		
	end
end)
	
function GM:EntityTakeDamage( ply, hitgroup )
	
	if ( hitgroup == HITGROUP_HEAD ) then
		GPO:Notify(GPO.colors.white, "Player ", GPO.colors.red, ply:Nick(), GPO.colors.white, " got punched in the face!")
	end
	
	if ( hitgroup == HITGROUP_GEAR ) then
		GPO:Notify(GPO.colors.white, "Player ", GPO.colors.red, ply:Nick(), GPO.colors.white, " got punched in the torso.")
	end
	
	if ( hitgroup == HITGROUP_LEFTARM ) then
		GPO:Notify(GPO.colors.white, "Player ", GPO.colors.red, ply:Nick(), GPO.colors.white, " got punched in the left arm.")
	end
	
	if ( hitgroup == HITGROUP_RIGHTARM ) then
		GPO:Notify(GPO.colors.white, "Player ", GPO.colors.red, ply:Nick(), GPO.colors.white, " got punched in the right arm.")
	end
	
	if ( hitgroup == HITGROUP_LEFTLEG ) then
		GPO:Notify(GPO.colors.white, "Player ", GPO.colors.red, ply:Nick(), GPO.colors.white, " got punched in the left leg.")
	end
	
	if ( hitgroup == HITGROUP_RIGHTLEG ) then
		GPO:Notify(GPO.colors.white, "Player ", GPO.colors.red, ply:Nick(), GPO.colors.white, " got punched in the right leg.")
	end
	
end

function GM:ScalePlayerDamage( ply, hitgroup, dmginfo )

	-- More damage if we're shot in the head
	 if ( hitgroup == HITGROUP_HEAD ) then
	 
		dmginfo:ScaleDamage( 3 )
	 
	 end
	 
	 -- Standard damage if we're shot in the groin
	  if ( hitgroup == HITGROUP_GEAR ) then
	 
		dmginfo:ScaleDamage( 1 )
	 
	 end
	 
	-- Less damage if we're shot in the arms or legs
	 
	 if ( hitgroup == HITGROUP_LEFTARM ) then
	 
		dmginfo:ScaleDamage( 0.5 )
	 
	 end
	 
	 if ( hitgroup == HITGROUP_RIGHTARM ) then
	 
		dmginfo:ScaleDamage( 0.5 )
	 
	 end
	 
	 if ( hitgroup == HITGROUP_LEFTLEG ) then
	 
		dmginfo:ScaleDamage( 0.5 )
	 
	 end
	 
	 if ( hitgroup == HITGROUP_RIGHTLEG ) then
	 
		dmginfo:ScaleDamage( 0.5 )
	 
	 end

end