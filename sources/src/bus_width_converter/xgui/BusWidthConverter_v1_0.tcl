# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set dinWidth [ipgui::add_param $IPINST -parent $Page0 -name dinWidth]
	set doutWidth [ipgui::add_param $IPINST -parent $Page0 -name doutWidth]
}

proc update_PARAM_VALUE.dinWidth { PARAM_VALUE.dinWidth } {
	# Procedure called to update dinWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.dinWidth { PARAM_VALUE.dinWidth } {
	# Procedure called to validate dinWidth
	return true
}

proc update_PARAM_VALUE.doutWidth { PARAM_VALUE.doutWidth } {
	# Procedure called to update doutWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.doutWidth { PARAM_VALUE.doutWidth } {
	# Procedure called to validate doutWidth
	return true
}


proc update_MODELPARAM_VALUE.dinWidth { MODELPARAM_VALUE.dinWidth PARAM_VALUE.dinWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.dinWidth}] ${MODELPARAM_VALUE.dinWidth}
}

proc update_MODELPARAM_VALUE.doutWidth { MODELPARAM_VALUE.doutWidth PARAM_VALUE.doutWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.doutWidth}] ${MODELPARAM_VALUE.doutWidth}
}

