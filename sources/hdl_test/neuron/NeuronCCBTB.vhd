library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--$NUM_LAYERS = 2;
--$NEURONS_PER_LAYER = 2;
--$NUM_INPUTS = 1;

--$VAL_INTEGER_PRECISION = 4;
--$VAL_FRACTION_PRECISION = 7;
--$WEIGHT_INTEGER_PRECISION = 5;
--$WEIGHT_FRACTION_PRECISION = 10;

--$PKT_TYPE_ADDR_WIDTH = 1;
--$PKT_LAYER_ADDR_WIDTH = 2;
--$PKT_NEURON_ADDR_WIDTH = 3;
--$PKT_SYNAPSE_ADDR_WIDTH = 3;
--$PKT_STIMULUS_REG_ADDR_WIDTH = 2;
--$STIMULUS_TYPE = 1;
--$WEIGHT_TYPE = 0;

-- Test vectors came from "Experiment 1 test.xlsx"

entity NeuronCCBTB is
end NeuronCCBTB;

architecture Behavioral of NeuronCCBTB is
    component Neuron is
        port (
            CLK : in STD_LOGIC;
            RST : in STD_LOGIC;
            PKT_IN_VALID : in STD_LOGIC;
            PKT_IN : in STD_LOGIC_VECTOR (17 downto 0);
            NEURON_ADDR : in STD_LOGIC_VECTOR (2 downto 0);
            SYN_0_VALID : in STD_LOGIC;
            SYN_0_DIN : in STD_LOGIC_VECTOR (0 downto 0);
            SYN_1_VALID : in STD_LOGIC;
            SYN_1_DIN : in STD_LOGIC_VECTOR (0 downto 0);
            SYN_OUT_VALID : out STD_LOGIC;
            SYN_OUT : out STD_LOGIC;
            DONE_OUT : out STD_LOGIC
        );
    end component Neuron;
        
    signal sigClk, sigRst, sigPktInValid, sigSyn0Valid, sigSyn1Valid, sigSynOutValid, sigDoneOut : STD_LOGIC;
    signal sigPktIn : STD_LOGIC_VECTOR (17 downto 0);
    signal sigSyn0Din, sigSyn1Din : STD_LOGIC_VECTOR (0 downto 0);
    signal sigSynOut : STD_LOGIC;
    signal sigNeuronAddr : STD_LOGIC_VECTOR (2 downto 0);
    
    constant neuronAddr : STD_LOGIC_VECTOR (2 downto 0) := "001";
begin
    uut: Neuron
      port map (
        CLK => sigClk,
        RST => sigRst,
        PKT_IN_VALID => sigPktInValid,
        PKT_IN => sigPktIn,
        NEURON_ADDR => sigNeuronAddr,
        SYN_0_DIN => sigSyn0Din,
        SYN_0_VALID => sigSyn0Valid,
        SYN_1_DIN => sigSyn1Din, 
        SYN_1_VALID => sigSyn1Valid, 
        SYN_OUT_VALID => sigSynOutValid,
        SYN_OUT => sigSynOut,
        DONE_OUT => sigDoneOut
     );
      
    clock: process begin
        sigClk <= '0';
        wait for 100ns;
        sigClk <= '1';
        wait for 100ns;
    end process;
    
    tb: process begin
        sigRst <= '1';
        wait for 200ns;
        sigRst <= '0';
        
        sigNeuronAddr <= neuronAddr;
        sigSyn0Valid <= '0';
        sigSyn1Valid <= '0';
        sigPktInValid <= '0';
        
        -- Test for >0.5
        -- Bias
        sigPktInValid <= '1';
        sigPktIn <= neuronAddr & "000" & "0"&"0001"&"0101011" ;-- 1.3331 <neuron_addr>.<synapse_addr>.<sign>.<int>.<frac>.<pad>
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        -- Weight 1
        sigPktInValid <= '1';
        sigPktIn <= neuronAddr & "001" & "0"&"0010"&"1010110"; -- 2.6665
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        -- Weight 2
        sigPktInValid <= '1';
        sigPktIn <= neuronAddr & "010" & "0"&"0001"&"1010110"; -- 1.6665
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        -- Synaptic input 1
        sigSyn0Din <= "1";
        sigSyn0Valid <= '1';
        wait for 200ns;
        sigSyn0Valid <= '0';
        
        -- Synaptic input 2
        sigSyn1Din <= "0";
        sigSyn1Valid <= '1';
        wait for 200ns;
        sigSyn1Valid <= '0';

        -- Assertions
        wait until sigSynOutValid = '1';
        wait for 10ns;
        assert sigSynOut = '1' report "Test failed: 1";

        wait for 200ns;

        -- Test for <0.5
        -- Bias
        sigPktInValid <= '1';
        sigPktIn <= neuronAddr & "000" & "0"&"0001"&"0000000"; -- 1
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        -- Weight 1
        sigPktInValid <= '1';
        sigPktIn <= neuronAddr & "001" & "0"&"0010"&"1010110"; -- 2.6665
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        -- Weight 2
        sigPktInValid <= '1';
        sigPktIn <= neuronAddr & "010" & "1"&"1110"&"0101011"; -- -1.6665
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        -- Synaptic input 1
        sigSyn0Din <= "0";
        sigSyn0Valid <= '1';
        wait for 200ns;
        sigSyn0Valid <= '0';
        
        -- Synaptic input 2
        sigSyn1Din <= "1";
        sigSyn1Valid <= '1';
        wait for 200ns;
        sigSyn1Valid <= '0';

        -- Assertions
        wait until sigSynOutValid = '0';
        wait for 10ns;
        assert sigSynOut = '0' report "Test failed: 2";
        
        wait;
    end process;
end Behavioral;
