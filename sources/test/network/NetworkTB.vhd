library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity NetworkTB is
end NetworkTB;

architecture Behavioral of NetworkTB is
    component Network is
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
    
    type SYNAPSE_ADDR_ARRAY is array (INTEGER range <>) of STD_LOGIC_VECTOR (3 downto 0);
    type LAYER_ADDR_ARRAY is array (INTEGER range <>) of STD_LOGIC_VECTOR (4 downto 0);
    type NEURON_ADDR_ARRAY is array (INTEGER range <>) of STD_LOGIC_VECTOR (5 downto 0);

    constant stimulusType : STD_LOGIC_VECTOR := "1";
    constant weightType : STD_LOGIC_VECTOR := "0";
    constant blank : STD_LOGIC_VECTOR (10 downto 0) := "00000" & "000000";
    constant layerAddresses : LAYER_ADDR_ARRAY (0 to 1) := ("00000", "00001");
    constant neuronAddresses : NEURON_ADDR_ARRAY (0 to 1) := ("000000", "000001");
    constant synapseAddresses : SYNAPSE_ADDR_ARRAY (0 to 1) := ("0000", "0001");
    
    constant expected1 : UNSIGNED (15 downto 0) := "0" & "00000000" & "1010011"; -- 0.650390625
    constant expected2 : UNSIGNED (15 downto 0) := "0" & "00000000" & "1001001"; -- 0.5751953125

    signal sigClk, sigRst, sigPktInValid, sigNxtSynOut, sigDoneOut, sigSynOutsReady : STD_LOGIC;
    signal sigPktIn, sigSynOuts : STD_LOGIC_VECTOR (31 downto 0);
begin
    uut: Network
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
        sigRst <= '1';
        wait for 200ns;
        sigRst <= '0';
        
        -- Set weights --------------------------
        
        sigPktInValid <= '1';
        sigPktIn <= weightType & layerAddresses(0) & neuronAddresses(0) & synapseAddresses(0) & "0" & "00000000" & "1000000"; -- 0.5
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        sigPktInValid <= '1';
        sigPktIn <= weightType & layerAddresses(0) & neuronAddresses(0) & synapseAddresses(1) & "0" & "00000000" & "0100000"; -- 0.25
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        sigPktInValid <= '1';
        sigPktIn <= weightType & layerAddresses(0) & neuronAddresses(1) & synapseAddresses(0) & "0" & "00000000" & "0100000"; --0.25
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        sigPktInValid <= '1';
        sigPktIn <= weightType & layerAddresses(0) & neuronAddresses(1) & synapseAddresses(1) & "0" & "00000000" & "0010000"; -- 0.125
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        sigPktInValid <= '1';
        sigPktIn <= weightType & layerAddresses(1) & neuronAddresses(0) & synapseAddresses(0) & "0" & "00000000" & "1000000"; -- 0.5
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        sigPktInValid <= '1';
        sigPktIn <= weightType & layerAddresses(1) & neuronAddresses(0) & synapseAddresses(1) & "0" & "00000000" & "0100000"; -- 0.25
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        sigPktInValid <= '1';
        sigPktIn <= weightType & layerAddresses(1) & neuronAddresses(1) & synapseAddresses(0) & "0" & "00000000" & "0100000"; -- 0.25
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        sigPktInValid <= '1';
        sigPktIn <= weightType & layerAddresses(1) & neuronAddresses(1) & synapseAddresses(1) & "0" & "00000000" & "0010000"; -- 0.125
        wait for 200ns;
        sigPktInValid <= '0';
        
        -- Set stimuli --------------------------
        
        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        sigPktInValid <= '1';
        sigPktIn <= stimulusType & blank & synapseAddresses(0) & "0" & "00000011" & "0000000"; -- 3
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        sigPktInValid <= '1';
        sigPktIn <= stimulusType & blank & synapseAddresses(1) & "0" & "00000001" & "0000000"; -- 1
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigSynOutsReady = '1';
        sigNxtSynOut <= '1';
        wait for 210ns;
        assert sigSynOuts = STD_LOGIC_VECTOR(Resize(expected1, 32)) report "Test failed: 1";
        wait for 200ns;
        assert sigSynOuts = STD_LOGIC_VECTOR(Resize(expected2, 32)) report "Test failed: 2"; 
        
        wait;
    end process;

end Behavioral;
