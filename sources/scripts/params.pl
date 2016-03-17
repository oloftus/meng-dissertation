use List::Util qw[max];

$NUM_LAYERS = 2;
$NEURONS_PER_LAYER = 2;
$NUM_INPUTS = 1;

$VAL_INTEGER_PRECISION = 4;
$VAL_FRACTION_PRECISION = 7;
$WEIGHT_INTEGER_PRECISION = 4;
$WEIGHT_FRACTION_PRECISION = 11;

$PKT_TYPE_ADDR_WIDTH = 1;
$PKT_LAYER_ADDR_WIDTH = 2;
$PKT_NEURON_ADDR_WIDTH = 3;
$PKT_SYNAPSE_ADDR_WIDTH = 3;
$PKT_STIMULUS_REG_ADDR_WIDTH = 2;
$STIMULUS_TYPE = 1;
$WEIGHT_TYPE = 0;

$AXI_BUS_WIDTH = 32;

$weightWidth = 1 + $WEIGHT_INTEGER_PRECISION + $WEIGHT_FRACTION_PRECISION; # Sign bit
$valueWidth = 1 + $VAL_INTEGER_PRECISION + $VAL_FRACTION_PRECISION;
$transferWidth = 1 + $VAL_FRACTION_PRECISION;

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