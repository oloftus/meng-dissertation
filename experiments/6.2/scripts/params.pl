use List::Util qw[max];

$HAS_SWRN = 1; # Create the SWRN?
$USE_MULTS = 0; # LUTs or MULTs for multipliers
$CCB = 0; # Use CCB's MUX with rounding?
$PO2 = 0; # Use powers of 2 weights and shifting?

if ($CCB and $PO2) {
  die "Options CCB and PO2 are mutually exclusive", "\n";
}

$NUM_LAYERS = 2;
$NEURONS_PER_LAYER = 5;
$NUM_INPUTS = 3;

$VAL_INTEGER_PRECISION = 4;
$VAL_FRACTION_PRECISION = 3;
$WEIGHT_INTEGER_PRECISION = 5;
$WEIGHT_FRACTION_PRECISION = 10;
my $SHIFT_WIDTH = 3; # 4 = 11 len(101) = 2 # 7 = 111 len(111) = 3 max(3,2)=3 PO2 ONLY

$PKT_TYPE_ADDR_WIDTH = 1;
$PKT_LAYER_ADDR_WIDTH = 2;
$PKT_NEURON_ADDR_WIDTH = 3;
$PKT_SYNAPSE_ADDR_WIDTH = 3;
$PKT_STIMULUS_REG_ADDR_WIDTH = 2;
$STIMULUS_TYPE = 1;
$WEIGHT_TYPE = 0;

$AXI_BUS_WIDTH = 32;

$transferWidth = 1 + $VAL_FRACTION_PRECISION;

if ($CCB) {
  $transferWidth = 1;
  ($WEIGHT_INTEGER_PRECISION, $WEIGHT_FRACTION_PRECISION) = ($VAL_INTEGER_PRECISION, $VAL_FRACTION_PRECISION);
}
if ($PO2) {
  ($WEIGHT_INTEGER_PRECISION, $WEIGHT_FRACTION_PRECISION) = ($VAL_INTEGER_PRECISION, $VAL_FRACTION_PRECISION);
}

$weightWidth = 1 + $WEIGHT_INTEGER_PRECISION + $WEIGHT_FRACTION_PRECISION; # Sign bit
$valueWidth = 1 + $VAL_INTEGER_PRECISION + $VAL_FRACTION_PRECISION;
$shiftWidth = 2 + $SHIFT_WIDTH; # <Shift direction><Sign bit><Width>

$neuronOutPacketWidth = $PKT_SYNAPSE_ADDR_WIDTH + $weightWidth;
$layerOutPacketWidth = $PKT_NEURON_ADDR_WIDTH + $neuronOutPacketWidth;
$weightTypeOutPacketWidth = $PKT_LAYER_ADDR_WIDTH + $layerOutPacketWidth;
$stimulusTypeOutPacketWidth = $PKT_STIMULUS_REG_ADDR_WIDTH + $transferWidth;
$largestPacketWidth = $PKT_TYPE_ADDR_WIDTH + max($weightTypeOutPacketWidth, $stimulusTypeOutPacketWidth);
$pktStimulusTypeAddrWidth = $largestPacketWidth - $stimulusTypeOutPacketWidth;
$pktWeightTypeAddrWidth = $largestPacketWidth - $weightTypeOutPacketWidth;

if ($largestPacketWidth > $AXI_BUS_WIDTH) {
    die "Packet parameters exceeed AXI bus width", "\n";
}

1