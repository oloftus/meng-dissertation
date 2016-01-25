# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set fractionPrecision [ipgui::add_param $IPINST -parent $Page0 -name fractionPrecision]
	set integerPrecision [ipgui::add_param $IPINST -parent $Page0 -name integerPrecision]
}

proc update_PARAM_VALUE.fractionPrecision { PARAM_VALUE.fractionPrecision } {
	# Procedure called to update fractionPrecision when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.fractionPrecision { PARAM_VALUE.fractionPrecision } {
	# Procedure called to validate fractionPrecision
	return true
}

proc update_PARAM_VALUE.integerPrecision { PARAM_VALUE.integerPrecision } {
	# Procedure called to update integerPrecision when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.integerPrecision { PARAM_VALUE.integerPrecision } {
	# Procedure called to validate integerPrecision
	return true
}


proc update_MODELPARAM_VALUE.integerPrecision { MODELPARAM_VALUE.integerPrecision PARAM_VALUE.integerPrecision } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.integerPrecision}] ${MODELPARAM_VALUE.integerPrecision}
}

proc update_MODELPARAM_VALUE.fractionPrecision { MODELPARAM_VALUE.fractionPrecision PARAM_VALUE.fractionPrecision } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.fractionPrecision}] ${MODELPARAM_VALUE.fractionPrecision}
}

