# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set latencyWidth [ipgui::add_param $IPINST -parent $Page0 -name latencyWidth]
	set latency [ipgui::add_param $IPINST -parent $Page0 -name latency]
}

proc update_PARAM_VALUE.latencyWidth { PARAM_VALUE.latencyWidth } {
	# Procedure called to update latencyWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.latencyWidth { PARAM_VALUE.latencyWidth } {
	# Procedure called to validate latencyWidth
	return true
}

proc update_PARAM_VALUE.latency { PARAM_VALUE.latency } {
	# Procedure called to update latency when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.latency { PARAM_VALUE.latency } {
	# Procedure called to validate latency
	return true
}


proc update_MODELPARAM_VALUE.latency { MODELPARAM_VALUE.latency PARAM_VALUE.latency } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.latency}] ${MODELPARAM_VALUE.latency}
}

proc update_MODELPARAM_VALUE.latencyWidth { MODELPARAM_VALUE.latencyWidth PARAM_VALUE.latencyWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.latencyWidth}] ${MODELPARAM_VALUE.latencyWidth}
}

