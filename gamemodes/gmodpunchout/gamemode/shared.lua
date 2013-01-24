GM.Name = "Gmod Punchout!!"
GM.Author = "Nortonv8"
GM.Email = "nortonv8@gmail.com"
GM.Website = "N/A"

GPO = {}

local modules = file.Find( "gmodpunchout/gamemode/modules/*.lua", "LUA" )
for _, plugin in ipairs( modules ) do
	local prefix = string.Left( plugin, string.find( plugin, "_" ) - 1 )
	if ( CLIENT and ( prefix == "sh" or prefix == "cl" ) ) then
		include( "modules/" .. plugin )
	elseif ( SERVER ) then
		if prefix=="sv" or prefix=="sh" then
			include( "modules/" .. plugin )
		end
		if ( prefix == "sh" or prefix == "cl" ) then
			AddCSLuaFile( "gmodpunchout/gamemode/modules/" .. plugin )
		end
	end
end
modules=nil

GPO:LoadPlugins()

function GM:Initialize()
	self.BaseClass.Initialize( self )
end