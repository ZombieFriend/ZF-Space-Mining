ENT.Type 			= "anim"
ENT.Base 			= "base_wire_entity"
ENT.PrintName		= "MK1 Laser"
ENT.Author			= "Zombie Friend"
ENT.Category 		= "ZF Asteroid"

ENT.Spawnable 		= false
ENT.AdminSpawnable 	= true
ENT.muzzleoffset = Vector(147.5,0,9.25)
ENT.muzzleoffset2 = Vector(147.5+1000,0,9.25)
function ENT:createTracerData()
	local tracerdata = {}
	tracerdata.start = self:LocalToWorld(self.muzzleoffset)
	tracerdata.endpos =  self:LocalToWorld(self.muzzleoffset2)
	tracerdata.filter = self.Entity
	return tracerdata
end
	
	--e = self, string is overlay text
--[[
function OverlayDrawTextTest(e, string)
	local object = e
	local entity = object.Entity
	local aim_e = LocalPlayer():GetEyeTrace().Entity
	local distance = EyePos():Distance(entity:GetPos())
	if(object:GetOverlayText()~=nil and distance<500 and entity==aim_e ) then 
		AddWorldTip(entity:EntIndex(), object:GetOverlayText(), 0.5, entity:GetPos(), entity)
	end
end
]]