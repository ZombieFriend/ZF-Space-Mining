TOOL.Category 		= "ZF Asteroids"
TOOL.Name 			= "Proto Asteroid"
TOOL.Tab = "Custom Addon Framework"
TOOL.Command 		= nil
TOOL.ConfigName 	= ""
TOOL.ClientConVar["zf_asteroid_creator"] = "zf_veldspar"

if CLIENT then
	language.Add("Tool.zf_asteroid_creator.name", "Create Asteroid Tool")
	language.Add("Tool.zf_asteroid_creator.desc", "Create asteroid for prototyping")
	language.Add("Tool.zf_asteroid_creator.0", "Primary: Create Asteroid")
end
function TOOL:LeftClick(trace)
	local asteroid = ents.Create("zf_asteroid")
	if !IsValid(asteroid) then return false end
	local Pos = trace.HitPos
	local Normal = trace.HitNormal
	Normal:Mul(500)
	Pos:Add(Normal)
	asteroid:SetPos(Pos)
	asteroid:Spawn()
	asteroid:Activate()
	undo.Create("zf_asteroid")
		undo.AddEntity( asteroid )
		undo.SetPlayer( self:GetOwner() )
	undo.Finish()
	print(asteroid.ore_amount)
	return true
end
function TOOL:Think()

end

--no max asteroids