library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Synapse is
    generic (
        size : INTEGER
    );
    port (
        CLK, CLR, RST : in STD_LOGIC;
        SYN_IN_VALID : in STD_LOGIC;
        SYN_IN : in STD_LOGIC_VECTOR (size - 1 downto 0);
        SYN_OUT_VALID : out STD_LOGIC;
        SYN_OUT : out STD_LOGIC_VECTOR (size - 1 downto 0)
    );
end Synapse;

architecture Behavioral of Synapse is
    signal sigRegSet, sigSynOutValid : STD_LOGIC;
begin
    SYN_OUT_VALID <= sigSynOutValid;
    sigRegSet <= SYN_IN_VALID and not sigSynOutValid;

    valid_proc: process (CLK) begin
        if Rising_Edge(CLK) then
            if SYN_IN_VALID = '1' then
                sigSynOutValid <= SYN_IN_VALID;
            elsif RST = '1' or CLR = '1' then
                sigSynOutValid <= '0';
            end if;
        end if;
    end process;
    
    register_proc: process (CLK) begin
        if Rising_Edge(CLK) then
            if sigRegSet = '1' then
                SYN_OUT <= SYN_IN;
            elsif RST = '1' then
                SYN_OUT <= (others => '0');
            end if;
        end if;
    end process;
end Behavioral;
