
create_bd_port -dir I -type clk CLK
create_bd_port -dir I -type rst RST
create_bd_port -dir I -from 31 -to 0 -type data PKT_IN
create_bd_port -dir I PKT_IN_VALID
create_bd_port -dir O DONE_OUT


create_bd_port -dir O -from 12 -to 0 -type data SYN_0_OUT
create_bd_port -dir O SYN_0_OUT_VALID


create_bd_port -dir O -from 12 -to 0 -type data SYN_1_OUT
create_bd_port -dir O SYN_1_OUT_VALID


create_bd_cell -type ip -vlnv oloftus.com:prif:ValueRouter:4.0 TypeRouter_Stimulus
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 TypeRouter_Stimulus_Address
create_bd_cell -type ip -vlnv oloftus.com:prif:ValueRouter:4.0 TypeRouter_Weight
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 TypeRouter_Weight_Address
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 DoneOut_Layers
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 DoneOutConcat_Layers
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 DoneOut_StimulusRegisters
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 DoneOutConcat_StimulusRegisters
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 DoneOut
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 DoneOutConcat


create_bd_cell -type ip -vlnv oloftus.com:prif:ValueRouter:4.0 LayerRouter_0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 LayerRouter_0_Address
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 DoneOut_Layer_0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 DoneOutConcat_Layer_0


create_bd_cell -type ip -vlnv xilinx.com:ip:Neuron_wrapper:1.0 Neuron_0_0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Neuron_0_0_Address


create_bd_cell -type ip -vlnv xilinx.com:ip:Neuron_wrapper:1.0 Neuron_0_1
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Neuron_0_1_Address


create_bd_cell -type ip -vlnv oloftus.com:prif:ValueRouter:4.0 LayerRouter_1
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 LayerRouter_1_Address
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 DoneOut_Layer_1
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 DoneOutConcat_Layer_1


create_bd_cell -type ip -vlnv xilinx.com:ip:Neuron_wrapper:1.0 Neuron_1_0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Neuron_1_0_Address


create_bd_cell -type ip -vlnv xilinx.com:ip:Neuron_wrapper:1.0 Neuron_1_1
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Neuron_1_1_Address


create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 StimulusRegister_0


create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 StimulusRegister_1


set_property -dict [list CONFIG.packetOutWidth {31} CONFIG.packetInWidth {32}] [get_bd_cells TypeRouter_Stimulus]
set_property -dict [list CONFIG.CONST_VAL {1}] [get_bd_cells TypeRouter_Stimulus_Address]
set_property -dict [list CONFIG.packetOutWidth {31} CONFIG.packetInWidth {32}] [get_bd_cells TypeRouter_Weight]
set_property -dict [list CONFIG.CONST_VAL {0}] [get_bd_cells TypeRouter_Weight_Address]
set_property -dict [list CONFIG.n {2}] [get_bd_cells DoneOut_Layers]
set_property -dict [list CONFIG.n {2}] [get_bd_cells DoneOut_StimulusRegisters]
set_property -dict [list CONFIG.n {2}] [get_bd_cells DoneOut]


set_property -dict [list CONFIG.packetOutWidth {26} CONFIG.packetInWidth {31}] [get_bd_cells LayerRouter_0]
set_property -dict [list CONFIG.CONST_WIDTH {5} CONFIG.CONST_VAL {0}] [get_bd_cells LayerRouter_0_Address]
set_property -dict [list CONFIG.n {2}] [get_bd_cells DoneOut_Layer_0]


set_property -dict [list CONFIG.CONST_WIDTH {6} CONFIG.CONST_VAL {0}] [get_bd_cells Neuron_0_0_Address]


set_property -dict [list CONFIG.CONST_WIDTH {6} CONFIG.CONST_VAL {1}] [get_bd_cells Neuron_0_1_Address]


set_property -dict [list CONFIG.packetOutWidth {26} CONFIG.packetInWidth {31}] [get_bd_cells LayerRouter_1]
set_property -dict [list CONFIG.CONST_WIDTH {5} CONFIG.CONST_VAL {1}] [get_bd_cells LayerRouter_1_Address]
set_property -dict [list CONFIG.n {2}] [get_bd_cells DoneOut_Layer_1]


set_property -dict [list CONFIG.CONST_WIDTH {6} CONFIG.CONST_VAL {0}] [get_bd_cells Neuron_1_0_Address]


set_property -dict [list CONFIG.CONST_WIDTH {6} CONFIG.CONST_VAL {1}] [get_bd_cells Neuron_1_1_Address]


set_property -dict [list CONFIG.address {0} CONFIG.addressWidth {19} CONFIG.dataWidth {13}] [get_bd_cells StimulusRegister_0]


set_property -dict [list CONFIG.address {1} CONFIG.addressWidth {19} CONFIG.dataWidth {13}] [get_bd_cells StimulusRegister_1]


connect_bd_net [get_bd_ports CLK] [get_bd_pins TypeRouter_Weight/CLK]
connect_bd_net [get_bd_ports PKT_IN_VALID] [get_bd_pins TypeRouter_Weight/PKT_IN_VALID]
connect_bd_net [get_bd_ports PKT_IN] [get_bd_pins TypeRouter_Weight/PKT_IN]
connect_bd_net [get_bd_pins TypeRouter_Weight/DONE_IN] [get_bd_pins DoneOut_Layers/DOUT]
connect_bd_net [get_bd_pins TypeRouter_Weight/DONE_OUT] [get_bd_pins DoneOutConcat/In0]
connect_bd_net [get_bd_pins TypeRouter_Weight_Address/dout] [get_bd_pins TypeRouter_Weight/ADDR]

connect_bd_net [get_bd_ports CLK] [get_bd_pins TypeRouter_Stimulus/CLK]
connect_bd_net [get_bd_ports PKT_IN_VALID] [get_bd_pins TypeRouter_Stimulus/PKT_IN_VALID]
connect_bd_net [get_bd_ports PKT_IN] [get_bd_pins TypeRouter_Stimulus/PKT_IN]
connect_bd_net [get_bd_pins TypeRouter_Stimulus/DONE_IN] [get_bd_pins DoneOut_StimulusRegisters/DOUT]
connect_bd_net [get_bd_pins TypeRouter_Stimulus/DONE_OUT] [get_bd_pins DoneOutConcat/In1]
connect_bd_net [get_bd_pins TypeRouter_Stimulus_Address/dout] [get_bd_pins TypeRouter_Stimulus/ADDR]

connect_bd_net [get_bd_ports DONE_OUT] [get_bd_pins DoneOut/DOUT]
connect_bd_net [get_bd_pins DoneOutConcat/dout] [get_bd_pins DoneOut/DIN]
connect_bd_net [get_bd_pins DoneOutConcat_Layers/dout] [get_bd_pins DoneOut_Layers/DIN]
connect_bd_net [get_bd_pins DoneOutConcat_StimulusRegisters/dout] [get_bd_pins DoneOut_StimulusRegisters/DIN]


connect_bd_net [get_bd_ports CLK] [get_bd_pins StimulusRegister_0/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins StimulusRegister_0/RST]
connect_bd_net [get_bd_pins TypeRouter_Stimulus/PKT_OUT] [get_bd_pins StimulusRegister_0/PKT_IN]
connect_bd_net [get_bd_pins TypeRouter_Stimulus/PKT_OUT_VALID] [get_bd_pins StimulusRegister_0/PKT_IN_VALID]
connect_bd_net [get_bd_pins StimulusRegister_0/DONE_OUT] [get_bd_pins DoneOutConcat_StimulusRegisters/In0]


connect_bd_net [get_bd_ports CLK] [get_bd_pins StimulusRegister_1/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins StimulusRegister_1/RST]
connect_bd_net [get_bd_pins TypeRouter_Stimulus/PKT_OUT] [get_bd_pins StimulusRegister_1/PKT_IN]
connect_bd_net [get_bd_pins TypeRouter_Stimulus/PKT_OUT_VALID] [get_bd_pins StimulusRegister_1/PKT_IN_VALID]
connect_bd_net [get_bd_pins StimulusRegister_1/DONE_OUT] [get_bd_pins DoneOutConcat_StimulusRegisters/In1]


connect_bd_net [get_bd_pins TypeRouter_Weight/PKT_OUT_VALID] [get_bd_pins LayerRouter_0/PKT_IN_VALID]
connect_bd_net [get_bd_pins TypeRouter_Weight/PKT_OUT] [get_bd_pins LayerRouter_0/PKT_IN]
connect_bd_net [get_bd_ports CLK] [get_bd_pins LayerRouter_0/CLK]
connect_bd_net [get_bd_pins DoneOutConcat_Layer_0/dout] [get_bd_pins DoneOut_Layer_0/DIN]
connect_bd_net [get_bd_pins DoneOut_Layer_0/DOUT] [get_bd_pins LayerRouter_0/DONE_IN]
connect_bd_net [get_bd_pins LayerRouter_0_Address/dout] [get_bd_pins LayerRouter_0/ADDR]
connect_bd_net [get_bd_pins LayerRouter_0/DONE_OUT] [get_bd_pins DoneOutConcat_Layers/In0]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_0_0/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_0_0/RST]
connect_bd_net [get_bd_pins Neuron_0_0_Address/dout] [get_bd_pins Neuron_0_0/NEURON_ADDR]
connect_bd_net [get_bd_pins LayerRouter_0/PKT_OUT] [get_bd_pins Neuron_0_0/PKT_IN]
connect_bd_net [get_bd_pins LayerRouter_0/PKT_OUT_VALID] [get_bd_pins Neuron_0_0/PKT_IN_VALID]
connect_bd_net [get_bd_pins Neuron_0_0/DONE_OUT] [get_bd_pins DoneOutConcat_Layer_0/In0]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_0_1/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_0_1/RST]
connect_bd_net [get_bd_pins Neuron_0_1_Address/dout] [get_bd_pins Neuron_0_1/NEURON_ADDR]
connect_bd_net [get_bd_pins LayerRouter_0/PKT_OUT] [get_bd_pins Neuron_0_1/PKT_IN]
connect_bd_net [get_bd_pins LayerRouter_0/PKT_OUT_VALID] [get_bd_pins Neuron_0_1/PKT_IN_VALID]
connect_bd_net [get_bd_pins Neuron_0_1/DONE_OUT] [get_bd_pins DoneOutConcat_Layer_0/In1]


connect_bd_net [get_bd_pins TypeRouter_Weight/PKT_OUT_VALID] [get_bd_pins LayerRouter_1/PKT_IN_VALID]
connect_bd_net [get_bd_pins TypeRouter_Weight/PKT_OUT] [get_bd_pins LayerRouter_1/PKT_IN]
connect_bd_net [get_bd_ports CLK] [get_bd_pins LayerRouter_1/CLK]
connect_bd_net [get_bd_pins DoneOutConcat_Layer_1/dout] [get_bd_pins DoneOut_Layer_1/DIN]
connect_bd_net [get_bd_pins DoneOut_Layer_1/DOUT] [get_bd_pins LayerRouter_1/DONE_IN]
connect_bd_net [get_bd_pins LayerRouter_1_Address/dout] [get_bd_pins LayerRouter_1/ADDR]
connect_bd_net [get_bd_pins LayerRouter_1/DONE_OUT] [get_bd_pins DoneOutConcat_Layers/In1]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_1_0/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_1_0/RST]
connect_bd_net [get_bd_pins Neuron_1_0_Address/dout] [get_bd_pins Neuron_1_0/NEURON_ADDR]
connect_bd_net [get_bd_pins LayerRouter_1/PKT_OUT] [get_bd_pins Neuron_1_0/PKT_IN]
connect_bd_net [get_bd_pins LayerRouter_1/PKT_OUT_VALID] [get_bd_pins Neuron_1_0/PKT_IN_VALID]
connect_bd_net [get_bd_pins Neuron_1_0/DONE_OUT] [get_bd_pins DoneOutConcat_Layer_1/In0]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_1_1/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_1_1/RST]
connect_bd_net [get_bd_pins Neuron_1_1_Address/dout] [get_bd_pins Neuron_1_1/NEURON_ADDR]
connect_bd_net [get_bd_pins LayerRouter_1/PKT_OUT] [get_bd_pins Neuron_1_1/PKT_IN]
connect_bd_net [get_bd_pins LayerRouter_1/PKT_OUT_VALID] [get_bd_pins Neuron_1_1/PKT_IN_VALID]
connect_bd_net [get_bd_pins Neuron_1_1/DONE_OUT] [get_bd_pins DoneOutConcat_Layer_1/In1]


connect_bd_net [get_bd_pins StimulusRegister_0/VAL_OUT] [get_bd_pins Neuron_0_0/SYN_0_DIN]
connect_bd_net [get_bd_pins StimulusRegister_0/VAL_OUT_VALID] [get_bd_pins Neuron_0_0/SYN_0_VALID]


connect_bd_net [get_bd_pins StimulusRegister_0/VAL_OUT] [get_bd_pins Neuron_0_1/SYN_0_DIN]
connect_bd_net [get_bd_pins StimulusRegister_0/VAL_OUT_VALID] [get_bd_pins Neuron_0_1/SYN_0_VALID]


connect_bd_net [get_bd_pins StimulusRegister_1/VAL_OUT] [get_bd_pins Neuron_0_0/SYN_1_DIN]
connect_bd_net [get_bd_pins StimulusRegister_1/VAL_OUT_VALID] [get_bd_pins Neuron_0_0/SYN_1_VALID]


connect_bd_net [get_bd_pins StimulusRegister_1/VAL_OUT] [get_bd_pins Neuron_0_1/SYN_1_DIN]
connect_bd_net [get_bd_pins StimulusRegister_1/VAL_OUT_VALID] [get_bd_pins Neuron_0_1/SYN_1_VALID]


connect_bd_net [get_bd_pins Neuron_0_0/SYN_OUT] [get_bd_pins Neuron_1_0/SYN_0_DIN]
connect_bd_net [get_bd_pins Neuron_0_0/SYN_OUT_VALID] [get_bd_pins Neuron_1_0/SYN_0_VALID]


connect_bd_net [get_bd_pins Neuron_0_0/SYN_OUT] [get_bd_pins Neuron_1_1/SYN_0_DIN]
connect_bd_net [get_bd_pins Neuron_0_0/SYN_OUT_VALID] [get_bd_pins Neuron_1_1/SYN_0_VALID]


connect_bd_net [get_bd_pins Neuron_0_1/SYN_OUT] [get_bd_pins Neuron_1_0/SYN_1_DIN]
connect_bd_net [get_bd_pins Neuron_0_1/SYN_OUT_VALID] [get_bd_pins Neuron_1_0/SYN_1_VALID]


connect_bd_net [get_bd_pins Neuron_0_1/SYN_OUT] [get_bd_pins Neuron_1_1/SYN_1_DIN]
connect_bd_net [get_bd_pins Neuron_0_1/SYN_OUT_VALID] [get_bd_pins Neuron_1_1/SYN_1_VALID]


connect_bd_net [get_bd_pins Neuron_1_0/SYN_OUT] [get_bd_ports SYN_0_OUT]
connect_bd_net [get_bd_pins Neuron_1_0/SYN_OUT_VALID] [get_bd_ports SYN_0_OUT_VALID]


connect_bd_net [get_bd_pins Neuron_1_1/SYN_OUT] [get_bd_ports SYN_1_OUT]
connect_bd_net [get_bd_pins Neuron_1_1/SYN_OUT_VALID] [get_bd_ports SYN_1_OUT_VALID]


regenerate_bd_layout

