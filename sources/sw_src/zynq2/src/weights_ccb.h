#include "params.h"
#include "addresses.h"

#ifndef WEIGHTS_CCB_H_
#define WEIGHTS_CCB_H_

void getWeights (u32* weightsP) {

	u32 weights[NUM_WEIGHTS] = {
		// Input layer
		// Bias
		pktTypes[0] | layerAddresses[0] | neuronAddresses[0] | synapseAddresses[0] | 0x0 << WEIGHT_INTEGER_POS | 0x0, // Approximation
		pktTypes[0] | layerAddresses[0] | neuronAddresses[1] | synapseAddresses[0] | 0x15 << WEIGHT_INTEGER_POS | 0x5b,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[2] | synapseAddresses[0] | 0x1f << WEIGHT_INTEGER_POS | 0x9,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[3] | synapseAddresses[0] | 0x1c << WEIGHT_INTEGER_POS | 0x63,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[4] | synapseAddresses[0] | 0x0 << WEIGHT_INTEGER_POS | 0x3,

		// Weights
		pktTypes[0] | layerAddresses[0] | neuronAddresses[0] | synapseAddresses[1] | 0x3 << WEIGHT_INTEGER_POS | 0x24,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[0] | synapseAddresses[2] | 0x1a << WEIGHT_INTEGER_POS | 0x72,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[0] | synapseAddresses[3] | 0x18 << WEIGHT_INTEGER_POS | 0x4f,

		pktTypes[0] | layerAddresses[0] | neuronAddresses[1] | synapseAddresses[1] | 0x6 << WEIGHT_INTEGER_POS | 0x10,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[1] | synapseAddresses[2] | 0x3 << WEIGHT_INTEGER_POS | 0x54,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[1] | synapseAddresses[3] | 0x6 << WEIGHT_INTEGER_POS | 0x44,

		pktTypes[0] | layerAddresses[0] | neuronAddresses[2] | synapseAddresses[1] | 0x18 << WEIGHT_INTEGER_POS | 0x4d,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[2] | synapseAddresses[2] | 0x3 << WEIGHT_INTEGER_POS | 0x29,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[2] | synapseAddresses[3] | 0x4 << WEIGHT_INTEGER_POS | 0x7f,

		pktTypes[0] | layerAddresses[0] | neuronAddresses[3] | synapseAddresses[1] | 0x1a << WEIGHT_INTEGER_POS | 0x36,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[3] | synapseAddresses[2] | 0x6 << WEIGHT_INTEGER_POS | 0x34,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[3] | synapseAddresses[3] | 0x1c << WEIGHT_INTEGER_POS | 0x18,

		pktTypes[0] | layerAddresses[0] | neuronAddresses[4] | synapseAddresses[1] | 0x16 << WEIGHT_INTEGER_POS | 0x50,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[4] | synapseAddresses[2] | 0x0 << WEIGHT_INTEGER_POS | 0x33,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[4] | synapseAddresses[3] | 0x3 << WEIGHT_INTEGER_POS | 0x38,

		// Layer 2
		// Bias
		pktTypes[0] | layerAddresses[1] | neuronAddresses[0] | synapseAddresses[0] | 0x19 << WEIGHT_INTEGER_POS | 0x7f,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[1] | synapseAddresses[0] | 0x1c << WEIGHT_INTEGER_POS | 0x5b,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[2] | synapseAddresses[0] | 0x1c << WEIGHT_INTEGER_POS | 0x21,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[3] | synapseAddresses[0] | 0x3 << WEIGHT_INTEGER_POS | 0x1f,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[4] | synapseAddresses[0] | 0x14 << WEIGHT_INTEGER_POS | 0x3e,

		// Weights
		pktTypes[0] | layerAddresses[1] | neuronAddresses[0] | synapseAddresses[1] | 0x6 << WEIGHT_INTEGER_POS | 0x3,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[0] | synapseAddresses[2] | 0x0 << WEIGHT_INTEGER_POS | 0x75,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[0] | synapseAddresses[3] | 0x1d << WEIGHT_INTEGER_POS | 0x51,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[0] | synapseAddresses[4] | 0x3 << WEIGHT_INTEGER_POS | 0x6b,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[0] | synapseAddresses[5] | 0x1d << WEIGHT_INTEGER_POS | 0x46,

		pktTypes[0] | layerAddresses[1] | neuronAddresses[1] | synapseAddresses[1] | 0x2 << WEIGHT_INTEGER_POS | 0x3d,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[1] | synapseAddresses[2] | 0x1d << WEIGHT_INTEGER_POS | 0x26,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[1] | synapseAddresses[3] | 0x1b << WEIGHT_INTEGER_POS | 0x74,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[1] | synapseAddresses[4] | 0x1 << WEIGHT_INTEGER_POS | 0x78,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[1] | synapseAddresses[5] | 0x5 << WEIGHT_INTEGER_POS | 0xa,

		pktTypes[0] | layerAddresses[1] | neuronAddresses[2] | synapseAddresses[1] | 0x3 << WEIGHT_INTEGER_POS | 0x46,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[2] | synapseAddresses[2] | 0x1 << WEIGHT_INTEGER_POS | 0x79,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[2] | synapseAddresses[3] | 0x0 << WEIGHT_INTEGER_POS | 0x9,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[2] | synapseAddresses[4] | 0x1b << WEIGHT_INTEGER_POS | 0x64,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[2] | synapseAddresses[5] | 0x5 << WEIGHT_INTEGER_POS | 0x0,

		pktTypes[0] | layerAddresses[1] | neuronAddresses[3] | synapseAddresses[1] | 0x1f << WEIGHT_INTEGER_POS | 0x20,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[3] | synapseAddresses[2] | 0x0 << WEIGHT_INTEGER_POS | 0x4c,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[3] | synapseAddresses[3] | 0x1b << WEIGHT_INTEGER_POS | 0xf,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[3] | synapseAddresses[4] | 0x1a << WEIGHT_INTEGER_POS | 0x51,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[3] | synapseAddresses[5] | 0x1b << WEIGHT_INTEGER_POS | 0x57,

		pktTypes[0] | layerAddresses[1] | neuronAddresses[4] | synapseAddresses[1] | 0x1f << WEIGHT_INTEGER_POS | 0x3f,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[4] | synapseAddresses[2] | 0x2 << WEIGHT_INTEGER_POS | 0x62,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[4] | synapseAddresses[3] | 0x4 << WEIGHT_INTEGER_POS | 0x3,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[4] | synapseAddresses[4] | 0x0 << WEIGHT_INTEGER_POS | 0x2c,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[4] | synapseAddresses[5] | 0x4 << WEIGHT_INTEGER_POS | 0x59
	};

	int i;
	u32* weightsPCpy = weightsP;
	for (i = 0; i < NUM_WEIGHTS; i++) {
		*weightsPCpy++ = weights[i];
	}
}

#endif /* WEIGHTS_CCB_H_ */
