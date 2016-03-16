use List::Util qw[max];

$NUM_LAYERS = 3;
$NEURONS_PER_LAYER = 3;
$NUM_INPUTS = 2;

$VAL_INTEGER_PRECISION = 8;
$VAL_FRACTION_PRECISION = 7;
$WEIGHT_INTEGER_PRECISION = 6;
$WEIGHT_FRACTION_PRECISION = 5;

$PKT_TYPE_ADDR_WIDTH = 1;
$PKT_LAYER_ADDR_WIDTH = 5;
$PKT_NEURON_ADDR_WIDTH = 6;
$PKT_SYNAPSE_ADDR_WIDTH = 4;
$PKT_STIMULUS_REG_ADDR_WIDTH = 4;
$STIMULUS_TYPE = 1;
$WEIGHT_TYPE = 0;

$AXI_BUS_WIDTH = 32;

$weightWidth = 1 + $WEIGHT_INTEGER_PRECISION + $WEIGHT_FRACTION_PRECISION; # Sign bit
$valueWidth = 1 + $VAL_INTEGER_PRECISION + $VAL_FRACTION_PRECISION;

$neuronOutPacketWidth = $PKT_SYNAPSE_ADDR_WIDTH + $weightWidth;
$layerOutPacketWidth = $PKT_NEURON_ADDR_WIDTH + $neuronOutPacketWidth;
$weightTypeOutPacketWidth = $PKT_LAYER_ADDR_WIDTH + $layerOutPacketWidth;
$stimulusTypeOutPacketWidth = $PKT_STIMULUS_REG_ADDR_WIDTH + $valueWidth;
$largestPacketWidth = $PKT_TYPE_ADDR_WIDTH + max($weightTypeOutPacketWidth, $stimulusTypeOutPacketWidth);
$pktStimulusTypeAddrWidth = $largestPacketWidth - $stimulusTypeOutPacketWidth;
$pktWeightTypeAddrWidth = $largestPacketWidth - $weightTypeOutPacketWidth;

if ($largestPacketWidth > $AXI_BUS_WIDTH) {
    die "Packet parameters exceeed AXI bus width";
}

1