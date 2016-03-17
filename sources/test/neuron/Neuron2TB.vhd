library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--$NUM_LAYERS = 2;
--$NEURONS_PER_LAYER = 2;
--$NUM_INPUTS = 1;

--$VAL_INTEGER_PRECISION = 4;
--$VAL_FRACTION_PRECISION = 7;
--$WEIGHT_INTEGER_PRECISION = 4;
--$WEIGHT_FRACTION_PRECISION = 11;

--$PKT_TYPE_ADDR_WIDTH = 1;
--$PKT_LAYER_ADDR_WIDTH = 2;
--$PKT_NEURON_ADDR_WIDTH = 3;
--$PKT_SYNAPSE_ADDR_WIDTH = 3;
--$PKT_STIMULUS_REG_ADDR_WIDTH = 2;
--$STIMULUS_TYPE = 1;
--$WEIGHT_TYPE = 0;

-- Test vectors came from "Experiment 1 test.xlsx"

entity Neuron2TB is
end Neuron2TB;

architecture Behavioral of Neuron2TB is
    component Neuron is
        port (
            CLK : in STD_LOGIC;
            RST : in STD_LOGIC;
            PKT_IN_VALID : in STD_LOGIC;
            PKT_IN : in STD_LOGIC_VECTOR (21 downto 0); -- 3+3+1+4+11
            NEURON_ADDR : in STD_LOGIC_VECTOR (2 downto 0); -- 3
            SYN_0_VALID : in STD_LOGIC;
            SYN_0_DIN : in STD_LOGIC_VECTOR (7 downto 0); -- 1+7
            SYN_1_VALID : in STD_LOGIC;
            SYN_1_DIN : in STD_LOGIC_VECTOR (7 downto 0);
            SYN_OUT_VALID : out STD_LOGIC;
            SYN_OUT : out STD_LOGIC_VECTOR (7 downto 0);
            DONE_OUT : out STD_LOGIC
        );
    end component Neuron;
        
    signal sigClk, sigRst, sigPktInValid, sigSyn0Valid, sigSyn1Valid, sigSynOutValid, sigDoneOut : STD_LOGIC;
    signal sigPktIn : STD_LOGIC_VECTOR (21 downto 0);
    signal sigSyn0Din, sigSyn1Din, sigSynOut : STD_LOGIC_VECTOR (7 downto 0);
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
        
        -- Test for +ve numbers
        -- Bias
        sigPktInValid <= '1';
        sigPktIn <= neuronAddr & "000" & "0"&"0001"&"01010101010" ;-- 1.3331 <neuron_addr>.<synapse_addr>.<sign>.<int>.<frac>.<pad>
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        -- Weight 1
        sigPktInValid <= '1';
        sigPktIn <= neuronAddr & "001" & "0"&"0010"&"10101010100"; -- 2.6665
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        -- Weight 2
        sigPktInValid <= '1';
        sigPktIn <= neuronAddr & "010" & "0"&"0001"&"10101010100"; -- 1.6665
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        -- Synaptic input 1
        sigSyn0Din <= "1"&"0000000"; -- 1
        sigSyn0Valid <= '1';
        wait for 200ns;
        sigSyn0Valid <= '0';
        
        -- Synaptic input 2
        sigSyn1Din <= "0"&"0101010"; -- 0.330096159 (0.328125)
        sigSyn1Valid <= '1';
        wait for 200ns;
        sigSyn1Valid <= '0';

        -- Assertions
        wait until sigSynOutValid = '1';
        wait for 10ns;
        assert sigSynOut = "0"&"1111110" report "Test failed: 1"; -- 0.985928289 (0.984375)

        wait until sigSynOutValid = '0';
        wait for 100ns;

        -- Test for -ve numbers
        -- Weight 2
        sigPktInValid <= '1';
        sigPktIn <= neuronAddr & "010" & "1"&"1110"&"01010101100"; -- -1.6665
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        -- Synaptic input 1
        sigSyn0Din <= "1"&"0000000"; -- 1
        sigSyn0Valid <= '1';
        wait for 200ns;
        sigSyn0Valid <= '0';
        
        -- Synaptic input 2
        sigSyn1Din <= "0"&"0101010"; -- 0.330096159 (0.328125)
        sigSyn1Valid <= '1';
        wait for 200ns;
        sigSyn1Valid <= '0';

        -- Assertions
        wait until sigSynOutValid = '1';
        wait for 10ns;
        assert sigSynOut = "0"&"1111001" report "Test failed: 2"; -- 0.951649365 (0.945313)

        wait until sigSynOutValid = '0';
        wait for 100ns;
        wait;
    end process;
end Behavioral;
