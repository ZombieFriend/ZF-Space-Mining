TOOL.Category 		= "ZF Asteroids"
TOOL.Name 			= "Proto Ore Laser"
TOOL.Command 		= nil
TOOL.ConfigName 	= ""
TOOL.ClientConVar["zf_ore_laser_creator"] = "zf_orelaser"

if CLIENT then
	language.Add("Tool.zf_ore_laser_creator.name", "Create laser Tool")
	language.Add("Tool.zf_ore_laser_creator.desc", "Create laser for prototyping")
	language.Add("Tool.zf_ore_laser_creator.0", "Primary: Create laser")
end
function TOOL:LeftClick(trace)
	local laser = ents.Create("zf_ore_laser")
	laser:SetPos(trace.HitPos)
	laser:Spawn()
	laser:Activate()
	laser:PhysWake()
	undo.Create("zf_laser")
		undo.AddEntity( laser )
		undo.SetPlayer( self:GetOwner() )
	undo.Finish()
	print(laser)
	return true
end
function TOOL:Think()

end

--no max lasers