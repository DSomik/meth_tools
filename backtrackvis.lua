local pos = {}
local person = nil

hook.Add("HUDPaint", "", function()
	person = nil
	local bdis = math.huge
	local midx, midy = ScrW() / 2, ScrH() / 2

	for _, v in ipairs(player.GetAll()) do
		if not v:IsValid() or not v:Alive() or v:GetObserverMode() ~= 0 or v:Team() == 1002 or v:GetColor().a == 0 or v == LocalPlayer() then continue end
		
		local spos = v:GetPos():ToScreen()
		local cdis = math.Dist(spos.x, spos.y, midx, midy)
		
		if cdis < bdis then
			bdis = cdis
			person = v
		end
	end

	if not person then return end
	
	if not person:Alive() or person:GetObserverMode() ~= 0 or person:Team() == 1002 or person:GetColor().a == 0 then return end

	local p = pos[person]

	if not p then
		return
	end
	
	local flv = meth_lua_api.var.GetVarInt("Aimbot.Position Adjustment.Fake Latency") / 1000

	cam.Start3D()
		for k, v in ipairs(p) do
			local ct = CurTime()
		
			if ct - v[2] < flv - 0.2 then
				continue
			end
		
			if ct - v[2] > flv then
				table.remove(p, k)
				continue
			end
			
			for _, h in ipairs(v[1]) do
				render.DrawWireframeBox(h.pos, h.ang, h.mins, h.maxs, Color(255, 255, 255, 255))
			end
		end
	cam.End3D()
end)

hook.Add("Tick", "", function()
	if not person then
		return
	end
	
	if not pos[person] then
		pos[person] = {}
	end
	
	local ins = {}
	
	for i = 0, person:GetHitboxSetCount() - 1 do
		for ii = 0, person:GetHitBoxCount(i) - 1 do
			local bone = person:GetHitBoxBone(ii, i)
			
			if not bone then continue end
			
			local mins, maxs = person:GetHitBoxBounds(ii, i)
			
			if not mins or not maxs then continue end
			
			local bm = person:GetBoneMatrix(bone)
			
			if not bm then continue end
			
			local pos, ang = bm:GetTranslation(), bm:GetAngles()
			
			if not pos or not ang then continue end
			
			table.insert(ins, {
				["pos"] = pos,
				["ang"] = ang,
				["mins"] = mins,
				["maxs"] = maxs,
			})
		end
	end
	
	table.insert(pos[person], {ins, CurTime()})
end)
