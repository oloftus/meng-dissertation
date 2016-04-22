# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set inputWidth [ipgui::add_param $IPINST -parent $Page0 -name inputWidth]
	set numInputs [ipgui::add_param $IPINST -parent $Page0 -name numInputs]
}

proc update_PARAM_VALUE.inputWidth { PARAM_VALUE.inputWidth } {
	# Procedure called to update inputWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.inputWidth { PARAM_VALUE.inputWidth } {
	# Procedure called to validate inputWidth
	return true
}

proc update_PARAM_VALUE.numInputs { PARAM_VALUE.numInputs } {
	# Procedure called to update numInputs when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.numInputs { PARAM_VALUE.numInputs } {
	# Procedure called to validate numInputs
	return true
}


proc update_MODELPARAM_VALUE.numInputs { MODELPARAM_VALUE.numInputs PARAM_VALUE.numInputs } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.numInputs}] ${MODELPARAM_VALUE.numInputs}
}

proc update_MODELPARAM_VALUE.inputWidth { MODELPARAM_VALUE.inputWidth PARAM_VALUE.inputWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.inputWidth}] ${MODELPARAM_VALUE.inputWidth}
}

