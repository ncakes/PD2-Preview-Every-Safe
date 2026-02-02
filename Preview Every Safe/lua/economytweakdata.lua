--Preview COP and legendaries and removed safes
Hooks:PostHook(EconomyTweakData, "init", "PreviewEverySafe-PostHook-EconomyTweakData:init", function(self, ...)
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
end)
