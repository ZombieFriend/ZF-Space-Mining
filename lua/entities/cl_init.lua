include('shared.lua')

function ENT:Think()
end
function ENT:Draw()
	self:DoNormalDraw()
	self:DrawModel()
end
function ENT:DoNormalDraw()
end

