--[[ GLOBAL VARIABLES ]]--

--[[ OBS ]]--
obs = obslua

--[[ Sources ]]--
scoreLocalSource	= ""
scoreVisitorSource	= ""
faultLocalSource	= ""
faultVisitorSource	= ""
periodSource		= ""

--[[ Values ]]--
scoreLocal		= 0
scoreVisitor	= 0
faultLocal		= 0
faultVisitor	= 0
period			= 1

--[[ Satus ]]--
activated     = false

--[[ HotKeys ]]--
hotkey_resetFaults				= obs.OBS_INVALID_HOTKEY_ID
hotkey_incrementScoreLocal		= obs.OBS_INVALID_HOTKEY_ID
hotkey_decrementScoreLocal		= obs.OBS_INVALID_HOTKEY_ID
hotkey_incrementScoreVisitor	= obs.OBS_INVALID_HOTKEY_ID
hotkey_decrementScoreVisitor	= obs.OBS_INVALID_HOTKEY_ID
hotkey_incrementFaultLocal		= obs.OBS_INVALID_HOTKEY_ID
hotkey_decrementFaultLocal		= obs.OBS_INVALID_HOTKEY_ID
hotkey_incrementFaultVisitor	= obs.OBS_INVALID_HOTKEY_ID
hotkey_decrementFaultVisitor	= obs.OBS_INVALID_HOTKEY_ID
hotkey_incrementPeriod			= obs.OBS_INVALID_HOTKEY_ID
hotkey_decrementPeriod			= obs.OBS_INVALID_HOTKEY_ID

--[[ GLOBAL FUNCTIONS ]]--

--[[
	Resets the values and sets the sources
	]]--
function reset(pressed)
	if not pressed then
		return
	end
	
	scoreLocal = 0
	setSource(scoreLocal, scoreLocalSource)
	
	scoreVisitor = 0
	setSource(scoreVisitor, scoreVisitorSource)
	
	faultLocal = 0
	setSource(faultLocal, faultLocalSource)
	
	faultVisitor = 0
	setSource(faultVisitor, faultVisitorSource)
	
	period = 1
	setSource(period, periodSource)
end

--[[
	Sets the valueSource with the given value
	]]--
function setSource(value, valueSource)
	local text = string.format("%02d", value)
	local source = obs.obs_get_source_by_name(valueSource)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
end 

--[[
	Increments the value and sets the corresponding source
	@return the incremented value
	]]--
function increment(value, valueSource)
	value = value + 1
	setSource(value, valueSource)	
	return value
end

--[[
	Decrements the value and sets the corresponding source
	@return the decremented value
	]]--
function decrement(value, valueSource)
	value = value - 1
	setSource(value, valueSource)	
	return value
end

--[[ BUTTON FUNCTIONS ]]--

--[[
	Increments the local score if button pressed
	]]--
function btn_incrementScoreLocal(pressed)
	if not pressed then
		return
	end
	scoreLocal = increment(scoreLocal,scoreLocalSource)
end

--[[
	Decrements the local score if button pressed
	]]--
function btn_decrementScoreLocal(pressed)
	if not pressed then
		return
	end

	if scoreLocal > 0 then
		scoreLocal = decrement(scoreLocal, scoreLocalSource)
	end
end

--[[
	Increments the visitor score if button pressed
	]]--
function btn_incrementScoreVisitor(pressed)
	if not pressed then
		return
	end
	scoreVisitor = increment(scoreVisitor,scoreVisitorSource)
end

--[[
	Decrements the visitor score if button pressed
	]]--
function btn_decrementScoreVisitor(pressed)
	if not pressed then
		return
	end
	
	if scoreVisitor > 0 then
		scoreVisitor = decrement(scoreVisitor, scoreVisitorSource)
	end
end

--[[
	Increments the local faults if button pressed
	]]--
function btn_incrementFaultLocal(pressed)
	if not pressed then
		return
	end
	
	if faultLocal < 5 then
		faultLocal = increment(faultLocal,faultLocalSource)
	end
end

--[[
	Decrements the local faults if button pressed
	]]--
function btn_decrementFaultLocal(pressed)
	if not pressed then
		return
	end
		
	if faultLocal > 0 then
		faultLocal = decrement(faultLocal, faultLocalSource)
	end
end

--[[
	Increments the visitor faults if button pressed
	]]--
function btn_incrementFaultVisitor(pressed)
	if not pressed then
		return
	end
	
	if faultVisitor < 5 then
		faultVisitor = increment(faultVisitor,faultVisitorSource)
	end
end

--[[
	Decrements the visitor faults if button pressed
	]]--
function btn_decrementFaultVisitor(pressed)
	if not pressed then
		return
	end
		
	if faultVisitor > 0 then
		faultVisitor = decrement(faultVisitor, faultVisitorSource)
	end
end

--[[
	Resets the faults if button pressed and sets sources
	]]--
function btn_resetFaults(pressed)
	if not pressed then
		return
	end
		
	faultLocal = 0
	setSource(faultLocal, faultLocalSource)
	
	faultVisitor = 0
	setSource(faultVisitor, faultVisitorSource)
end

--[[
	Increments the period if button pressed
	]]--
function btn_incrementPeriod(pressed)
	if not pressed then
		return
	end
	period = increment(period,periodSource)
end

--[[
	Decrements the period if button pressed
	]]--
function btn_decrementPeriod(pressed)
	if not pressed then
		return
	end
		
	if period > 1 then
		period = decrement(period, periodSource)
	end
end

--[[ PROPERTIES FUNCTIONS ]]--

--[[
	Increments the local score
	]]--
function incrementScoreLocal(props, p)
	btn_incrementScoreLocal(true)
	return false
end

--[[
	Decrements the local score
	]]--
function decrementScoreLocal(props, p)
	btn_decrementScoreLocal(true)
	return false
end

--[[
	Increments the visitor score
	]]--
function incrementScoreVisitor(props, p)
	btn_incrementScoreVisitor(true)
	return false
end

--[[
	Decrements the visitor score
	]]--
function decrementScoreVisitor(props, p)
	btn_decrementScoreVisitor(true)
	return false
end

--[[
	Increments the local faults
	]]--
function incrementFaultLocal(props, p)
	btn_incrementFaultLocal(true)
	return false
end

--[[
	Decrements the local faults
	]]--
function decrementFaultLocal(props, p)
	btn_decrementFaultLocal(true)
	return false
end

--[[
	Increments the visitor faults
	]]--
function incrementFaultVisitor(props, p)
	btn_incrementFaultVisitor(true)
	return false
end

--[[
	Decrements the visitor faults
	]]--
function decrementFaultVisitor(props, p)
	btn_decrementFaultVisitor(true)
	return false
end
--[[
	Resets the faults
	]]--
function resetFaults(props, p)
	btn_resetFaults(true)
	return false
end

--[[
	Increments the period
	]]--
function incrementPeriod(pressed)
	btn_incrementPeriod(true)
	return false
end

--[[
	Decrements the period
	]]--
function decrementPeriod(pressed)
	btn_decrementPeriod(true)
	return false
end

--[[ OBS FUNCTIONS ]]--

--[[
	Defines the properties that the user can change for the entire script module itself
	]]--
function script_properties()
	-- Creates a new properties object
	local props = obs.obs_properties_create()
	-- Creates combo boxes
	local sLocal = obs.obs_properties_add_list(props, "cb_scoreLocal", "Local Score source", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
	local sVisitor = obs.obs_properties_add_list(props, "cb_scoreVisitor", "Visitor Score source", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
	local fLocal = obs.obs_properties_add_list(props, "cb_faultLocal", "Local Fault source", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
	local fVisitor = obs.obs_properties_add_list(props, "cb_faultVisitor", "Visitor Fault source", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
	local p = obs.obs_properties_add_list(props, "cb_period", "Period source", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
	
	-- Enumerates all sources
	local sources = obs.obs_enum_sources()
	-- Fills combo boxes
	if sources ~= nil then
		for _, source in ipairs(sources) do
			source_id = obs.obs_source_get_id(source)
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name(source)
				obs.obs_property_list_add_string(sLocal, name, name)
				obs.obs_property_list_add_string(sVisitor, name, name)
				obs.obs_property_list_add_string(fLocal, name, name)
				obs.obs_property_list_add_string(fVisitor, name, name)
				obs.obs_property_list_add_string(p, name, name)
			end
		end
	end
	-- Releases the references of a source list
	obs.source_list_release(sources)
	
	-- Adds button properties
	obs.obs_properties_add_button(props, "btn_incrementScoreLocal", "Score Local +", incrementScoreLocal)
	obs.obs_properties_add_button(props, "btn_decrementScoreLocal", "Score Local -", decrementScoreLocal)
	obs.obs_properties_add_button(props, "btn_incrementScoreVisitor", "Score Visitor +", incrementScoreVisitor)
	obs.obs_properties_add_button(props, "btn_decrementScoreVisitor", "Score Visitor -", decrementScoreVisitor)
	obs.obs_properties_add_button(props, "btn_incrementFaultLocal", "Fault Local +", incrementFaultLocal)
	obs.obs_properties_add_button(props, "btn_decrementFaultLocal", "Fault Local -", decrementFaultLocal)
	obs.obs_properties_add_button(props, "btn_incrementFaultVisitor", "Fault Visitor +", incrementFaultVisitor)
	obs.obs_properties_add_button(props, "btn_decrementFaultVisitor", "Fault Visitor -", decrementFaultVisitor)	
	obs.obs_properties_add_button(props, "btn_resetFaults", "Reset Faults", resetFaults)
	obs.obs_properties_add_button(props, "btn_incrementPeriod", "Period +", incrementPeriod)
	obs.obs_properties_add_button(props, "btn_decrementPeriod", "Period -", decrementPeriod)
	
	return props
end

--[[
	Returns the description shown to the user
	]]--
function script_description()
	return "DpT Scoreboard"
end

--[[
	Updates the settings when settings are changed
	]]--
function script_update(settings)
	scoreLocalSource = obs.obs_data_get_string(settings, "cb_scoreLocal")
	scoreVisitorSource = obs.obs_data_get_string(settings, "cb_scoreVisitor")
	faultLocalSource = obs.obs_data_get_string(settings, "cb_faultLocal")
	faultVisitorSource = obs.obs_data_get_string(settings, "cb_faultVisitor")
	periodSource = obs.obs_data_get_string(settings, "cb_period")
	reset(true)
end

--[[
	Sets the default settings
	]]--
function script_defaults(settings)

end

--[[
	Called when the script is saved.
	NOTE: This function is usually used for any extra internal settings data (such as in this case, hotkey's data) that may be used in the script
	]]--
function script_save(settings)
	
	local hotkey_save_array = obs.obs_hotkey_save(hotkey_incrementScoreLocal)
	obs.obs_data_set_array(settings, "hk_incrementScoreLocal", hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
	
	hotkey_save_array = obs.obs_hotkey_save(hotkey_decrementScoreLocal)
	obs.obs_data_set_array(settings, "hk_decrementScoreLocal", hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
	
	hotkey_save_array = obs.obs_hotkey_save(hotkey_incrementScoreVisitor)
	obs.obs_data_set_array(settings, "hk_incrementScoreVisitor", hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
	
	hotkey_save_array = obs.obs_hotkey_save(hotkey_decrementScoreVisitor)
	obs.obs_data_set_array(settings, "hk_decrementScoreVisitor", hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
	
	hotkey_save_array = obs.obs_hotkey_save(hotkey_incrementFaultLocal)
	obs.obs_data_set_array(settings, "hk_incrementFaultLocal", hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
	
	hotkey_save_array = obs.obs_hotkey_save(hotkey_decrementFaultLocal)
	obs.obs_data_set_array(settings, "hk_decrementFaultLocal", hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
	
	hotkey_save_array = obs.obs_hotkey_save(hotkey_incrementFaultVisitor)
	obs.obs_data_set_array(settings, "hk_incrementFaultVisitor", hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
	
	hotkey_save_array = obs.obs_hotkey_save(hotkey_decrementFaultVisitor)
	obs.obs_data_set_array(settings, "hk_decrementFaultVisitor", hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
	
	hotkey_save_array = obs.obs_hotkey_save(hotkey_resetFaults)
	obs.obs_data_set_array(settings, "hk_resetFaults", hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
	
	hotkey_save_array = obs.obs_hotkey_save(hotkey_incrementPeriod)
	obs.obs_data_set_array(settings, "hk_incrementPeriod", hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
	
	hotkey_save_array = obs.obs_hotkey_save(hotkey_decrementPeriod)
	obs.obs_data_set_array(settings, "hk_decrementPeriod", hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
end

--[[
	Called on startup.
	NOTE: This function is usually used for any extra internal settings data (such as in this case, hotkey's data) that may be used in the script
	]]--
function script_load(settings)

	-- The primary obs signal handler
	local sh = obs.obs_get_signal_handler()
	-- Connect a callback to a signal on a signal handler
	obs.signal_handler_connect(sh, "source_activate", source_activated)
	obs.signal_handler_connect(sh, "source_deactivate", source_deactivated)

	hotkey_incrementScoreLocal = obs.obs_hotkey_register_frontend("hk_incrementScoreLocal", "Score Local +", btn_incrementScoreLocal)
	hotkey_decrementScoreLocal = obs.obs_hotkey_register_frontend("hk_decrementScoreLocal", "Score Local -", btn_decrementScoreLocal)
	hotkey_incrementScoreVisitor = obs.obs_hotkey_register_frontend("hk_incrementScoreVisitor", "Score Visitor +", btn_incrementScoreVisitor)
	hotkey_decrementScoreVisitor = obs.obs_hotkey_register_frontend("hk_decrementScoreVisitor", "Score Visitor -", btn_decrementScoreVisitor)
	hotkey_incrementFaultLocal = obs.obs_hotkey_register_frontend("hk_incrementFaultLocal", "Fault Local +", btn_incrementFaultLocal)
	hotkey_decrementFaultLocal = obs.obs_hotkey_register_frontend("hk_decrementFaultLocal", "Fault Local -", btn_decrementFaultLocal)
	hotkey_incrementFaultVisitor = obs.obs_hotkey_register_frontend("hk_incrementFaultVisitor", "Fault Visitor +", btn_incrementFaultVisitor)
	hotkey_decrementFaultVisitor = obs.obs_hotkey_register_frontend("hk_decrementFaultVisitor", "Fault Visitor -", btn_decrementFaultVisitor)
	hotkey_resetFaults = obs.obs_hotkey_register_frontend("hk_resetFaults", "Reset Faults", btn_resetFaults)
	hotkey_incrementPeriod = obs.obs_hotkey_register_frontend("hk_incrementPeriod", "Period +", btn_incrementPeriod)
	hotkey_decrementPeriod = obs.obs_hotkey_register_frontend("hk_decrementPeriod", "Period -", btn_decrementPeriod)
	
	local hotkey_save_array = obs.obs_data_get_array(settings, "hk_incrementScoreLocal")
	obs.obs_hotkey_load(hotkey_incrementScoreLocal, hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)

	hotkey_save_array = obs.obs_data_get_array(settings, "hk_decrementScoreLocal")
	obs.obs_hotkey_load(hotkey_decrementScoreLocal, hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
	
	hotkey_save_array = obs.obs_data_get_array(settings, "hk_incrementScoreVisitor")
	obs.obs_hotkey_load(hotkey_incrementScoreVisitor, hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
	
	hotkey_save_array = obs.obs_data_get_array(settings, "hk_decrementScoreVisitor")
	obs.obs_hotkey_load(hotkey_decrementScoreVisitor, hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array) 
	
	hotkey_save_array = obs.obs_data_get_array(settings, "hk_incrementFaultLocal")
	obs.obs_hotkey_load(hotkey_incrementFaultLocal, hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)

	hotkey_save_array = obs.obs_data_get_array(settings, "hk_decrementFaultLocal")
	obs.obs_hotkey_load(hotkey_decrementFaultLocal, hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
	
	hotkey_save_array = obs.obs_data_get_array(settings, "hk_incrementFaultVisitor")
	obs.obs_hotkey_load(hotkey_incrementFaultVisitor, hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
	
	hotkey_save_array = obs.obs_data_get_array(settings, "hk_decrementFaultVisitor")
	obs.obs_hotkey_load(hotkey_decrementFaultVisitor, hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
	
	hotkey_save_array = obs.obs_data_get_array(settings, "hk_resetFaults")
	obs.obs_hotkey_load(hotkey_resetFaults, hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
	
	hotkey_save_array = obs.obs_data_get_array(settings, "hk_decrementPeriod")
	obs.obs_hotkey_load(hotkey_incrementPeriod, hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
	
	hotkey_save_array = obs.obs_data_get_array(settings, "hk_decrementPeriod")
	obs.obs_hotkey_load(hotkey_decrementPeriod, hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
end