--Preview COP and legendaries and removed safes
Hooks:PostHook(EconomyTweakData, "init", "PreviewEverySafe_EconomyTweakData_init", function(self, ...)
	--Preview COP, hide drill
	self.safes.overkill_01.promo = nil
	self.safes.overkill_01.free = true

	--John Wick
	self.safes.wac_01.ip_content = nil
	--Bodhi
	self.safes.surf_01.ip_content = nil
	--Jimmy
	self.safes.cola_01.ip_content = nil
	--Scarface
	self.safes.sfs_01.ip_content = nil

	--Unremove items
	for _, data in pairs(self.contents) do
		if data.removed_items and data.contains then
			for k, v in pairs(data.removed_items) do
				data.contains[k] = data.contains[k] or {}
				for _, id in ipairs(v) do
					table.insert(data.contains[k], id)
				end
			end
		end
		data.removed_items = nil
	end

	--Add back the Don Pastrami
	self.contents.event_bah.contains.contents = {"event_bah_legendary"}

	--Preview legendaries
	--Add legendaries to the normal list of items
	for safe, data in pairs(self.safes) do
		local contains = self.contents[data.content].contains
		if contains.weapon_skins and contains.contents and #contains.contents > 0 then
			for _, legendary_contains_id in pairs(contains.contents) do
				local legendary_contains = self.contents[legendary_contains_id].contains
				if legendary_contains and legendary_contains.weapon_skins then
					for _, skin_id in pairs(legendary_contains.weapon_skins) do
						table.insert(contains.weapon_skins, skin_id)
					end
				end
			end
			--Remove the old legendary contains thing
			contains.contents = nil
		end
	end
end)
