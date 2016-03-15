# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set packetOutWidth [ipgui::add_param $IPINST -parent $Page0 -name packetOutWidth]
	set packetInWidth [ipgui::add_param $IPINST -parent $Page0 -name packetInWidth]
}

proc update_PARAM_VALUE.packetOutWidth { PARAM_VALUE.packetOutWidth } {
	# Procedure called to update packetOutWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.packetOutWidth { PARAM_VALUE.packetOutWidth } {
	# Procedure called to validate packetOutWidth
	return true
}

proc update_PARAM_VALUE.packetInWidth { PARAM_VALUE.packetInWidth } {
	# Procedure called to update packetInWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.packetInWidth { PARAM_VALUE.packetInWidth } {
	# Procedure called to validate packetInWidth
	return true
}


proc update_MODELPARAM_VALUE.packetInWidth { MODELPARAM_VALUE.packetInWidth PARAM_VALUE.packetInWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.packetInWidth}] ${MODELPARAM_VALUE.packetInWidth}
}

proc update_MODELPARAM_VALUE.packetOutWidth { MODELPARAM_VALUE.packetOutWidth PARAM_VALUE.packetOutWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.packetOutWidth}] ${MODELPARAM_VALUE.packetOutWidth}
}

