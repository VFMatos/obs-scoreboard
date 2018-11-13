obs           = obslua
scoreLocalSource = ""
scoreVisitorSource = ""
faultLocalSource = ""
faultVisitorSource = ""
periodSource = ""
scoreLocal = 0
scoreVisitor = 0
faultLocal = 0
faultVisitor = 0
period = 1
activated     = false

hotkey_btn_resetFaults     = obs.OBS_INVALID_HOTKEY_ID
hotkey_btn_incrementScoreLocal     = obs.OBS_INVALID_HOTKEY_ID
hotkey_btn_decrementScoreLocal     = obs.OBS_INVALID_HOTKEY_ID
hotkey_btn_incrementScoreVisitor     = obs.OBS_INVALID_HOTKEY_ID
hotkey_btn_decrementScoreVisitor     = obs.OBS_INVALID_HOTKEY_ID
hotkey_btn_incrementFaultLocal     = obs.OBS_INVALID_HOTKEY_ID
hotkey_btn_decrementFaultLocal     = obs.OBS_INVALID_HOTKEY_ID
hotkey_btn_incrementFaultVisitor     = obs.OBS_INVALID_HOTKEY_ID
hotkey_btn_decrementFaultVisitor     = obs.OBS_INVALID_HOTKEY_ID

-- Function to set the time text

function btn_incrementScoreLocal(pressed)
	if not pressed then
		return
	end

	scoreLocal = scoreLocal + 1
	local = string.format("%02d", scoreLocal)
	local source = obs.obs_get_source_by_name(scoreLocalSource)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
end

function btn_decrementScoreLocal(pressed)
	if not pressed then
		return
	end

	scoreLocal = scoreLocal - 1
	local = string.format("%02d", scoreLocal)
	local source = obs.obs_get_source_by_name(scoreLocalSource)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
end

function btn_incrementScoreVisitor(pressed)
	if not pressed then
		return
	end

	scoreVisitor = scoreVisitor + 1
	local = string.format("%02d", scoreVisitor)
	local source = obs.obs_get_source_by_name(scoreVisitorSource)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
end

function btn_decrementScoreVisitor(pressed)
	if not pressed then
		return
	end

	scoreVisitor = scoreVisitor - 1
	local = string.format("%02d", scoreVisitor)
	local source = obs.obs_get_source_by_name(scoreVisitorSource)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
end

function btn_incrementFaultLocal(pressed)
	if not pressed then
		return
	end

	faultLocal = faultLocal + 1
	local = string.format("%02d", faultLocal)
	local source = obs.obs_get_source_by_name(faultLocalSource)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
end

function btn_decrementFaultLocal(pressed)
	if not pressed then
		return
	end

	faultLocal = faultLocal - 1
	local = string.format("%02d", faultLocal)
	local source = obs.obs_get_source_by_name(faultLocalSource)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
end

function btn_incrementFaultVisitor(pressed)
	if not pressed then
		return
	end

	faultVisitor = faultVisitor + 1
	local = string.format("%02d", faultVisitor)
	local source = obs.obs_get_source_by_name(faultVisitorSource)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
end

function btn_decrementFaultVisitor(pressed)
	if not pressed then
		return
	end

	faultVisitor = faultVisitor - 1
	local = string.format("%02d", faultVisitor)
	local source = obs.obs_get_source_by_name(faultVisitorSource)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
end

function btn_incrementPeriod(pressed)
	if not pressed then
		return
	end

	period = period + 1
	local = string.format("%02d", period)
	local source = obs.obs_get_source_by_name(periodSource)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
end

function btn_decrementPeriod(pressed)
	if not pressed then
		return
	end

	period = period - 1
	local = string.format("%02d", period)
	local source = obs.obs_get_source_by_name(periodSource)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
end

function reset(pressed)
	if not pressed then
		return
	end

	scoreLocal = 0
	scoreVisitor = 0
	local = string.format("%02d", scoreLocal)
	local source = obs.obs_get_source_by_name(scoreLocalSource)
	if source ~= nil then
		local settings1 = obs.obs_data_create()
		obs.obs_data_set_string(settings1, "text", text)
		obs.obs_source_update(source, settings1)
		obs.obs_data_release(settings1)
		obs.obs_source_release(source)
	end
	text = string.format("%02d", scoreVisitor)
	source = obs.obs_get_source_by_name(scoreVisitorSource)
	if source ~= nil then
		local settings2 = obs.obs_data_create()
		obs.obs_data_set_string(settings2, "text", text)
		obs.obs_source_update(source, settings2)
		obs.obs_data_release(settings2)
		obs.obs_source_release(source)
	end
	
	faultLocal = 0
	faultVisitor = 0
	local = string.format("%02d", faultLocal)
	local source = obs.obs_get_source_by_name(faultLocalSource)
	if source ~= nil then
		local settings3 = obs.obs_data_create()
		obs.obs_data_set_string(settings3, "text", text)
		obs.obs_source_update(source, settings3)
		obs.obs_data_release(settings3)
		obs.obs_source_release(source)
	end
	text = string.format("%02d", faultVisitor)
	source = obs.obs_get_source_by_name(faultVisitorSource)
	if source ~= nil then
		local settings4 = obs.obs_data_create()
		obs.obs_data_set_string(settings4, "text", text)
		obs.obs_source_update(source, settings4)
		obs.obs_data_release(settings4)
		obs.obs_source_release(source)
	end
	
	period = 1
	local = string.format("%02d", period)
	local source = obs.obs_get_source_by_name(periodSource)
	if source ~= nil then
		local settings5 = obs.obs_data_create()
		obs.obs_data_set_string(settings5, "text", text)
		obs.obs_source_update(source, settings5)
		obs.obs_data_release(settings5)
		obs.obs_source_release(source)
	end
end

function resetFaults(props, p)
	faultLocal = 0
	faultVisitor = 0
	local = string.format("%02d", faultLocal)
	local source = obs.obs_get_source_by_name(faultLocalSource)
	if source ~= nil then
		local settings1 = obs.obs_data_create()
		obs.obs_data_set_string(settings1, "text", text)
		obs.obs_source_update(source, settings1)
		obs.obs_data_release(settings1)
		obs.obs_source_release(source)
	end
	text = string.format("%02d", faultVisitor)
	source = obs.obs_get_source_by_name(faultVisitorSource)
	if source ~= nil then
		local settings2 = obs.obs_data_create()
		obs.obs_data_set_string(settings2, "text", text)
		obs.obs_source_update(source, settings2)
		obs.obs_data_release(settings2)
		obs.obs_source_release(source)
	end
	return false
end

function incrementScoreLocal(props, p)
	scoreLocal = scoreLocal + 1
	local = string.format("%02d", scoreLocal)
	local source = obs.obs_get_source_by_name(scoreLocalSource)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
	return false
end

function decrementScoreLocal(props, p)
	scoreLocal = scoreLocal - 1
	local = string.format("%02d", scoreLocal)
	local source = obs.obs_get_source_by_name(scoreLocalSource)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
	return false
end

function incrementScoreVisitor(props, p)
	scoreVisitor = scoreVisitor + 1
	local = string.format("%02d", scoreVisitor)
	local source = obs.obs_get_source_by_name(scoreVisitorSource)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
	return false
end

function decrementScoreVisitor(props, p)
	scoreVisitor = scoreVisitor - 1
	local = string.format("%02d", scoreVisitor)
	local source = obs.obs_get_source_by_name(scoreVisitorSource)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
	return false
end

function incrementFaultLocal(props, p)
	faultLocal = faultLocal + 1
	local = string.format("%02d", faultLocal)
	local source = obs.obs_get_source_by_name(faultLocalSource)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
	return false
end

function decrementFaultLocal(props, p)
	faultLocal = faultLocal - 1
	local = string.format("%02d", faultLocal)
	local source = obs.obs_get_source_by_name(faultLocalSource)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
	return false
end

function incrementFaultVisitor(props, p)
	faultVisitor = faultVisitor + 1
	local = string.format("%02d", faultVisitor)
	local source = obs.obs_get_source_by_name(faultVisitorSource)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
	return false
end

function decrementFaultVisitor(props, p)
	faultVisitor = faultVisitor - 1
	local = string.format("%02d", faultVisitor)
	local source = obs.obs_get_source_by_name(faultVisitorSource)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
	return false
end

function incrementPeriod(props, p)
	period = period + 1
	local = string.format("%02d", period)
	local source = obs.obs_get_source_by_name(periodSource)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
	return false
end

function decrementPeriod(props, p)
	period = period - 1
	local = string.format("%02d", period)
	local source = obs.obs_get_source_by_name(periodSource)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
	return false
end


----------------------------------------------------------

-- A function named script_properties defines the properties that the user
-- can change for the entire script module itself
function script_properties()
	local props = obs.obs_properties_create()
	local scoreLocalSource = obs.obs_properties_add_list(props, "ScoreLocal", "Local Score source", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
	local scoreVisitorSource = obs.obs_properties_add_list(props, "ScoreVisitor", "Visitor Score source", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
	local faultLocalSource = obs.obs_properties_add_list(props, "FaultLocal", "Local Fault source", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
	local faultVisitorSource = obs.obs_properties_add_list(props, "FaultVisitor", "Visitor Fault source", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
	local periodSource = obs.obs_properties_add_list(props, "Period", "Period source", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
	local sources = obs.obs_enum_sources()
	if sources ~= nil then
		for _, source in ipairs(sources) do
			source_id = obs.obs_source_get_id(source)
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name(source)
				obs.obs_property_list_add_string(scoreLocalSource, name, name)
				obs.obs_property_list_add_string(scoreVisitorSource, name, name)
				obs.obs_property_list_add_string(faultLocalSource, name, name)
				obs.obs_property_list_add_string(faultVisitorSource, name, name)
				obs.obs_property_list_add_string(periodSource, name, name)
			end
		end
	end
	obs.source_list_release(sources)
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

-- A function named script_description returns the description shown to
-- the user
function script_description()
	return "DpT Scoreboard"
end

-- A function named script_update will be called when settings are changed
function script_update(settings)
	scoreLocalSource = obs.obs_data_get_string(settings, "ScoreLocal")
	scoreVisitorSource = obs.obs_data_get_string(settings, "ScoreVisitor")
	faultLocalSource = obs.obs_data_get_string(settings, "FaultLocal")
	faultVisitorSource = obs.obs_data_get_string(settings, "FaultVisitor")
	periodSource = obs.obs_data_get_string(settings, "Period")
	reset(true)
end

-- A function named script_defaults will be called to set the default settings
function script_defaults(settings)

end

-- A function named script_save will be called when the script is saved
--
-- NOTE: This function is usually used for saving extra data (such as in this
-- case, a hotkey's save data).  Settings set via the properties are saved
-- automatically.
function script_save(settings)
	local hotkey_save_array = obs.obs_hotkey_save(hotkey_btn_resetFaults)
	obs.obs_data_set_array(settings, "scoreboard.btn_resetFaults", hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
	
	local hotkey_save_array2 = obs.obs_hotkey_save(hotkey_btn_incrementScoreLocal)
	obs.obs_data_set_array(settings, "scoreboard.btn_incrementScoreLocal", hotkey_save_array2)
	obs.obs_data_array_release(hotkey_save_array2)
	
	local hotkey_save_array3 = obs.obs_hotkey_save(hotkey_btn_decrementScoreLocal)
	obs.obs_data_set_array(settings, "scoreboard.btn_decrementScoreLocal", hotkey_save_array3)
	obs.obs_data_array_release(hotkey_save_array3)
	
	local hotkey_save_array4 = obs.obs_hotkey_save(hotkey_btn_incrementScoreVisitor)
	obs.obs_data_set_array(settings, "scoreboard.btn_incrementScoreVisitor", hotkey_save_array4)
	obs.obs_data_array_release(hotkey_save_array4)
	
	local hotkey_save_array5 = obs.obs_hotkey_save(hotkey_btn_decrementScoreVisitor)
	obs.obs_data_set_array(settings, "scoreboard.btn_decrementScoreVisitor", hotkey_save_array5)
	obs.obs_data_array_release(hotkey_save_array5)
	
	local hotkey_save_array6 = obs.obs_hotkey_save(hotkey_btn_incrementScoreVisitor)
	obs.obs_data_set_array(settings, "scoreboard.btn_incrementFaultLocal", hotkey_save_array6)
	obs.obs_data_array_release(hotkey_save_array6)
	
	local hotkey_save_array7 = obs.obs_hotkey_save(hotkey_btn_decrementScoreVisitor)
	obs.obs_data_set_array(settings, "scoreboard.btn_decrementFaultLocal", hotkey_save_array7)
	obs.obs_data_array_release(hotkey_save_array7)
	
	local hotkey_save_array8 = obs.obs_hotkey_save(hotkey_btn_incrementScoreVisitor)
	obs.obs_data_set_array(settings, "scoreboard.btn_incrementFaultVisitor", hotkey_save_array8)
	obs.obs_data_array_release(hotkey_save_array8)
	
	local hotkey_save_array9 = obs.obs_hotkey_save(hotkey_btn_decrementScoreVisitor)
	obs.obs_data_set_array(settings, "scoreboard.btn_decrementFaultVisitor", hotkey_save_array9)
	obs.obs_data_array_release(hotkey_save_array9)
	
	local hotkey_save_array10 = obs.obs_hotkey_save(hotkey_btn_incrementScoreVisitor)
	obs.obs_data_set_array(settings, "scoreboard.btn_incrementPeriod", hotkey_save_array10)
	obs.obs_data_array_release(hotkey_save_array10)
	
	local hotkey_save_array11 = obs.obs_hotkey_save(hotkey_btn_decrementScoreVisitor)
	obs.obs_data_set_array(settings, "scoreboard.btn_decrementPeriod", hotkey_save_array11)
	obs.obs_data_array_release(hotkey_save_array11)
end

-- a function named script_load will be called on startup
function script_load(settings)
	-- Connect hotkey and activation/deactivation signal callbacks
	--
	-- NOTE: These particular script callbacks do not necessarily have to
	-- be disconnected, as callbacks will automatically destroy themselves
	-- if the script is unloaded.  So there's no real need to manually
	-- disconnect callbacks that are intended to last until the script is
	-- unloaded.
	local sh = obs.obs_get_signal_handler()
	obs.signal_handler_connect(sh, "source_activate", source_activated)
	obs.signal_handler_connect(sh, "source_deactivate", source_deactivated)

	hotkey_btn_resetFaults = obs.obs_hotkey_register_frontend("scoreboard.btn_resetFaults", "Reset Faults", reset)
	hotkey_btn_incrementScoreLocal = obs.obs_hotkey_register_frontend("scoreboard.btn_incrementScoreLocal", "Score Local +", btn_incrementScoreLocal)
	hotkey_btn_decrementScoreLocal = obs.obs_hotkey_register_frontend("scoreboard.btn_decrementScoreLocal", "Score Local -", btn_decrementScoreLocal)
	hotkey_btn_incrementScoreVisitor = obs.obs_hotkey_register_frontend("scoreboard.btn_incrementScoreVisitor", "Score Visitor +", btn_incrementScoreVisitor)
	hotkey_btn_decrementScoreVisitor = obs.obs_hotkey_register_frontend("scoreboard.btn_decrementScoreVisitor", "Score Visitor -", btn_decrementScoreVisitor)
	hotkey_btn_incrementFaultLocal = obs.obs_hotkey_register_frontend("scoreboard.btn_incrementFaultLocal", "Fault Local +", btn_incrementFaultLocal)
	hotkey_btn_decrementFaultLocal = obs.obs_hotkey_register_frontend("scoreboard.btn_decrementFaultLocal", "Fault Local -", btn_decrementFaultLocal)
	hotkey_btn_incrementFaultVisitor = obs.obs_hotkey_register_frontend("scoreboard.btn_incrementFaultVisitor", "Fault Visitor +", btn_incrementFaultVisitor)
	hotkey_btn_decrementFaultVisitor = obs.obs_hotkey_register_frontend("scoreboard.btn_decrementFaultVisitor", "Fault Visitor -", btn_decrementFaultVisitor)
	hotkey_btn_incrementPeriod = obs.obs_hotkey_register_frontend("scoreboard.btn_incrementPeriod", "Period +", btn_incrementPeriod)
	hotkey_btn_decrementPeriod = obs.obs_hotkey_register_frontend("scoreboard.btn_decrementPeriod", "Period -", btn_decrementPeriod)
	
	local hotkey_save_array = obs.obs_data_get_array(settings, "scoreboard.btn_resetFaults")
	obs.obs_hotkey_load(hotkey_btn_resetFaults, hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
	
	local hotkey_save_array1 = obs.obs_data_get_array(settings, "scoreboard.btn_incrementScoreLocal")
	obs.obs_hotkey_load(hotkey_btn_incrementScoreLocal, hotkey_save_array1)
	obs.obs_data_array_release(hotkey_save_array1)

	local hotkey_save_array2 = obs.obs_data_get_array(settings, "scoreboard.btn_decrementScoreLocal")
	obs.obs_hotkey_load(hotkey_btn_decrementScoreLocal, hotkey_save_array2)
	obs.obs_data_array_release(hotkey_save_array2)
	
	local hotkey_save_array3 = obs.obs_data_get_array(settings, "scoreboard.btn_incrementScoreVisitor")
	obs.obs_hotkey_load(hotkey_btn_incrementScoreVisitor, hotkey_save_array3)
	obs.obs_data_array_release(hotkey_save_array3)
	
	local hotkey_save_array4 = obs.obs_data_get_array(settings, "scoreboard.btn_decrementScoreVisitor")
	obs.obs_hotkey_load(hotkey_btn_decrementScoreVisitor, hotkey_save_array4)
	obs.obs_data_array_release(hotkey_save_array4) 
	
	local hotkey_save_array5 = obs.obs_data_get_array(settings, "scoreboard.btn_incrementFaultLocal")
	obs.obs_hotkey_load(hotkey_btn_incrementFaultLocal, hotkey_save_array5)
	obs.obs_data_array_release(hotkey_save_array5)

	local hotkey_save_array6 = obs.obs_data_get_array(settings, "scoreboard.btn_decrementFaultLocal")
	obs.obs_hotkey_load(hotkey_btn_decrementFaultLocal, hotkey_save_array6)
	obs.obs_data_array_release(hotkey_save_array6)
	
	local hotkey_save_array7 = obs.obs_data_get_array(settings, "scoreboard.btn_incrementFaultVisitor")
	obs.obs_hotkey_load(hotkey_btn_incrementFaultVisitor, hotkey_save_array7)
	obs.obs_data_array_release(hotkey_save_array7)
	
	local hotkey_save_array8 = obs.obs_data_get_array(settings, "scoreboard.btn_decrementFaultVisitor")
	obs.obs_hotkey_load(hotkey_btn_decrementFaultVisitor, hotkey_save_array8)
	obs.obs_data_array_release(hotkey_save_array8) 
end
