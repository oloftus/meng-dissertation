
create_bd_port -dir I -from 17 -to 0 -type data PKT_IN
create_bd_port -dir I PKT_IN_VALID
create_bd_port -dir I -from 2 -to 0 -type data NEURON_ADDR
create_bd_port -dir O DONE_OUT


create_bd_port -dir I -type clk CLK
create_bd_port -dir I -type rst RST
create_bd_port -dir O  -type data SYN_OUT
create_bd_port -dir O SYN_OUT_VALID


create_bd_port -dir I SYN_0_VALID
create_bd_port -dir I -from 0 -to 0 -type data SYN_0_DIN


create_bd_port -dir I SYN_1_VALID
create_bd_port -dir I -from 0 -to 0 -type data SYN_1_DIN


create_bd_port -dir I SYN_2_VALID
create_bd_port -dir I -from 0 -to 0 -type data SYN_2_DIN


create_bd_port -dir I SYN_3_VALID
create_bd_port -dir I -from 0 -to 0 -type data SYN_3_DIN


create_bd_port -dir I SYN_4_VALID
create_bd_port -dir I -from 0 -to 0 -type data SYN_4_DIN


create_bd_cell -type ip -vlnv oloftus.com:prif:ValueRouter:1.0 NeuronRouter
create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 BiasRegister
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 DoneOut
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 DoneOutConcat


create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 PlanSlicer_Int
create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 PlanSlicer_FracHalf
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 PlanSlicerIntFracConcat
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 RoundUp


create_bd_cell -type ip -vlnv oloftus.com:prif:AndN:1.0 MultiplierEnable
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 MultiplierEnableConcat
create_bd_cell -type ip -vlnv oloftus.com:prif:SumJunction:1.0 SumJunction
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 SumJunctionConcat
create_bd_cell -type ip -vlnv oloftus.com:prif:ValidSetter:1.0 ValidSetter
create_bd_cell -type ip -vlnv oloftus.com:prif:Plan:1.0 Plan


create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 WeightRegister_0


create_bd_cell -type ip -vlnv oloftus.com:prif:BlankMux:1.0 WeightMux_0


create_bd_cell -type ip -vlnv oloftus.com:prif:Synapse:1.0 Synapse_0


create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 WeightRegister_1


create_bd_cell -type ip -vlnv oloftus.com:prif:BlankMux:1.0 WeightMux_1


create_bd_cell -type ip -vlnv oloftus.com:prif:Synapse:1.0 Synapse_1


create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 WeightRegister_2


create_bd_cell -type ip -vlnv oloftus.com:prif:BlankMux:1.0 WeightMux_2


create_bd_cell -type ip -vlnv oloftus.com:prif:Synapse:1.0 Synapse_2


create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 WeightRegister_3


create_bd_cell -type ip -vlnv oloftus.com:prif:BlankMux:1.0 WeightMux_3


create_bd_cell -type ip -vlnv oloftus.com:prif:Synapse:1.0 Synapse_3


create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 WeightRegister_4


create_bd_cell -type ip -vlnv oloftus.com:prif:BlankMux:1.0 WeightMux_4


create_bd_cell -type ip -vlnv oloftus.com:prif:Synapse:1.0 Synapse_4


set_property -dict [list CONFIG.packetInWidth {18} CONFIG.packetOutWidth {15}] [get_bd_cells NeuronRouter]
set_property -dict [list CONFIG.n {6}] [get_bd_cells DoneOut]
set_property -dict [list CONFIG.NUM_PORTS {6}] [get_bd_cells DoneOutConcat]
set_property -dict [list CONFIG.address {0} CONFIG.addressWidth {3} CONFIG.dataWidth {12} CONFIG.padHighWidth {0} CONFIG.padLowWidth {0}] [get_bd_cells BiasRegister]


set_property -dict [list CONFIG.DIN_WIDTH {12} CONFIG.DIN_TO {6} CONFIG.DIN_FROM {6}] [get_bd_cells PlanSlicer_FracHalf]
set_property -dict [list CONFIG.DIN_WIDTH {12} CONFIG.DIN_TO {7} CONFIG.DIN_FROM {7}] [get_bd_cells PlanSlicer_Int]
set_property -dict [list CONFIG.n {2}] [get_bd_cells RoundUp]


set_property -dict [list CONFIG.latency {7}] [get_bd_cells ValidSetter]
set_property -dict [list CONFIG.inputWidth {12} CONFIG.numInputs {6}] [get_bd_cells SumJunction]
set_property -dict [list CONFIG.n {5}] [get_bd_cells MultiplierEnable]
set_property -dict [list CONFIG.NUM_PORTS {5}] [get_bd_cells MultiplierEnableConcat]
set_property -dict [list CONFIG.NUM_PORTS {6} CONFIG.IN0_WIDTH {12} CONFIG.IN1_WIDTH {12} CONFIG.IN2_WIDTH {12} CONFIG.IN3_WIDTH {12} CONFIG.IN4_WIDTH {12} CONFIG.IN5_WIDTH {12}] [get_bd_cells SumJunctionConcat]
set_property -dict [list CONFIG.integerPrecision {4} CONFIG.fractionPrecision {7}] [get_bd_cells Plan]


set_property -dict [list CONFIG.address {1} CONFIG.addressWidth {3} CONFIG.dataWidth {12}] [get_bd_cells WeightRegister_0]


set_property -dict [list CONFIG.width {12}] [get_bd_cells WeightMux_0]


set_property -dict [list CONFIG.size {1}] [get_bd_cells Synapse_0]


set_property -dict [list CONFIG.address {2} CONFIG.addressWidth {3} CONFIG.dataWidth {12}] [get_bd_cells WeightRegister_1]


set_property -dict [list CONFIG.width {12}] [get_bd_cells WeightMux_1]


set_property -dict [list CONFIG.size {1}] [get_bd_cells Synapse_1]


set_property -dict [list CONFIG.address {3} CONFIG.addressWidth {3} CONFIG.dataWidth {12}] [get_bd_cells WeightRegister_2]


set_property -dict [list CONFIG.width {12}] [get_bd_cells WeightMux_2]


set_property -dict [list CONFIG.size {1}] [get_bd_cells Synapse_2]


set_property -dict [list CONFIG.address {4} CONFIG.addressWidth {3} CONFIG.dataWidth {12}] [get_bd_cells WeightRegister_3]


set_property -dict [list CONFIG.width {12}] [get_bd_cells WeightMux_3]


set_property -dict [list CONFIG.size {1}] [get_bd_cells Synapse_3]


set_property -dict [list CONFIG.address {5} CONFIG.addressWidth {3} CONFIG.dataWidth {12}] [get_bd_cells WeightRegister_4]


set_property -dict [list CONFIG.width {12}] [get_bd_cells WeightMux_4]


set_property -dict [list CONFIG.size {1}] [get_bd_cells Synapse_4]


connect_bd_net [get_bd_ports CLK] [get_bd_pins NeuronRouter/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins NeuronRouter/RST]
connect_bd_net [get_bd_pins DoneOutConcat/dout] [get_bd_pins DoneOut/DIN]
connect_bd_net [get_bd_pins DoneOut/DOUT] [get_bd_pins NeuronRouter/DONE_IN]
connect_bd_net [get_bd_ports DONE_OUT] [get_bd_pins NeuronRouter/DONE_OUT]
connect_bd_net [get_bd_ports PKT_IN_VALID] [get_bd_pins NeuronRouter/PKT_IN_VALID]
connect_bd_net [get_bd_ports PKT_IN] [get_bd_pins NeuronRouter/PKT_IN]
connect_bd_net [get_bd_ports NEURON_ADDR] [get_bd_pins NeuronRouter/ADDR]
connect_bd_net [get_bd_ports CLK] [get_bd_pins BiasRegister/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins BiasRegister/RST]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT] [get_bd_pins BiasRegister/PKT_IN]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT_VALID] [get_bd_pins BiasRegister/PKT_IN_VALID]
connect_bd_net [get_bd_pins BiasRegister/VAL_OUT] [get_bd_pins SumJunctionConcat/In0]
connect_bd_net [get_bd_pins BiasRegister/DONE_OUT] [get_bd_pins DoneOutConcat/In0]


connect_bd_net [get_bd_pins Plan/Y] [get_bd_pins PlanSlicer_Int/Din]
connect_bd_net [get_bd_pins Plan/Y] [get_bd_pins PlanSlicer_FracHalf/Din]
connect_bd_net [get_bd_pins PlanSlicer_Int/Dout] [get_bd_pins PlanSlicerIntFracConcat/In0]
connect_bd_net [get_bd_pins PlanSlicer_FracHalf/Dout] [get_bd_pins PlanSlicerIntFracConcat/In1]
connect_bd_net [get_bd_pins PlanSlicerIntFracConcat/dout] [get_bd_pins RoundUp/DIN]
connect_bd_net [get_bd_pins RoundUp/DOUT] [get_bd_ports SYN_OUT]


connect_bd_net [get_bd_ports CLK] [get_bd_pins ValidSetter/CLK]
connect_bd_net [get_bd_ports CLK] [get_bd_pins SumJunction/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins ValidSetter/RST]
connect_bd_net [get_bd_pins MultiplierEnable/DOUT] [get_bd_pins ValidSetter/SYN_IN_VALID]
connect_bd_net [get_bd_pins MultiplierEnableConcat/dout] [get_bd_pins MultiplierEnable/DIN]
connect_bd_net [get_bd_pins SumJunctionConcat/dout] [get_bd_pins SumJunction/DIN]
connect_bd_net [get_bd_ports SYN_OUT_VALID] [get_bd_pins ValidSetter/SYN_OUT_VALID]
connect_bd_net [get_bd_pins SumJunction/DOUT] [get_bd_pins Plan/X]


connect_bd_net [get_bd_pins WeightRegister_0/VAL_OUT] [get_bd_pins WeightMux_0/DIN]


connect_bd_net [get_bd_ports CLK] [get_bd_pins WeightRegister_0/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins WeightRegister_0/RST]
connect_bd_net [get_bd_pins WeightRegister_0/DONE_OUT] [get_bd_pins DoneOutConcat/In1]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT] [get_bd_pins WeightRegister_0/PKT_IN]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT_VALID] [get_bd_pins WeightRegister_0/PKT_IN_VALID]


connect_bd_net [get_bd_pins Synapse_0/SYN_OUT] [get_bd_pins WeightMux_0/SEL]
connect_bd_net [get_bd_pins WeightMux_0/DOUT] [get_bd_pins SumJunctionConcat/In1]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Synapse_0/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Synapse_0/RST]
connect_bd_net [get_bd_pins Synapse_0/SYN_OUT_VALID] [get_bd_pins MultiplierEnableConcat/In0]
connect_bd_net [get_bd_ports SYN_0_VALID] [get_bd_pins Synapse_0/SYN_IN_VALID]
connect_bd_net [get_bd_ports SYN_0_DIN] [get_bd_pins Synapse_0/SYN_IN]
connect_bd_net [get_bd_pins ValidSetter/SYN_IN_CLR] [get_bd_pins Synapse_0/CLR]


connect_bd_net [get_bd_pins WeightRegister_1/VAL_OUT] [get_bd_pins WeightMux_1/DIN]


connect_bd_net [get_bd_ports CLK] [get_bd_pins WeightRegister_1/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins WeightRegister_1/RST]
connect_bd_net [get_bd_pins WeightRegister_1/DONE_OUT] [get_bd_pins DoneOutConcat/In2]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT] [get_bd_pins WeightRegister_1/PKT_IN]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT_VALID] [get_bd_pins WeightRegister_1/PKT_IN_VALID]


connect_bd_net [get_bd_pins Synapse_1/SYN_OUT] [get_bd_pins WeightMux_1/SEL]
connect_bd_net [get_bd_pins WeightMux_1/DOUT] [get_bd_pins SumJunctionConcat/In2]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Synapse_1/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Synapse_1/RST]
connect_bd_net [get_bd_pins Synapse_1/SYN_OUT_VALID] [get_bd_pins MultiplierEnableConcat/In1]
connect_bd_net [get_bd_ports SYN_1_VALID] [get_bd_pins Synapse_1/SYN_IN_VALID]
connect_bd_net [get_bd_ports SYN_1_DIN] [get_bd_pins Synapse_1/SYN_IN]
connect_bd_net [get_bd_pins ValidSetter/SYN_IN_CLR] [get_bd_pins Synapse_1/CLR]


connect_bd_net [get_bd_pins WeightRegister_2/VAL_OUT] [get_bd_pins WeightMux_2/DIN]


connect_bd_net [get_bd_ports CLK] [get_bd_pins WeightRegister_2/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins WeightRegister_2/RST]
connect_bd_net [get_bd_pins WeightRegister_2/DONE_OUT] [get_bd_pins DoneOutConcat/In3]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT] [get_bd_pins WeightRegister_2/PKT_IN]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT_VALID] [get_bd_pins WeightRegister_2/PKT_IN_VALID]


connect_bd_net [get_bd_pins Synapse_2/SYN_OUT] [get_bd_pins WeightMux_2/SEL]
connect_bd_net [get_bd_pins WeightMux_2/DOUT] [get_bd_pins SumJunctionConcat/In3]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Synapse_2/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Synapse_2/RST]
connect_bd_net [get_bd_pins Synapse_2/SYN_OUT_VALID] [get_bd_pins MultiplierEnableConcat/In2]
connect_bd_net [get_bd_ports SYN_2_VALID] [get_bd_pins Synapse_2/SYN_IN_VALID]
connect_bd_net [get_bd_ports SYN_2_DIN] [get_bd_pins Synapse_2/SYN_IN]
connect_bd_net [get_bd_pins ValidSetter/SYN_IN_CLR] [get_bd_pins Synapse_2/CLR]


connect_bd_net [get_bd_pins WeightRegister_3/VAL_OUT] [get_bd_pins WeightMux_3/DIN]


connect_bd_net [get_bd_ports CLK] [get_bd_pins WeightRegister_3/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins WeightRegister_3/RST]
connect_bd_net [get_bd_pins WeightRegister_3/DONE_OUT] [get_bd_pins DoneOutConcat/In4]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT] [get_bd_pins WeightRegister_3/PKT_IN]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT_VALID] [get_bd_pins WeightRegister_3/PKT_IN_VALID]


connect_bd_net [get_bd_pins Synapse_3/SYN_OUT] [get_bd_pins WeightMux_3/SEL]
connect_bd_net [get_bd_pins WeightMux_3/DOUT] [get_bd_pins SumJunctionConcat/In4]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Synapse_3/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Synapse_3/RST]
connect_bd_net [get_bd_pins Synapse_3/SYN_OUT_VALID] [get_bd_pins MultiplierEnableConcat/In3]
connect_bd_net [get_bd_ports SYN_3_VALID] [get_bd_pins Synapse_3/SYN_IN_VALID]
connect_bd_net [get_bd_ports SYN_3_DIN] [get_bd_pins Synapse_3/SYN_IN]
connect_bd_net [get_bd_pins ValidSetter/SYN_IN_CLR] [get_bd_pins Synapse_3/CLR]


connect_bd_net [get_bd_pins WeightRegister_4/VAL_OUT] [get_bd_pins WeightMux_4/DIN]


connect_bd_net [get_bd_ports CLK] [get_bd_pins WeightRegister_4/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins WeightRegister_4/RST]
connect_bd_net [get_bd_pins WeightRegister_4/DONE_OUT] [get_bd_pins DoneOutConcat/In5]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT] [get_bd_pins WeightRegister_4/PKT_IN]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT_VALID] [get_bd_pins WeightRegister_4/PKT_IN_VALID]


connect_bd_net [get_bd_pins Synapse_4/SYN_OUT] [get_bd_pins WeightMux_4/SEL]
connect_bd_net [get_bd_pins WeightMux_4/DOUT] [get_bd_pins SumJunctionConcat/In5]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Synapse_4/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Synapse_4/RST]
connect_bd_net [get_bd_pins Synapse_4/SYN_OUT_VALID] [get_bd_pins MultiplierEnableConcat/In4]
connect_bd_net [get_bd_ports SYN_4_VALID] [get_bd_pins Synapse_4/SYN_IN_VALID]
connect_bd_net [get_bd_ports SYN_4_DIN] [get_bd_pins Synapse_4/SYN_IN]
connect_bd_net [get_bd_pins ValidSetter/SYN_IN_CLR] [get_bd_pins Synapse_4/CLR]


regenerate_bd_layout

