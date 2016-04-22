#include "params.h"
#include "addresses.h"

#include <stdio.h>
#include <xil_io.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_types.h"

#ifndef WEIGHTS_PO2_H_
#define WEIGHTS_PO2_H_

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
		pktTypes[0] | layerAddresses[0] | neuronAddresses[0] | synapseAddresses[1] | 0x2,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[0] | synapseAddresses[2] | 0x12,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[0] | synapseAddresses[3] | 0x13,

		pktTypes[0] | layerAddresses[0] | neuronAddresses[1] | synapseAddresses[1] | 0x3,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[1] | synapseAddresses[2] | 0x2,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[1] | synapseAddresses[3] | 0x3,

		pktTypes[0] | layerAddresses[0] | neuronAddresses[2] | synapseAddresses[1] | 0x13,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[2] | synapseAddresses[2] | 0x2,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[2] | synapseAddresses[3] | 0x2,

		pktTypes[0] | layerAddresses[0] | neuronAddresses[3] | synapseAddresses[1] | 0x12,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[3] | synapseAddresses[2] | 0x3,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[3] | synapseAddresses[3] | 0x12,

		pktTypes[0] | layerAddresses[0] | neuronAddresses[4] | synapseAddresses[1] | 0x13,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[4] | synapseAddresses[2] | 0x9,
		pktTypes[0] | layerAddresses[0] | neuronAddresses[4] | synapseAddresses[3] | 0x2,

		// Layer 2
		// Bias
		pktTypes[0] | layerAddresses[1] | neuronAddresses[0] | synapseAddresses[0] | 0x19 << WEIGHT_INTEGER_POS | 0x7f,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[1] | synapseAddresses[0] | 0x1c << WEIGHT_INTEGER_POS | 0x5b,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[2] | synapseAddresses[0] | 0x1c << WEIGHT_INTEGER_POS | 0x21,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[3] | synapseAddresses[0] | 0x3 << WEIGHT_INTEGER_POS | 0x1f,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[4] | synapseAddresses[0] | 0x14 << WEIGHT_INTEGER_POS | 0x3e,

		// Weights
		pktTypes[0] | layerAddresses[1] | neuronAddresses[0] | synapseAddresses[1] | 0x3,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[0] | synapseAddresses[2] | 0x8,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[0] | synapseAddresses[3] | 0x11,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[0] | synapseAddresses[4] | 0x2,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[0] | synapseAddresses[5] | 0x11,

		pktTypes[0] | layerAddresses[1] | neuronAddresses[1] | synapseAddresses[1] | 0x1,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[1] | synapseAddresses[2] | 0x11,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[1] | synapseAddresses[3] | 0x12,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[1] | synapseAddresses[4] | 0x0,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[1] | synapseAddresses[5] | 0x2,

		pktTypes[0] | layerAddresses[1] | neuronAddresses[2] | synapseAddresses[1] | 0x2,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[2] | synapseAddresses[2] | 0x0,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[2] | synapseAddresses[3] | 0xc,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[2] | synapseAddresses[4] | 0x12,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[2] | synapseAddresses[5] | 0x2,

		pktTypes[0] | layerAddresses[1] | neuronAddresses[3] | synapseAddresses[1] | 0x18,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[3] | synapseAddresses[2] | 0x9,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[3] | synapseAddresses[3] | 0x12,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[3] | synapseAddresses[4] | 0x12,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[3] | synapseAddresses[5] | 0x12,

		pktTypes[0] | layerAddresses[1] | neuronAddresses[4] | synapseAddresses[1] | 0x19,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[4] | synapseAddresses[2] | 0x1,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[4] | synapseAddresses[3] | 0x2,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[4] | synapseAddresses[4] | 0xa,
		pktTypes[0] | layerAddresses[1] | neuronAddresses[4] | synapseAddresses[5] | 0x2
	};

	int i;
	u32* weightsPCpy = weightsP;
	for (i = 0; i < NUM_WEIGHTS; i++) {
		*weightsPCpy++ = weights[i];
	}
}

#endif /* WEIGHTS_PO2_H_ */
