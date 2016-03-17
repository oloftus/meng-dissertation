#!/usr/bin/perl

use strict;
use warnings;

require "params.pl";

our $NEURONS_PER_LAYER;
our $NUM_LAYERS;
our $NUM_INPUTS;
our $VAL_INTEGER_PRECISION;
our $VAL_FRACTION_PRECISION;
our $WEIGHT_INTEGER_PRECISION;
our $WEIGHT_FRACTION_PRECISION;
our $AXI_BUS_WIDTH;
our $PKT_TYPE_ADDR_WIDTH;
our $PKT_LAYER_ADDR_WIDTH;
our $PKT_NEURON_ADDR_WIDTH;
our $PKT_SYNAPSE_ADDR_WIDTH;
our $STIMULUS_TYPE;
our $WEIGHT_TYPE;

our $valueWidth;
our $weightWidth;
our $neuronOutPacketWidth;
our $layerOutPacketWidth;
our $transferWidth;

foreach my $mode ("hidden_neuron", "input_neuron") {
my $numSynapses = $mode =~ "^hidden" ? $NEURONS_PER_LAYER : $NUM_INPUTS;
my $neuronLatency = $numSynapses + 2;

open my $fh, ">", "create_".($mode =~ "^hidden" ? "hidden" : "input")."_neuron.tcl" or die "Couldn't open file"."\n";

# Create static ports
print $fh <<CMD;

create_bd_port -dir I -type clk CLK
create_bd_port -dir I -type rst RST
create_bd_port -dir I PKT_IN_VALID
create_bd_port -dir I -from @{[$layerOutPacketWidth - 1]} -to 0 -type data PKT_IN
create_bd_port -dir I -from @{[$PKT_NEURON_ADDR_WIDTH - 1]} -to 0 -type data NEURON_ADDR
create_bd_port -dir O -from @{[$transferWidth - 1]} -to 0 -type data SYN_OUT
create_bd_port -dir O SYN_OUT_VALID
create_bd_port -dir O DONE_OUT

CMD

# Create input ports for each synapse
foreach my $id (0..$numSynapses - 1) {
print $fh <<CMD;

create_bd_port -dir I SYN_${id}_VALID
create_bd_port -dir I -from @{[$transferWidth - 1]} -to 0 -type data SYN_${id}_DIN

CMD
}

# Create static components
print $fh <<CMD;

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

CMD

# Create synapses
foreach my $id (0..$numSynapses - 1) {
print $fh <<CMD;

create_bd_cell -type ip -vlnv oloftus.com:prif:Synapse:1.0 Synapse_${id}
create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 WeightRegister_${id}
create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 MultiplierSlicer_${id}
create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 Multiplier_${id}

CMD
}

# Configure (semi-) static components
my $sumJunctionConcatInputs = [];
for my $id (0..$numSynapses) { push $sumJunctionConcatInputs, "CONFIG.IN${id}_WIDTH {$valueWidth}" };

print $fh <<CMD;

set_property -dict [list CONFIG.packetInWidth {$layerOutPacketWidth} CONFIG.packetOutWidth {$neuronOutPacketWidth}] [get_bd_cells NeuronRouter]
set_property -dict [list CONFIG.latency {$neuronLatency}] [get_bd_cells ValidSetter]
set_property -dict [list CONFIG.inputWidth {$valueWidth} CONFIG.numInputs {@{[$numSynapses + 1]}}] [get_bd_cells SumJunction]
set_property -dict [list CONFIG.n {$numSynapses}] [get_bd_cells MultiplierEnable]
set_property -dict [list CONFIG.NUM_PORTS {$numSynapses}] [get_bd_cells MultiplierEnableConcat]
set_property -dict [list CONFIG.n {@{[$numSynapses + 1]}}] [get_bd_cells DoneOut]
set_property -dict [list CONFIG.NUM_PORTS {@{[$numSynapses + 1]}}] [get_bd_cells DoneOutConcat]
set_property -dict [list CONFIG.NUM_PORTS {@{[$numSynapses + 1]}} @$sumJunctionConcatInputs] [get_bd_cells SumJunctionConcat]
set_property -dict [list CONFIG.address {0} CONFIG.addressWidth {$PKT_SYNAPSE_ADDR_WIDTH} CONFIG.dataWidth {$weightWidth} CONFIG.padHighWidth {@{[$VAL_INTEGER_PRECISION - $WEIGHT_INTEGER_PRECISION]}} CONFIG.padLowWidth {@{[$VAL_FRACTION_PRECISION - $WEIGHT_FRACTION_PRECISION]}}] [get_bd_cells BiasRegister]
set_property -dict [list CONFIG.integerPrecision {$VAL_INTEGER_PRECISION} CONFIG.fractionPrecision {$VAL_FRACTION_PRECISION}] [get_bd_cells Plan]
set_property -dict [list CONFIG.DIN_WIDTH {${valueWidth}} CONFIG.DIN_FROM {@{[$transferWidth - 1]}} CONFIG.DIN_TO {0}] [get_bd_cells PlanSlicer]

CMD

# Configure synapses
foreach my $id (0..$numSynapses - 1) {
print $fh <<CMD;

set_property -dict [list CONFIG.size {${transferWidth}}] [get_bd_cells Synapse_${id}]
set_property -dict [list CONFIG.address {@{[$id + 1]}} CONFIG.addressWidth {$PKT_SYNAPSE_ADDR_WIDTH} CONFIG.dataWidth {$weightWidth}] [get_bd_cells WeightRegister_${id}]
set_property -dict [list CONFIG.DIN_WIDTH {@{[$transferWidth + $weightWidth]}} CONFIG.DIN_FROM {@{[$WEIGHT_FRACTION_PRECISION + $valueWidth - 1]}} CONFIG.DIN_TO {${WEIGHT_FRACTION_PRECISION}}] [get_bd_cells MultiplierSlicer_${id}]
set_property -dict [list CONFIG.PortAWidth.VALUE_SRC USER CONFIG.PortBWidth.VALUE_SRC USER CONFIG.PortAWidth {${transferWidth}} CONFIG.PortBWidth {${weightWidth}} CONFIG.PortAType.VALUE_SRC USER CONFIG.PortBType.VALUE_SRC USER CONFIG.PortAType {Unsigned} CONFIG.PortBType {Signed} CONFIG.ClockEnable {true} CONFIG.Use_Custom_Output_Width {true} CONFIG.OutputWidthHigh {@{[$transferWidth + $weightWidth - 1]}}] [get_bd_cells Multiplier_${id}]

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

CMD

# Wire up synapses
foreach my $id (0..$numSynapses - 1) {
print $fh <<CMD;

connect_bd_net [get_bd_ports CLK] [get_bd_pins WeightRegister_${id}/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins WeightRegister_${id}/RST]
connect_bd_net [get_bd_pins WeightRegister_${id}/DONE_OUT] [get_bd_pins DoneOutConcat/In@{[$id + 1]}]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT] [get_bd_pins WeightRegister_${id}/PKT_IN]
connect_bd_net [get_bd_pins NeuronRouter/PKT_OUT_VALID] [get_bd_pins WeightRegister_${id}/PKT_IN_VALID]
connect_bd_net [get_bd_ports CLK] [get_bd_pins Synapse_${id}/CLK]
connect_bd_net [get_bd_ports RST] [get_bd_pins Synapse_${id}/RST]
connect_bd_net [get_bd_pins Synapse_${id}/SYN_OUT_VALID] [get_bd_pins MultiplierEnableConcat/In${id}]
connect_bd_net [get_bd_ports CLK] [get_bd_pins Multiplier_${id}/CLK]
connect_bd_net [get_bd_ports SYN_${id}_VALID] [get_bd_pins Synapse_${id}/SYN_IN_VALID]
connect_bd_net [get_bd_ports SYN_${id}_DIN] [get_bd_pins Synapse_${id}/SYN_IN]
connect_bd_net [get_bd_pins ValidSetter/SYN_IN_CLR] [get_bd_pins Synapse_${id}/CLR]
connect_bd_net [get_bd_pins Multiplier_${id}/CE] [get_bd_pins MultiplierEnable/DOUT]
connect_bd_net [get_bd_pins Multiplier_${id}/P] [get_bd_pins MultiplierSlicer_${id}/Din]
connect_bd_net [get_bd_pins Synapse_${id}/SYN_OUT] [get_bd_pins Multiplier_${id}/A]
connect_bd_net [get_bd_pins WeightRegister_${id}/VAL_OUT] [get_bd_pins Multiplier_${id}/B]
connect_bd_net [get_bd_pins MultiplierSlicer_${id}/Dout] [get_bd_pins SumJunctionConcat/In@{[$id + 1]}]

CMD
}

# Regenerate layout
print $fh <<CMD;

regenerate_bd_layout

CMD
}
