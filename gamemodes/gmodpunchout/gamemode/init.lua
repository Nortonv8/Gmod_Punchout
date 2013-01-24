AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("database/cl_database.lua")

include("shared.lua")
include("database/database.lua")

function GM:PlayerAuthed( ply, steamID, uniqueID )
	ply:databaseCheck()
end

function GM:PlayerDisconnected( ply )
	ply:databaseDisconnect()
end