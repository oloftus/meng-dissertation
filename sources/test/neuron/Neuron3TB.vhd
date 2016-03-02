library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Neuron3TB is
end Neuron3TB;

architecture Behavioral of Neuron3TB is
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
            SYN_2_VALID : in STD_LOGIC;
            SYN_2_DIN : in STD_LOGIC_VECTOR (15 downto 0);
            SYN_OUT_VALID : out STD_LOGIC;
            SYN_OUT : out STD_LOGIC_VECTOR (15 downto 0);
            DONE_OUT : out STD_LOGIC
       );
        end component Neuron;
        
    signal sigClk, sigRst, sigPktInValid, sigSyn0Valid, sigSyn1Valid, sigSyn2Valid, sigSynOutValid, sigDoneOut : STD_LOGIC;
    signal sigPktIn : STD_LOGIC_VECTOR (25 downto 0);
    signal sigSyn0Din, sigSyn1Din, sigSyn2Din : STD_LOGIC_VECTOR (15 downto 0);
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
        SYN_2_DIN => sigSyn2Din, 
        SYN_2_VALID => sigSyn2Valid, 
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
        sigSyn2Valid <= '0';
        sigPktInValid <= '0';
        
        sigPktInValid <= '1';
        sigPktIn <= neuronAddr & "0000" & "0" & "00000000" & "0001000";
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        sigPktInValid <= '1';
        sigPktIn <= neuronAddr & "0001" & "0" & "00000000" & "0000100";
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;

        sigPktInValid <= '1';
        sigPktIn <= neuronAddr & "0010" & "0" & "00000000" & "0000010";
        wait for 200ns;
        sigPktInValid <= '0';

        wait until sigDoneOut = '1';
        wait until sigDoneOut = '0';
        wait for 100ns;
        
        sigSyn0Din <= "0"&"00000000"&"1000000";
        sigSyn0Valid <= '1';
        sigSyn1Din <= "0"&"00000000"&"0100000";
        sigSyn1Valid <= '1';
        sigSyn2Din <= "0"&"00000000"&"0010000";
        sigSyn2Valid <= '1';        
        wait for 200ns;
        sigSyn0Valid <= '0';
        sigSyn1Valid <= '0';
        sigSyn2Valid <= '0';
        
        wait until sigSynOutValid = '1';
        wait for 10ns;
        assert sigSynOut = "0" & "00000000" & "1000001"; --0.51025390625

        wait;
    end process;
end Behavioral;
