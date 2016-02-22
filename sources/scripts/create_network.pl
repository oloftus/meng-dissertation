use strict;
use warnings;

##########################

my $NUM_LAYERS = 2;
my $NEURONS_PER_LAYER = 2;

my $SYNAPSE_INTEGER_PRECISION = 8;
my $SYNAPSE_FRACTION_PRECISION = 8;

my $PKT_TYPE_WIDTH = 1;
my $PKT_LAYER_WIDTH = 5;
my $PKT_NEURON_WIDTH = 6;
my $PKT_SYNAPSE_WIDTH = 4;

my $STIMULUS_TYPE = 1;
my $WEIGHT_TYPE = 0;

##########################

my $synapsePrecision = $SYNAPSE_INTEGER_PRECISION + $SYNAPSE_FRACTION_PRECISION;
my $signedSynapsePortWidth = 1 + $synapsePrecision; # Sign bit
my $signedSynapsePortHigh = $signedSynapsePortWidth - 1;
my $layerOutPacketWidth $PKT_NEURON_WIDTH + $PKT_SYNAPSE_WIDTH + $synapsePrecision;
my $typeOutPacketWidth = $PKT_LAYER_WIDTH + layerOutPacketWidth;
my $packetWidth = $PKT_TYPE_WIDTH + $typeOutPacketWidth;
my $packetHigh = $packetWidth - 1;
my $pktStimulusWidth = $packetWidth - $synapsePrecision;

open my $fh, ">", "script.tcl";

print $fh <<CMD;

create_bd_port -dir I -type clk CLK
create_bd_port -dir I -type rst RST
create_bd_port -dir I -from $packetHigh -to 0 -type data PKT_IN
create_bd_port -dir I PKT_IN_VALID
create_bd_port -dir O DONE_OUT

CMD

foreach my $id (0..$NEURONS_PER_LAYER - 1) {
print $fh <<CMD;

create_bd_port -dir O -from $signedSynapsePortHigh -to 0 -type data SYN_${id}_OUT
create_bd_port -dir O SYN_${id}_OUT_VALID

CMD
}

print $fh <<CMD;

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

CMD

foreach my $lid (0..$NUM_LAYERS - 1) {
print $fh <<CMD;

create_bd_cell -type ip -vlnv oloftus.com:prif:ValueRouter:4.0 LayerRouter_${lid}
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 LayerRouter_${lid}_Address
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 DoneOut_Layer_${lid}
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 DoneOutConcat_Layer_${lid}

CMD

foreach my $nid (0..$NEURONS_PER_LAYER - 1) {
print $fh <<CMD;

create_bd_cell -type ip -vlnv xilinx.com:ip:Neuron_wrapper:1.0 Neuron_${lid}_${nid}
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Neuron_${lid}_${nid}_Address

CMD
}}

foreach my $id (0..$NEURONS_PER_LAYER - 1) {
print $fh <<CMD;

create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 StimulusRegister_${id}

CMD
}

print $fh <<CMD;

set_property -dict [list CONFIG.packetOutWidth {${typeOutPacketWidth}} CONFIG.packetInWidth {${packetWidth}}] [get_bd_cells TypeRouter_Stimulus]
set_property -dict [list CONFIG.CONST_VAL {${STIMULUS_TYPE}}] [get_bd_cells TypeRouter_Stimulus_Address]
set_property -dict [list CONFIG.packetOutWidth {${typeOutPacketWidth}} CONFIG.packetInWidth {${packetWidth}}] [get_bd_cells TypeRouter_Weight]
set_property -dict [list CONFIG.CONST_VAL {$WEIGHT_TYPE}] [get_bd_cells TypeRouter_Weight_Address]
set_property -dict [list CONFIG.n {${NUM_LAYERS}}] [get_bd_cells DoneOut_Layers]
set_property -dict [list CONFIG.n {${NEURONS_PER_LAYER}}] [get_bd_cells DoneOut_StimulusRegisters]
set_property -dict [list CONFIG.n {2}] [get_bd_cells DoneOut]

CMD

foreach my $lid (0..$NUM_LAYERS - 1) {
print $fh <<CMD;

set_property -dict [list CONFIG.packetOutWidth {${layerOutPacketWidth}} CONFIG.packetInWidth {${typeOutPacketWidth}}] [get_bd_cells LayerRouter_${lid}]
set_property -dict [list CONFIG.CONST_WIDTH {${PKT_LAYER_WIDTH}} CONFIG.CONST_VAL {${lid}}] [get_bd_cells LayerRouter_${lid}_Address]
set_property -dict [list CONFIG.n {${NUM_LAYERS}}] [get_bd_cells DoneOut_Layer_${lid}]

CMD

foreach my $nid (0..$NEURONS_PER_LAYER - 1) {
print $fh <<CMD;

set_property -dict [list CONFIG.CONST_WIDTH {${PKT_NEURON_WIDTH}} CONFIG.CONST_VAL {${nid}}] [get_bd_cells Neuron_${lid}_${nid}_Address]

CMD
}}


foreach my $id (0..$NEURONS_PER_LAYER - 1) {
print $fh <<CMD;

set_property -dict [list CONFIG.address {${id}} CONFIG.addressWidth {${pktStimulusWidth}} CONFIG.dataWidth {${synapsePrecision}}] [get_bd_cells StimulusRegister_${id}]

CMD
}

print $fh <<CMD;

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

CMD

foreach my $id (0..$NEURONS_PER_LAYER - 1) {
print $fh <<CMD;

connect_bd_net [get_bd_ports CLK] [get_bd_pins StimulusRegister_${id}/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins StimulusRegister_${id}/RST]
connect_bd_net [get_bd_pins TypeRouter_Stimulus/PKT_OUT] [get_bd_pins StimulusRegister_${id}/PKT_IN]
connect_bd_net [get_bd_pins TypeRouter_Stimulus/PKT_OUT_VALID] [get_bd_pins StimulusRegister_${id}/PKT_IN_VALID]
connect_bd_net [get_bd_pins StimulusRegister_${id}/DONE_OUT] [get_bd_pins DoneOutConcat_StimulusRegisters/In${id}]

CMD
}

foreach my $lid (0..$NUM_LAYERS - 1) {
print $fh <<CMD;

connect_bd_net [get_bd_pins TypeRouter_Weight/PKT_OUT_VALID] [get_bd_pins LayerRouter_${lid}/PKT_IN_VALID]
connect_bd_net [get_bd_pins TypeRouter_Weight/PKT_OUT] [get_bd_pins LayerRouter_${lid}/PKT_IN]
connect_bd_net [get_bd_ports CLK] [get_bd_pins LayerRouter_${lid}/CLK]
connect_bd_net [get_bd_pins DoneOutConcat_Layer_${lid}/dout] [get_bd_pins DoneOut_Layer_${lid}/DIN]
connect_bd_net [get_bd_pins DoneOut_Layer_${lid}/DOUT] [get_bd_pins LayerRouter_${lid}/DONE_IN]
connect_bd_net [get_bd_pins LayerRouter_${lid}_Address/dout] [get_bd_pins LayerRouter_${lid}/ADDR]
connect_bd_net [get_bd_pins LayerRouter_${lid}/DONE_OUT] [get_bd_pins DoneOutConcat_Layers/In${lid}]

CMD

foreach my $nid (0..$NEURONS_PER_LAYER - 1) {
print $fh <<CMD;

connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_${lid}_${nid}/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_${lid}_${nid}/RST]
connect_bd_net [get_bd_pins Neuron_${lid}_${nid}_Address/dout] [get_bd_pins Neuron_${lid}_${nid}/NEURON_ADDR]
connect_bd_net [get_bd_pins LayerRouter_${lid}/PKT_OUT] [get_bd_pins Neuron_${lid}_${nid}/PKT_IN]
connect_bd_net [get_bd_pins LayerRouter_${lid}/PKT_OUT_VALID] [get_bd_pins Neuron_${lid}_${nid}/PKT_IN_VALID]
connect_bd_net [get_bd_pins Neuron_${lid}_${nid}/DONE_OUT] [get_bd_pins DoneOutConcat_Layer_${lid}/In${nid}]

CMD
}}

foreach my $nid1 (0..$NEURONS_PER_LAYER - 1) {
foreach my $nid2 (0..$NEURONS_PER_LAYER - 1) {
print $fh <<CMD;

connect_bd_net [get_bd_pins StimulusRegister_${nid1}/VAL_OUT] [get_bd_pins Neuron_0_${nid2}/SYN_${nid1}_DIN]
connect_bd_net [get_bd_pins StimulusRegister_${nid1}/VAL_OUT_VALID] [get_bd_pins Neuron_0_${nid2}/SYN_${nid1}_VALID]

CMD
}}

foreach my $lid (0..$NUM_LAYERS - 2) {
foreach my $nid1 (0..$NEURONS_PER_LAYER - 1) {
foreach my $nid2 (0..$NEURONS_PER_LAYER - 1) {
print $fh <<CMD;

connect_bd_net [get_bd_pins Neuron_${lid}_${nid1}/SYN_OUT] [get_bd_pins Neuron_@{[$lid + 1]}_${nid2}/SYN_${nid1}_DIN]
connect_bd_net [get_bd_pins Neuron_${lid}_${nid1}/SYN_OUT_VALID] [get_bd_pins Neuron_@{[$lid + 1]}_${nid2}/SYN_${nid1}_VALID]

CMD
}}}

foreach my $nid (0..$NEURONS_PER_LAYER - 1) {
print $fh <<CMD;

connect_bd_net [get_bd_pins Neuron_@{[$NUM_LAYERS - 1]}_${nid}/SYN_OUT] [get_bd_ports SYN_${nid}_OUT]
connect_bd_net [get_bd_pins Neuron_@{[$NUM_LAYERS - 1]}_${nid}/SYN_OUT_VALID] [get_bd_ports SYN_${nid}_OUT_VALID]

CMD
}

print $fh <<CMD;

regenerate_bd_layout

CMD
