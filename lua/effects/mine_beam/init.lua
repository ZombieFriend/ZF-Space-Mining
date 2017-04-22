
/*---------------------------------------------------------
   Init( data table )
---------------------------------------------------------*/
function EFFECT:Init( data )

	self.StartPos 	= data:GetStart()	
	self.EndPos 	= data:GetOrigin()
	self.Multi 		= data:GetMagnitude( )
	self.rad 		= 16
	self.MultiBeam	= data:GetScale()
	
	self.Entity:SetRenderBoundsWS( self.StartPos, self.EndPos )
	
	self.emitter = ParticleEmitter(self.EndPos)  	
	
end

/*---------------------------------------------------------
   THINK
---------------------------------------------------------*/
function EFFECT:Think( )
    	return false 
end

/*---------------------------------------------------------
   Draw the effect
---------------------------------------------------------*/
function EFFECT:Render( )
	
	render.SetMaterial( Material(  "effects/blueblacklargebeam"  ) )
   	render.DrawBeam( self.StartPos, self.EndPos, 64, 0, 0, Color( 255, 0, 0, 255 ) )
   	
   	-- render.SetMaterial( bMats.Glow2 )
   	-- render.DrawSprite(self.StartPos, 144, 144, Color(255, 255, 255, 255)) 
   	
	-- render.SetMaterial( lMats.Glow1 )		
   	-- render.DrawBeam( self.EndPos, self.StartPos, 128, (1)*((2*CurTime())-(0.0005*self.MultiBeam)), (1)*(2*CurTime()), Color( 255, 255, 255, 255 ) )
   	
	-- render.SetMaterial( lMats.Glow2 )	
   	-- render.DrawBeam( self.EndPos, self.StartPos, 96, (1)*((2*CurTime())-(0.001*self.MultiBeam)), (1)*(2*CurTime()), Color( 255, 255, 255, 255 ) )
   	
	return false
					 
end
