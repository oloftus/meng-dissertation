#include "params.h"
#include "addresses.h"

#ifndef STIMULI_H_
#define STIMULI_H_

void getStimuli(u32* stimuliP) {

	u32 stimuli[NUM_STIMULI][NUM_INPUTS] = {
		{
			pktTypes[1] | stimulusAddresses[0] | 0x1 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[1] | 0x0 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[2] | 0x0 << STIMULUS_INTEGER_POS,
		},
		{
			pktTypes[1] | stimulusAddresses[0] | 0x0 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[1] | 0x1 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[2] | 0x0 << STIMULUS_INTEGER_POS,
		},
		{
			pktTypes[1] | stimulusAddresses[0] | 0x1 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[1] | 0x1 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[2] | 0x0 << STIMULUS_INTEGER_POS,
		},
		{
			pktTypes[1] | stimulusAddresses[0] | 0x0 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[1] | 0x0 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[2] | 0x1 << STIMULUS_INTEGER_POS,
		},
		{
			pktTypes[1] | stimulusAddresses[0] | 0x1 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[1] | 0x0 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[2] | 0x1 << STIMULUS_INTEGER_POS,
		},
		{
			pktTypes[1] | stimulusAddresses[0] | 0x0 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[1] | 0x1 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[2] | 0x1 << STIMULUS_INTEGER_POS,
		},
		{
			pktTypes[1] | stimulusAddresses[0] | 0x1 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[1] | 0x1 << STIMULUS_INTEGER_POS,
			pktTypes[1] | stimulusAddresses[2] | 0x1 << STIMULUS_INTEGER_POS
		}
	};

	int i, j;
	u32* stimuliPCpy = stimuliP;
	for (i = 0; i < NUM_STIMULI; i++) {
		for (j = 0; j < NUM_INPUTS; j++) {
			*(stimuliPCpy++) = stimuli[i][j];
		}
	}
}

#endif /* STIMULI_H_ */
