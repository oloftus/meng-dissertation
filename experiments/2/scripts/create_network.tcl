
create_bd_port -dir I -type clk CLK
create_bd_port -dir I -type rst RST
create_bd_port -dir I -from 31 -to 0 -type data PKT_IN
create_bd_port -dir I PKT_IN_VALID
create_bd_port -dir I NXT_SYN_OUT
create_bd_port -dir O DONE_OUT
create_bd_port -dir O -from 31 -to 0 -type data SYN_OUTS
create_bd_port -dir O SYN_OUTS_READY


create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 PacketInSlicer
create_bd_cell -type ip -vlnv oloftus.com:prif:ValueRouter:1.0 TypeRouter_Stimulus
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 TypeRouter_Stimulus_Address
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 PktRcvd_StimulusRegisters
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 PktRcvdConcat_StimulusRegisters
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 SynOutConcat
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 SynOutValidConcat
create_bd_cell -type ip -vlnv oloftus.com:prif:SynOutBuffer:1.0 SynOutBuffer


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Neuron_0_0_Bias


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_0_0_0_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_0_0_1_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_0_0_2_Weight


create_bd_cell -type ip -vlnv oloftus.com:prif:InputNeuron:1.0 Neuron_0_0


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Neuron_0_1_Bias


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_0_1_0_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_0_1_1_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_0_1_2_Weight


create_bd_cell -type ip -vlnv oloftus.com:prif:InputNeuron:1.0 Neuron_0_1


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Neuron_0_2_Bias


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_0_2_0_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_0_2_1_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_0_2_2_Weight


create_bd_cell -type ip -vlnv oloftus.com:prif:InputNeuron:1.0 Neuron_0_2


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Neuron_0_3_Bias


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_0_3_0_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_0_3_1_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_0_3_2_Weight


create_bd_cell -type ip -vlnv oloftus.com:prif:InputNeuron:1.0 Neuron_0_3


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Neuron_0_4_Bias


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_0_4_0_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_0_4_1_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_0_4_2_Weight


create_bd_cell -type ip -vlnv oloftus.com:prif:InputNeuron:1.0 Neuron_0_4


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Neuron_1_0_Bias


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_0_0_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_0_1_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_0_2_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_0_3_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_0_4_Weight


create_bd_cell -type ip -vlnv oloftus.com:prif:HiddenNeuron:1.0 Neuron_1_0


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Neuron_1_1_Bias


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_1_0_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_1_1_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_1_2_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_1_3_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_1_4_Weight


create_bd_cell -type ip -vlnv oloftus.com:prif:HiddenNeuron:1.0 Neuron_1_1


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Neuron_1_2_Bias


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_2_0_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_2_1_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_2_2_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_2_3_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_2_4_Weight


create_bd_cell -type ip -vlnv oloftus.com:prif:HiddenNeuron:1.0 Neuron_1_2


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Neuron_1_3_Bias


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_3_0_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_3_1_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_3_2_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_3_3_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_3_4_Weight


create_bd_cell -type ip -vlnv oloftus.com:prif:HiddenNeuron:1.0 Neuron_1_3


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Neuron_1_4_Bias


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_4_0_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_4_1_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_4_2_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_4_3_Weight


create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_1_4_4_Weight


create_bd_cell -type ip -vlnv oloftus.com:prif:HiddenNeuron:1.0 Neuron_1_4


create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 StimulusRegister_0


create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 StimulusRegister_1


create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 StimulusRegister_2


set_property -dict [list CONFIG.DIN_WIDTH {32} CONFIG.DIN_TO {0} CONFIG.DIN_FROM {24}] [get_bd_cells PacketInSlicer]
set_property -dict [list CONFIG.packetOutWidth {10} CONFIG.packetInWidth {25}] [get_bd_cells TypeRouter_Stimulus]
set_property -dict [list CONFIG.CONST_WIDTH {15} CONFIG.CONST_VAL {16384}] [get_bd_cells TypeRouter_Stimulus_Address]
set_property -dict [list CONFIG.n {3}] [get_bd_cells PktRcvd_StimulusRegisters]
set_property -dict [list CONFIG.NUM_PORTS {3}] [get_bd_cells PktRcvdConcat_StimulusRegisters]
set_property -dict [list CONFIG.NUM_PORTS {5}] [get_bd_cells SynOutValidConcat]
set_property -dict [list CONFIG.NUM_PORTS {5} CONFIG.IN0_WIDTH {8} CONFIG.IN1_WIDTH {8} CONFIG.IN2_WIDTH {8} CONFIG.IN3_WIDTH {8} CONFIG.IN4_WIDTH {8}] [get_bd_cells SynOutConcat]
set_property -dict [list CONFIG.numInputs {5} CONFIG.dinWidth {8} CONFIG.doutWidth {32}] [get_bd_cells SynOutBuffer]


set_property -dict [list CONFIG.CONST_WIDTH {12} CONFIG.CONST_VAL {0}] [get_bd_cells Neuron_0_0_Bias]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {3356}] [get_bd_cells Synapse_0_0_0_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {60304}] [get_bd_cells Synapse_0_0_1_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {57974}] [get_bd_cells Synapse_0_0_2_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {12} CONFIG.CONST_VAL {2779}] [get_bd_cells Neuron_0_1_Bias]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {6268}] [get_bd_cells Synapse_0_1_0_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {3740}] [get_bd_cells Synapse_0_1_1_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {6687}] [get_bd_cells Synapse_0_1_2_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {12} CONFIG.CONST_VAL {3977}] [get_bd_cells Neuron_0_2_Bias]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {57957}] [get_bd_cells Synapse_0_2_0_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {3398}] [get_bd_cells Synapse_0_2_1_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {5111}] [get_bd_cells Synapse_0_2_2_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {12} CONFIG.CONST_VAL {3683}] [get_bd_cells Neuron_0_3_Bias]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {59821}] [get_bd_cells Synapse_0_3_0_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {6559}] [get_bd_cells Synapse_0_3_1_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {61627}] [get_bd_cells Synapse_0_3_2_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {12} CONFIG.CONST_VAL {3}] [get_bd_cells Neuron_0_4_Bias]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {55930}] [get_bd_cells Synapse_0_4_0_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {406}] [get_bd_cells Synapse_0_4_1_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {3514}] [get_bd_cells Synapse_0_4_2_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {12} CONFIG.CONST_VAL {3327}] [get_bd_cells Neuron_1_0_Bias]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {6168}] [get_bd_cells Synapse_1_0_0_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {933}] [get_bd_cells Synapse_1_0_1_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {63107}] [get_bd_cells Synapse_1_0_2_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {3928}] [get_bd_cells Synapse_1_0_3_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {63017}] [get_bd_cells Synapse_1_0_4_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {12} CONFIG.CONST_VAL {3675}] [get_bd_cells Neuron_1_1_Bias]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {2529}] [get_bd_cells Synapse_1_1_0_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {62766}] [get_bd_cells Synapse_1_1_1_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {61343}] [get_bd_cells Synapse_1_1_2_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {1977}] [get_bd_cells Synapse_1_1_3_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {5197}] [get_bd_cells Synapse_1_1_4_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {12} CONFIG.CONST_VAL {3617}] [get_bd_cells Neuron_1_2_Bias]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {3631}] [get_bd_cells Synapse_1_2_0_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {1988}] [get_bd_cells Synapse_1_2_1_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {65}] [get_bd_cells Synapse_1_2_2_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {61213}] [get_bd_cells Synapse_1_2_3_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {5118}] [get_bd_cells Synapse_1_2_4_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {12} CONFIG.CONST_VAL {415}] [get_bd_cells Neuron_1_3_Bias]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {64762}] [get_bd_cells Synapse_1_3_0_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {602}] [get_bd_cells Synapse_1_3_1_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {60534}] [get_bd_cells Synapse_1_3_2_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {60036}] [get_bd_cells Synapse_1_3_3_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {61110}] [get_bd_cells Synapse_1_3_4_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {12} CONFIG.CONST_VAL {2622}] [get_bd_cells Neuron_1_4_Bias]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {65010}] [get_bd_cells Synapse_1_4_0_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {2828}] [get_bd_cells Synapse_1_4_1_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {4115}] [get_bd_cells Synapse_1_4_2_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {345}] [get_bd_cells Synapse_1_4_3_Weight]


set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {4803}] [get_bd_cells Synapse_1_4_4_Weight]


set_property -dict [list CONFIG.address {0} CONFIG.addressWidth {2} CONFIG.dataWidth {8}] [get_bd_cells StimulusRegister_0]


set_property -dict [list CONFIG.address {1} CONFIG.addressWidth {2} CONFIG.dataWidth {8}] [get_bd_cells StimulusRegister_1]


set_property -dict [list CONFIG.address {2} CONFIG.addressWidth {2} CONFIG.dataWidth {8}] [get_bd_cells StimulusRegister_2]


connect_bd_net [get_bd_pins TypeRouter_Stimulus/DONE_OUT] [get_bd_ports DONE_OUT]


connect_bd_net [get_bd_ports PKT_IN] [get_bd_pins PacketInSlicer/Din]
connect_bd_net [get_bd_ports CLK] [get_bd_pins TypeRouter_Stimulus/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins TypeRouter_Stimulus/RST]
connect_bd_net [get_bd_ports PKT_IN_VALID] [get_bd_pins TypeRouter_Stimulus/PKT_IN_VALID]
connect_bd_net [get_bd_pins PacketInSlicer/Dout] [get_bd_pins TypeRouter_Stimulus/PKT_IN]
connect_bd_net [get_bd_pins TypeRouter_Stimulus/DONE_IN] [get_bd_pins PktRcvd_StimulusRegisters/DOUT]
connect_bd_net [get_bd_pins TypeRouter_Stimulus_Address/dout] [get_bd_pins TypeRouter_Stimulus/ADDR]
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


connect_bd_net [get_bd_ports CLK] [get_bd_pins StimulusRegister_2/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins StimulusRegister_2/RST]
connect_bd_net [get_bd_pins TypeRouter_Stimulus/PKT_OUT] [get_bd_pins StimulusRegister_2/PKT_IN]
connect_bd_net [get_bd_pins TypeRouter_Stimulus/PKT_OUT_VALID] [get_bd_pins StimulusRegister_2/PKT_IN_VALID]


connect_bd_net [get_bd_pins StimulusRegister_0/DONE_OUT] [get_bd_pins PktRcvdConcat_StimulusRegisters/In0]


connect_bd_net [get_bd_pins StimulusRegister_1/DONE_OUT] [get_bd_pins PktRcvdConcat_StimulusRegisters/In1]


connect_bd_net [get_bd_pins StimulusRegister_2/DONE_OUT] [get_bd_pins PktRcvdConcat_StimulusRegisters/In2]


connect_bd_net  [get_bd_pins Neuron_0_0_Bias/dout] [get_bd_pins Neuron_0_0/BIAS_VAL]


connect_bd_net  [get_bd_pins Synapse_0_0_0_Weight/dout] [get_bd_pins Neuron_0_0/SYN_0_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_0_0_1_Weight/dout] [get_bd_pins Neuron_0_0/SYN_1_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_0_0_2_Weight/dout] [get_bd_pins Neuron_0_0/SYN_2_WEIGHT]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_0_0/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_0_0/RST]


connect_bd_net  [get_bd_pins Neuron_0_1_Bias/dout] [get_bd_pins Neuron_0_1/BIAS_VAL]


connect_bd_net  [get_bd_pins Synapse_0_1_0_Weight/dout] [get_bd_pins Neuron_0_1/SYN_0_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_0_1_1_Weight/dout] [get_bd_pins Neuron_0_1/SYN_1_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_0_1_2_Weight/dout] [get_bd_pins Neuron_0_1/SYN_2_WEIGHT]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_0_1/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_0_1/RST]


connect_bd_net  [get_bd_pins Neuron_0_2_Bias/dout] [get_bd_pins Neuron_0_2/BIAS_VAL]


connect_bd_net  [get_bd_pins Synapse_0_2_0_Weight/dout] [get_bd_pins Neuron_0_2/SYN_0_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_0_2_1_Weight/dout] [get_bd_pins Neuron_0_2/SYN_1_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_0_2_2_Weight/dout] [get_bd_pins Neuron_0_2/SYN_2_WEIGHT]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_0_2/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_0_2/RST]


connect_bd_net  [get_bd_pins Neuron_0_3_Bias/dout] [get_bd_pins Neuron_0_3/BIAS_VAL]


connect_bd_net  [get_bd_pins Synapse_0_3_0_Weight/dout] [get_bd_pins Neuron_0_3/SYN_0_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_0_3_1_Weight/dout] [get_bd_pins Neuron_0_3/SYN_1_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_0_3_2_Weight/dout] [get_bd_pins Neuron_0_3/SYN_2_WEIGHT]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_0_3/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_0_3/RST]


connect_bd_net  [get_bd_pins Neuron_0_4_Bias/dout] [get_bd_pins Neuron_0_4/BIAS_VAL]


connect_bd_net  [get_bd_pins Synapse_0_4_0_Weight/dout] [get_bd_pins Neuron_0_4/SYN_0_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_0_4_1_Weight/dout] [get_bd_pins Neuron_0_4/SYN_1_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_0_4_2_Weight/dout] [get_bd_pins Neuron_0_4/SYN_2_WEIGHT]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_0_4/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_0_4/RST]


connect_bd_net  [get_bd_pins Neuron_1_0_Bias/dout] [get_bd_pins Neuron_1_0/BIAS_VAL]


connect_bd_net  [get_bd_pins Synapse_1_0_0_Weight/dout] [get_bd_pins Neuron_1_0/SYN_0_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_1_0_1_Weight/dout] [get_bd_pins Neuron_1_0/SYN_1_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_1_0_2_Weight/dout] [get_bd_pins Neuron_1_0/SYN_2_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_1_0_3_Weight/dout] [get_bd_pins Neuron_1_0/SYN_3_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_1_0_4_Weight/dout] [get_bd_pins Neuron_1_0/SYN_4_WEIGHT]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_1_0/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_1_0/RST]


connect_bd_net  [get_bd_pins Neuron_1_1_Bias/dout] [get_bd_pins Neuron_1_1/BIAS_VAL]


connect_bd_net  [get_bd_pins Synapse_1_1_0_Weight/dout] [get_bd_pins Neuron_1_1/SYN_0_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_1_1_1_Weight/dout] [get_bd_pins Neuron_1_1/SYN_1_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_1_1_2_Weight/dout] [get_bd_pins Neuron_1_1/SYN_2_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_1_1_3_Weight/dout] [get_bd_pins Neuron_1_1/SYN_3_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_1_1_4_Weight/dout] [get_bd_pins Neuron_1_1/SYN_4_WEIGHT]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_1_1/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_1_1/RST]


connect_bd_net  [get_bd_pins Neuron_1_2_Bias/dout] [get_bd_pins Neuron_1_2/BIAS_VAL]


connect_bd_net  [get_bd_pins Synapse_1_2_0_Weight/dout] [get_bd_pins Neuron_1_2/SYN_0_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_1_2_1_Weight/dout] [get_bd_pins Neuron_1_2/SYN_1_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_1_2_2_Weight/dout] [get_bd_pins Neuron_1_2/SYN_2_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_1_2_3_Weight/dout] [get_bd_pins Neuron_1_2/SYN_3_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_1_2_4_Weight/dout] [get_bd_pins Neuron_1_2/SYN_4_WEIGHT]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_1_2/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_1_2/RST]


connect_bd_net  [get_bd_pins Neuron_1_3_Bias/dout] [get_bd_pins Neuron_1_3/BIAS_VAL]


connect_bd_net  [get_bd_pins Synapse_1_3_0_Weight/dout] [get_bd_pins Neuron_1_3/SYN_0_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_1_3_1_Weight/dout] [get_bd_pins Neuron_1_3/SYN_1_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_1_3_2_Weight/dout] [get_bd_pins Neuron_1_3/SYN_2_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_1_3_3_Weight/dout] [get_bd_pins Neuron_1_3/SYN_3_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_1_3_4_Weight/dout] [get_bd_pins Neuron_1_3/SYN_4_WEIGHT]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_1_3/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_1_3/RST]


connect_bd_net  [get_bd_pins Neuron_1_4_Bias/dout] [get_bd_pins Neuron_1_4/BIAS_VAL]


connect_bd_net  [get_bd_pins Synapse_1_4_0_Weight/dout] [get_bd_pins Neuron_1_4/SYN_0_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_1_4_1_Weight/dout] [get_bd_pins Neuron_1_4/SYN_1_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_1_4_2_Weight/dout] [get_bd_pins Neuron_1_4/SYN_2_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_1_4_3_Weight/dout] [get_bd_pins Neuron_1_4/SYN_3_WEIGHT]


connect_bd_net  [get_bd_pins Synapse_1_4_4_Weight/dout] [get_bd_pins Neuron_1_4/SYN_4_WEIGHT]


connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_1_4/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_1_4/RST]


connect_bd_net [get_bd_pins StimulusRegister_0/VAL_OUT] [get_bd_pins Neuron_0_0/SYN_0_DIN]
connect_bd_net [get_bd_pins StimulusRegister_0/VAL_OUT_VALID] [get_bd_pins Neuron_0_0/SYN_0_VALID]


connect_bd_net [get_bd_pins StimulusRegister_0/VAL_OUT] [get_bd_pins Neuron_0_1/SYN_0_DIN]
connect_bd_net [get_bd_pins StimulusRegister_0/VAL_OUT_VALID] [get_bd_pins Neuron_0_1/SYN_0_VALID]


connect_bd_net [get_bd_pins StimulusRegister_0/VAL_OUT] [get_bd_pins Neuron_0_2/SYN_0_DIN]
connect_bd_net [get_bd_pins StimulusRegister_0/VAL_OUT_VALID] [get_bd_pins Neuron_0_2/SYN_0_VALID]


connect_bd_net [get_bd_pins StimulusRegister_0/VAL_OUT] [get_bd_pins Neuron_0_3/SYN_0_DIN]
connect_bd_net [get_bd_pins StimulusRegister_0/VAL_OUT_VALID] [get_bd_pins Neuron_0_3/SYN_0_VALID]


connect_bd_net [get_bd_pins StimulusRegister_0/VAL_OUT] [get_bd_pins Neuron_0_4/SYN_0_DIN]
connect_bd_net [get_bd_pins StimulusRegister_0/VAL_OUT_VALID] [get_bd_pins Neuron_0_4/SYN_0_VALID]


connect_bd_net [get_bd_pins StimulusRegister_1/VAL_OUT] [get_bd_pins Neuron_0_0/SYN_1_DIN]
connect_bd_net [get_bd_pins StimulusRegister_1/VAL_OUT_VALID] [get_bd_pins Neuron_0_0/SYN_1_VALID]


connect_bd_net [get_bd_pins StimulusRegister_1/VAL_OUT] [get_bd_pins Neuron_0_1/SYN_1_DIN]
connect_bd_net [get_bd_pins StimulusRegister_1/VAL_OUT_VALID] [get_bd_pins Neuron_0_1/SYN_1_VALID]


connect_bd_net [get_bd_pins StimulusRegister_1/VAL_OUT] [get_bd_pins Neuron_0_2/SYN_1_DIN]
connect_bd_net [get_bd_pins StimulusRegister_1/VAL_OUT_VALID] [get_bd_pins Neuron_0_2/SYN_1_VALID]


connect_bd_net [get_bd_pins StimulusRegister_1/VAL_OUT] [get_bd_pins Neuron_0_3/SYN_1_DIN]
connect_bd_net [get_bd_pins StimulusRegister_1/VAL_OUT_VALID] [get_bd_pins Neuron_0_3/SYN_1_VALID]


connect_bd_net [get_bd_pins StimulusRegister_1/VAL_OUT] [get_bd_pins Neuron_0_4/SYN_1_DIN]
connect_bd_net [get_bd_pins StimulusRegister_1/VAL_OUT_VALID] [get_bd_pins Neuron_0_4/SYN_1_VALID]


connect_bd_net [get_bd_pins StimulusRegister_2/VAL_OUT] [get_bd_pins Neuron_0_0/SYN_2_DIN]
connect_bd_net [get_bd_pins StimulusRegister_2/VAL_OUT_VALID] [get_bd_pins Neuron_0_0/SYN_2_VALID]


connect_bd_net [get_bd_pins StimulusRegister_2/VAL_OUT] [get_bd_pins Neuron_0_1/SYN_2_DIN]
connect_bd_net [get_bd_pins StimulusRegister_2/VAL_OUT_VALID] [get_bd_pins Neuron_0_1/SYN_2_VALID]


connect_bd_net [get_bd_pins StimulusRegister_2/VAL_OUT] [get_bd_pins Neuron_0_2/SYN_2_DIN]
connect_bd_net [get_bd_pins StimulusRegister_2/VAL_OUT_VALID] [get_bd_pins Neuron_0_2/SYN_2_VALID]


connect_bd_net [get_bd_pins StimulusRegister_2/VAL_OUT] [get_bd_pins Neuron_0_3/SYN_2_DIN]
connect_bd_net [get_bd_pins StimulusRegister_2/VAL_OUT_VALID] [get_bd_pins Neuron_0_3/SYN_2_VALID]


connect_bd_net [get_bd_pins StimulusRegister_2/VAL_OUT] [get_bd_pins Neuron_0_4/SYN_2_DIN]
connect_bd_net [get_bd_pins StimulusRegister_2/VAL_OUT_VALID] [get_bd_pins Neuron_0_4/SYN_2_VALID]


connect_bd_net [get_bd_pins Neuron_0_0/SYN_OUT] [get_bd_pins Neuron_1_0/SYN_0_DIN]
connect_bd_net [get_bd_pins Neuron_0_0/SYN_OUT_VALID] [get_bd_pins Neuron_1_0/SYN_0_VALID]


connect_bd_net [get_bd_pins Neuron_0_0/SYN_OUT] [get_bd_pins Neuron_1_1/SYN_0_DIN]
connect_bd_net [get_bd_pins Neuron_0_0/SYN_OUT_VALID] [get_bd_pins Neuron_1_1/SYN_0_VALID]


connect_bd_net [get_bd_pins Neuron_0_0/SYN_OUT] [get_bd_pins Neuron_1_2/SYN_0_DIN]
connect_bd_net [get_bd_pins Neuron_0_0/SYN_OUT_VALID] [get_bd_pins Neuron_1_2/SYN_0_VALID]


connect_bd_net [get_bd_pins Neuron_0_0/SYN_OUT] [get_bd_pins Neuron_1_3/SYN_0_DIN]
connect_bd_net [get_bd_pins Neuron_0_0/SYN_OUT_VALID] [get_bd_pins Neuron_1_3/SYN_0_VALID]


connect_bd_net [get_bd_pins Neuron_0_0/SYN_OUT] [get_bd_pins Neuron_1_4/SYN_0_DIN]
connect_bd_net [get_bd_pins Neuron_0_0/SYN_OUT_VALID] [get_bd_pins Neuron_1_4/SYN_0_VALID]


connect_bd_net [get_bd_pins Neuron_0_1/SYN_OUT] [get_bd_pins Neuron_1_0/SYN_1_DIN]
connect_bd_net [get_bd_pins Neuron_0_1/SYN_OUT_VALID] [get_bd_pins Neuron_1_0/SYN_1_VALID]


connect_bd_net [get_bd_pins Neuron_0_1/SYN_OUT] [get_bd_pins Neuron_1_1/SYN_1_DIN]
connect_bd_net [get_bd_pins Neuron_0_1/SYN_OUT_VALID] [get_bd_pins Neuron_1_1/SYN_1_VALID]


connect_bd_net [get_bd_pins Neuron_0_1/SYN_OUT] [get_bd_pins Neuron_1_2/SYN_1_DIN]
connect_bd_net [get_bd_pins Neuron_0_1/SYN_OUT_VALID] [get_bd_pins Neuron_1_2/SYN_1_VALID]


connect_bd_net [get_bd_pins Neuron_0_1/SYN_OUT] [get_bd_pins Neuron_1_3/SYN_1_DIN]
connect_bd_net [get_bd_pins Neuron_0_1/SYN_OUT_VALID] [get_bd_pins Neuron_1_3/SYN_1_VALID]


connect_bd_net [get_bd_pins Neuron_0_1/SYN_OUT] [get_bd_pins Neuron_1_4/SYN_1_DIN]
connect_bd_net [get_bd_pins Neuron_0_1/SYN_OUT_VALID] [get_bd_pins Neuron_1_4/SYN_1_VALID]


connect_bd_net [get_bd_pins Neuron_0_2/SYN_OUT] [get_bd_pins Neuron_1_0/SYN_2_DIN]
connect_bd_net [get_bd_pins Neuron_0_2/SYN_OUT_VALID] [get_bd_pins Neuron_1_0/SYN_2_VALID]


connect_bd_net [get_bd_pins Neuron_0_2/SYN_OUT] [get_bd_pins Neuron_1_1/SYN_2_DIN]
connect_bd_net [get_bd_pins Neuron_0_2/SYN_OUT_VALID] [get_bd_pins Neuron_1_1/SYN_2_VALID]


connect_bd_net [get_bd_pins Neuron_0_2/SYN_OUT] [get_bd_pins Neuron_1_2/SYN_2_DIN]
connect_bd_net [get_bd_pins Neuron_0_2/SYN_OUT_VALID] [get_bd_pins Neuron_1_2/SYN_2_VALID]


connect_bd_net [get_bd_pins Neuron_0_2/SYN_OUT] [get_bd_pins Neuron_1_3/SYN_2_DIN]
connect_bd_net [get_bd_pins Neuron_0_2/SYN_OUT_VALID] [get_bd_pins Neuron_1_3/SYN_2_VALID]


connect_bd_net [get_bd_pins Neuron_0_2/SYN_OUT] [get_bd_pins Neuron_1_4/SYN_2_DIN]
connect_bd_net [get_bd_pins Neuron_0_2/SYN_OUT_VALID] [get_bd_pins Neuron_1_4/SYN_2_VALID]


connect_bd_net [get_bd_pins Neuron_0_3/SYN_OUT] [get_bd_pins Neuron_1_0/SYN_3_DIN]
connect_bd_net [get_bd_pins Neuron_0_3/SYN_OUT_VALID] [get_bd_pins Neuron_1_0/SYN_3_VALID]


connect_bd_net [get_bd_pins Neuron_0_3/SYN_OUT] [get_bd_pins Neuron_1_1/SYN_3_DIN]
connect_bd_net [get_bd_pins Neuron_0_3/SYN_OUT_VALID] [get_bd_pins Neuron_1_1/SYN_3_VALID]


connect_bd_net [get_bd_pins Neuron_0_3/SYN_OUT] [get_bd_pins Neuron_1_2/SYN_3_DIN]
connect_bd_net [get_bd_pins Neuron_0_3/SYN_OUT_VALID] [get_bd_pins Neuron_1_2/SYN_3_VALID]


connect_bd_net [get_bd_pins Neuron_0_3/SYN_OUT] [get_bd_pins Neuron_1_3/SYN_3_DIN]
connect_bd_net [get_bd_pins Neuron_0_3/SYN_OUT_VALID] [get_bd_pins Neuron_1_3/SYN_3_VALID]


connect_bd_net [get_bd_pins Neuron_0_3/SYN_OUT] [get_bd_pins Neuron_1_4/SYN_3_DIN]
connect_bd_net [get_bd_pins Neuron_0_3/SYN_OUT_VALID] [get_bd_pins Neuron_1_4/SYN_3_VALID]


connect_bd_net [get_bd_pins Neuron_0_4/SYN_OUT] [get_bd_pins Neuron_1_0/SYN_4_DIN]
connect_bd_net [get_bd_pins Neuron_0_4/SYN_OUT_VALID] [get_bd_pins Neuron_1_0/SYN_4_VALID]


connect_bd_net [get_bd_pins Neuron_0_4/SYN_OUT] [get_bd_pins Neuron_1_1/SYN_4_DIN]
connect_bd_net [get_bd_pins Neuron_0_4/SYN_OUT_VALID] [get_bd_pins Neuron_1_1/SYN_4_VALID]


connect_bd_net [get_bd_pins Neuron_0_4/SYN_OUT] [get_bd_pins Neuron_1_2/SYN_4_DIN]
connect_bd_net [get_bd_pins Neuron_0_4/SYN_OUT_VALID] [get_bd_pins Neuron_1_2/SYN_4_VALID]


connect_bd_net [get_bd_pins Neuron_0_4/SYN_OUT] [get_bd_pins Neuron_1_3/SYN_4_DIN]
connect_bd_net [get_bd_pins Neuron_0_4/SYN_OUT_VALID] [get_bd_pins Neuron_1_3/SYN_4_VALID]


connect_bd_net [get_bd_pins Neuron_0_4/SYN_OUT] [get_bd_pins Neuron_1_4/SYN_4_DIN]
connect_bd_net [get_bd_pins Neuron_0_4/SYN_OUT_VALID] [get_bd_pins Neuron_1_4/SYN_4_VALID]


connect_bd_net [get_bd_pins Neuron_1_0/SYN_OUT_VALID] [get_bd_pins SynOutValidConcat/In0]
connect_bd_net [get_bd_pins Neuron_1_0/SYN_OUT] [get_bd_pins SynOutConcat/In0]


connect_bd_net [get_bd_pins Neuron_1_1/SYN_OUT_VALID] [get_bd_pins SynOutValidConcat/In1]
connect_bd_net [get_bd_pins Neuron_1_1/SYN_OUT] [get_bd_pins SynOutConcat/In1]


connect_bd_net [get_bd_pins Neuron_1_2/SYN_OUT_VALID] [get_bd_pins SynOutValidConcat/In2]
connect_bd_net [get_bd_pins Neuron_1_2/SYN_OUT] [get_bd_pins SynOutConcat/In2]


connect_bd_net [get_bd_pins Neuron_1_3/SYN_OUT_VALID] [get_bd_pins SynOutValidConcat/In3]
connect_bd_net [get_bd_pins Neuron_1_3/SYN_OUT] [get_bd_pins SynOutConcat/In3]


connect_bd_net [get_bd_pins Neuron_1_4/SYN_OUT_VALID] [get_bd_pins SynOutValidConcat/In4]
connect_bd_net [get_bd_pins Neuron_1_4/SYN_OUT] [get_bd_pins SynOutConcat/In4]


regenerate_bd_layout

