local orig_MenuNodeOpenContainerGui_weapon_cosmetics_callback = MenuNodeOpenContainerGui.weapon_cosmetics_callback
function MenuNodeOpenContainerGui:weapon_cosmetics_callback(button, data)
	if button == Idstring("1") then
		PreviewEverySafe:choose_wear(data)
		return
	end

	orig_MenuNodeOpenContainerGui_weapon_cosmetics_callback(self, button, data)
end

--Unpack then call original function
function MenuNodeOpenContainerGui:pes_weapon_cosmetics_callback_handler(data)
	orig_MenuNodeOpenContainerGui_weapon_cosmetics_callback(self, Idstring("1"), data)
end
