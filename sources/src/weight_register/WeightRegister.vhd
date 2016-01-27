library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity WeightRegister is
    generic (
        dataSize : INTEGER;
        addrSize : INTEGER
    );
    port (
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;

        ADDR : in STD_LOGIC_VECTOR (addrSize - 1 downto 0);
        WOUT : out STD_LOGIC_VECTOR (dataSize - 1 downto 0);

        WVALID : in STD_LOGIC;
        WADDR : in STD_LOGIC_VECTOR (addrSize - 1 downto 0);
        WIN : in STD_LOGIC_VECTOR (dataSize - 1 downto 0)
    );
end WeightRegister;

architecture Behavioral of WeightRegister is
    signal sigSet : STD_LOGIC;
    
    component Latch is
        generic (
            size : INTEGER
        );
        port (
            CLK : in STD_LOGIC;
            SET : in STD_LOGIC;
            RST : in STD_LOGIC;
            DIN : in STD_LOGIC_VECTOR (size - 1 downto 0);
            DOUT : out STD_LOGIC_VECTOR (size - 1 downto 0) 
        );
    end component;
begin
    sigSet <= '1' when WADDR = ADDR and WVALID = '1' else '0';
    
    latch_inst: Latch
        generic map (
            size => dataSize
        )
        port map (
            CLK => CLK,
            SET => sigSet,
            RST => RST,
            DIN => WIN,
            DOUT => WOUT 
        );
end Behavioral;
