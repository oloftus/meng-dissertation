#-----------------------
#Loading from existing component.
ipx::open_core {./component.xml}
#-----------------------

ipx::remove_all_port [ipx::current_core]
ipx::remove_all_file_group [ipx::current_core]
ipx::remove_all_bus_interface [ipx::current_core]

#-----------------------
# SYNTHESIS FILESET
#-----------------------
ipx::add_file_group {xilinx_vhdlsynthesis} [ipx::current_core]
ipx::add_file Neuron0_ooc.xdc [ipx::get_file_group xilinx_vhdlsynthesis [ipx::current_core]]
ipx::add_file hw_handoff/Neuron0.hwh [ipx::get_file_group xilinx_vhdlsynthesis [ipx::current_core]]
ipx::add_file ip/Neuron0_And2_0_0/Neuron0_And2_0_0.xci [ipx::get_file_group xilinx_vhdlsynthesis [ipx::current_core]]
ipx::add_file ip/Neuron0_PlanWrapper_0_0/Neuron0_PlanWrapper_0_0.xci [ipx::get_file_group xilinx_vhdlsynthesis [ipx::current_core]]
ipx::add_file ip/Neuron0_Synapse_0_0/Neuron0_Synapse_0_0.xci [ipx::get_file_group xilinx_vhdlsynthesis [ipx::current_core]]
ipx::add_file ip/Neuron0_Synapse_0_1/Neuron0_Synapse_0_1.xci [ipx::get_file_group xilinx_vhdlsynthesis [ipx::current_core]]
ipx::add_file ip/Neuron0_ValidSetter_0_0/Neuron0_ValidSetter_0_0.xci [ipx::get_file_group xilinx_vhdlsynthesis [ipx::current_core]]
ipx::add_file ip/Neuron0_c_addsub_0_0/Neuron0_c_addsub_0_0.xci [ipx::get_file_group xilinx_vhdlsynthesis [ipx::current_core]]
ipx::add_file ip/Neuron0_mult_gen_0_0/Neuron0_mult_gen_0_0.xci [ipx::get_file_group xilinx_vhdlsynthesis [ipx::current_core]]
ipx::add_file ip/Neuron0_mult_gen_0_1/Neuron0_mult_gen_0_1.xci [ipx::get_file_group xilinx_vhdlsynthesis [ipx::current_core]]
ipx::add_file ip/Neuron0_xlconstant_0_0/Neuron0_xlconstant_0_0.xci [ipx::get_file_group xilinx_vhdlsynthesis [ipx::current_core]]
ipx::add_file ip/Neuron0_xlconstant_0_1/Neuron0_xlconstant_0_1.xci [ipx::get_file_group xilinx_vhdlsynthesis [ipx::current_core]]
ipx::add_file hdl/Neuron0.vhd [ipx::get_file_group xilinx_vhdlsynthesis [ipx::current_core]]
set_property {model_name} {Neuron0} [ipx::get_file_group xilinx_vhdlsynthesis [ipx::current_core]]

#-----------------------
# SIMULATION FILESET
#-----------------------
ipx::add_file_group {xilinx_vhdlbehavioralsimulation} [ipx::current_core]
ipx::add_file Neuron0_ooc.xdc [ipx::get_file_group xilinx_vhdlbehavioralsimulation [ipx::current_core]]
ipx::add_file hw_handoff/Neuron0.hwh [ipx::get_file_group xilinx_vhdlbehavioralsimulation [ipx::current_core]]
ipx::add_file ip/Neuron0_And2_0_0/Neuron0_And2_0_0.xci [ipx::get_file_group xilinx_vhdlbehavioralsimulation [ipx::current_core]]
ipx::add_file ip/Neuron0_PlanWrapper_0_0/Neuron0_PlanWrapper_0_0.xci [ipx::get_file_group xilinx_vhdlbehavioralsimulation [ipx::current_core]]
ipx::add_file ip/Neuron0_Synapse_0_0/Neuron0_Synapse_0_0.xci [ipx::get_file_group xilinx_vhdlbehavioralsimulation [ipx::current_core]]
ipx::add_file ip/Neuron0_Synapse_0_1/Neuron0_Synapse_0_1.xci [ipx::get_file_group xilinx_vhdlbehavioralsimulation [ipx::current_core]]
ipx::add_file ip/Neuron0_ValidSetter_0_0/Neuron0_ValidSetter_0_0.xci [ipx::get_file_group xilinx_vhdlbehavioralsimulation [ipx::current_core]]
ipx::add_file ip/Neuron0_c_addsub_0_0/Neuron0_c_addsub_0_0.xci [ipx::get_file_group xilinx_vhdlbehavioralsimulation [ipx::current_core]]
ipx::add_file ip/Neuron0_mult_gen_0_0/Neuron0_mult_gen_0_0.xci [ipx::get_file_group xilinx_vhdlbehavioralsimulation [ipx::current_core]]
ipx::add_file ip/Neuron0_mult_gen_0_1/Neuron0_mult_gen_0_1.xci [ipx::get_file_group xilinx_vhdlbehavioralsimulation [ipx::current_core]]
ipx::add_file ip/Neuron0_xlconstant_0_0/Neuron0_xlconstant_0_0.xci [ipx::get_file_group xilinx_vhdlbehavioralsimulation [ipx::current_core]]
ipx::add_file ip/Neuron0_xlconstant_0_1/Neuron0_xlconstant_0_1.xci [ipx::get_file_group xilinx_vhdlbehavioralsimulation [ipx::current_core]]
ipx::add_file hdl/Neuron0.vhd [ipx::get_file_group xilinx_vhdlbehavioralsimulation [ipx::current_core]]
set_property {model_name} {Neuron0} [ipx::get_file_group xilinx_vhdlbehavioralsimulation [ipx::current_core]]

#-----------------------
# PORTS 
#-----------------------
ipx::add_ports_from_hdl [::ipx::current_core] -top_level_hdl_file ./hdl/Neuron0.vhd -top_module_name Neuron0

#-----------------------
# BUS INTERFACES 
#-----------------------
#------------------
#   Adding CLK.CLK
#------------------
ipx::add_bus_interface {CLK.CLK} [ipx::current_core]
set_property display_name {Clk} [ipx::get_bus_interface {CLK.CLK} [ipx::current_core]]
set_property interface_mode {slave} [ipx::get_bus_interface {CLK.CLK} [ipx::current_core]]

#   Adding Bus Type VNLV xilinx.com:signal:clock:1.0
set_property {bus_type_vlnv} {xilinx.com:signal:clock:1.0}  [ipx::get_bus_interface CLK.CLK [ipx::current_core]]

#   Adding Abstraction VNLV xilinx.com:signal:clock_rtl:1.0
set_property {abstraction_type_vlnv} {xilinx.com:signal:clock_rtl:1.0}  [ipx::get_bus_interface CLK.CLK [ipx::current_core]]

#   Adding PortMap
set_property {physical_name} {CLK} [ipx::add_port_map {CLK}  [ipx::get_bus_interface {CLK.CLK} [ipx::current_core]]]
#   Adding Parameters
#------------------
#   Adding RST.RST
#------------------
ipx::add_bus_interface {RST.RST} [ipx::current_core]
set_property display_name {Reset} [ipx::get_bus_interface {RST.RST} [ipx::current_core]]
set_property interface_mode {slave} [ipx::get_bus_interface {RST.RST} [ipx::current_core]]

#   Adding Bus Type VNLV xilinx.com:signal:reset:1.0
set_property {bus_type_vlnv} {xilinx.com:signal:reset:1.0}  [ipx::get_bus_interface RST.RST [ipx::current_core]]

#   Adding Abstraction VNLV xilinx.com:signal:reset_rtl:1.0
set_property {abstraction_type_vlnv} {xilinx.com:signal:reset_rtl:1.0}  [ipx::get_bus_interface RST.RST [ipx::current_core]]

#   Adding PortMap
set_property {physical_name} {RST} [ipx::add_port_map {RST}  [ipx::get_bus_interface {RST.RST} [ipx::current_core]]]
#   Adding Parameters
#------------------
#   Adding DATA.SYN_0_DIN
#------------------
ipx::add_bus_interface {DATA.SYN_0_DIN} [ipx::current_core]
set_property display_name {Data} [ipx::get_bus_interface {DATA.SYN_0_DIN} [ipx::current_core]]
set_property interface_mode {slave} [ipx::get_bus_interface {DATA.SYN_0_DIN} [ipx::current_core]]

#   Adding Bus Type VNLV xilinx.com:signal:data:1.0
set_property {bus_type_vlnv} {xilinx.com:signal:data:1.0}  [ipx::get_bus_interface DATA.SYN_0_DIN [ipx::current_core]]

#   Adding Abstraction VNLV xilinx.com:signal:data_rtl:1.0
set_property {abstraction_type_vlnv} {xilinx.com:signal:data_rtl:1.0}  [ipx::get_bus_interface DATA.SYN_0_DIN [ipx::current_core]]

#   Adding PortMap
set_property {physical_name} {SYN_0_DIN} [ipx::add_port_map {DATA}  [ipx::get_bus_interface {DATA.SYN_0_DIN} [ipx::current_core]]]
#   Adding Parameters
#------------------
#   Adding DATA.SYN_1_DIN
#------------------
ipx::add_bus_interface {DATA.SYN_1_DIN} [ipx::current_core]
set_property display_name {Data1} [ipx::get_bus_interface {DATA.SYN_1_DIN} [ipx::current_core]]
set_property interface_mode {slave} [ipx::get_bus_interface {DATA.SYN_1_DIN} [ipx::current_core]]

#   Adding Bus Type VNLV xilinx.com:signal:data:1.0
set_property {bus_type_vlnv} {xilinx.com:signal:data:1.0}  [ipx::get_bus_interface DATA.SYN_1_DIN [ipx::current_core]]

#   Adding Abstraction VNLV xilinx.com:signal:data_rtl:1.0
set_property {abstraction_type_vlnv} {xilinx.com:signal:data_rtl:1.0}  [ipx::get_bus_interface DATA.SYN_1_DIN [ipx::current_core]]

#   Adding PortMap
set_property {physical_name} {SYN_1_DIN} [ipx::add_port_map {DATA}  [ipx::get_bus_interface {DATA.SYN_1_DIN} [ipx::current_core]]]
#   Adding Parameters
#------------------
#   Adding DATA.SYN_OUT
#------------------
ipx::add_bus_interface {DATA.SYN_OUT} [ipx::current_core]
set_property display_name {Data2} [ipx::get_bus_interface {DATA.SYN_OUT} [ipx::current_core]]
set_property interface_mode {slave} [ipx::get_bus_interface {DATA.SYN_OUT} [ipx::current_core]]

#   Adding Bus Type VNLV xilinx.com:signal:data:1.0
set_property {bus_type_vlnv} {xilinx.com:signal:data:1.0}  [ipx::get_bus_interface DATA.SYN_OUT [ipx::current_core]]

#   Adding Abstraction VNLV xilinx.com:signal:data_rtl:1.0
set_property {abstraction_type_vlnv} {xilinx.com:signal:data_rtl:1.0}  [ipx::get_bus_interface DATA.SYN_OUT [ipx::current_core]]

#   Adding PortMap
set_property {physical_name} {SYN_OUT} [ipx::add_port_map {DATA}  [ipx::get_bus_interface {DATA.SYN_OUT} [ipx::current_core]]]
#   Adding Parameters
ipx::add_bus_parameter {LAYERED_METADATA}  [ipx::get_bus_interface DATA.SYN_OUT [ipx::current_core]]
set_property {value} {undef} [ipx::get_bus_parameter {LAYERED_METADATA}   [ipx::get_bus_interface DATA.SYN_OUT [ipx::current_core]]]


#-----------------------
# SAVE CORE TO REPOS
#-----------------------
ipx::create_default_gui_files [ipx::current_core]
ipx::save_core [ipx::current_core]
ipx::check_integrity  [ipx::current_core]
update_ip_catalog
