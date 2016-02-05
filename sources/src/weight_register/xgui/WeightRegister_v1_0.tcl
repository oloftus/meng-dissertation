# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set addrSize [ipgui::add_param $IPINST -parent $Page0 -name addrSize]
	set dataSize [ipgui::add_param $IPINST -parent $Page0 -name dataSize]
}

proc update_PARAM_VALUE.addrSize { PARAM_VALUE.addrSize } {
	# Procedure called to update addrSize when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.addrSize { PARAM_VALUE.addrSize } {
	# Procedure called to validate addrSize
	return true
}

proc update_PARAM_VALUE.dataSize { PARAM_VALUE.dataSize } {
	# Procedure called to update dataSize when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.dataSize { PARAM_VALUE.dataSize } {
	# Procedure called to validate dataSize
	return true
}


proc update_MODELPARAM_VALUE.dataSize { MODELPARAM_VALUE.dataSize PARAM_VALUE.dataSize } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.dataSize}] ${MODELPARAM_VALUE.dataSize}
}

proc update_MODELPARAM_VALUE.addrSize { MODELPARAM_VALUE.addrSize PARAM_VALUE.addrSize } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.addrSize}] ${MODELPARAM_VALUE.addrSize}
}

