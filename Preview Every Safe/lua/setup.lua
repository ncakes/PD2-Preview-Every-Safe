--Don't do setup twice
if _G.PreviewEverySafe then
	return
end

--Set up variables
_G.PreviewEverySafe = _G.PreviewEverySafe or {}

--Menu hooks
--Add localization for COP Safe
Hooks:Add("LocalizationManagerPostInit", "PreviewEverySafe_hook_LocalizationManagerPostInit", function(loc)
	loc:add_localized_strings({
		menu_steam_market_content_overkill_01 = "Completely OVERKILL"
	})
end)

--Choose wear menu
function PreviewEverySafe:choose_wear(button, data)
	local menu_title = "Preview Every Safe"
	local menu_message = "Choose preview wear."

	local params = {
		button = button,
		data = data
	}

	local menu_options = {
		[1] = {
			text = managers.localization:text("bm_menu_quality_mint"),
			callback = function()
				self:choose_wear_callback(params, "mint")
			end
		},
		[2] = {
			text = managers.localization:text("bm_menu_quality_fine"),
			callback = function()
				self:choose_wear_callback(params, "fine")
			end
		},
		[3] = {
			text = managers.localization:text("bm_menu_quality_good"),
			callback = function()
				self:choose_wear_callback(params, "good")
			end
		},
		[4] = {
			text = managers.localization:text("bm_menu_quality_fair"),
			callback = function()
				self:choose_wear_callback(params, "fair")
			end
		},
		[5] = {
			text = managers.localization:text("bm_menu_quality_poor"),
			callback = function()
				self:choose_wear_callback(params, "poor")
			end
		},
		[6] = {
			text = managers.localization:text("dialog_cancel"),
			is_cancel_button = true
		}
	}
	local menu = QuickMenu:new(menu_title, menu_message, menu_options)
	menu:Show()
end

--Choose wear menu callback
function PreviewEverySafe:choose_wear_callback(params, quality)
	params.data.cosmetic_quality = quality
	local _callback = callback(managers.menu, MenuNodeOpenContainerGui, "weapon_cosmetics_callback_handler", params)
	_callback()
end
