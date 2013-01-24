GPO.Achievements = {}

local meta = FindMetaTable("Player")

function meta:AddAchievement(t)
	local n=t.name
	if not self:GetPData("GPOAch-"..t.name, false) then
		GPO:Notify(team.GetColor(self:Team()), self:Nick(), GPO.colors.white, " has earned the achievement: '", GPO.colors.blue, t.name, GPO.colors.white, "'.")
		GPO:Notify(self, GPO.colors.white, "You have recieved ", GPO.colors.blue, "$" .. tostring(t.reward), GPO.colors.white, " for earning that achievement!")
		self:AddCash(t.reward)
		self:SetPData("GPOAch-"..t.name, true)
	end
end

function meta:Achieved(t)
	if self:GetPData("GPOAch-"..t.name, false) then
		return true
	else
		return false
	end
end

function meta:ResetAchievements()
	for k,v in ipairs(GPO.Achievements) do
		self:SetPData("GPOAch-"..v.name, false)
	end
end

function GPO:AddAchievement(t)
	local n=#GPO.Achievements+1
	GPO.Achievements[n]={}
	GPO.Achievements[n].name = t.name
	GPO.Achievements[n].desc = t.desc
	GPO.Achievements[n].reward = t.reward
	GPO.Achievements[n].func = t.func
	GPO.Achievements[n].func(GPO.Achievements[n], "GPOAch-"..t.name, "GPOAch-"..t.name.."-Progress")

	if t.total then GPO.Achievements[n].total = t.total end
end

GPO:AddAchievement({
	name="Play Gmod Punchout",
	desc="Begin your hopefully enjoyable experience on Gmod Punchout!",
	reward=500,
	func=function(a,b)
		hook.Add("PlayerInitialSpawn", b, function(ply)
			ply:AddAchievement(a)
		end)
	end
})

GPO:AddAchievement({
	name="Suicidal",
	desc="Die a total of 200 times!",
	reward=1500,
	total=200,
	func=function(a,b,c)
		hook.Add("PlayerDeath", b, function(victim, weapon, killer)
			if not victim:Achieved(a) then
				victim:SetPData(c, victim:GetPData(c,0)+1)
				if tonumber(victim:GetPData(c,0))>=a.total then
					victim:AddAchievement(a)
				end
			end
		end)
	end
})

GPO:AddAchievement({
	name="Homicidal",
	desc="Kill a total of 200 people!",
	reward=2000,
	total=200,
	func=function(a,b,c)
		hook.Add("PlayerDeath", b, function(victim, weapon, killer)
			if victim != killer and killer:IsPlayer() and not killer:Achieved(a) then
				killer:SetPData(c, killer:GetPData(c,0)+1)
				if tonumber(killer:GetPData(c,0))>=a.total then
					killer:AddAchievement(a)
				end
			end
		end)
	end
})