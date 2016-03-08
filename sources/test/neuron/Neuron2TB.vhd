library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Neuron2TB is
end Neuron2TB;

architecture Behavioral of Neuron2TB is
    component Neuron is
        port (
            CLK : in STD_LOGIC;
            RST : in STD_LOGIC;
            PKT_IN_VALID : in STD_LOGIC;
            PKT_IN : in STD_LOGIC_VECTOR (25 downto 0);
            NEURON_ADDR : in STD_LOGIC_VECTOR (5 downto 0);
            SYN_0_VALID : in STD_LOGIC;
            SYN_0_DIN : in STD_LOGIC_VECTOR (15 downto 0);
            SYN_1_VALID : in STD_LOGIC;
            SYN_1_DIN : in STD_LOGIC_VECTOR (15 downto 0);
            SYN_OUT_VALID : out STD_LOGIC;
            SYN_OUT : out STD_LOGIC_VECTOR (15 downto 0);
            DONE_OUT : out STD_LOGIC
       );
        end component Neuron;
        
    signal sigClk, sigRst, sigPktInValid, sigSyn0Valid, sigSyn1Valid, sigSynOutValid, sigDoneOut : STD_LOGIC;
    signal sigPktIn : STD_LOGIC_VECTOR (25 downto 0);
    signal sigSyn0Din, sigSyn1Din : STD_LOGIC_VECTOR (15 downto 0);
    signal sigSynOut :  STD_LOGIC_VECTOR (15 downto 0);
    signal sigNeuronAddr : STD_LOGIC_VECTOR (5 downto 0);
    
    constant neuronAddr : STD_LOGIC_VECTOR (5 downto 0) := "000001";
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
        
        sigPktInValid <= '1';
        sigPktIn <= neuronAddr & "0000" & "0" & "00000000" & "1000000"; -- 0.5
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        sigPktInValid <= '1';
        sigPktIn <= neuronAddr & "0001" & "0" & "00000000" & "0100000"; -- 0.25
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        -- Test the neuron works
        sigSyn0Din <= "0"&"00000011"&"0000000"; -- 3
        sigSyn0Valid <= '1';
        wait for 200ns;
        sigSyn0Valid <= '0';
        
        sigSyn1Din <= "0"&"00000001"&"0000000"; -- 1
        sigSyn1Valid <= '1';        
        wait for 200ns;
        sigSyn1Valid <= '0';

        wait until sigSynOutValid = '1';
        wait for 10ns;
        assert sigSynOut = "0" & "00000000" & "1101100" report "Test failed: 1"; -- 0.84375
        
        wait until sigSynOutValid = '0';
        wait for 100ns;

        -- Test the neuron works again
        sigSyn0Din <= "0"&"00000110"&"0000000"; -- 6
        sigSyn0Valid <= '1';
        wait for 200ns;
        sigSyn0Valid <= '0';
        
        sigSyn1Din <= "0"&"00000010"&"0000000"; -- 2
        sigSyn1Valid <= '1';        
        wait for 200ns;
        sigSyn1Valid <= '0';

        wait until sigSynOutValid = '1';
        wait for 10ns;
        assert sigSynOut = "0" & "00000000" & "1111010" report "Test failed: 2"; -- 0.953125
        
        wait;
    end process;
end Behavioral;
