create_bd_port -dir I -type clk CLK
create_bd_port -dir I -type rst RST
create_bd_port -dir I -from 31 -to 0 -type data PKT_IN
create_bd_port -dir I PKT_IN_VALID
create_bd_port -dir O DONE_OUT
create_bd_port -dir O -from 12 -to 0 -type data SYN_0_OUT
create_bd_port -dir O -from 12 -to 0 -type data SYN_1_OUT
create_bd_port -dir O SYN_0_OUT_VALID
create_bd_port -dir O SYN_1_OUT_VALID



create_bd_cell -type ip -vlnv xilinx.com:ip:Neuron_wrapper:1.0 Neuron_0_0
create_bd_cell -type ip -vlnv xilinx.com:ip:Neuron_wrapper:1.0 Neuron_0_1
create_bd_cell -type ip -vlnv xilinx.com:ip:Neuron_wrapper:1.0 Neuron_1_0
create_bd_cell -type ip -vlnv xilinx.com:ip:Neuron_wrapper:1.0 Neuron_1_1


# Stimulus 0
create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 AddressableRegister_0
# Stimulus 1
create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 AddressableRegister_1

# Type router (stimulus)
create_bd_cell -type ip -vlnv oloftus.com:prif:ValueRouter:4.0 ValueRouter_0
# Type router (weight)
create_bd_cell -type ip -vlnv oloftus.com:prif:ValueRouter:4.0 ValueRouter_3
# Layer router 1
create_bd_cell -type ip -vlnv oloftus.com:prif:ValueRouter:4.0 ValueRouter_1
# Layer router 2
create_bd_cell -type ip -vlnv oloftus.com:prif:ValueRouter:4.0 ValueRouter_2

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_3


set_property -dict [list CONFIG.address {1} CONFIG.addressWidth {19} CONFIG.dataWidth {13}] [get_bd_cells AddressableRegister_0]
set_property -dict [list CONFIG.address {2} CONFIG.addressWidth {19} CONFIG.dataWidth {13}] [get_bd_cells AddressableRegister_1]

set_property -dict [list CONFIG.packetOutWidth {31} CONFIG.packetInWidth {32}] [get_bd_cells ValueRouter_0]
set_property -dict [list CONFIG.packetOutWidth {31} CONFIG.packetInWidth {32}] [get_bd_cells ValueRouter_3]


connect_bd_net [get_bd_ports CLK] [get_bd_pins ValueRouter_3/CLK]
connect_bd_net [get_bd_ports CLK] [get_bd_pins ValueRouter_0/CLK]
connect_bd_net [get_bd_ports CLK] [get_bd_pins AddressableRegister_0/CLK]
connect_bd_net [get_bd_ports CLK] [get_bd_pins AddressableRegister_1/CLK]
connect_bd_net [get_bd_ports CLK] [get_bd_pins ValueRouter_1/CLK]
connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_0_0/CLK]
connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_0_1/CLK]
connect_bd_net [get_bd_ports CLK] [get_bd_pins ValueRouter_2/CLK]
connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_1_0/CLK]
connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_1_1/CLK]

connect_bd_net [get_bd_ports RST] [get_bd_pins AddressableRegister_0/RST]
connect_bd_net [get_bd_ports RST] [get_bd_pins AddressableRegister_1/RST]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_0_0/RST]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_0_1/RST]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_1_0/RST]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_1_1/RST]

connect_bd_net [get_bd_pins xlconstant_0/dout] [get_bd_pins Neuron_0_0/NEURON_ADDR]
connect_bd_net [get_bd_pins xlconstant_1/dout] [get_bd_pins Neuron_0_1/NEURON_ADDR]
connect_bd_net [get_bd_pins xlconstant_2/dout] [get_bd_pins Neuron_1_1/NEURON_ADDR]
connect_bd_net [get_bd_pins xlconstant_3/dout] [get_bd_pins Neuron_1_0/NEURON_ADDR]

connect_bd_net [get_bd_ports PKT_IN_VALID] [get_bd_pins ValueRouter_0/PKT_IN_VALID]
connect_bd_net -net [get_bd_nets PKT_IN_VALID_1] [get_bd_ports PKT_IN_VALID] [get_bd_pins ValueRouter_3/PKT_IN_VALID]
connect_bd_net [get_bd_ports PKT_IN] [get_bd_pins ValueRouter_3/PKT_IN]
connect_bd_net -net [get_bd_nets PKT_IN_1] [get_bd_ports PKT_IN] [get_bd_pins ValueRouter_0/PKT_IN]

connect_bd_net [get_bd_pins ValueRouter_0/PKT_OUT_VALID] [get_bd_pins AddressableRegister_0/PKT_IN_VALID]
connect_bd_net [get_bd_pins AddressableRegister_1/PKT_IN_VALID] [get_bd_pins ValueRouter_0/PKT_OUT_VALID]
connect_bd_net [get_bd_pins AddressableRegister_1/PKT_IN] [get_bd_pins ValueRouter_0/PKT_OUT]
connect_bd_net [get_bd_pins AddressableRegister_0/PKT_IN] [get_bd_pins ValueRouter_0/PKT_OUT]
connect_bd_net [get_bd_pins ValueRouter_3/PKT_OUT_VALID] [get_bd_pins ValueRouter_1/PKT_IN_VALID]
connect_bd_net [get_bd_pins ValueRouter_2/PKT_IN_VALID] [get_bd_pins ValueRouter_3/PKT_OUT_VALID]
connect_bd_net [get_bd_pins ValueRouter_2/PKT_IN] [get_bd_pins ValueRouter_3/PKT_OUT]
connect_bd_net [get_bd_pins ValueRouter_1/PKT_IN] [get_bd_pins ValueRouter_3/PKT_OUT]

connect_bd_net [get_bd_pins AddressableRegister_0/VAL_OUT] [get_bd_pins Neuron_0_0/SYN_0_DIN]
connect_bd_net [get_bd_pins AddressableRegister_0/VAL_OUT_VALID] [get_bd_pins Neuron_0_0/SYN_0_VALID]
connect_bd_net [get_bd_pins AddressableRegister_1/VAL_OUT] [get_bd_pins Neuron_0_0/SYN_1_DIN]
connect_bd_net [get_bd_pins AddressableRegister_1/VAL_OUT_VALID] [get_bd_pins Neuron_0_0/SYN_1_VALID]
connect_bd_net [get_bd_pins Neuron_0_1/SYN_0_DIN] [get_bd_pins AddressableRegister_0/VAL_OUT]
connect_bd_net [get_bd_pins Neuron_0_1/SYN_0_VALID] [get_bd_pins AddressableRegister_0/VAL_OUT_VALID]
connect_bd_net [get_bd_pins Neuron_0_1/SYN_1_DIN] [get_bd_pins AddressableRegister_1/VAL_OUT]
connect_bd_net [get_bd_pins Neuron_0_1/SYN_1_VALID] [get_bd_pins AddressableRegister_1/VAL_OUT_VALID]

connect_bd_net [get_bd_pins ValueRouter_1/PKT_OUT_VALID] [get_bd_pins Neuron_0_0/PKT_IN_VALID]
connect_bd_net -net [get_bd_nets ValueRouter_1_PKT_OUT_VALID] [get_bd_pins Neuron_0_1/PKT_IN_VALID] [get_bd_pins ValueRouter_1/PKT_OUT_VALID]
connect_bd_net [get_bd_pins ValueRouter_2/PKT_OUT_VALID] [get_bd_pins Neuron_1_0/PKT_IN_VALID]
connect_bd_net -net [get_bd_nets ValueRouter_2_PKT_OUT_VALID] [get_bd_pins Neuron_1_1/PKT_IN_VALID] [get_bd_pins ValueRouter_2/PKT_OUT_VALID]
connect_bd_net [get_bd_pins ValueRouter_1/PKT_OUT] [get_bd_pins Neuron_0_0/PKT_IN]
connect_bd_net -net [get_bd_nets ValueRouter_1_PKT_OUT] [get_bd_pins Neuron_0_1/PKT_IN] [get_bd_pins ValueRouter_1/PKT_OUT]
connect_bd_net [get_bd_pins Neuron_1_0/PKT_IN] [get_bd_pins ValueRouter_2/PKT_OUT]
connect_bd_net -net [get_bd_nets ValueRouter_2_PKT_OUT] [get_bd_pins Neuron_1_1/PKT_IN] [get_bd_pins ValueRouter_2/PKT_OUT]


connect_bd_net [get_bd_pins Neuron_0_0/SYN_OUT] [get_bd_pins Neuron_1_0/SYN_0_DIN]
connect_bd_net -net [get_bd_nets Neuron_0_0_SYN_OUT] [get_bd_pins Neuron_1_1/SYN_0_DIN] [get_bd_pins Neuron_0_0/SYN_OUT]
connect_bd_net [get_bd_pins Neuron_0_0/SYN_OUT_VALID] [get_bd_pins Neuron_1_0/SYN_0_VALID]
connect_bd_net -net [get_bd_nets Neuron_0_0_SYN_OUT_VALID] [get_bd_pins Neuron_1_1/SYN_0_VALID] [get_bd_pins Neuron_0_0/SYN_OUT_VALID]
connect_bd_net [get_bd_pins Neuron_0_1/SYN_OUT] [get_bd_pins Neuron_1_0/SYN_1_DIN]
connect_bd_net [get_bd_pins Neuron_0_1/SYN_OUT_VALID] [get_bd_pins Neuron_1_0/SYN_1_VALID]
connect_bd_net -net [get_bd_nets Neuron_0_1_SYN_OUT] [get_bd_pins Neuron_1_1/SYN_1_DIN] [get_bd_pins Neuron_0_1/SYN_OUT]
connect_bd_net -net [get_bd_nets Neuron_0_1_SYN_OUT_VALID] [get_bd_pins Neuron_1_1/SYN_1_VALID] [get_bd_pins Neuron_0_1/SYN_OUT_VALID]

connect_bd_net [get_bd_ports SYN_0_OUT] [get_bd_pins Neuron_1_0/SYN_OUT]
connect_bd_net [get_bd_ports SYN_0_OUT_VALID] [get_bd_pins Neuron_1_0/SYN_OUT_VALID]
connect_bd_net [get_bd_ports SYN_1_OUT] [get_bd_pins Neuron_1_1/SYN_OUT]
connect_bd_net [get_bd_ports SYN_1_OUT_VALID] [get_bd_pins Neuron_1_1/SYN_OUT_VALID]



create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 OrN_0
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 OrN_1
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 OrN_2
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 OrN_3
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 OrN_4
set_property -dict [list CONFIG.n {2}] [get_bd_cells OrN_0]
set_property -dict [list CONFIG.n {2}] [get_bd_cells OrN_1]
set_property -dict [list CONFIG.n {2}] [get_bd_cells OrN_2]
set_property -dict [list CONFIG.n {2}] [get_bd_cells OrN_3]
set_property -dict [list CONFIG.n {2}] [get_bd_cells OrN_4]
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_1
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_2
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_3
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_4

connect_bd_net [get_bd_pins Neuron_0_0/DONE_OUT] [get_bd_pins xlconcat_0/In0]
connect_bd_net [get_bd_pins Neuron_0_1/DONE_OUT] [get_bd_pins xlconcat_0/In1]
connect_bd_net [get_bd_pins Neuron_1_0/DONE_OUT] [get_bd_pins xlconcat_1/In0]
connect_bd_net [get_bd_pins Neuron_1_1/DONE_OUT] [get_bd_pins xlconcat_1/In1]
connect_bd_net [get_bd_pins xlconcat_0/dout] [get_bd_pins OrN_0/DIN]
connect_bd_net [get_bd_pins xlconcat_1/dout] [get_bd_pins OrN_1/DIN]
connect_bd_net [get_bd_pins OrN_0/DOUT] [get_bd_pins ValueRouter_1/DONE_IN]
connect_bd_net [get_bd_pins OrN_1/DOUT] [get_bd_pins ValueRouter_2/DONE_IN]
connect_bd_net [get_bd_pins ValueRouter_1/DONE_OUT] [get_bd_pins xlconcat_2/In0]
connect_bd_net [get_bd_pins ValueRouter_2/DONE_OUT] [get_bd_pins xlconcat_2/In1]
connect_bd_net [get_bd_pins xlconcat_2/dout] [get_bd_pins OrN_2/DIN]
connect_bd_net [get_bd_pins OrN_2/DOUT] [get_bd_pins ValueRouter_3/DONE_IN]
connect_bd_net [get_bd_pins AddressableRegister_0/DONE_OUT] [get_bd_pins xlconcat_3/In0]
connect_bd_net [get_bd_pins AddressableRegister_1/DONE_OUT] [get_bd_pins xlconcat_3/In1]
connect_bd_net [get_bd_pins xlconcat_3/dout] [get_bd_pins OrN_3/DIN]
connect_bd_net [get_bd_pins OrN_3/DOUT] [get_bd_pins ValueRouter_0/DONE_IN]
connect_bd_net [get_bd_pins ValueRouter_3/DONE_OUT] [get_bd_pins xlconcat_4/In0]
connect_bd_net [get_bd_pins ValueRouter_0/DONE_OUT] [get_bd_pins xlconcat_4/In1]
connect_bd_net [get_bd_pins xlconcat_4/dout] [get_bd_pins OrN_4/DIN]
connect_bd_net [get_bd_ports DONE_OUT] [get_bd_pins OrN_4/DOUT]


# Type router (stimulus)
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_4
connect_bd_net [get_bd_pins xlconstant_4/dout] [get_bd_pins ValueRouter_0/ADDR]
set_property -dict [list CONFIG.CONST_VAL {1}] [get_bd_cells xlconstant_4]
# Type router (weight)
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_5
connect_bd_net [get_bd_pins xlconstant_5/dout] [get_bd_pins ValueRouter_3/ADDR]
set_property -dict [list CONFIG.CONST_VAL {0}] [get_bd_cells xlconstant_5]

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_6
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_7
connect_bd_net [get_bd_pins xlconstant_6/dout] [get_bd_pins ValueRouter_1/ADDR]
connect_bd_net [get_bd_pins xlconstant_7/dout] [get_bd_pins ValueRouter_2/ADDR]
set_property -dict [list CONFIG.packetOutWidth {26} CONFIG.packetInWidth {31}] [get_bd_cells ValueRouter_1]
set_property -dict [list CONFIG.packetOutWidth {26} CONFIG.packetInWidth {31}] [get_bd_cells ValueRouter_2]
set_property -dict [list CONFIG.CONST_WIDTH {5} CONFIG.CONST_VAL {1}] [get_bd_cells xlconstant_6]
set_property -dict [list CONFIG.CONST_WIDTH {5} CONFIG.CONST_VAL {2}] [get_bd_cells xlconstant_7]

set_property -dict [list CONFIG.CONST_WIDTH {6} CONFIG.CONST_VAL {1}] [get_bd_cells xlconstant_0]
set_property -dict [list CONFIG.CONST_WIDTH {6} CONFIG.CONST_VAL {2}] [get_bd_cells xlconstant_1]
set_property -dict [list CONFIG.CONST_WIDTH {6} CONFIG.CONST_VAL {1}] [get_bd_cells xlconstant_3]
set_property -dict [list CONFIG.CONST_WIDTH {6} CONFIG.CONST_VAL {2}] [get_bd_cells xlconstant_2]


regenerate_bd_layout
