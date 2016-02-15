# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set address [ipgui::add_param $IPINST -parent $Page0 -name address]
	set addressWidth [ipgui::add_param $IPINST -parent $Page0 -name addressWidth]
	set dataWidth [ipgui::add_param $IPINST -parent $Page0 -name dataWidth]
}

proc update_PARAM_VALUE.address { PARAM_VALUE.address } {
	# Procedure called to update address when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.address { PARAM_VALUE.address } {
	# Procedure called to validate address
	return true
}

proc update_PARAM_VALUE.addressWidth { PARAM_VALUE.addressWidth } {
	# Procedure called to update addressWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.addressWidth { PARAM_VALUE.addressWidth } {
	# Procedure called to validate addressWidth
	return true
}

proc update_PARAM_VALUE.dataWidth { PARAM_VALUE.dataWidth } {
	# Procedure called to update dataWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.dataWidth { PARAM_VALUE.dataWidth } {
	# Procedure called to validate dataWidth
	return true
}


proc update_MODELPARAM_VALUE.dataWidth { MODELPARAM_VALUE.dataWidth PARAM_VALUE.dataWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.dataWidth}] ${MODELPARAM_VALUE.dataWidth}
}

proc update_MODELPARAM_VALUE.addressWidth { MODELPARAM_VALUE.addressWidth PARAM_VALUE.addressWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.addressWidth}] ${MODELPARAM_VALUE.addressWidth}
}

proc update_MODELPARAM_VALUE.address { MODELPARAM_VALUE.address PARAM_VALUE.address } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.address}] ${MODELPARAM_VALUE.address}
}

