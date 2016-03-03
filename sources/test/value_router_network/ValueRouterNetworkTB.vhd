library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ValueRouterNetworkTB is
end ValueRouterNetworkTB;

architecture Behavioral of ValueRouterNetworkTB is
    signal sigClk, sigDone, sigPktInValid, sigRst, sigSyn0Valid, sigSyn1Valid : STD_LOGIC;
    signal sigPktIn : STD_LOGIC_VECTOR (31 downto 0);
    signal sigSyn0Data, sigSyn1Data, sigWeight0Data, sigWeight1Data, sigWeight2Data, sigWeight3Data,
        sigWeight4Data, sigWeight5Data, sigWeight6Data, sigWeight7Data : STD_LOGIC_VECTOR (15 downto 0);
    
    component ValueRouterNetworkTest is
        port (
            CLK : in STD_LOGIC;
            PKT_IN_VALID : in STD_LOGIC;
            PKT_IN : in STD_LOGIC_VECTOR ( 31 downto 0 );
            RST : in STD_LOGIC;
            SYN_0_VALID : out STD_LOGIC;
            SYN_1_VALID : out STD_LOGIC;
            SYN_0_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
            SYN_1_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
            WEIGHT_0_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
            WEIGHT_1_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
            WEIGHT_2_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
            WEIGHT_3_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
            WEIGHT_4_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
            WEIGHT_5_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
            WEIGHT_6_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
            WEIGHT_7_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
            DONE : out STD_LOGIC
        );
    end component ValueRouterNetworkTest;
begin
    uut: ValueRouterNetworkTest
        port map (
            CLK => sigClk,
            DONE => sigDone,
            PKT_IN => sigPktIn,
            PKT_IN_VALID => sigPktInValid,
            RST => sigRst,
            SYN_0_DATA => sigSyn0Data,
            SYN_0_VALID => sigSyn0Valid,
            SYN_1_DATA => sigSyn1Data,
            SYN_1_VALID => sigSyn1Valid,
            WEIGHT_0_DATA => sigWeight0Data,
            WEIGHT_1_DATA => sigWeight1Data,
            WEIGHT_2_DATA => sigWeight2Data,
            WEIGHT_3_DATA => sigWeight3Data,
            WEIGHT_4_DATA => sigWeight4Data,
            WEIGHT_5_DATA => sigWeight5Data,
            WEIGHT_6_DATA => sigWeight6Data,
            WEIGHT_7_DATA => sigWeight7Data
        );
        
    clock: process begin
        sigClk <= '0';
        wait for 100ns;
        sigClk <= '1';
        wait for 100ns;
    end process;
    
    tb: process is
        constant layerWidth : INTEGER := 5;
        constant neuronWidth : INTEGER := 6;
        constant weightSynapseWidth : INTEGER := 4;
        constant stimulusSynapseWidth : INTEGER := 15;
        constant valueWidth : INTEGER := 16;

        
        constant stimulusType : STD_LOGIC_VECTOR := "1";
        constant weightType : STD_LOGIC_VECTOR := "0";
        constant stimulusSynapse1Addr : STD_LOGIC_VECTOR (stimulusSynapseWidth - 1 downto 0) := STD_LOGIC_VECTOR(To_Unsigned(16384, 15));
        constant layer1Addr : STD_LOGIC_VECTOR (layerWidth - 1 downto 0) := STD_LOGIC_VECTOR(To_Unsigned(16, layerWidth));
        constant neuron2Addr : STD_LOGIC_VECTOR (neuronWidth - 1 downto 0) := STD_LOGIC_VECTOR(To_Unsigned(33, neuronWidth));
        constant synapse2Addr : STD_LOGIC_VECTOR (weightSynapseWidth - 1 downto 0) := STD_LOGIC_VECTOR(To_Unsigned(8, weightSynapseWidth));
        
        constant val1 : STD_LOGIC_VECTOR (15 downto 0) := "1111"&"0000"&"0000"&"0000";
        constant val2 : STD_LOGIC_VECTOR (15 downto 0) := "0000"&"1111"&"0000"&"0000";
    begin
        sigRst <= '1';
        wait for 200ns;
        sigRst <= '0';
        
        -- Test stimulus setting
        sigPktIn <= stimulusType & stimulusSynapse1Addr & val1;
        sigPktInValid <= '1';
        
        wait until sigDone = '1';
        sigPktInValid <= '0';

        assert sigSyn0Data = val1 report "Test failed: 1";
        assert sigSyn0Valid = '1' report "Test failed: 2";

        wait for 200ns;

        -- Test weightus setting
        sigPktIn <= weightType & layer1Addr & neuron2Addr & synapse2Addr & val2;
        sigPktInValid <= '1';
        
        wait until sigDone = '1';
        sigPktInValid <= '0';
        
        assert sigWeight3Data = val2 report "Test failed: 3";
        
        wait;
    end process;

end Behavioral;
