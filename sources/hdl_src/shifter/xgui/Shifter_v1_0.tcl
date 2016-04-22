# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set valueWidth [ipgui::add_param $IPINST -parent $Page0 -name valueWidth]
	set transferWidth [ipgui::add_param $IPINST -parent $Page0 -name transferWidth]
	set shiftWidth [ipgui::add_param $IPINST -parent $Page0 -name shiftWidth]
}

proc update_PARAM_VALUE.valueWidth { PARAM_VALUE.valueWidth } {
	# Procedure called to update valueWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.valueWidth { PARAM_VALUE.valueWidth } {
	# Procedure called to validate valueWidth
	return true
}

proc update_PARAM_VALUE.transferWidth { PARAM_VALUE.transferWidth } {
	# Procedure called to update transferWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.transferWidth { PARAM_VALUE.transferWidth } {
	# Procedure called to validate transferWidth
	return true
}

proc update_PARAM_VALUE.shiftWidth { PARAM_VALUE.shiftWidth } {
	# Procedure called to update shiftWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.shiftWidth { PARAM_VALUE.shiftWidth } {
	# Procedure called to validate shiftWidth
	return true
}


proc update_MODELPARAM_VALUE.shiftWidth { MODELPARAM_VALUE.shiftWidth PARAM_VALUE.shiftWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.shiftWidth}] ${MODELPARAM_VALUE.shiftWidth}
}

proc update_MODELPARAM_VALUE.transferWidth { MODELPARAM_VALUE.transferWidth PARAM_VALUE.transferWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.transferWidth}] ${MODELPARAM_VALUE.transferWidth}
}

proc update_MODELPARAM_VALUE.valueWidth { MODELPARAM_VALUE.valueWidth PARAM_VALUE.valueWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.valueWidth}] ${MODELPARAM_VALUE.valueWidth}
}

