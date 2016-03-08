#include <stdio.h>
#include <xil_io.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_types.h"

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

#define TYPE_POS 31
#define LAYER_POS 26
#define NEURON_POS 20
#define SYNAPSE_POS 16
#define SIGN_POS 15
#define INTEGER_POS 7

#define NUM_WEIGHTS 8
#define NUM_STIMULI 2

int main()
{
    init_platform();


    // Weights and stimuli
    u32 pktTypes[2] = { 0 , 1 << TYPE_POS }; // Weight: 0; Stimulus: 1
    u32 layerAddresses[2] = { 0, 0x1 << LAYER_POS };
    u32 neuronAddresses[2] = { 0, 0x1 << NEURON_POS };
    u32 synapseAddresses[2] = { 0, 0x1 << SYNAPSE_POS };

    u32 weights[NUM_WEIGHTS] = {
      pktTypes[0] | layerAddresses[0] | neuronAddresses[0] | synapseAddresses[0] | 0x0 << SIGN_POS | 0x0 << INTEGER_POS | 0x40, // 0.5
      pktTypes[0] | layerAddresses[0] | neuronAddresses[0] | synapseAddresses[1] | 0x0 << SIGN_POS | 0x0 << INTEGER_POS | 0x20, // 0.25
      pktTypes[0] | layerAddresses[0] | neuronAddresses[1] | synapseAddresses[0] | 0x0 << SIGN_POS | 0x0 << INTEGER_POS | 0x20, // 0.25
      pktTypes[0] | layerAddresses[0] | neuronAddresses[1] | synapseAddresses[1] | 0x0 << SIGN_POS | 0x0 << INTEGER_POS | 0x10, // 0.125
      pktTypes[0] | layerAddresses[1] | neuronAddresses[0] | synapseAddresses[0] | 0x0 << SIGN_POS | 0x0 << INTEGER_POS | 0x40, // 0.5
      pktTypes[0] | layerAddresses[1] | neuronAddresses[0] | synapseAddresses[1] | 0x0 << SIGN_POS | 0x0 << INTEGER_POS | 0x20, // 0.25
      pktTypes[0] | layerAddresses[1] | neuronAddresses[1] | synapseAddresses[0] | 0x0 << SIGN_POS | 0x0 << INTEGER_POS | 0x20, // 0.25
      pktTypes[0] | layerAddresses[1] | neuronAddresses[1] | synapseAddresses[1] | 0x0 << SIGN_POS | 0x0 << INTEGER_POS | 0x10 // 0.125
    };

    u32 stimuli[NUM_STIMULI + 2] = {
      pktTypes[1] | synapseAddresses[0] | 0x0 << SIGN_POS | 0x3 << INTEGER_POS  | 0x0, // 3
      pktTypes[1] | synapseAddresses[1] | 0x0 << SIGN_POS | 0x1 << INTEGER_POS | 0x0 // 1
    };


    // Reset things (REMOVE WHEN THE PROGRAM IS STABLE)
    Xil_Out32(CTRL_IN_REG, CTRL_IN_RST_SYN_OUTS_READY);
    Xil_Out32(CTRL_IN_REG, CTRL_IN_RST_PKT_RCVD);


	u32 i;

	// Set weights
	for (i = 0; i < NUM_WEIGHTS; i++) {
		Xil_Out32(PKT_IN_REG, weights[i]);
		Xil_Out32(CTRL_IN_REG, CTRL_IN_PKT_IN_VALID);
		Xil_Out32(CTRL_IN_REG, 0x0);
		while((Xil_In32(CTRL_OUT_REG) & CTRL_OUT_PKT_RCVD) != CTRL_OUT_PKT_RCVD) {} // Wait for the PKT_RCVD signal
	    Xil_Out32(CTRL_IN_REG, CTRL_IN_RST_PKT_RCVD); // Reset the PKT_RCVD signal
	}

	// Set stimuli
	for (i = 0; i < NUM_STIMULI; i++) {
		Xil_Out32(PKT_IN_REG, stimuli[i]);
		Xil_Out32(CTRL_IN_REG, CTRL_IN_PKT_IN_VALID);
		Xil_Out32(CTRL_IN_REG, 0x0);
		while((Xil_In32(CTRL_OUT_REG) & CTRL_OUT_PKT_RCVD) != CTRL_OUT_PKT_RCVD) {}
	    Xil_Out32(CTRL_IN_REG, CTRL_IN_RST_PKT_RCVD);
	}


    // Wait until the network has finished processing
	while ((Xil_In32(CTRL_OUT_REG) & CTRL_OUT_SYN_OUTS_READY) != CTRL_OUT_SYN_OUTS_READY) { }
    Xil_Out32(CTRL_IN_REG, CTRL_IN_RST_SYN_OUTS_READY); // Reset the SYN_OUTS_READY signal


    // Retrieve the output values
	for (i = 0; i < NUM_STIMULI; i++) {
		Xil_Out32(CTRL_IN_REG, CTRL_IN_NXT_SYN_OUT);
		Xil_Out32(CTRL_IN_REG, 0x0);
		u32 result = Xil_In32(SYN_OUTS_REG);
		xil_printf("SYN_OUTS_REG %D: %X \r\n", i, result);
	}


    return 0;
}
