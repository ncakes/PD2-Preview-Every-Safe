if _G.PreviewEverySafe then return end

_G.PreviewEverySafe = {}

--Menu hooks
Hooks:Add("LocalizationManagerPostInit", "PreviewEverySafe-Hooks-LocalizationManagerPostInit", function(loc)
	loc:add_localized_strings({menu_steam_market_content_overkill_01 = "Completely OVERKILL"})
end)

--Choose wear menu
function PreviewEverySafe:choose_wear(data)
	local menu_title = "Preview Every Safe"
	local menu_message = "Choose preview wear."

	local menu_options = {}
	local qualities = {"mint", "fine", "good", "fair", "poor"}
	for i, quality in ipairs(qualities) do
		table.insert(menu_options, {
			text = managers.localization:text("bm_menu_quality_"..quality),
			callback = function()
				data.cosmetic_quality = quality
				local _callback = callback(managers.menu, MenuNodeOpenContainerGui, "pes_weapon_cosmetics_callback_handler", data)
				_callback()
			end,
			is_focused_button = (i == 1),
		})
	end
	table.insert(menu_options, {
		text = managers.localization:text("dialog_cancel"),
		is_cancel_button = true,
	})
	QuickMenu:new(menu_title, menu_message, menu_options):Show()
end
