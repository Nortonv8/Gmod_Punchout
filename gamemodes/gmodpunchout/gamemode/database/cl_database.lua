local database = {}

local function databaseReceive( tab )
	database = tab
end
net.Receive("database", function(len)
	local tab = net.ReadTable()
	databaseReceive( tab )
end)

function databaseTable()
	return database
end

function databaseGetValue( name )
	local d = databaseTable()
	return d[name]
end