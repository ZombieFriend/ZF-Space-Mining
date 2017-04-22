print("=======================================================")
print("ZF_Crafting Initializing")
ZF_Crafting = {}
ZF_Crafting.Reagents = {}
ZF_Crafting.NamePointers = {}
function ZF_Crafting:makeReagentIdentifier(index1, index2)
	return tostring(index1)..tostring(index2)
end

function ZF_Crafting:registerReagent(index1, index2, reagent_table)
	local reagent_name = reagent_table.name
	local reagent_identifier = self:makeReagentIdentifier(index1, index2)
	
	if ZF_Crafting.Reagents[reagent_identifier] then
		print("ZF_Crafting - Registration failed - "..reagent_name.." Reason: Reagent slot taken up")
		return
	end
	
	if not ZF_Crafting.NamePointers[reagent_name] then
		ZF_Crafting.NamePointers[reagent_name]={}
	end
	
	table.insert(ZF_Crafting.NamePointers[reagent_name], reagent_table)
	ZF_Crafting.Reagents[reagent_identifier] = reagent_table
	print("Registered: "..reagent_name)
end

function ZF_Crafting:registerSimpleReagent(index1, index2, name, model, material)
	local reagent_table = {}
	reagent_table.name = name

	if model then
		reagent_table.model = model
	end
	if material then
		reagent_table.material = material
	end

	reagent_table.identifier = self:makeReagentIdentifier(index1,index2)
	self:registerReagent(index1, index2, reagent_table)
end

function ZF_Crafting:getReagentByID(index1, index2)
	local reagent_identifier = self:makeReagentIdentifier(index1, index2)
	return ZF_Crafting.Reagents[reagent_identifier]
end

--time to find all the registered reagents
local files, directories = file.Find("ZF_Crafting/reagents/*", "LUA")
for _,i in pairs(files) do
	local includename = "ZF_Crafting/reagents/"..i
	if file.Exists(includename, "LUA") then
		if SERVER then
			include(includename)
			AddCSLuaFile(includename)
		end
		if CLIENT then
			include(includename)
		end
	end
end
-- function ZF_Crafting:
print("=======================================================")