#!/usr/bin/perl

use strict;
use warnings;

require "params.pl";

our $NEURONS_PER_LAYER;
our $NUM_LAYERS;
our $INTEGER_PRECISION;
our $FRACTION_PRECISION;
our $AXI_BUS_WIDTH;
our $PKT_TYPE_ADDR_WIDTH;
our $PKT_LAYER_ADDR_WIDTH;
our $PKT_NEURON_ADDR_WIDTH;
our $PKT_SYNAPSE_ADDR_WIDTH;
our $STIMULUS_TYPE;
our $WEIGHT_TYPE;

our $valueWidth;
our $neuronOutPacketWidth;
our $layerOutPacketWidth;
our $neuronLatency;

open my $fh, ">", "create_neuron.tcl";

# Create static ports
print $fh <<CMD;

create_bd_port -dir I -type clk CLK
create_bd_port -dir I -type rst RST
create_bd_port -dir I PKT_IN_VALID
create_bd_port -dir I -from @{[$layerOutPacketWidth - 1]} -to 0 -type data PKT_IN
create_bd_port -dir I -from @{[$PKT_NEURON_ADDR_WIDTH - 1]} -to 0 -type data NEURON_ADDR
create_bd_port -dir O -from @{[$valueWidth - 1]} -to 0 -type data SYN_OUT
create_bd_port -dir O SYN_OUT_VALID
create_bd_port -dir O DONE_OUT

CMD

# Create input ports for each synapse
foreach my $id (0..$NEURONS_PER_LAYER - 1) {
print $fh <<CMD;

create_bd_port -dir I SYN_${id}_VALID
create_bd_port -dir I -from @{[$valueWidth - 1]} -to 0 -type data SYN_${id}_DIN

CMD
}

# Create static components
print $fh <<CMD;
create_bd_cell -type ip -vlnv oloftus.com:prif:ValueRouter:5.0 NeuronRouter
create_bd_cell -type ip -vlnv oloftus.com:prif:AndN:1.0 MultiplierEnable
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 MultiplierEnableConcat
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 DoneOut
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 DoneOutConcat
create_bd_cell -type ip -vlnv oloftus.com:prif:SumJunction:1.0 SumJunction
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 SumJunctionConcat
create_bd_cell -type ip -vlnv oloftus.com:prif:ValidSetter:1.0 ValidSetter
create_bd_cell -type ip -vlnv oloftus.com:prif:Plan:1.0 Plan
CMD

# Create synapses
foreach my $id (0..$NEURONS_PER_LAYER - 1) {
print $fh <<CMD;

create_bd_cell -type ip -vlnv oloftus.com:prif:Synapse:1.0 Synapse_${id}
create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:2.0 WeightRegister_${id}
create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 MultiplierSlicer_${id}

create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 Multiplier_${id}
create_bd_cell -type ip -vlnv oloftus.com:prif:Complements1To2:1.0 Multiplier_${id}_Complements1To2
create_bd_cell -type ip -vlnv oloftus.com:prif:Complements2To1:1.0 Multiplier_${id}_Complements2To1_0
create_bd_cell -type ip -vlnv oloftus.com:prif:Complements2To1:1.0 Multiplier_${id}_Complements2To1_1
create_bd_cell -type ip -vlnv oloftus.com:prif:Xor2:1.0 Multiplier_${id}_Xor2

CMD
}

# Configure (semi-) static components
my $sumJunctionConcatInputs = [];
for my $id (0..$NEURONS_PER_LAYER - 1) { push $sumJunctionConcatInputs, "CONFIG.IN${id}_WIDTH {$valueWidth}" };

print $fh <<CMD;

set_property -dict [list CONFIG.packetInWidth {$layerOutPacketWidth} CONFIG.packetOutWidth {$neuronOutPacketWidth}] [get_bd_cells NeuronRouter]
set_property -dict [list CONFIG.latency {$neuronLatency}] [get_bd_cells ValidSetter]
set_property -dict [list CONFIG.inputWidth {$valueWidth}] [get_bd_cells SumJunction]
set_property -dict [list CONFIG.numInputs {$NEURONS_PER_LAYER}] [get_bd_cells SumJunction]
set_property -dict [list CONFIG.integerPrecision {$INTEGER_PRECISION} CONFIG.fractionPrecision {$FRACTION_PRECISION}] [get_bd_cells Plan]
set_property -dict [list CONFIG.n {$NEURONS_PER_LAYER}] [get_bd_cells MultiplierEnable]
set_property -dict [list CONFIG.NUM_PORTS {$NEURONS_PER_LAYER}] [get_bd_cells MultiplierEnableConcat]
set_property -dict [list CONFIG.n {$NEURONS_PER_LAYER}] [get_bd_cells DoneOut]
set_property -dict [list CONFIG.NUM_PORTS {$NEURONS_PER_LAYER}] [get_bd_cells DoneOutConcat]
set_property -dict [list CONFIG.NUM_PORTS {$NEURONS_PER_LAYER} @$sumJunctionConcatInputs] [get_bd_cells SumJunctionConcat]

CMD

# Configure neurons
foreach my $id (0..$NEURONS_PER_LAYER - 1) {
print $fh <<CMD;

set_property -dict [list CONFIG.size {$valueWidth}] [get_bd_cells Synapse_${id}]
set_property -dict [list CONFIG.address {${id}} CONFIG.addressWidth {$PKT_SYNAPSE_ADDR_WIDTH} CONFIG.dataWidth {$valueWidth}] [get_bd_cells WeightRegister_${id}]
set_property -dict [list CONFIG.DIN_FROM {@{[$FRACTION_PRECISION + $valueWidth - 1]}} CONFIG.DIN_TO {${FRACTION_PRECISION}}] [get_bd_cells MultiplierSlicer_${id}]

set_property -dict [list CONFIG.PortAWidth.VALUE_SRC USER CONFIG.PortBWidth.VALUE_SRC USER CONFIG.PortAWidth {$valueWidth} CONFIG.PortBWidth {$valueWidth} CONFIG.PortAType.VALUE_SRC USER CONFIG.PortBType.VALUE_SRC USER CONFIG.PortAType {Signed} CONFIG.PortBType {Signed} CONFIG.ClockEnable {true}] [get_bd_cells Multiplier_${id}]
set_property -dict [list CONFIG.width {@{[2 * $valueWidth]}}] [get_bd_cells Multiplier_${id}_Complements1To2]
set_property -dict [list CONFIG.width {$valueWidth}] [get_bd_cells Multiplier_${id}_Complements2To1_0]
set_property -dict [list CONFIG.width {$valueWidth}] [get_bd_cells Multiplier_${id}_Complements2To1_1]

CMD
}

# Wire up static components
print $fh <<CMD;

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
connect_bd_net [get_bd_pins SumJunction/DOUT] [get_bd_pins Plan/X]
connect_bd_net [get_bd_ports SYN_OUT] [get_bd_pins Plan/Y]
connect_bd_net [get_bd_ports SYN_OUT_VALID] [get_bd_pins ValidSetter/SYN_OUT_VALID]
connect_bd_net [get_bd_ports PKT_IN_VALID] [get_bd_pins NeuronRouter/PKT_IN_VALID]
connect_bd_net [get_bd_ports PKT_IN] [get_bd_pins NeuronRouter/PKT_IN]
connect_bd_net [get_bd_ports NEURON_ADDR] [get_bd_pins NeuronRouter/ADDR]

CMD

# Wire up neurons
foreach my $id (0..$NEURONS_PER_LAYER - 1) {
print $fh <<CMD;

connect_bd_net [get_bd_ports CLK] [get_bd_pins WeightRegister_${id}/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins WeightRegister_${id}/RST]
connect_bd_net [get_bd_pins DoneOutConcat/In${id}] [get_bd_pins WeightRegister_${id}/DONE_OUT]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT] [get_bd_pins WeightRegister_${id}/PKT_IN]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT_VALID] [get_bd_pins WeightRegister_${id}/PKT_IN_VALID]
connect_bd_net [get_bd_ports CLK] [get_bd_pins Synapse_${id}/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Synapse_${id}/RST]
connect_bd_net [get_bd_pins Synapse_${id}/SYN_OUT_VALID] [get_bd_pins MultiplierEnableConcat/In${id}]
connect_bd_net [get_bd_ports CLK] [get_bd_pins Multiplier_${id}/CLK]
connect_bd_net [get_bd_pins MultiplierSlicer_${id}/Dout] [get_bd_pins SumJunctionConcat/In${id}]
connect_bd_net [get_bd_ports SYN_${id}_VALID] [get_bd_pins Synapse_${id}/SYN_IN_VALID]
connect_bd_net [get_bd_ports SYN_${id}_DIN] [get_bd_pins Synapse_${id}/SYN_IN]
connect_bd_net [get_bd_pins ValidSetter/SYN_IN_CLR] [get_bd_pins Synapse_${id}/CLR]
connect_bd_net [get_bd_pins Multiplier_${id}/CE] [get_bd_pins MultiplierEnable/DOUT]
connect_bd_net [get_bd_pins Synapse_${id}/SYN_OUT] [get_bd_pins Multiplier_${id}_Complements2To1_1/TWOS]
connect_bd_net [get_bd_pins WeightRegister_${id}/VAL_OUT] [get_bd_pins Multiplier_${id}_Complements2To1_0/TWOS]
connect_bd_net [get_bd_pins Multiplier_${id}_Complements1To2/TWOS] [get_bd_pins MultiplierSlicer_${id}/Din]
connect_bd_net [get_bd_pins Multiplier_${id}_Complements2To1_0/ONES] [get_bd_pins Multiplier_${id}/B]
connect_bd_net [get_bd_pins Multiplier_${id}_Complements2To1_0/SIGN] [get_bd_pins Multiplier_${id}_Xor2/B]
connect_bd_net [get_bd_pins Multiplier_${id}_Complements2To1_1/ONES] [get_bd_pins Multiplier_${id}/A]
connect_bd_net [get_bd_pins Multiplier_${id}_Complements2To1_1/SIGN] [get_bd_pins Multiplier_${id}_Xor2/A]
connect_bd_net [get_bd_pins Multiplier_${id}_Complements1To2/SIGN] [get_bd_pins Multiplier_${id}_Xor2/O]
connect_bd_net [get_bd_pins Multiplier_${id}_Complements1To2/ONES] [get_bd_pins Multiplier_${id}/P]

group_bd_cells mult_${id} [get_bd_cells Multiplier_${id}] [get_bd_cells Multiplier_${id}_Complements1To2] [get_bd_cells Multiplier_${id}_Complements2To1_1] [get_bd_cells Multiplier_${id}_Xor2] [get_bd_cells Multiplier_${id}_Complements2To1_0]

CMD
}

# Regenerate layout
print $fh <<CMD;

regenerate_bd_layout

CMD
