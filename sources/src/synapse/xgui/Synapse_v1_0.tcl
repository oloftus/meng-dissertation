# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set size [ipgui::add_param $IPINST -parent $Page0 -name size]
}

proc update_PARAM_VALUE.size { PARAM_VALUE.size } {
	# Procedure called to update size when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.size { PARAM_VALUE.size } {
	# Procedure called to validate size
	return true
}


proc update_MODELPARAM_VALUE.size { MODELPARAM_VALUE.size PARAM_VALUE.size } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.size}] ${MODELPARAM_VALUE.size}
}

