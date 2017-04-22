include('shared.lua')

function ENT:Think()
	local drawbeam = self:GetNWBool("drawbeam", false)
	if drawbeam == true then
	
		local tracerdata = self:createTracerData()
		local trace = nil
		trace = util.TraceLine(tracerdata)
		local dist = (trace.HitPos - tracerdata.start):Length()        
		local effectdata = EffectData()
				effectdata:SetOrigin(trace.HitPos)
				effectdata:SetStart(tracerdata.start)
				effectdata:SetMagnitude(30)
				effectdata:SetScale(dist)
				util.Effect( "mine_beam", effectdata )
		-- print(trace.Entity)
	end
end
