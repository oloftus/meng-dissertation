#include "params.h"
#include "addresses.h"

#ifndef WEIGHTS_H_
#define WEIGHTS_H_

void getWeights (u32* weightsP) {

	u32 weights[NUM_WEIGHTS] = {
		// Input layer
		// Biases
		pktTypes[0] | layerAddresses[0] | neuronAddresses[0] | synapseAddresses[0] | 0x0 << WEIGHT_INTEGER_POS | 0x0, // Approximation
		pktTypes[0] | layerAddresses[0] | neuronAddresses[1] | synapseAddresses[0] | 0x15 << WEIGHT_INTEGER_POS | 0x2d8,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[2] | synapseAddresses[0] | 0x1f << WEIGHT_INTEGER_POS | 0x48,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[3] | synapseAddresses[0] | 0x1c << WEIGHT_INTEGER_POS | 0x318,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[4] | synapseAddresses[0] | 0x0 << WEIGHT_INTEGER_POS | 0x18,

		// Weights
		pktTypes[0] | layerAddresses[0] | neuronAddresses[0] | synapseAddresses[1] | 0x3 << WEIGHT_INTEGER_POS | 0x11c,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[0] | synapseAddresses[2] | 0x3a << WEIGHT_INTEGER_POS | 0x390,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[0] | synapseAddresses[3] | 0x38 << WEIGHT_INTEGER_POS | 0x276,

		pktTypes[0] | layerAddresses[0] | neuronAddresses[1] | synapseAddresses[1] | 0x6 << WEIGHT_INTEGER_POS | 0x7c,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[1] | synapseAddresses[2] | 0x3 << WEIGHT_INTEGER_POS | 0x29c,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[1] | synapseAddresses[3] | 0x6 << WEIGHT_INTEGER_POS | 0x21f,

		pktTypes[0] | layerAddresses[0] | neuronAddresses[2] | synapseAddresses[1] | 0x38 << WEIGHT_INTEGER_POS | 0x265,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[2] | synapseAddresses[2] | 0x3 << WEIGHT_INTEGER_POS | 0x146,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[2] | synapseAddresses[3] | 0x4 << WEIGHT_INTEGER_POS | 0x3f7,

		pktTypes[0] | layerAddresses[0] | neuronAddresses[3] | synapseAddresses[1] | 0x3a << WEIGHT_INTEGER_POS | 0x1ad,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[3] | synapseAddresses[2] | 0x6 << WEIGHT_INTEGER_POS | 0x19f,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[3] | synapseAddresses[3] | 0x3c << WEIGHT_INTEGER_POS | 0xbb,

		pktTypes[0] | layerAddresses[0] | neuronAddresses[4] | synapseAddresses[1] | 0x36 << WEIGHT_INTEGER_POS | 0x27a,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[4] | synapseAddresses[2] | 0x0 << WEIGHT_INTEGER_POS | 0x196,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[4] | synapseAddresses[3] | 0x3 << WEIGHT_INTEGER_POS | 0x1ba,

		// Layer 2
		// Bias
		pktTypes[0] | layerAddresses[1] | neuronAddresses[0] | synapseAddresses[0] | 0x19 << WEIGHT_INTEGER_POS | 0x3f8,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[1] | synapseAddresses[0] | 0x1c << WEIGHT_INTEGER_POS | 0x2d8,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[2] | synapseAddresses[0] | 0x1c << WEIGHT_INTEGER_POS | 0x108,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[3] | synapseAddresses[0] | 0x3 << WEIGHT_INTEGER_POS | 0xf8,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[4] | synapseAddresses[0] | 0x14 << WEIGHT_INTEGER_POS | 0x1f0,

		// Weights
		pktTypes[0] | layerAddresses[1] | neuronAddresses[0] | synapseAddresses[1] | 0x6 << WEIGHT_INTEGER_POS | 0x18,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[0] | synapseAddresses[2] | 0x0 << WEIGHT_INTEGER_POS | 0x3a5,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[0] | synapseAddresses[3] | 0x3d << WEIGHT_INTEGER_POS | 0x283,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[0] | synapseAddresses[4] | 0x3 << WEIGHT_INTEGER_POS | 0x358,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[0] | synapseAddresses[5] | 0x3d << WEIGHT_INTEGER_POS | 0x229,

		pktTypes[0] | layerAddresses[1] | neuronAddresses[1] | synapseAddresses[1] | 0x2 << WEIGHT_INTEGER_POS | 0x1e1,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[1] | synapseAddresses[2] | 0x3d << WEIGHT_INTEGER_POS | 0x12e,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[1] | synapseAddresses[3] | 0x3b << WEIGHT_INTEGER_POS | 0x39f,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[1] | synapseAddresses[4] | 0x1 << WEIGHT_INTEGER_POS | 0x3b9,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[1] | synapseAddresses[5] | 0x5 << WEIGHT_INTEGER_POS | 0x4d,

		pktTypes[0] | layerAddresses[1] | neuronAddresses[2] | synapseAddresses[1] | 0x3 << WEIGHT_INTEGER_POS | 0x22f,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[2] | synapseAddresses[2] | 0x1 << WEIGHT_INTEGER_POS | 0x3c4,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[2] | synapseAddresses[3] | 0x0 << WEIGHT_INTEGER_POS | 0x41,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[2] | synapseAddresses[4] | 0x3b << WEIGHT_INTEGER_POS | 0x31d,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[2] | synapseAddresses[5] | 0x4 << WEIGHT_INTEGER_POS | 0x3fe,

		pktTypes[0] | layerAddresses[1] | neuronAddresses[3] | synapseAddresses[1] | 0x3f << WEIGHT_INTEGER_POS | 0xfa,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[3] | synapseAddresses[2] | 0x0 << WEIGHT_INTEGER_POS | 0x25a,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[3] | synapseAddresses[3] | 0x3b << WEIGHT_INTEGER_POS | 0x76,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[3] | synapseAddresses[4] | 0x3a << WEIGHT_INTEGER_POS | 0x284,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[3] | synapseAddresses[5] | 0x3b << WEIGHT_INTEGER_POS | 0x2b6,

		pktTypes[0] | layerAddresses[1] | neuronAddresses[4] | synapseAddresses[1] | 0x3f << WEIGHT_INTEGER_POS | 0x1f2,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[4] | synapseAddresses[2] | 0x2 << WEIGHT_INTEGER_POS | 0x30c,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[4] | synapseAddresses[3] | 0x4 << WEIGHT_INTEGER_POS | 0x13,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[4] | synapseAddresses[4] | 0x0 << WEIGHT_INTEGER_POS | 0x159,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[4] | synapseAddresses[5] | 0x4 << WEIGHT_INTEGER_POS | 0x2c3
	};

	int i;
	u32* weightsPCpy = weightsP;
	for (i = 0; i < NUM_WEIGHTS; i++) {
		*weightsPCpy++ = weights[i];
	}
}

#endif /* WEIGHTS_H_ */
