AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( 'shared.lua' )


function ENT:Initialize()
end


function ENT:SpawnFunction( ply, tr )
end


function ENT:OnRemove()
	Wire_Remove(self.Entity)
	
end 
function ENT:Think()

end
--Experimental stuff in here
function ENT:Use(ply,call)
end



function ENT:Displays() 
	Wire_TriggerOutput(self.Entity, "Shield", self.Shield.HP)	
end
