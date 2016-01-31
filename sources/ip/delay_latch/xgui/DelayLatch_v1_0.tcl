# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set delayWidth [ipgui::add_param $IPINST -parent $Page0 -name delayWidth]
	set delay [ipgui::add_param $IPINST -parent $Page0 -name delay]
}

proc update_PARAM_VALUE.delayWidth { PARAM_VALUE.delayWidth } {
	# Procedure called to update delayWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.delayWidth { PARAM_VALUE.delayWidth } {
	# Procedure called to validate delayWidth
	return true
}

proc update_PARAM_VALUE.delay { PARAM_VALUE.delay } {
	# Procedure called to update delay when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.delay { PARAM_VALUE.delay } {
	# Procedure called to validate delay
	return true
}


proc update_MODELPARAM_VALUE.delay { MODELPARAM_VALUE.delay PARAM_VALUE.delay } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.delay}] ${MODELPARAM_VALUE.delay}
}

proc update_MODELPARAM_VALUE.delayWidth { MODELPARAM_VALUE.delayWidth PARAM_VALUE.delayWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.delayWidth}] ${MODELPARAM_VALUE.delayWidth}
}

