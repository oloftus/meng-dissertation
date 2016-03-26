#!/usr/bin/perl

use strict;
use warnings;

require "params.pl";

our $NUM_LAYERS;
our $NEURONS_PER_LAYER;
our $NUM_INPUTS;
our $VAL_INTEGER_PRECISION;
our $VAL_FRACTION_PRECISION;
our $WEIGHT_INTEGER_PRECISION;
our $WEIGHT_FRACTION_PRECISION;
our $PKT_TYPE_ADDR_WIDTH;
our $PKT_LAYER_ADDR_WIDTH;
our $PKT_NEURON_ADDR_WIDTH;
our $PKT_SYNAPSE_ADDR_WIDTH;
our $PKT_STIMULUS_REG_ADDR_WIDTH;
our $STIMULUS_TYPE;
our $WEIGHT_TYPE;
our $NEURON_LATENCY;
our $AXI_BUS_WIDTH;
our $HAS_SWRN;
our $WEIGHTS;

our $valueWidth;
our $weightWidth;
our $layerOutPacketWidth;
our $weightTypeOutPacketWidth;
our $stimulusTypeOutPacketWidth;
our $pktStimulusTypeAddrWidth;
our $pktWeightTypeAddrWidth;
our $largestPacketWidth;
our $transferWidth;

if (not $HAS_SWRN) {
  require "weights.pl";
}

open my $fh, ">", "create_network.tcl";

# Create static ports
print $fh <<CMD;

create_bd_port -dir I -type clk CLK
create_bd_port -dir I -type rst RST
create_bd_port -dir I -from @{[$AXI_BUS_WIDTH - 1]} -to 0 -type data PKT_IN
create_bd_port -dir I PKT_IN_VALID
create_bd_port -dir I NXT_SYN_OUT
create_bd_port -dir O DONE_OUT
create_bd_port -dir O -from @{[$AXI_BUS_WIDTH - 1]} -to 0 -type data SYN_OUTS
create_bd_port -dir O SYN_OUTS_READY

CMD

# Create static components
print $fh <<CMD;

create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 PacketInSlicer
create_bd_cell -type ip -vlnv oloftus.com:prif:ValueRouter:1.0 TypeRouter_Stimulus
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 TypeRouter_Stimulus_Address
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 PktRcvd_StimulusRegisters
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 PktRcvdConcat_StimulusRegisters
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 SynOutConcat
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 SynOutValidConcat
create_bd_cell -type ip -vlnv oloftus.com:prif:SynOutBuffer:1.0 SynOutBuffer

CMD

if ($HAS_SWRN) {
print $fh <<CMD;

create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 PktRcvd
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 PktRcvdConcat
create_bd_cell -type ip -vlnv oloftus.com:prif:ValueRouter:1.0 TypeRouter_Weight
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 TypeRouter_Weight_Address
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 PktRcvd_Layers
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 PktRcvdConcat_Layers

CMD
}

# Create each layer
foreach my $lid (0..$NUM_LAYERS - 1) {
if ($HAS_SWRN) {
print $fh <<CMD;

create_bd_cell -type ip -vlnv oloftus.com:prif:ValueRouter:1.0 LayerRouter_${lid}
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 LayerRouter_${lid}_Address
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 PktRcvd_Layer_${lid}
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 PktRcvdConcat_Layer_${lid}

CMD
}

# Create each neuron per layer. The first layer is different
foreach my $nid (0..$NEURONS_PER_LAYER - 1) {
if ($HAS_SWRN) {
print $fh <<CMD;

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Neuron_${lid}_${nid}_Address

CMD
}
else {
print $fh <<CMD;

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Neuron_${lid}_${nid}_Bias

CMD

foreach my $sid (0..($lid == 0 ? $NUM_INPUTS : $NEURONS_PER_LAYER) - 1) {
print $fh <<CMD;

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Synapse_${lid}_${nid}_${sid}_Weight

CMD
}}

print $fh <<CMD;

create_bd_cell -type ip -vlnv oloftus.com:prif:@{[$lid == 0 ? "InputNeuron" : "HiddenNeuron"]}:1.0 Neuron_${lid}_${nid}

CMD
}}

# Create a StimulusRegister for each input
foreach my $id (0..$NUM_INPUTS - 1) {
print $fh <<CMD;

create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 StimulusRegister_${id}

CMD
}

my $synOutConcatInputs = [];
for my $id (0..$NEURONS_PER_LAYER - 1) { push $synOutConcatInputs, "CONFIG.IN${id}_WIDTH {$transferWidth}" };

# Configure static components
if ($HAS_SWRN) {
print $fh <<CMD;

set_property -dict [list CONFIG.packetOutWidth {${weightTypeOutPacketWidth}} CONFIG.packetInWidth {${largestPacketWidth}}] [get_bd_cells TypeRouter_Weight]
set_property -dict [list CONFIG.CONST_WIDTH {${pktWeightTypeAddrWidth}} CONFIG.CONST_VAL {@{[$WEIGHT_TYPE << ($pktWeightTypeAddrWidth - $PKT_TYPE_ADDR_WIDTH)]}}] [get_bd_cells TypeRouter_Weight_Address]
set_property -dict [list CONFIG.n {${NUM_LAYERS}}] [get_bd_cells PktRcvd_Layers]
set_property -dict [list CONFIG.NUM_PORTS {${NUM_LAYERS}}] [get_bd_cells PktRcvdConcat_Layers]
set_property -dict [list CONFIG.n {2}] [get_bd_cells PktRcvd]

CMD
}

print $fh <<CMD;

set_property -dict [list CONFIG.DIN_WIDTH {32} CONFIG.DIN_TO {0} CONFIG.DIN_FROM {@{[$largestPacketWidth - 1]}}] [get_bd_cells PacketInSlicer]
set_property -dict [list CONFIG.packetOutWidth {${stimulusTypeOutPacketWidth}} CONFIG.packetInWidth {${largestPacketWidth}}] [get_bd_cells TypeRouter_Stimulus]
set_property -dict [list CONFIG.CONST_WIDTH {${pktStimulusTypeAddrWidth}} CONFIG.CONST_VAL {@{[$STIMULUS_TYPE << ($pktStimulusTypeAddrWidth - $PKT_TYPE_ADDR_WIDTH)]}}] [get_bd_cells TypeRouter_Stimulus_Address]
set_property -dict [list CONFIG.n {${NUM_INPUTS}}] [get_bd_cells PktRcvd_StimulusRegisters]
set_property -dict [list CONFIG.NUM_PORTS {${NUM_INPUTS}}] [get_bd_cells PktRcvdConcat_StimulusRegisters]
set_property -dict [list CONFIG.NUM_PORTS {${NEURONS_PER_LAYER}}] [get_bd_cells SynOutValidConcat]
set_property -dict [list CONFIG.NUM_PORTS {${NEURONS_PER_LAYER}} @$synOutConcatInputs] [get_bd_cells SynOutConcat]
set_property -dict [list CONFIG.numInputs {${NEURONS_PER_LAYER}} CONFIG.dinWidth {$transferWidth} CONFIG.doutWidth {@{[$AXI_BUS_WIDTH]}}] [get_bd_cells SynOutBuffer]

CMD

# Configure each layer
foreach my $lid (0..$NUM_LAYERS - 1) {
if ($HAS_SWRN) {
print $fh <<CMD;

set_property -dict [list CONFIG.packetOutWidth {${layerOutPacketWidth}} CONFIG.packetInWidth {${weightTypeOutPacketWidth}}] [get_bd_cells LayerRouter_${lid}]
set_property -dict [list CONFIG.CONST_WIDTH {${PKT_LAYER_ADDR_WIDTH}} CONFIG.CONST_VAL {${lid}}] [get_bd_cells LayerRouter_${lid}_Address]
set_property -dict [list CONFIG.n {${NEURONS_PER_LAYER}}] [get_bd_cells PktRcvd_Layer_${lid}]
set_property -dict [list CONFIG.NUM_PORTS {${NEURONS_PER_LAYER}}] [get_bd_cells PktRcvdConcat_Layer_${lid}]

CMD
}

# Configure each neuron per layer
foreach my $nid (0..$NEURONS_PER_LAYER - 1) {
if ($HAS_SWRN) {
print $fh <<CMD;

set_property -dict [list CONFIG.CONST_WIDTH {${PKT_NEURON_ADDR_WIDTH}} CONFIG.CONST_VAL {${nid}}] [get_bd_cells Neuron_${lid}_${nid}_Address]

CMD
}
else {
print $fh <<CMD;

set_property -dict [list CONFIG.CONST_WIDTH {${valueWidth}} CONFIG.CONST_VAL {@{[$WEIGHTS->[$lid]->[0]->[$nid]]}}] [get_bd_cells Neuron_${lid}_${nid}_Bias]

CMD

foreach my $sid (0..($lid == 0 ? $NUM_INPUTS : $NEURONS_PER_LAYER) - 1) {
print $fh <<CMD;

set_property -dict [list CONFIG.CONST_WIDTH {${weightWidth}} CONFIG.CONST_VAL {@{[$WEIGHTS->[$lid]->[1]->[$nid]->[$sid]]}}] [get_bd_cells Synapse_${lid}_${nid}_${sid}_Weight]

CMD
}}}}

# Create each StimulusRegister
foreach my $id (0..$NUM_INPUTS - 1) {
print $fh <<CMD;

set_property -dict [list CONFIG.address {${id}} CONFIG.addressWidth {${PKT_STIMULUS_REG_ADDR_WIDTH}} CONFIG.dataWidth {${transferWidth}}] [get_bd_cells StimulusRegister_${id}]

CMD
}

# Wire up static components
if ($HAS_SWRN) {
print $fh <<CMD;

connect_bd_net [get_bd_ports CLK] [get_bd_pins TypeRouter_Weight/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins TypeRouter_Weight/RST]
connect_bd_net [get_bd_ports PKT_IN_VALID] [get_bd_pins TypeRouter_Weight/PKT_IN_VALID]
connect_bd_net [get_bd_pins PacketInSlicer/Dout] [get_bd_pins TypeRouter_Weight/PKT_IN]
connect_bd_net [get_bd_pins TypeRouter_Weight/DONE_IN] [get_bd_pins PktRcvd_Layers/DOUT]
connect_bd_net [get_bd_pins TypeRouter_Weight/DONE_OUT] [get_bd_pins PktRcvdConcat/In0]
connect_bd_net [get_bd_pins TypeRouter_Weight_Address/dout] [get_bd_pins TypeRouter_Weight/ADDR]
connect_bd_net [get_bd_pins PktRcvdConcat/dout] [get_bd_pins PktRcvd/DIN]
connect_bd_net [get_bd_pins PktRcvdConcat_Layers/dout] [get_bd_pins PktRcvd_Layers/DIN]

CMD
}

if ($HAS_SWRN) {
print $fh <<CMD;

connect_bd_net [get_bd_pins TypeRouter_Stimulus/DONE_OUT] [get_bd_pins PktRcvdConcat/In1]
connect_bd_net [get_bd_pins PktRcvd/DOUT] [get_bd_ports DONE_OUT]

CMD
}
else {
print $fh <<CMD;

connect_bd_net [get_bd_pins TypeRouter_Stimulus/DONE_OUT] [get_bd_ports DONE_OUT]

CMD
}

print $fh <<CMD;

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

CMD

# Wire up each StimulusRegister to static components
foreach my $id (0..$NUM_INPUTS - 1) {
print $fh <<CMD;

connect_bd_net [get_bd_ports CLK] [get_bd_pins StimulusRegister_${id}/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins StimulusRegister_${id}/RST]
connect_bd_net [get_bd_pins TypeRouter_Stimulus/PKT_OUT] [get_bd_pins StimulusRegister_${id}/PKT_IN]
connect_bd_net [get_bd_pins TypeRouter_Stimulus/PKT_OUT_VALID] [get_bd_pins StimulusRegister_${id}/PKT_IN_VALID]

CMD
}

# Wire up input StimulusRegister's
foreach my $id (0..$NUM_INPUTS - 1) {
print $fh <<CMD;

connect_bd_net [get_bd_pins StimulusRegister_${id}/DONE_OUT] [get_bd_pins PktRcvdConcat_StimulusRegisters/In${id}]

CMD
}

# Wire up each layer to static components
foreach my $lid (0..$NUM_LAYERS - 1) {
if ($HAS_SWRN) {
print $fh <<CMD;

connect_bd_net [get_bd_pins TypeRouter_Weight/PKT_OUT_VALID] [get_bd_pins LayerRouter_${lid}/PKT_IN_VALID]
connect_bd_net [get_bd_pins TypeRouter_Weight/PKT_OUT] [get_bd_pins LayerRouter_${lid}/PKT_IN]
connect_bd_net [get_bd_ports CLK] [get_bd_pins LayerRouter_${lid}/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins LayerRouter_${lid}/RST]
connect_bd_net [get_bd_pins PktRcvdConcat_Layer_${lid}/dout] [get_bd_pins PktRcvd_Layer_${lid}/DIN]
connect_bd_net [get_bd_pins PktRcvd_Layer_${lid}/DOUT] [get_bd_pins LayerRouter_${lid}/DONE_IN]
connect_bd_net [get_bd_pins LayerRouter_${lid}_Address/dout] [get_bd_pins LayerRouter_${lid}/ADDR]
connect_bd_net [get_bd_pins LayerRouter_${lid}/DONE_OUT] [get_bd_pins PktRcvdConcat_Layers/In${lid}]

CMD
}

# Wire up each neuron per layer to static components
foreach my $nid (0..$NEURONS_PER_LAYER - 1) {
if ($HAS_SWRN) {
print $fh <<CMD;

connect_bd_net [get_bd_pins Neuron_${lid}_${nid}_Address/dout] [get_bd_pins Neuron_${lid}_${nid}/NEURON_ADDR]
connect_bd_net [get_bd_pins LayerRouter_${lid}/PKT_OUT] [get_bd_pins Neuron_${lid}_${nid}/PKT_IN]
connect_bd_net [get_bd_pins LayerRouter_${lid}/PKT_OUT_VALID] [get_bd_pins Neuron_${lid}_${nid}/PKT_IN_VALID]
connect_bd_net [get_bd_pins Neuron_${lid}_${nid}/DONE_OUT] [get_bd_pins PktRcvdConcat_Layer_${lid}/In${nid}]

CMD
}
else {
print $fh <<CMD;

connect_bd_net  [get_bd_pins Neuron_${lid}_${nid}_Bias/dout] [get_bd_pins Neuron_${lid}_${nid}/BIAS_VAL]

CMD

foreach my $sid (0..($lid == 0 ? $NUM_INPUTS : $NEURONS_PER_LAYER) - 1) {
print $fh <<CMD;

connect_bd_net  [get_bd_pins Synapse_${lid}_${nid}_${sid}_Weight/dout] [get_bd_pins Neuron_${lid}_${nid}/SYN_${sid}_WEIGHT]

CMD
}}

print $fh <<CMD;

connect_bd_net [get_bd_ports CLK] [get_bd_pins Neuron_${lid}_${nid}/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Neuron_${lid}_${nid}/RST]

CMD
}}

# Wire up each neuron in the first layer to network inputs
foreach my $iid (0..$NUM_INPUTS - 1) {
foreach my $nid (0..$NEURONS_PER_LAYER - 1) {
print $fh <<CMD;

connect_bd_net [get_bd_pins StimulusRegister_${iid}/VAL_OUT] [get_bd_pins Neuron_0_${nid}/SYN_${iid}_DIN]
connect_bd_net [get_bd_pins StimulusRegister_${iid}/VAL_OUT_VALID] [get_bd_pins Neuron_0_${nid}/SYN_${iid}_VALID]

CMD
}}

# Wire up interconnections between hidden layers of the network
foreach my $lid (0..$NUM_LAYERS - 2) {
foreach my $nid1 (0..$NEURONS_PER_LAYER - 1) {
foreach my $nid2 (0..$NEURONS_PER_LAYER - 1) {
print $fh <<CMD;

connect_bd_net [get_bd_pins Neuron_${lid}_${nid1}/SYN_OUT] [get_bd_pins Neuron_@{[$lid + 1]}_${nid2}/SYN_${nid1}_DIN]
connect_bd_net [get_bd_pins Neuron_${lid}_${nid1}/SYN_OUT_VALID] [get_bd_pins Neuron_@{[$lid + 1]}_${nid2}/SYN_${nid1}_VALID]

CMD
}}}

# Wire up each neuron in the last layer to network outputs
foreach my $nid (0..$NEURONS_PER_LAYER - 1) {
print $fh <<CMD;

connect_bd_net [get_bd_pins Neuron_@{[$NUM_LAYERS - 1]}_${nid}/SYN_OUT_VALID] [get_bd_pins SynOutValidConcat/In${nid}]
connect_bd_net [get_bd_pins Neuron_@{[$NUM_LAYERS - 1]}_${nid}/SYN_OUT] [get_bd_pins SynOutConcat/In${nid}]

CMD
}

# Regenerate layout
print $fh <<CMD;

regenerate_bd_layout

CMD
