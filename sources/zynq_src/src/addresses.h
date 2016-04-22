#include "params.h"

#ifndef ADDRESSES_H_
#define ADDRESSES_H_

extern u32 pktTypes[2] = { 0, 1 << TYPE_ADDR_POS }; // Weight: 0; Stimulus: 1
extern u32 layerAddresses[NUM_LAYERS] = { 0, 1 << LAYER_ADDR_POS };
extern u32 neuronAddresses[NEURONS_PER_LAYER] = { 0, 1 << NEURON_ADDR_POS, 2 << NEURON_ADDR_POS, 3 << NEURON_ADDR_POS, 4 << NEURON_ADDR_POS };
extern u32 synapseAddresses[NEURONS_PER_LAYER + 1] = { 0, 1 << SYNAPSE_ADDR_POS, 2 << SYNAPSE_ADDR_POS, 3 << SYNAPSE_ADDR_POS, 4 << SYNAPSE_ADDR_POS, 5 << SYNAPSE_ADDR_POS };
extern u32 stimulusAddresses[NUM_INPUTS] = { 0, 1 << STIMULUS_ADDR_POS, 2 << STIMULUS_ADDR_POS };

#endif /* ADDRESSES_H_ */
