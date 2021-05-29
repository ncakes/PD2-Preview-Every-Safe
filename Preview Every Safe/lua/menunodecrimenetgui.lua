--Note: MenuNodeOpenContainerGui:setup() handles the container preview stuff

--Hijack and open menu on right click, otherwise use original
local orig_MenuNodeOpenContainerGui_weapon_cosmetics_callback = MenuNodeOpenContainerGui.weapon_cosmetics_callback
function MenuNodeOpenContainerGui:weapon_cosmetics_callback(button, data)
	--Right click
	if button == Idstring("1") then
		PreviewEverySafe:choose_wear(button, data)
	else
		--Original
		orig_MenuNodeOpenContainerGui_weapon_cosmetics_callback(self, button, data)
	end
end

--Unpack then call original function
function MenuNodeOpenContainerGui:weapon_cosmetics_callback_handler(params)
	local button = params.button
	local data = params.data
	orig_MenuNodeOpenContainerGui_weapon_cosmetics_callback(self, button, data)
end
