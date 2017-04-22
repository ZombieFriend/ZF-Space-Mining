AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( 'shared.lua' )

ENT.laser_name = "mk1"
ENT.laser_rate = "5"

local function LaserOre(self)
	local tracerdata = self:createTracerData()
	local trace = util.TraceLine(tracerdata)
	if not trace.Hit then return false end
	if(trace.Entity:GetClass()=="zf_asteroid") then
		print("gj")
	end
end

function ENT:ToggleLaser()
	if self.mining_enabled==true then
		self:SetLaser(0)
	else
		self:SetLaser(1)
	end
end
		
function ENT:SetLaser(value)
	if value==1 then
		self:SetNWBool("drawbeam", true)
		self.mining_enabled = true
		timer.Start(self.mining_timer)
	else
		self:SetNWBool("drawbeam", false)
		self.mining_enabled = false
		timer.Stop(self.mining_timer)
	end
end

function ENT:Initialize()
	--physics inits
	self.Entity:SetModel("models/slyfo/mcpcannon.mdl")
	self.Entity:PhysicsInit( SOLID_VPHYSICS ) 	
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS ) 
	self.Entity:SetUseType(SIMPLE_USE)
	--value inits
	self.mining_multiplirs = {}
	self.mining_power = 10
	self.mining_speed = 0.5
	self.mining_rate = 10
	self.mining_timer = tostring(self:GetCreationID())
	self.mining_enabled = false
	timer.Create(self.mining_timer, self.mining_speed, 0, function() LaserOre(self) end)
	timer.Stop(self.mining_timer)
	print(self.laser_name)
	--wire
	local WireInputs = {
		"On"
	}
	local WireOutputs = {
		"Cycle %"
	}
	
	self.Inputs = Wire_CreateInputs(self.Entity, WireInputs)
	self.Outputs = Wire_CreateOutputs(self.Entity, WireOutputs)
end

function ENT:SpawnFunction( ply, tr )
end


function ENT:OnRemove()
	Wire_Remove(self.Entity)
	timer.Remove(self.mining_timer)
end 

function ENT:TriggerInput(name, value)
	if name == "On" then
		self:SetLaser(value)
	end
end

function ENT:Think()
end

function ENT:Use(ply,call)
	self:ToggleLaser()
end
