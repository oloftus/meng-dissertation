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

entity NetworkTB is
end NetworkTB;

architecture Behavioral of NetworkTB is
    component Network_Test is
        port (
            CLK : in STD_LOGIC;
            RST : in STD_LOGIC;
            PKT_IN : in STD_LOGIC_VECTOR (31 downto 0);
            PKT_IN_VALID : in STD_LOGIC;
            NXT_SYN_OUT : in STD_LOGIC;
            DONE_OUT : out STD_LOGIC;
            SYN_OUTS : out STD_LOGIC_VECTOR (31 downto 0);
            SYN_OUTS_READY : out STD_LOGIC
        );
    end component;
    
    type LAYER_ADDR_ARRAY is array (INTEGER range <>) of STD_LOGIC_VECTOR (1 downto 0);
    type NEURON_ADDR_ARRAY is array (INTEGER range <>) of STD_LOGIC_VECTOR (2 downto 0);
    type SYNAPSE_ADDR_ARRAY is array (INTEGER range <>) of STD_LOGIC_VECTOR (2 downto 0);

    constant stimulusType : STD_LOGIC := '1';
    constant weightType : STD_LOGIC_VECTOR := "0";
    
    constant layerAddresses : LAYER_ADDR_ARRAY (0 to 1) := ("00", "01");
    constant neuronAddresses : NEURON_ADDR_ARRAY (0 to 1) := ("000", "001");
    constant synapseAddresses : SYNAPSE_ADDR_ARRAY (0 to 2) := ("000", "001", "010");
    constant stimulusRegisterAddress : STD_LOGIC_VECTOR (1 downto 0) := "00";
    
    constant expected1 : STD_LOGIC_VECTOR (7 downto 0) := "1"&"0000000"; -- 1
    constant expected2 : STD_LOGIC_VECTOR (7 downto 0) := "0"&"1111101"; -- 0.985257076 (0.976563)
--    constant expected3 : UNSIGNED (15 downto 0) := "0" & "00000000" & "1010110"; -- 0.5751953125
--    constant expected4 : UNSIGNED (15 downto 0) := "0" & "00000000" & "1001010"; -- 0.5751953125
    
    signal sigClk, sigRst, sigPktInValid, sigNxtSynOut, sigDoneOut, sigSynOutsReady : STD_LOGIC;
    signal sigPktIn, sigSynOuts : STD_LOGIC_VECTOR (31 downto 0);
begin
    uut: Network_Test
      port map (
        CLK => sigClk,
        RST => sigRst,
        PKT_IN => sigPktIn,
        PKT_IN_VALID => sigPktInValid,
        NXT_SYN_OUT => sigNxtSynOut,
        DONE_OUT => sigDoneOut,
        SYN_OUTS => sigSynOuts,
        SYN_OUTS_READY => sigSynOutsReady
      );
    
    clock: process begin
        sigClk <= '0';
        wait for 100ns;
        sigClk <= '1';
        wait for 100ns;
    end process;
    
    tb: process begin
        sigNxtSynOut <= '0';
        sigPktInValid <= '0';
        sigPktIn <= (others => '0');
        
        sigRst <= '1';
        wait for 200ns;
        sigRst <= '0';
        
        -- Set weights/biases --------------------------
        
        -- Layer 0 Neuron 0
        -- Bias
        sigPktInValid <= '1';
        sigPktIn(24 downto 0) <= weightType & layerAddresses(0) & neuronAddresses(0) & synapseAddresses(0) & "0"&"0001"&"01010101010"; -- 1.3331 (1.333008)
        sigPktIn(31 downto 25) <= (others => '0');
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        -- Weight 1
        sigPktInValid <= '1';
        sigPktIn(24 downto 0) <= weightType & layerAddresses(0) & neuronAddresses(0) & synapseAddresses(1) & "0"&"0010"&"10101010100"; -- 2.6665
        sigPktIn(31 downto 25) <= (others => '0');
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        -- Layer 0 Neuron 1
        -- Bias
        sigPktInValid <= '1';
        sigPktIn(24 downto 0) <= weightType & layerAddresses(0) & neuronAddresses(1) & synapseAddresses(0) & "0"&"0010"&"01010101010"; -- 2.3331 (2.333008)
        sigPktIn(31 downto 25) <= (others => '0');
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        -- Weight 1
        sigPktInValid <= '1';
        sigPktIn(24 downto 0) <= weightType & layerAddresses(0) & neuronAddresses(1) & synapseAddresses(1) & "0"&"0001"&"10101010100"; -- 1.6665 (1.66602)
        sigPktIn(31 downto 25) <= (others => '0');
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        -- Layer 1 Neuron 0
        -- Bias
        sigPktInValid <= '1';
        sigPktIn(24 downto 0) <= weightType & layerAddresses(1) & neuronAddresses(0) & synapseAddresses(0) & "0"&"0001"&"01010101010"; -- 1.3331 (1.333008)
        sigPktIn(31 downto 25) <= (others => '0');
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        -- Weight 1
        sigPktInValid <= '1';
        sigPktIn(24 downto 0) <= weightType & layerAddresses(1) & neuronAddresses(0) & synapseAddresses(1) & "0"&"0010"&"10101010100"; -- 2.6665 (2.66602)
        sigPktIn(31 downto 25) <= (others => '0');
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        -- Weight 2
        sigPktInValid <= '1';
        sigPktIn(24 downto 0) <= weightType & layerAddresses(1) & neuronAddresses(0) & synapseAddresses(2) & "0"&"0001"&"10101010100"; -- 1.6665 (1.66602)
        sigPktIn(31 downto 25) <= (others => '0');
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        -- Layer 1 Neuron 1
        -- Bias
        sigPktInValid <= '1';
        sigPktIn(24 downto 0) <= weightType & layerAddresses(1) & neuronAddresses(1) & synapseAddresses(0) & "0"&"0000"&"01010101010"; -- 0.3331 (0.333008)
        sigPktIn(31 downto 25) <= (others => '0');
        wait for 200ns;
        sigPktInValid <= '0';
        
        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;
        
        -- Weight 1
        sigPktInValid <= '1';
        sigPktIn(24 downto 0) <= weightType & layerAddresses(1) & neuronAddresses(1) & synapseAddresses(1) & "0"&"0010"&"10101010100"; -- 2.6665 (2.66602)
        sigPktIn(31 downto 25) <= (others => '0');
        wait for 200ns;
        sigPktInValid <= '0';
        
        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;
        
        -- Weight 2
        sigPktInValid <= '1';
        sigPktIn(24 downto 0) <= weightType & layerAddresses(1) & neuronAddresses(1) & synapseAddresses(2) & "0"&"0001"&"10101010100"; -- 1.6665 (1.66602)
        sigPktIn(31 downto 25) <= (others => '0');
        wait for 200ns;
        sigPktInValid <= '0';
        
        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;
        
        -- Test the network works

        sigPktInValid <= '1';
        sigPktIn(9 downto 0) <= stimulusRegisterAddress & "0"&"1111111"; -- 0.99219 (0.992188)
        sigPktIn(31 downto 10) <= (24 => stimulusType, others => '0');
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigSynOutsReady = '1';
        
        sigNxtSynOut <= '1';
        wait for 210ns;
        assert sigSynOuts(7 downto 0) = expected1 report "Test failed: 1";
        wait for 200ns;
        assert sigSynOuts(7 downto 0) = expected2 report "Test failed: 2"; 
        sigNxtSynOut <= '0';
        
        -- Test the network works again

--        sigPktInValid <= '1';
--        sigPktIn <= stimulusType & blank & synapseAddresses(0) & "0" & "00000110" & "0000000"; -- 6
--        wait for 200ns;
--        sigPktInValid <= '0';

--        wait until sigDoneOut = '1';
--        wait until sigDoneOut = '0';
--        wait for 100ns;

--        sigPktInValid <= '1';
--        sigPktIn <= stimulusType & blank & synapseAddresses(1) & "0" & "00000010" & "0000000"; -- 2
--        wait for 200ns;
--        sigPktInValid <= '0';

--        wait until sigSynOutsReady = '1';

--        sigNxtSynOut <= '1';
--        wait for 210ns;
--        assert sigSynOuts = STD_LOGIC_VECTOR(pad7 & expected3, 32)) report "Test failed: 3";
--        wait for 200ns;
--        assert sigSynOuts = STD_LOGIC_VECTOR(pad7 & expected4, 32)) report "Test failed: 4"; 
--        sigNxtSynOut <= '0';
        
        wait;
    end process;

end Behavioral;
