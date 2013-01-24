surface.CreateFont("GmodPunchoutHUD",
	{
		font="Verdana",
		size=ScreenScale(9),
		weight="1200",
	}
)

surface.CreateFont("GmodPunchoutHUD2",
	{
		font="Courier New",
		size=ScreenScale(6),
		weight="700",
		outline=true
	}
)
 
hook.Add("HUDPaint", "CreateGmodPunchoutHUD", function()
	draw.RoundedBox( 0, ScrW()*0.005, ScrH()*0.925, ScrW()*0.15, ScrH()*0.06, Color( 0, 0, 25, 150 ) )
	draw.RoundedBox( 0, ScrW()*0.006, ScrH()*0.962, math.Clamp(LocalPlayer():Health(), 0, 100)* (ScrW()*0.00148), ScrH()*0.02, Color( 0, 255, 0, 255 ) )
	draw.RoundedBox( 0, ScrW()*0.006, ScrH()*0.962, math.Clamp(LocalPlayer():Health(), 0, 100)* (ScrW()*0.00148), ScrH()*0.01, Color( 255, 255, 255, 90 ) ) 
	surface.SetDrawColor( 0, 255, 0, 255 )
	surface.DrawOutlinedRect( ScrW()*0.006, ScrH()*0.962, ScrW()*0.148, ScrH()*0.02)
	draw.SimpleText("HP: "..LocalPlayer():Health(), "GmodPunchoutHUD", ScrW()*0.05, ScrH()*0.960, Color(0,0,255,255))

	local Cash = Material("icon16/money.png")
	surface.SetMaterial(Cash)
	surface.SetDrawColor(255,255,255,255)
	surface.DrawTexturedRectRotated(ScrW()*0.017, ScrH()*0.937, 16, 16,0)

	draw.SimpleText("  $"..LocalPlayer():GetNWInt("cash"), "GmodPunchoutHUD2", ScrW()*0.015, ScrH()*0.935, Color(255,255,255,255))
	
end)
 
local function hidehud(name)
	for k, v in pairs({"CHudHealth", "CHudBattery"})do
		if name == v then return false end
	end
end
hook.Add("HUDShouldDraw", "Hide the normal HUD", hidehud)