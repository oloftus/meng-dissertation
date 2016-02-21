#Create ports
#Create components
#Create slices
#Configure components

# Create ports
create_bd_port -dir I -type clk CLK
create_bd_port -dir I -type rst RST

create_bd_port -dir I SYN_0_VALID
create_bd_port -dir I -from 12 -to 0 -type data SYN_0_DIN

create_bd_port -dir I SYN_1_VALID
create_bd_port -dir I -from 12 -to 0 -type data SYN_1_DIN

create_bd_port -dir I -from 15 -to 0 -type data SYN_0_WIN
create_bd_port -dir I -from 15 -to 0 -type data SYN_1_WIN
create_bd_port -dir I SYN_0_WVALID
create_bd_port -dir I SYN_1_WVALID

create_bd_port -dir O SYN_OUT_VALID
create_bd_port -dir O -from 12 -to 0 -type data SYN_OUT

create_bd_port -dir O DONE_OUT

# Create components
create_bd_cell -type ip -vlnv oloftus.com:prif:Synapse:1.0 Synapse_0
create_bd_cell -type ip -vlnv oloftus.com:prif:Synapse:1.0 Synapse_1

create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 AddressableRegister_0
create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 AddressableRegister_1

create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_0
create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_1

create_bd_cell -type ip -vlnv oloftus.com:prif:AndN:1.0 AndN_0
create_bd_cell -type ip -vlnv oloftus.com:prif:SumJunction:1.0 SumJunction_0
create_bd_cell -type ip -vlnv oloftus.com:prif:ValidSetter:1.0 ValidSetter_0
create_bd_cell -type ip -vlnv oloftus.com:prif:Plan:1.0 Plan_0

create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 OrN_0

# Connect CLKs
connect_bd_net [get_bd_ports CLK] [get_bd_pins mult_gen_1/CLK]
connect_bd_net -net [get_bd_nets CLK_1] [get_bd_ports CLK] [get_bd_pins AddressableRegister_0/CLK]
connect_bd_net -net [get_bd_nets CLK_1] [get_bd_ports CLK] [get_bd_pins AddressableRegister_1/CLK]
connect_bd_net -net [get_bd_nets CLK_1] [get_bd_ports CLK] [get_bd_pins SumJunction_0/CLK]
connect_bd_net -net [get_bd_nets CLK_1] [get_bd_ports CLK] [get_bd_pins Synapse_0/CLK]
connect_bd_net -net [get_bd_nets CLK_1] [get_bd_ports CLK] [get_bd_pins Synapse_1/CLK]
connect_bd_net -net [get_bd_nets CLK_1] [get_bd_ports CLK] [get_bd_pins ValidSetter_0/CLK]
connect_bd_net -net [get_bd_nets CLK_1] [get_bd_ports CLK] [get_bd_pins mult_gen_0/CLK]

# Connect RSTs
connect_bd_net [get_bd_ports RST] [get_bd_pins AddressableRegister_0/RST]
connect_bd_net -net [get_bd_nets RST_1] [get_bd_ports RST] [get_bd_pins AddressableRegister_1/RST]
connect_bd_net -net [get_bd_nets RST_1] [get_bd_ports RST] [get_bd_pins Synapse_0/RST]
connect_bd_net -net [get_bd_nets RST_1] [get_bd_ports RST] [get_bd_pins Synapse_1/RST]
connect_bd_net -net [get_bd_nets RST_1] [get_bd_ports RST] [get_bd_pins ValidSetter_0/RST]

connect_bd_net [get_bd_ports SYN_0_VALID] [get_bd_pins Synapse_0/SYN_IN_VALID]
connect_bd_net [get_bd_ports SYN_1_VALID] [get_bd_pins Synapse_1/SYN_IN_VALID]
connect_bd_net [get_bd_ports SYN_0_DIN] [get_bd_pins Synapse_0/SYN_IN]
connect_bd_net [get_bd_ports SYN_1_DIN] [get_bd_pins Synapse_1/SYN_IN]
connect_bd_net [get_bd_pins Synapse_0/SYN_OUT] [get_bd_pins mult_gen_0/A]
connect_bd_net [get_bd_pins Synapse_1/SYN_OUT] [get_bd_pins mult_gen_1/A]
connect_bd_net [get_bd_pins AddressableRegister_0/VAL_OUT] [get_bd_pins mult_gen_0/B]
connect_bd_net [get_bd_pins AddressableRegister_1/VAL_OUT] [get_bd_pins mult_gen_1/B]
connect_bd_net [get_bd_pins SumJunction_0/DOUT] [get_bd_pins Plan_0/X]
connect_bd_net [get_bd_ports SYN_OUT] [get_bd_pins Plan_0/Y]
connect_bd_net [get_bd_ports SYN_OUT_VALID] [get_bd_pins ValidSetter_0/SYN_OUT_VALID]
connect_bd_net [get_bd_pins ValidSetter_0/SYN_IN_CLR] [get_bd_pins Synapse_0/CLR]
connect_bd_net -net [get_bd_nets ValidSetter_0_SYN_IN_CLR] [get_bd_pins Synapse_1/CLR] [get_bd_pins ValidSetter_0/SYN_IN_CLR]

connect_bd_net [get_bd_ports SYN_0_WIN] [get_bd_pins AddressableRegister_0/PKT_IN]
connect_bd_net [get_bd_ports SYN_0_WVALID] [get_bd_pins AddressableRegister_0/PKT_IN_VALID]
connect_bd_net [get_bd_ports SYN_1_WVALID] [get_bd_pins AddressableRegister_1/PKT_IN_VALID]
connect_bd_net [get_bd_ports SYN_1_WIN] [get_bd_pins AddressableRegister_1/PKT_IN]

# Configuration
set_property -dict [list CONFIG.size {13}] [get_bd_cells Synapse_0]
set_property -dict [list CONFIG.size {13}] [get_bd_cells Synapse_1]
set_property -dict [list CONFIG.address {1} CONFIG.addressWidth {4} CONFIG.dataWidth {16}] [get_bd_cells AddressableRegister_0]
set_property -dict [list CONFIG.address {2} CONFIG.addressWidth {4} CONFIG.dataWidth {16}] [get_bd_cells AddressableRegister_1]
set_property -dict [list CONFIG.PortAWidth.VALUE_SRC USER CONFIG.PortBWidth.VALUE_SRC USER CONFIG.PortAWidth {13} CONFIG.PortBWidth {13} CONFIG.Use_Custom_Output_Width {true} CONFIG.OutputWidthHigh {12} CONFIG.ClockEnable {true}] [get_bd_cells mult_gen_0]
set_property -dict [list CONFIG.PortAWidth.VALUE_SRC USER CONFIG.PortBWidth.VALUE_SRC USER CONFIG.PortAWidth {13} CONFIG.PortBWidth {13} CONFIG.Use_Custom_Output_Width {true} CONFIG.OutputWidthHigh {12} CONFIG.ClockEnable {true}] [get_bd_cells mult_gen_1]
set_property -dict [list CONFIG.latency {2}] [get_bd_cells ValidSetter_0]
set_property -dict [list CONFIG.inputWidth {13}] [get_bd_cells SumJunction_0]
set_property -dict [list CONFIG.fractionPrecision {6} CONFIG.integerPrecision {6}] [get_bd_cells Plan_0]

# Setup AndN gate
set_property -dict [list CONFIG.n {2}] [get_bd_cells AndN_0]
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0
set_property -dict [list CONFIG.NUM_PORTS {2}] [get_bd_cells xlconcat_0]
connect_bd_net [get_bd_pins Synapse_0/SYN_OUT_VALID] [get_bd_pins xlconcat_0/In0]
connect_bd_net [get_bd_pins Synapse_1/SYN_OUT_VALID] [get_bd_pins xlconcat_0/In1]
connect_bd_net [get_bd_pins xlconcat_0/dout] [get_bd_pins AndN_0/DIN]
connect_bd_net [get_bd_pins AndN_0/DOUT] [get_bd_pins mult_gen_0/CE]
connect_bd_net -net [get_bd_nets AndN_0_DOUT] [get_bd_pins mult_gen_1/CE] [get_bd_pins AndN_0/DOUT]
connect_bd_net -net [get_bd_nets AndN_0_DOUT] [get_bd_pins ValidSetter_0/SYN_IN_VALID] [get_bd_pins AndN_0/DOUT]

# Setup OrN gate
set_property -dict [list CONFIG.n {2}] [get_bd_cells OrN_0]
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_1
set_property -dict [list CONFIG.NUM_PORTS {2}] [get_bd_cells xlconcat_1]
connect_bd_net [get_bd_pins xlconcat_1/In0] [get_bd_pins AddressableRegister_0/DONE_OUT]
connect_bd_net [get_bd_pins xlconcat_1/In1] [get_bd_pins AddressableRegister_1/DONE_OUT]
connect_bd_net [get_bd_pins xlconcat_1/dout] [get_bd_pins OrN_0/DIN]
connect_bd_net [get_bd_ports DONE_OUT] [get_bd_pins OrN_0/DOUT]

# Setup SumJunction
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_2
set_property -dict [list CONFIG.NUM_PORTS {2} CONFIG.IN0_WIDTH {13} CONFIG.IN1_WIDTH {13}] [get_bd_cells xlconcat_2]
connect_bd_net [get_bd_pins mult_gen_0/P] [get_bd_pins xlconcat_2/In0]
connect_bd_net [get_bd_pins mult_gen_1/P] [get_bd_pins xlconcat_2/In1]
connect_bd_net [get_bd_pins xlconcat_2/dout] [get_bd_pins SumJunction_0/DIN]

# Regenerate layout
regenerate_bd_layout
