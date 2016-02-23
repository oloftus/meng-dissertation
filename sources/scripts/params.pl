$NUM_LAYERS = 3;
$NEURONS_PER_LAYER = 3;
$INTEGER_PRECISION = 8;
$FRACTION_PRECISION = 7;
$AXI_BUS_WIDTH = 32;
$PKT_TYPE_ADDR_WIDTH = 1;
$PKT_LAYER_ADDR_WIDTH = 5;
$PKT_NEURON_ADDR_WIDTH = 6;
$PKT_SYNAPSE_ADDR_WIDTH = 4;
$STIMULUS_TYPE = 1;
$WEIGHT_TYPE = 0;
$NEURON_LATENCY = 3;

$valueWidth = 1 + $INTEGER_PRECISION + $FRACTION_PRECISION; # Sign bit
$neuronOutPacketWidth = $PKT_SYNAPSE_ADDR_WIDTH + $valueWidth;
$layerOutPacketWidth = $PKT_NEURON_ADDR_WIDTH + $neuronOutPacketWidth;
$typeOutPacketWidth = $PKT_LAYER_ADDR_WIDTH + $layerOutPacketWidth;
$networkInPacketWidth = $PKT_TYPE_ADDR_WIDTH + $typeOutPacketWidth;
$pktStimulusAddrWidth = $AXI_BUS_WIDTH - $valueWidth;

networkInPacketWidth