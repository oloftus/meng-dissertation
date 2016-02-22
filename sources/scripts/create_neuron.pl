use strict;
use warnings;

##########################

my $NUM_SYNAPSES = 2;

my $SYNAPSE_INTEGER_PRECISION = 6;
my $SYNAPSE_FRACTION_PRECISION = 6;

my $WEIGHT_INTEGER_PRECISION = 8;
my $WEIGHT_FRACTION_PRECISION = 8;

my $PKT_WEIGHT_WIDTH = 4;
my $PKT_NEURON_WIDTH = 6;

##########################

my $synapsePrecision = $SYNAPSE_INTEGER_PRECISION + $SYNAPSE_FRACTION_PRECISION;
my $signedSynapsePortWidth = 1 + $synapsePrecision; # Sign bit
my $signedSynapsePortHigh = $signedSynapsePortWidth - 1;

my $weightPrecision = $WEIGHT_INTEGER_PRECISION + $WEIGHT_FRACTION_PRECISION;
my $signedWeightWidth = 1 + $weightPrecision;
my $swrnSynapsePortWidth = $signedWeightWidth + $PKT_WEIGHT_WIDTH;
my $swrnNeuronPortWidth = $swrnSynapsePortWidth + $PKT_NEURON_WIDTH;
my $swrnNeuronPortHigh = $swrnNeuronPortWidth - 1;
my $swrnNeuronAddrPortHigh = $PKT_NEURON_WIDTH - 1;

my $latency = 2; # TODO: CALCULATE

open my $fh, ">", "script.tcl";

print $fh <<CMD;

create_bd_port -dir I -type clk CLK
create_bd_port -dir I -type rst RST
create_bd_port -dir I PKT_IN_VALID
create_bd_port -dir I -from $swrnNeuronPortHigh -to 0 -type data PKT_IN
create_bd_port -dir I -from $swrnNeuronAddrPortHigh -to 0 -type data NEURON_ADDR
create_bd_port -dir O -from $signedSynapsePortHigh -to 0 -type data SYN_OUT
create_bd_port -dir O SYN_OUT_VALID
create_bd_port -dir O DONE_OUT

CMD

foreach my $id (0..$NUM_SYNAPSES - 1) {
print $fh <<CMD;

create_bd_port -dir I SYN_${id}_VALID
create_bd_port -dir I -from $signedSynapsePortHigh -to 0 -type data SYN_${id}_DIN

CMD
}

print $fh <<CMD;
create_bd_cell -type ip -vlnv oloftus.com:prif:ValueRouter:4.0 NeuronRouter
create_bd_cell -type ip -vlnv oloftus.com:prif:AndN:1.0 MultiplierEnable
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 MultiplierEnableConcat
create_bd_cell -type ip -vlnv oloftus.com:prif:OrN:1.0 DoneOut
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 DoneOutConcat
create_bd_cell -type ip -vlnv oloftus.com:prif:SumJunction:1.0 SumJunction
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 SumJunctionConcat
create_bd_cell -type ip -vlnv oloftus.com:prif:ValidSetter:1.0 ValidSetter
create_bd_cell -type ip -vlnv oloftus.com:prif:Plan:1.0 Plan
CMD

foreach my $id (0..$NUM_SYNAPSES - 1) {
print $fh <<CMD;

create_bd_cell -type ip -vlnv oloftus.com:prif:Synapse:1.0 Synapse_${id}
create_bd_cell -type ip -vlnv oloftus.com:prif:AddressableRegister:1.0 WeightRegister_${id}
create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 Multiplier_${id}

CMD
}

my $sumJunctionConcatInputs = [];
for my $id (0..$NUM_SYNAPSES - 1) { push $sumJunctionConcatInputs, "CONFIG.IN${id}_WIDTH {$signedSynapsePortWidth}" };

print $fh <<CMD;

set_property -dict [list CONFIG.packetInWidth {$swrnNeuronPortWidth} CONFIG.packetOutWidth {$swrnSynapsePortWidth}] [get_bd_cells NeuronRouter]
set_property -dict [list CONFIG.latency {$latency}] [get_bd_cells ValidSetter]
set_property -dict [list CONFIG.inputWidth {$signedSynapsePortWidth}] [get_bd_cells SumJunction]
set_property -dict [list CONFIG.numInputs {$NUM_SYNAPSES}] [get_bd_cells SumJunction]
set_property -dict [list CONFIG.integerPrecision {$SYNAPSE_INTEGER_PRECISION} CONFIG.fractionPrecision {$SYNAPSE_FRACTION_PRECISION}] [get_bd_cells Plan]
set_property -dict [list CONFIG.n {$NUM_SYNAPSES}] [get_bd_cells MultiplierEnable]
set_property -dict [list CONFIG.NUM_PORTS {$NUM_SYNAPSES}] [get_bd_cells MultiplierEnableConcat]
set_property -dict [list CONFIG.n {$NUM_SYNAPSES}] [get_bd_cells DoneOut]
set_property -dict [list CONFIG.NUM_PORTS {$NUM_SYNAPSES}] [get_bd_cells DoneOutConcat]
set_property -dict [list CONFIG.NUM_PORTS {$NUM_SYNAPSES} @$sumJunctionConcatInputs] [get_bd_cells SumJunctionConcat]

CMD

foreach my $id (0..$NUM_SYNAPSES - 1) {
print $fh <<CMD;

set_property -dict [list CONFIG.size {$signedSynapsePortWidth}] [get_bd_cells Synapse_${id}]
set_property -dict [list CONFIG.address {@{[${id} + 1]}} CONFIG.addressWidth {$PKT_WEIGHT_WIDTH} CONFIG.dataWidth {$signedWeightWidth}] [get_bd_cells WeightRegister_${id}]
set_property -dict [list CONFIG.PortAWidth.VALUE_SRC USER CONFIG.PortBWidth.VALUE_SRC USER CONFIG.PortAWidth {$signedSynapsePortWidth} CONFIG.PortBWidth {$signedWeightWidth} CONFIG.Use_Custom_Output_Width {true} CONFIG.OutputWidthHigh {$signedSynapsePortHigh} CONFIG.ClockEnable {true}] [get_bd_cells Multiplier_${id}]

CMD
}

print $fh <<CMD;

connect_bd_net [get_bd_ports CLK] [get_bd_pins ValidSetter/CLK]
connect_bd_net [get_bd_ports CLK] [get_bd_pins SumJunction/CLK]
connect_bd_net [get_bd_ports CLK] [get_bd_pins NeuronRouter/CLK]
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

foreach my $id (0..$NUM_SYNAPSES - 1) {
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
connect_bd_net [get_bd_pins Multiplier_${id}/CE] [get_bd_pins MultiplierEnable/DOUT]
connect_bd_net [get_bd_pins Multiplier_${id}/P] [get_bd_pins SumJunctionConcat/In${id}]
connect_bd_net [get_bd_ports SYN_${id}_VALID] [get_bd_pins Synapse_${id}/SYN_IN_VALID]
connect_bd_net [get_bd_ports SYN_${id}_DIN] [get_bd_pins Synapse_${id}/SYN_IN]
connect_bd_net [get_bd_pins Synapse_${id}/SYN_OUT] [get_bd_pins Multiplier_${id}/A]
connect_bd_net [get_bd_pins WeightRegister_${id}/VAL_OUT] [get_bd_pins Multiplier_${id}/B]
connect_bd_net [get_bd_pins ValidSetter/SYN_IN_CLR] [get_bd_pins Synapse_${id}/CLR]

CMD
}

print $fh <<CMD;

regenerate_bd_layout

CMD
