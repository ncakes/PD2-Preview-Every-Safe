--Preview COP and legendaries
Hooks:PostHook(EconomyTweakData, "init", "PreviewEverySafe_EconomyTweakData_init", function(self, ...)
	--Preview COP
	self.safes.overkill_01.promo = nil

	--Hide COP Drill
	self.safes.overkill_01.free = true

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
