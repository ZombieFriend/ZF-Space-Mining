AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( 'shared.lua' )
ENT.zf_asteroid_models = {
	a1 = "models/ce_ls3additional/asteroids/asteroid_200.mdl"
}
ENT.ore_density = 0
ENT.ore_amount 	= 0
ENT.ore_type 	= "ore"
function ENT:Initialize()
	self.ore_density = 1
	self.ore_amount = 100
	-- self:SetPos()
	-- self:SetAngles(Ang)
	self.Entity:PhysicsInit( SOLID_VPHYSICS ) 	
	-- self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_NONE)
	self.Entity:SetSolid( SOLID_VPHYSICS ) 
	self.Entity:SetUseType(SIMPLE_USE)  
	end

function ENT:SpawnFunction( ply, tr)

end


function ENT:OnRemove()
	Wire_Remove(self.Entity)
end 

function ENT:Think()

end
--Experimental stuff in here
function ENT:Use(ply,call)
end

function ENT:ComsumeOre(amount)
	if(amount>self.ore_amount)
		self.ore_amount = self.ore_amount-amount
		return self.ore_amount
	else
		self.ore_amount = self.ore_amount-amount
		return amount
	end
end

function ENT:Displays() 
end
