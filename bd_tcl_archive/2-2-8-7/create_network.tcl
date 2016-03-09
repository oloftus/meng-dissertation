
create_bd_port -dir I -type clk CLK
create_bd_port -dir I -type rst RST
create_bd_port -dir I -from 31 -to 0 -type data PKT_IN
create_bd_port -dir I PKT_IN_VALID
create_bd_port -dir I NXT_SYN_OUT
create_bd_port -dir O DONE_OUT
create_bd_port -dir O -from 31 -to 0 -type data SYN_OUTS
create_bd_port -dir O SYN_OUTS_READY


create_bd_cell -type ip -vlnv oloftus.com:prif:ValueRouter:4.0 TypeRouter_Stimulus
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 TypeRouter_Stimulus_Address
create_bd_cell -type ip -vlnv oloftus.com:prif:ValueRouter:4.0 TypeRouter_Weight
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 TypeRouter_Weight_Address
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 PktRcvd_Layers
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 PktRcvdConcat_Layers
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 PktRcvd_StimulusRegisters
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 PktRcvdConcat_StimulusRegisters
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 PktRcvd
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 PktRcvdConcat
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 SynOutConcat
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 SynOutValidConcat
create_bd_cell -type ip -vlnv oloftus.com:prif:SynOutBuffer:1.0 SynOutBuffer


create_bd_cell -type ip -vlnv oloftus.com:prif:ValueRouter:4.0 LayerRouter_0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 LayerRouter_0_Address
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 PktRcvd_Layer_0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 PktRcvdConcat_Layer_0


create_bd_cell -type ip -vlnv oloftus.com:prif:Neuron_wrapper:1.0 Neuron_0_0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Neuron_0_0_Address


create_bd_cell -type ip -vlnv oloftus.com:prif:Neuron_wrapper:1.0 Neuron_0_1
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Neuron_0_1_Address


create_bd_cell -type ip -vlnv oloftus.com:prif:ValueRouter:4.0 LayerRouter_1
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 LayerRouter_1_Address
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 PktRcvd_Layer_1
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 PktRcvdConcat_Layer_1


create_bd_cell -type ip -vlnv oloftus.com:prif:Neuron_wrapper:1.0 Neuron_1_0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Neuron_1_0_Address


create_bd_cell -type ip -vlnv oloftus.com:prif:Neuron_wrapper:1.0 Neuron_1_1
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Neuron_1_1_Address


create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 StimulusRegister_0


create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 StimulusRegister_1


set_property -dict [list CONFIG.packetOutWidth {31} CONFIG.packetInWidth {32}] [get_bd_cells TypeRouter_Stimulus]
set_property -dict [list CONFIG.CONST_VAL {1}] [get_bd_cells TypeRouter_Stimulus_Address]
set_property -dict [list CONFIG.packetOutWidth {31} CONFIG.packetInWidth {32}] [get_bd_cells TypeRouter_Weight]
set_property -dict [list CONFIG.CONST_VAL {0}] [get_bd_cells TypeRouter_Weight_Address]
set_property -dict [list CONFIG.n {2}] [get_bd_cells PktRcvd_Layers]
set_property -dict [list CONFIG.NUM_PORTS {2}] [get_bd_cells PktRcvdConcat_Layers]
set_property -dict [list CONFIG.n {2}] [get_bd_cells PktRcvd_StimulusRegisters]
set_property -dict [list CONFIG.NUM_PORTS {2}] [get_bd_cells PktRcvdConcat_StimulusRegisters]
set_property -dict [list CONFIG.n {2}] [get_bd_cells PktRcvd]
set_property -dict [list CONFIG.NUM_PORTS {2}] [get_bd_cells SynOutValidConcat]
set_property -dict [list CONFIG.NUM_PORTS {2} CONFIG.IN0_WIDTH {16} CONFIG.IN1_WIDTH {16}] [get_bd_cells SynOutConcat]
set_property -dict [list CONFIG.numInputs {2} CONFIG.dinWidth {16} CONFIG.doutWidth {32}] [get_bd_cells SynOutBuffer]


set_property -dict [list CONFIG.packetOutWidth {26} CONFIG.packetInWidth {31}] [get_bd_cells LayerRouter_0]
set_property -dict [list CONFIG.CONST_WIDTH {5} CONFIG.CONST_VAL {0}] [get_bd_cells LayerRouter_0_Address]
set_property -dict [list CONFIG.n {2}] [get_bd_cells PktRcvd_Layer_0]
set_property -dict [list CONFIG.NUM_PORTS {2}] [get_bd_cells PktRcvdConcat_Layer_0]


set_property -dict [list CONFIG.CONST_WIDTH {6} CONFIG.CONST_VAL {0}] [get_bd_cells Neuron_0_0_Address]


set_property -dict [list CONFIG.CONST_WIDTH {6} CONFIG.CONST_VAL {1}] [get_bd_cells Neuron_0_1_Address]


set_property -dict [list CONFIG.packetOutWidth {26} CONFIG.packetInWidth {31}] [get_bd_cells LayerRouter_1]
set_property -dict [list CONFIG.CONST_WIDTH {5} CONFIG.CONST_VAL {1}] [get_bd_cells LayerRouter_1_Address]
set_property -dict [list CONFIG.n {2}] [get_bd_cells PktRcvd_Layer_1]
set_property -dict [list CONFIG.NUM_PORTS {2}] [get_bd_cells PktRcvdConcat_Layer_1]


set_property -dict [list CONFIG.CONST_WIDTH {6} CONFIG.CONST_VAL {0}] [get_bd_cells Neuron_1_0_Address]


set_property -dict [list CONFIG.CONST_WIDTH {6} CONFIG.CONST_VAL {1}] [get_bd_cells Neuron_1_1_Address]


set_property -dict [list CONFIG.address {0} CONFIG.addressWidth {15} CONFIG.dataWidth {16}] [get_bd_cells StimulusRegister_0]


set_property -dict [list CONFIG.address {1} CONFIG.addressWidth {15} CONFIG.dataWidth {16}] [get_bd_cells StimulusRegister_1]


connect_bd_net [get_bd_ports CLK] [get_bd_pins TypeRouter_Weight/CLK]
connect_bd_net [get_bd_ports PKT_IN_VALID] [get_bd_pins TypeRouter_Weight/PKT_IN_VALID]
connect_bd_net [get_bd_ports PKT_IN] [get_bd_pins TypeRouter_Weight/PKT_IN]
connect_bd_net [get_bd_pins TypeRouter_Weight/DONE_IN] [get_bd_pins PktRcvd_Layers/DOUT]
connect_bd_net [get_bd_pins TypeRouter_Weight/DONE_OUT] [get_bd_pins PktRcvdConcat/In0]
connect_bd_net [get_bd_pins TypeRouter_Weight_Address/dout] [get_bd_pins TypeRouter_Weight/ADDR]

connect_bd_net [get_bd_ports CLK] [get_bd_pins TypeRouter_Stimulus/CLK]
connect_bd_net [get_bd_ports PKT_IN_VALID] [get_bd_pins TypeRouter_Stimulus/PKT_IN_VALID]
connect_bd_net [get_bd_ports PKT_IN] [get_bd_pins TypeRouter_Stimulus/PKT_IN]
connect_bd_net [get_bd_pins TypeRouter_Stimulus/DONE_IN] [get_bd_pins PktRcvd_StimulusRegisters/DOUT]
connect_bd_net [get_bd_pins TypeRouter_Stimulus/DONE_OUT] [get_bd_pins PktRcvdConcat/In1]
connect_bd_net [get_bd_pins TypeRouter_Stimulus_Address/dout] [get_bd_pins TypeRouter_Stimulus/ADDR]

connect_bd_net [get_bd_ports DONE_OUT] [get_bd_pins PktRcvd/DOUT]
connect_bd_net [get_bd_pins PktRcvdConcat/dout] [get_bd_pins PktRcvd/DIN]
connect_bd_net [get_bd_pins PktRcvdConcat_Layers/dout] [get_bd_pins PktRcvd_Layers/DIN]
connect_bd_net [get_bd_pins PktRcvdConcat_StimulusRegisters/dout] [get_bd_pins PktRcvd_StimulusRegisters/DIN]

connect_bd_net [get_bd_ports CLK] [get_bd_pins SynOutBuffer/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins SynOutBuffer/RST]
connect_bd_net [get_bd_ports SYN_OUTS] [get_bd_pins SynOutBuffer/DOUT]
connect_bd_net [get_bd_ports NXT_SYN_OUT] [get_bd_pins SynOutBuffer/NXT]
connect_bd_net [get_bd_ports SYN_OUTS_READY] [get_bd_pins SynOutBuffer/READY]
connect_bd_net [get_bd_pins SynOutConcat/dout] [get_bd_pins SynOutBuffer/DIN]
connect_bd_net [get_bd_pins SynOutValidConcat/dout] [get_bd_pins SynOutBuffer/DVALID]


connect_bd_net [get_bd_ports CLK] [get_bd_pins StimulusRegister_0/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins StimulusRegister_0/RST]
connect_bd_net [get_bd_pins TypeRouter_Stimulus/PKT_OUT] [get_bd_pins StimulusRegister_0/PKT_IN]
connect_bd_net [get_bd_pins TypeRouter_Stimulus/PKT_OUT_VALID] [get_bd_pins StimulusRegister_0/PKT_IN_VALID]


connect_bd_net [get_bd_ports CLK] [get_bd_pins StimulusRegister_1/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins StimulusRegister_1/RST]
connect_bd_net [get_bd_pins TypeRouter_Stimulus/PKT_OUT] [get_bd_pins StimulusRegister_1/PKT_IN]
connect_bd_net [get_bd_pins TypeRouter_Stimulus/PKT_OUT_VALID] [get_bd_pins StimulusRegister_1/PKT_IN_VALID]


connect_bd_net [get_bd_pins StimulusRegister_0/DONE_OUT] [get_bd_pins PktRcvdConcat_StimulusRegisters/In0]
connect_bd_net [get_bd_pins TypeRouter_Weight/PKT_OUT_VALID] [get_bd_pins LayerRouter_0/PKT_IN_VALID]
connect_bd_net [get_bd_pins TypeRouter_Weight/PKT_OUT] [get_bd_pins LayerRouter_0/PKT_IN]
connect_bd_net [get_bd_ports CLK] [get_bd_pins LayerRouter_0/CLK]
connect_bd_net [get_bd_pins PktRcvdConcat_Layer_0/dout] [get_bd_pins PktRcvd_Layer_0/DIN]
connect_bd_net [get_bd_pins PktRcvd_Layer_0/DOUT] [get_bd_pins LayerRouter_0/DONE_IN]
connect_bd_net [get_bd_pins LayerRouter_0_Address/dout] [get_bd_pins LayerRouter_0/ADDR]
connect_bd_net [get_bd_pins LayerRouter_0/DONE_OUT] [get_bd_pins PktRcvdConcat_Layers/In0]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_0_0/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_0_0/RST]
connect_bd_net [get_bd_pins Neuron_0_0_Address/dout] [get_bd_pins Neuron_0_0/NEURON_ADDR]
connect_bd_net [get_bd_pins LayerRouter_0/PKT_OUT] [get_bd_pins Neuron_0_0/PKT_IN]
connect_bd_net [get_bd_pins LayerRouter_0/PKT_OUT_VALID] [get_bd_pins Neuron_0_0/PKT_IN_VALID]
connect_bd_net [get_bd_pins Neuron_0_0/DONE_OUT] [get_bd_pins PktRcvdConcat_Layer_0/In0]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_0_1/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_0_1/RST]
connect_bd_net [get_bd_pins Neuron_0_1_Address/dout] [get_bd_pins Neuron_0_1/NEURON_ADDR]
connect_bd_net [get_bd_pins LayerRouter_0/PKT_OUT] [get_bd_pins Neuron_0_1/PKT_IN]
connect_bd_net [get_bd_pins LayerRouter_0/PKT_OUT_VALID] [get_bd_pins Neuron_0_1/PKT_IN_VALID]
connect_bd_net [get_bd_pins Neuron_0_1/DONE_OUT] [get_bd_pins PktRcvdConcat_Layer_0/In1]


connect_bd_net [get_bd_pins StimulusRegister_1/DONE_OUT] [get_bd_pins PktRcvdConcat_StimulusRegisters/In1]
connect_bd_net [get_bd_pins TypeRouter_Weight/PKT_OUT_VALID] [get_bd_pins LayerRouter_1/PKT_IN_VALID]
connect_bd_net [get_bd_pins TypeRouter_Weight/PKT_OUT] [get_bd_pins LayerRouter_1/PKT_IN]
connect_bd_net [get_bd_ports CLK] [get_bd_pins LayerRouter_1/CLK]
connect_bd_net [get_bd_pins PktRcvdConcat_Layer_1/dout] [get_bd_pins PktRcvd_Layer_1/DIN]
connect_bd_net [get_bd_pins PktRcvd_Layer_1/DOUT] [get_bd_pins LayerRouter_1/DONE_IN]
connect_bd_net [get_bd_pins LayerRouter_1_Address/dout] [get_bd_pins LayerRouter_1/ADDR]
connect_bd_net [get_bd_pins LayerRouter_1/DONE_OUT] [get_bd_pins PktRcvdConcat_Layers/In1]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_1_0/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_1_0/RST]
connect_bd_net [get_bd_pins Neuron_1_0_Address/dout] [get_bd_pins Neuron_1_0/NEURON_ADDR]
connect_bd_net [get_bd_pins LayerRouter_1/PKT_OUT] [get_bd_pins Neuron_1_0/PKT_IN]
connect_bd_net [get_bd_pins LayerRouter_1/PKT_OUT_VALID] [get_bd_pins Neuron_1_0/PKT_IN_VALID]
connect_bd_net [get_bd_pins Neuron_1_0/DONE_OUT] [get_bd_pins PktRcvdConcat_Layer_1/In0]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_1_1/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_1_1/RST]
connect_bd_net [get_bd_pins Neuron_1_1_Address/dout] [get_bd_pins Neuron_1_1/NEURON_ADDR]
connect_bd_net [get_bd_pins LayerRouter_1/PKT_OUT] [get_bd_pins Neuron_1_1/PKT_IN]
connect_bd_net [get_bd_pins LayerRouter_1/PKT_OUT_VALID] [get_bd_pins Neuron_1_1/PKT_IN_VALID]
connect_bd_net [get_bd_pins Neuron_1_1/DONE_OUT] [get_bd_pins PktRcvdConcat_Layer_1/In1]


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


connect_bd_net [get_bd_pins Neuron_1_0/SYN_OUT_VALID] [get_bd_pins SynOutValidConcat/In0]
connect_bd_net [get_bd_pins Neuron_1_0/SYN_OUT] [get_bd_pins SynOutConcat/In0]


connect_bd_net [get_bd_pins Neuron_1_1/SYN_OUT_VALID] [get_bd_pins SynOutValidConcat/In1]
connect_bd_net [get_bd_pins Neuron_1_1/SYN_OUT] [get_bd_pins SynOutConcat/In1]


regenerate_bd_layout

