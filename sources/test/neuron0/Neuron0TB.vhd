library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Neuron0TB is
end Neuron0TB;

architecture Behavioral of Neuron0TB is
    signal sigClk, sigRst, sigSyn1Valid, sigSyn2Valid, sigSynOutValid : STD_LOGIC;
    signal sigSyn1Din, sigSyn2Din : STD_LOGIC_VECTOR ( 12 downto 0 );
    signal sigSynOut :  STD_LOGIC_VECTOR ( 11 downto 0 );
    
    component Neuron0_wrapper is
      port (
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        
        SYN_1_DIN : in STD_LOGIC_VECTOR ( 12 downto 0 );
        SYN_1_VALID : in STD_LOGIC;
        SYN_2_DIN : in STD_LOGIC_VECTOR ( 12 downto 0 );
        SYN_2_VALID : in STD_LOGIC;
        
        SYN_OUT : out STD_LOGIC_VECTOR ( 11 downto 0 );
        SYN_OUT_VALID : out STD_LOGIC
      );
    end component;
begin
    uut: Neuron0_wrapper
      port map (
        CLK => sigClk,
        RST => sigRst,
        SYN_1_DIN => sigSyn1Din, 
        SYN_1_VALID => sigSyn1Valid, 
        SYN_2_DIN => sigSyn2Din,
        SYN_2_VALID => sigSyn2Valid,
        SYN_OUT => sigSynOut,
        SYN_OUT_VALID => sigSynOutValid
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
        
        sigSyn1Din <= "0"&"000000"&"100000"; -- 0.5
        sigSyn1Valid <= '1';
        sigSyn2Din <= "0"&"000000"&"100000"; -- 0.5
        sigSyn2Valid <= '1';
        
        wait for 200ns;
        
        wait;
    end process;
end Behavioral;
