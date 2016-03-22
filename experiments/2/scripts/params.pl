use List::Util qw[max];

$HAS_SWRN = 0;

$NUM_LAYERS = 2;
$NEURONS_PER_LAYER = 5;
$NUM_INPUTS = 3;

$VAL_INTEGER_PRECISION = 4;
$VAL_FRACTION_PRECISION = 7;
$WEIGHT_INTEGER_PRECISION = 5;
$WEIGHT_FRACTION_PRECISION = 10;

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
$stimulusTypeOutPacketWidth = $PKT_STIMULUS_REG_ADDR_WIDTH + $transferWidth;
$largestPacketWidth = $PKT_TYPE_ADDR_WIDTH + max($weightTypeOutPacketWidth, $stimulusTypeOutPacketWidth);
$pktStimulusTypeAddrWidth = $largestPacketWidth - $stimulusTypeOutPacketWidth;
$pktWeightTypeAddrWidth = $largestPacketWidth - $weightTypeOutPacketWidth;

if ($largestPacketWidth > $AXI_BUS_WIDTH) {
    die "Packet parameters exceeed AXI bus width";
}

$WEIGHTS = [
  [# Layer 1
    [# Biases
      0,
      2779,
      3977,
      3683,
      3
    ],
    [# Weights
      [
        3356,
        60304,
        57974
      ],
      [
        6268,
        3740,
        6687
      ],
      [
        57957,
        3398,
        5111
      ],
      [
        59821,
        6559,
        61627
      ],
      [
        55930,
        406,
        3514
      ]
    ]
  ],
  [# Layer 2
    [# Biases
      3327,
      3675,
      3617,
      415,
      2622
    ],
    [# Weights
      [
        6168,
        933,
        63107,
        3928,
        63017
      ],
      [
        2529,
        62766,
        61343,
        1977,
        5197
      ],
      [
        3631,
        1988,
        65,
        61213,
        5118
      ],
      [
        64762,
        602,
        60534,
        60036,
        61110
      ],
      [
        65010,
        2828,
        4115,
        345,
        4803
      ]
    ]
  ]
];

1