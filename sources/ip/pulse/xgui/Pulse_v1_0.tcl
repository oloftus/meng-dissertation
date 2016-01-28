# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set multipleWidth [ipgui::add_param $IPINST -parent $Page0 -name multipleWidth]
	set multiple [ipgui::add_param $IPINST -parent $Page0 -name multiple]
}

proc update_PARAM_VALUE.multipleWidth { PARAM_VALUE.multipleWidth } {
	# Procedure called to update multipleWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.multipleWidth { PARAM_VALUE.multipleWidth } {
	# Procedure called to validate multipleWidth
	return true
}

proc update_PARAM_VALUE.multiple { PARAM_VALUE.multiple } {
	# Procedure called to update multiple when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.multiple { PARAM_VALUE.multiple } {
	# Procedure called to validate multiple
	return true
}


proc update_MODELPARAM_VALUE.multiple { MODELPARAM_VALUE.multiple PARAM_VALUE.multiple } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.multiple}] ${MODELPARAM_VALUE.multiple}
}

proc update_MODELPARAM_VALUE.multipleWidth { MODELPARAM_VALUE.multipleWidth PARAM_VALUE.multipleWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.multipleWidth}] ${MODELPARAM_VALUE.multipleWidth}
}

