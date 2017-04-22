AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( 'shared.lua' )
ENT.zf_asteroid_models = {
	a1 = "models/ce_ls3additional/asteroids/asteroid_200.mdl"
}
ENT.ore_density = 0
ENT.ore_amount 	= 0
ENT.ore_type 	= "ore"
local function DelayDestroyed(self)
	self:Remove()
end
function ENT:Initialize()
	self.timer_despawn_identifier = tostring(self:GetCreationID()).."_despawn" --death timer starts when asteroid is first mined
	self.timer_despawn_delay = 180
	self.timer_despawn_enabled = false
	self.timer_destroy_identifier = tostring(self:GetCreationID()).."_destroy" --delay death timer when self.ore_amount reaches 0
	self.timer_destroy_delay = 0.5
	self.ore_amount = 100
	self.ore_denstiy = 1
	self.Entity:SetModel(self.zf_asteroid_models.a1)
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	-- self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_NONE )
	self.Entity:SetSolid( SOLID_VPHYSICS ) 
	self.Entity:SetUseType(SIMPLE_USE)
end


function ENT:SpawnFunction( ply, tr )
end


function ENT:OnRemove()
	Wire_Remove(self.Entity)
	timer.Remove(self.timer_despawn_identifier)
	timer.Remove(self.timer_destroy_identifier)
end 

function ENT:Think()

end

function ENT:Use(ply,call)
end

function ENT:ComsumeOre(amount)
	--starts a despawn timer when first mined
	if (self.timer_despawn_enabled==false) then
		self.timer_despawn_enabled = true
		timer.Create(self.timer_despawn_identifier, self.timer_despawn_delay, 1, function() DelayDestroyed(self) end)
	end
	--handles ore return and asteroid destroy on ore = 0.
	local return_amount = 0
	if(amount>=self.ore_amount) then
		return_amount = self.ore_amount
		self.ore_amount = 0
		timer.Create(self.timer_destroy_identifier, self.timer_destroy_delay, 1, function() DelayDestroyed(self) end)
	else
		return_amount = self.ore_amount
		self.ore_amount = self.ore_amount-amount
	end
	
	return return_amount
end

function ENT:Displays() 
	-- Wire_TriggerOutput(self.Entity, "Shield", self.Shield.HP)	
end
