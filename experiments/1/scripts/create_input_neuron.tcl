
create_bd_port -dir I -type clk CLK
create_bd_port -dir I -type rst RST
create_bd_port -dir I PKT_IN_VALID
create_bd_port -dir I -from 21 -to 0 -type data PKT_IN
create_bd_port -dir I -from 2 -to 0 -type data NEURON_ADDR
create_bd_port -dir O -from 7 -to 0 -type data SYN_OUT
create_bd_port -dir O SYN_OUT_VALID
create_bd_port -dir O DONE_OUT


create_bd_port -dir I SYN_0_VALID
create_bd_port -dir I -from 7 -to 0 -type data SYN_0_DIN


create_bd_port -dir I SYN_1_VALID
create_bd_port -dir I -from 7 -to 0 -type data SYN_1_DIN


create_bd_port -dir I SYN_2_VALID
create_bd_port -dir I -from 7 -to 0 -type data SYN_2_DIN


create_bd_cell -type ip -vlnv oloftus.com:prif:ValueRouter:1.0 NeuronRouter
create_bd_cell -type ip -vlnv oloftus.com:prif:AndN:1.0 MultiplierEnable
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 MultiplierEnableConcat
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 DoneOut
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 DoneOutConcat
create_bd_cell -type ip -vlnv oloftus.com:prif:SumJunction:1.0 SumJunction
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 SumJunctionConcat
create_bd_cell -type ip -vlnv oloftus.com:prif:ValidSetter:1.0 ValidSetter
create_bd_cell -type ip -vlnv oloftus.com:prif:Plan:1.0 Plan
create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 BiasRegister
create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 PlanSlicer


create_bd_cell -type ip -vlnv oloftus.com:prif:Synapse:1.0 Synapse_0
create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 WeightRegister_0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 MultiplierSlicer_0
create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 Multiplier_0


create_bd_cell -type ip -vlnv oloftus.com:prif:Synapse:1.0 Synapse_1
create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 WeightRegister_1
create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 MultiplierSlicer_1
create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 Multiplier_1


create_bd_cell -type ip -vlnv oloftus.com:prif:Synapse:1.0 Synapse_2
create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 WeightRegister_2
create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 MultiplierSlicer_2
create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 Multiplier_2


set_property -dict [list CONFIG.packetInWidth {22} CONFIG.packetOutWidth {19}] [get_bd_cells NeuronRouter]
set_property -dict [list CONFIG.latency {5}] [get_bd_cells ValidSetter]
set_property -dict [list CONFIG.inputWidth {12} CONFIG.numInputs {4}] [get_bd_cells SumJunction]
set_property -dict [list CONFIG.n {3}] [get_bd_cells MultiplierEnable]
set_property -dict [list CONFIG.NUM_PORTS {3}] [get_bd_cells MultiplierEnableConcat]
set_property -dict [list CONFIG.n {4}] [get_bd_cells DoneOut]
set_property -dict [list CONFIG.NUM_PORTS {4}] [get_bd_cells DoneOutConcat]
set_property -dict [list CONFIG.NUM_PORTS {4} CONFIG.IN0_WIDTH {12} CONFIG.IN1_WIDTH {12} CONFIG.IN2_WIDTH {12} CONFIG.IN3_WIDTH {12}] [get_bd_cells SumJunctionConcat]
set_property -dict [list CONFIG.address {0} CONFIG.addressWidth {3} CONFIG.dataWidth {16} CONFIG.padHighWidth {-1} CONFIG.padLowWidth {-3}] [get_bd_cells BiasRegister]
set_property -dict [list CONFIG.integerPrecision {4} CONFIG.fractionPrecision {7}] [get_bd_cells Plan]
set_property -dict [list CONFIG.DIN_WIDTH {12} CONFIG.DIN_FROM {7} CONFIG.DIN_TO {0}] [get_bd_cells PlanSlicer]


set_property -dict [list CONFIG.size {8}] [get_bd_cells Synapse_0]
set_property -dict [list CONFIG.address {1} CONFIG.addressWidth {3} CONFIG.dataWidth {16}] [get_bd_cells WeightRegister_0]
set_property -dict [list CONFIG.DIN_WIDTH {24} CONFIG.DIN_FROM {21} CONFIG.DIN_TO {10}] [get_bd_cells MultiplierSlicer_0]
set_property -dict [list CONFIG.PortAWidth.VALUE_SRC USER CONFIG.PortBWidth.VALUE_SRC USER CONFIG.PortAWidth {8} CONFIG.PortBWidth {16} CONFIG.PortAType.VALUE_SRC USER CONFIG.PortBType.VALUE_SRC USER CONFIG.PortAType {Unsigned} CONFIG.PortBType {Signed} CONFIG.ClockEnable {true} CONFIG.Use_Custom_Output_Width {true} CONFIG.OutputWidthHigh {23}] [get_bd_cells Multiplier_0]


set_property -dict [list CONFIG.size {8}] [get_bd_cells Synapse_1]
set_property -dict [list CONFIG.address {2} CONFIG.addressWidth {3} CONFIG.dataWidth {16}] [get_bd_cells WeightRegister_1]
set_property -dict [list CONFIG.DIN_WIDTH {24} CONFIG.DIN_FROM {21} CONFIG.DIN_TO {10}] [get_bd_cells MultiplierSlicer_1]
set_property -dict [list CONFIG.PortAWidth.VALUE_SRC USER CONFIG.PortBWidth.VALUE_SRC USER CONFIG.PortAWidth {8} CONFIG.PortBWidth {16} CONFIG.PortAType.VALUE_SRC USER CONFIG.PortBType.VALUE_SRC USER CONFIG.PortAType {Unsigned} CONFIG.PortBType {Signed} CONFIG.ClockEnable {true} CONFIG.Use_Custom_Output_Width {true} CONFIG.OutputWidthHigh {23}] [get_bd_cells Multiplier_1]


set_property -dict [list CONFIG.size {8}] [get_bd_cells Synapse_2]
set_property -dict [list CONFIG.address {3} CONFIG.addressWidth {3} CONFIG.dataWidth {16}] [get_bd_cells WeightRegister_2]
set_property -dict [list CONFIG.DIN_WIDTH {24} CONFIG.DIN_FROM {21} CONFIG.DIN_TO {10}] [get_bd_cells MultiplierSlicer_2]
set_property -dict [list CONFIG.PortAWidth.VALUE_SRC USER CONFIG.PortBWidth.VALUE_SRC USER CONFIG.PortAWidth {8} CONFIG.PortBWidth {16} CONFIG.PortAType.VALUE_SRC USER CONFIG.PortBType.VALUE_SRC USER CONFIG.PortAType {Unsigned} CONFIG.PortBType {Signed} CONFIG.ClockEnable {true} CONFIG.Use_Custom_Output_Width {true} CONFIG.OutputWidthHigh {23}] [get_bd_cells Multiplier_2]


connect_bd_net [get_bd_ports CLK] [get_bd_pins ValidSetter/CLK]
connect_bd_net [get_bd_ports CLK] [get_bd_pins SumJunction/CLK]
connect_bd_net [get_bd_ports CLK] [get_bd_pins NeuronRouter/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins NeuronRouter/RST]
connect_bd_net [get_bd_ports RST] [get_bd_pins ValidSetter/RST]
connect_bd_net [get_bd_pins MultiplierEnable/DOUT] [get_bd_pins ValidSetter/SYN_IN_VALID]
connect_bd_net [get_bd_pins MultiplierEnableConcat/dout] [get_bd_pins MultiplierEnable/DIN]
connect_bd_net [get_bd_pins DoneOutConcat/dout] [get_bd_pins DoneOut/DIN]
connect_bd_net [get_bd_pins DoneOut/DOUT] [get_bd_pins NeuronRouter/DONE_IN]
connect_bd_net [get_bd_ports DONE_OUT] [get_bd_pins NeuronRouter/DONE_OUT]
connect_bd_net [get_bd_pins SumJunctionConcat/dout] [get_bd_pins SumJunction/DIN]
connect_bd_net [get_bd_ports SYN_OUT_VALID] [get_bd_pins ValidSetter/SYN_OUT_VALID]
connect_bd_net [get_bd_ports PKT_IN_VALID] [get_bd_pins NeuronRouter/PKT_IN_VALID]
connect_bd_net [get_bd_ports PKT_IN] [get_bd_pins NeuronRouter/PKT_IN]
connect_bd_net [get_bd_ports NEURON_ADDR] [get_bd_pins NeuronRouter/ADDR]
connect_bd_net [get_bd_ports CLK] [get_bd_pins BiasRegister/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins BiasRegister/RST]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT] [get_bd_pins BiasRegister/PKT_IN]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT_VALID] [get_bd_pins BiasRegister/PKT_IN_VALID]
connect_bd_net [get_bd_pins BiasRegister/VAL_OUT] [get_bd_pins SumJunctionConcat/In0]
connect_bd_net [get_bd_pins BiasRegister/DONE_OUT] [get_bd_pins DoneOutConcat/In0]
connect_bd_net [get_bd_pins SumJunction/DOUT] [get_bd_pins Plan/X]
connect_bd_net [get_bd_pins Plan/Y] [get_bd_pins PlanSlicer/Din]
connect_bd_net [get_bd_pins PlanSlicer/Dout] [get_bd_ports SYN_OUT]


connect_bd_net [get_bd_ports CLK] [get_bd_pins WeightRegister_0/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins WeightRegister_0/RST]
connect_bd_net [get_bd_pins WeightRegister_0/DONE_OUT] [get_bd_pins DoneOutConcat/In1]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT] [get_bd_pins WeightRegister_0/PKT_IN]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT_VALID] [get_bd_pins WeightRegister_0/PKT_IN_VALID]
connect_bd_net [get_bd_ports CLK] [get_bd_pins Synapse_0/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Synapse_0/RST]
connect_bd_net [get_bd_pins Synapse_0/SYN_OUT_VALID] [get_bd_pins MultiplierEnableConcat/In0]
connect_bd_net [get_bd_ports CLK] [get_bd_pins Multiplier_0/CLK]
connect_bd_net [get_bd_ports SYN_0_VALID] [get_bd_pins Synapse_0/SYN_IN_VALID]
connect_bd_net [get_bd_ports SYN_0_DIN] [get_bd_pins Synapse_0/SYN_IN]
connect_bd_net [get_bd_pins ValidSetter/SYN_IN_CLR] [get_bd_pins Synapse_0/CLR]
connect_bd_net [get_bd_pins Multiplier_0/CE] [get_bd_pins MultiplierEnable/DOUT]
connect_bd_net [get_bd_pins Multiplier_0/P] [get_bd_pins MultiplierSlicer_0/Din]
connect_bd_net [get_bd_pins Synapse_0/SYN_OUT] [get_bd_pins Multiplier_0/A]
connect_bd_net [get_bd_pins WeightRegister_0/VAL_OUT] [get_bd_pins Multiplier_0/B]
connect_bd_net [get_bd_pins MultiplierSlicer_0/Dout] [get_bd_pins SumJunctionConcat/In1]


connect_bd_net [get_bd_ports CLK] [get_bd_pins WeightRegister_1/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins WeightRegister_1/RST]
connect_bd_net [get_bd_pins WeightRegister_1/DONE_OUT] [get_bd_pins DoneOutConcat/In2]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT] [get_bd_pins WeightRegister_1/PKT_IN]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT_VALID] [get_bd_pins WeightRegister_1/PKT_IN_VALID]
connect_bd_net [get_bd_ports CLK] [get_bd_pins Synapse_1/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Synapse_1/RST]
connect_bd_net [get_bd_pins Synapse_1/SYN_OUT_VALID] [get_bd_pins MultiplierEnableConcat/In1]
connect_bd_net [get_bd_ports CLK] [get_bd_pins Multiplier_1/CLK]
connect_bd_net [get_bd_ports SYN_1_VALID] [get_bd_pins Synapse_1/SYN_IN_VALID]
connect_bd_net [get_bd_ports SYN_1_DIN] [get_bd_pins Synapse_1/SYN_IN]
connect_bd_net [get_bd_pins ValidSetter/SYN_IN_CLR] [get_bd_pins Synapse_1/CLR]
connect_bd_net [get_bd_pins Multiplier_1/CE] [get_bd_pins MultiplierEnable/DOUT]
connect_bd_net [get_bd_pins Multiplier_1/P] [get_bd_pins MultiplierSlicer_1/Din]
connect_bd_net [get_bd_pins Synapse_1/SYN_OUT] [get_bd_pins Multiplier_1/A]
connect_bd_net [get_bd_pins WeightRegister_1/VAL_OUT] [get_bd_pins Multiplier_1/B]
connect_bd_net [get_bd_pins MultiplierSlicer_1/Dout] [get_bd_pins SumJunctionConcat/In2]


connect_bd_net [get_bd_ports CLK] [get_bd_pins WeightRegister_2/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins WeightRegister_2/RST]
connect_bd_net [get_bd_pins WeightRegister_2/DONE_OUT] [get_bd_pins DoneOutConcat/In3]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT] [get_bd_pins WeightRegister_2/PKT_IN]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT_VALID] [get_bd_pins WeightRegister_2/PKT_IN_VALID]
connect_bd_net [get_bd_ports CLK] [get_bd_pins Synapse_2/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Synapse_2/RST]
connect_bd_net [get_bd_pins Synapse_2/SYN_OUT_VALID] [get_bd_pins MultiplierEnableConcat/In2]
connect_bd_net [get_bd_ports CLK] [get_bd_pins Multiplier_2/CLK]
connect_bd_net [get_bd_ports SYN_2_VALID] [get_bd_pins Synapse_2/SYN_IN_VALID]
connect_bd_net [get_bd_ports SYN_2_DIN] [get_bd_pins Synapse_2/SYN_IN]
connect_bd_net [get_bd_pins ValidSetter/SYN_IN_CLR] [get_bd_pins Synapse_2/CLR]
connect_bd_net [get_bd_pins Multiplier_2/CE] [get_bd_pins MultiplierEnable/DOUT]
connect_bd_net [get_bd_pins Multiplier_2/P] [get_bd_pins MultiplierSlicer_2/Din]
connect_bd_net [get_bd_pins Synapse_2/SYN_OUT] [get_bd_pins Multiplier_2/A]
connect_bd_net [get_bd_pins WeightRegister_2/VAL_OUT] [get_bd_pins Multiplier_2/B]
connect_bd_net [get_bd_pins MultiplierSlicer_2/Dout] [get_bd_pins SumJunctionConcat/In3]


regenerate_bd_layout

