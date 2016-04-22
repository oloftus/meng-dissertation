#include <stdio.h>
#include <xil_io.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_types.h"

#include "addresses.h"
#include "stimuli.h"

#if CCB == 0 && PO2 == 0
#include "weights.h"
#endif

#if PO2 == 1
#include "weights_po2.h"
#endif

#if CCB == 1
#include "weights_ccb.h"
#endif

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

int main()
{
    init_platform();

    u32 weights[NUM_WEIGHTS];
    u32 stimuli[NUM_STIMULI][NUM_INPUTS];

    getWeights(weights);
	getStimuli(stimuli);

    u32 i, j;

	// Set weights
#if HAS_SWRN == 1
	for (i = 0; i < NUM_WEIGHTS; i++) {
		Xil_Out32(PKT_IN_REG, weights[i]);
		Xil_Out32(CTRL_IN_REG, CTRL_IN_PKT_IN_VALID);
		Xil_Out32(CTRL_IN_REG, 0x0);
		while((Xil_In32(CTRL_OUT_REG) & CTRL_OUT_PKT_RCVD) != CTRL_OUT_PKT_RCVD) {} // Wait for the PKT_RCVD signal
		Xil_Out32(CTRL_IN_REG, CTRL_IN_RST_PKT_RCVD); // Reset the PKT_RCVD signal
	}
#endif

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
