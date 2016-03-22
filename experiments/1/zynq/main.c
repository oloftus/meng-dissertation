#include <stdio.h>
#include <xil_io.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_types.h"

/***** Editable parameters *****/
#define NUM_LAYERS 2
#define NEURONS_PER_LAYER 5
#define NUM_INPUTS 3

#define VAL_INTEGER_PRECISION 4
#define VAL_FRACTION_PRECISION 7
#define WEIGHT_INTEGER_PRECISION 5
#define WEIGHT_FRACTION_PRECISION 10

#define PKT_TYPE_ADDR_WIDTH 1
#define PKT_LAYER_ADDR_WIDTH 2
#define PKT_NEURON_ADDR_WIDTH 3
#define PKT_SYNAPSE_ADDR_WIDTH 3
#define PKT_STIMULUS_REG_ADDR_WIDTH 2

#define NUM_STIMULI 7
/***** END editable parameters *****/

#define PKT_IN_REG XPAR_AXI_HARNESS_0_S00_AXI_BASEADDR + 0x0
#define CTRL_IN_REG XPAR_AXI_HARNESS_0_S00_AXI_BASEADDR + 0x4
#define SYN_OUTS_REG XPAR_AXI_HARNESS_0_S00_AXI_BASEADDR + 0x8
#define CTRL_OUT_REG XPAR_AXI_HARNESS_0_S00_AXI_BASEADDR + 0xC

#define CTRL_IN_PKT_IN_VALID 0x1
#define CTRL_IN_NXT_SYN_OUT 0X2
#define CTRL_IN_RST_SYN_OUTS_READY 0x4
#define CTRL_IN_RST_PKT_RCVD 0x8
#define CTRL_OUT_PKT_RCVD 0x1
#define CTRL_OUT_SYN_OUTS_READY 0x2

#define WEIGHT_INTEGER_POS WEIGHT_FRACTION_PRECISION
#define SYNAPSE_ADDR_POS (1 + WEIGHT_INTEGER_POS + WEIGHT_INTEGER_PRECISION)
#define NEURON_ADDR_POS (SYNAPSE_ADDR_POS + PKT_SYNAPSE_ADDR_WIDTH)
#define LAYER_ADDR_POS (NEURON_ADDR_POS + PKT_NEURON_ADDR_WIDTH)
#define TYPE_ADDR_POS (LAYER_ADDR_POS + PKT_LAYER_ADDR_WIDTH)

#define STIMULUS_INTEGER_POS VAL_FRACTION_PRECISION
#define STIMULUS_ADDR_POS (1 + STIMULUS_INTEGER_POS)

// NUM_LAYERS * <Number of biases per layer> + <Weights in first layer> + <Weights in subsequent layers>
#define NUM_WEIGHTS (NUM_LAYERS * NEURONS_PER_LAYER + NUM_INPUTS * NEURONS_PER_LAYER + (NUM_LAYERS - 1) * (NEURONS_PER_LAYER * NEURONS_PER_LAYER))

int main()
{
    init_platform();

	u32 pktTypes[2] = { 0, 1 << TYPE_ADDR_POS }; // Weight: 0; Stimulus: 1
	u32 layerAddresses[NUM_LAYERS] = { 0, 1 << LAYER_ADDR_POS };
	u32 neuronAddresses[NEURONS_PER_LAYER] = { 0, 1 << NEURON_ADDR_POS, 2 << NEURON_ADDR_POS, 3 << NEURON_ADDR_POS, 4 << NEURON_ADDR_POS };
	u32 synapseAddresses[NEURONS_PER_LAYER + 1] = { 0, 1 << SYNAPSE_ADDR_POS, 2 << SYNAPSE_ADDR_POS, 3 << SYNAPSE_ADDR_POS, 4 << SYNAPSE_ADDR_POS, 5 << SYNAPSE_ADDR_POS };
	u32 stimulusAddresses[NUM_INPUTS] = { 0, 1 << STIMULUS_ADDR_POS, 2 << STIMULUS_ADDR_POS };

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

	u32 stimuli[NUM_STIMULI][NUM_INPUTS] = {
		{
			pktTypes[1] | stimulusAddresses[0] | 0x1 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[1] | 0x0 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[2] | 0x0 << STIMULUS_INTEGER_POS
		},
		{
			pktTypes[1] | stimulusAddresses[0] | 0x0 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[1] | 0x1 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[2] | 0x0 << STIMULUS_INTEGER_POS
		},
		{
			pktTypes[1] | stimulusAddresses[0] | 0x1 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[1] | 0x1 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[2] | 0x0 << STIMULUS_INTEGER_POS
		},
		{
			pktTypes[1] | stimulusAddresses[0] | 0x0 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[1] | 0x0 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[2] | 0x1 << STIMULUS_INTEGER_POS
		},
		{
			pktTypes[1] | stimulusAddresses[0] | 0x1 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[1] | 0x0 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[2] | 0x1 << STIMULUS_INTEGER_POS
		},
		{
			pktTypes[1] | stimulusAddresses[0] | 0x0 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[1] | 0x1 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[2] | 0x1 << STIMULUS_INTEGER_POS
		},
		{
			pktTypes[1] | stimulusAddresses[0] | 0x1 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[1] | 0x1 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[2] | 0x1 << STIMULUS_INTEGER_POS
		}
	};

    // Reset things (REMOVE WHEN THE PROGRAM IS STABLE)
    Xil_Out32(CTRL_IN_REG, CTRL_IN_RST_SYN_OUTS_READY);
    Xil_Out32(CTRL_IN_REG, CTRL_IN_RST_PKT_RCVD);

	u32 i, j;

	// Set weights
	for (i = 0; i < NUM_WEIGHTS; i++) {
		Xil_Out32(PKT_IN_REG, weights[i]);
		Xil_Out32(CTRL_IN_REG, CTRL_IN_PKT_IN_VALID);
		Xil_Out32(CTRL_IN_REG, 0x0);
		while((Xil_In32(CTRL_OUT_REG) & CTRL_OUT_PKT_RCVD) != CTRL_OUT_PKT_RCVD) {} // Wait for the PKT_RCVD signal
	    Xil_Out32(CTRL_IN_REG, CTRL_IN_RST_PKT_RCVD); // Reset the PKT_RCVD signal
	}

	// Output CSV header
	xil_printf(",");
	for (j = 0; j < NEURONS_PER_LAYER; j++) {
		xil_printf("Synapse %d,", j);
	}
	xil_printf("\n");

	for (i = 0; i < NUM_STIMULI; i++) {
		// Set stimuli
		for (j = 0; j < NUM_INPUTS; j++) {
			Xil_Out32(PKT_IN_REG, stimuli[i][j]);
			Xil_Out32(CTRL_IN_REG, CTRL_IN_PKT_IN_VALID);
			Xil_Out32(CTRL_IN_REG, 0x0);
			while((Xil_In32(CTRL_OUT_REG) & CTRL_OUT_PKT_RCVD) != CTRL_OUT_PKT_RCVD) {}
			Xil_Out32(CTRL_IN_REG, CTRL_IN_RST_PKT_RCVD);
		}

		// Wait until the network has finished processing
		while ((Xil_In32(CTRL_OUT_REG) & CTRL_OUT_SYN_OUTS_READY) != CTRL_OUT_SYN_OUTS_READY) { }
		Xil_Out32(CTRL_IN_REG, CTRL_IN_RST_SYN_OUTS_READY); // Reset the SYN_OUTS_READY signal

		// Retrieve the output values
		Xil_Out32(CTRL_IN_REG, CTRL_IN_NXT_SYN_OUT);
		Xil_Out32(CTRL_IN_REG, 0x0);

		// Output
		xil_printf("Stimulus %d,", i);

		for (j = 0; j < NEURONS_PER_LAYER; j++) {
			Xil_Out32(CTRL_IN_REG, CTRL_IN_NXT_SYN_OUT);
			Xil_Out32(CTRL_IN_REG, 0x0);
			u32 result = Xil_In32(SYN_OUTS_REG);
			xil_printf("0x%x,", result);
		}

		xil_printf("\n");
	}

    return 0;
}
