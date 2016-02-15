--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.2 (win32) Build 932637 Wed Jun 11 13:24:38 MDT 2014
--Date        : Wed Feb 10 21:33:34 2016
--Host        : Oli-Windows7VM running 32-bit Service Pack 1  (build 7601)
--Command     : generate_target ValueRouterNetworkTest.bd
--Design      : ValueRouterNetworkTest
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ValueRouterNetworkTest is
  port (
    CLK : in STD_LOGIC;
    DONE : out STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 31 downto 0 );
    PKT_IN_VALID : in STD_LOGIC;
    RST : in STD_LOGIC;
    SYN_0_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    SYN_0_VALID : out STD_LOGIC;
    SYN_1_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    SYN_1_VALID : out STD_LOGIC;
    WEIGHT_0_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_1_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_2_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_3_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_4_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_5_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_6_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    WEIGHT_7_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of ValueRouterNetworkTest : entity is "ValueRouterNetworkTest,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLanguage=VHDL,numBlks=27,numReposBlks=27,numNonXlnxBlks=18,numHierBlks=0,maxHierDepth=0}";
end ValueRouterNetworkTest;

architecture STRUCTURE of ValueRouterNetworkTest is
  component ValueRouterNetworkTest_ValueRouter_0_0 is
  port (
    CLK : in STD_LOGIC;
    PKT_IN_VALID : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 31 downto 0 );
    PKT_OUT_VALID : out STD_LOGIC;
    PKT_OUT : out STD_LOGIC_VECTOR ( 30 downto 0 );
    DONE_IN : in STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_ValueRouter_0_0;
  component ValueRouterNetworkTest_TypeRouter0_0 is
  port (
    CLK : in STD_LOGIC;
    PKT_IN_VALID : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 31 downto 0 );
    PKT_OUT_VALID : out STD_LOGIC;
    PKT_OUT : out STD_LOGIC_VECTOR ( 30 downto 0 );
    DONE_IN : in STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_TypeRouter0_0;
  component ValueRouterNetworkTest_TypeRouter0_1 is
  port (
    CLK : in STD_LOGIC;
    PKT_IN_VALID : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 30 downto 0 );
    PKT_OUT_VALID : out STD_LOGIC;
    PKT_OUT : out STD_LOGIC_VECTOR ( 25 downto 0 );
    DONE_IN : in STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_TypeRouter0_1;
  component ValueRouterNetworkTest_LayerRouter0_0 is
  port (
    CLK : in STD_LOGIC;
    PKT_IN_VALID : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 30 downto 0 );
    PKT_OUT_VALID : out STD_LOGIC;
    PKT_OUT : out STD_LOGIC_VECTOR ( 25 downto 0 );
    DONE_IN : in STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_LayerRouter0_0;
  component ValueRouterNetworkTest_Or2_0_0 is
  port (
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    O : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_Or2_0_0;
  component ValueRouterNetworkTest_LayerRouter0_1 is
  port (
    CLK : in STD_LOGIC;
    PKT_IN_VALID : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 25 downto 0 );
    PKT_OUT_VALID : out STD_LOGIC;
    PKT_OUT : out STD_LOGIC_VECTOR ( 19 downto 0 );
    DONE_IN : in STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_LayerRouter0_1;
  component ValueRouterNetworkTest_NeuronRouter0_0 is
  port (
    CLK : in STD_LOGIC;
    PKT_IN_VALID : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 25 downto 0 );
    PKT_OUT_VALID : out STD_LOGIC;
    PKT_OUT : out STD_LOGIC_VECTOR ( 19 downto 0 );
    DONE_IN : in STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_NeuronRouter0_0;
  component ValueRouterNetworkTest_NeuronRouter0_1 is
  port (
    CLK : in STD_LOGIC;
    PKT_IN_VALID : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 25 downto 0 );
    PKT_OUT_VALID : out STD_LOGIC;
    PKT_OUT : out STD_LOGIC_VECTOR ( 19 downto 0 );
    DONE_IN : in STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_NeuronRouter0_1;
  component ValueRouterNetworkTest_NeuronRouter0_2 is
  port (
    CLK : in STD_LOGIC;
    PKT_IN_VALID : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 25 downto 0 );
    PKT_OUT_VALID : out STD_LOGIC;
    PKT_OUT : out STD_LOGIC_VECTOR ( 19 downto 0 );
    DONE_IN : in STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_NeuronRouter0_2;
  component ValueRouterNetworkTest_Or2_0_1 is
  port (
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    O : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_Or2_0_1;
  component ValueRouterNetworkTest_Or2_1_0 is
  port (
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    O : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_Or2_1_0;
  component ValueRouterNetworkTest_AddressableRegister_0_0 is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 30 downto 0 );
    PKT_IN_VALID : in STD_LOGIC;
    VAL_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    VAL_OUT_VALID : out STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_AddressableRegister_0_0;
  component ValueRouterNetworkTest_AddressableRegister_0_1 is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 30 downto 0 );
    PKT_IN_VALID : in STD_LOGIC;
    VAL_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    VAL_OUT_VALID : out STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_AddressableRegister_0_1;
  component ValueRouterNetworkTest_Or2_2_0 is
  port (
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    O : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_Or2_2_0;
  component ValueRouterNetworkTest_Or2_2_1 is
  port (
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    O : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_Or2_2_1;
  component ValueRouterNetworkTest_AddressableRegister_0_2 is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 19 downto 0 );
    PKT_IN_VALID : in STD_LOGIC;
    VAL_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    VAL_OUT_VALID : out STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_AddressableRegister_0_2;
  component ValueRouterNetworkTest_AddressableRegister_0_3 is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 19 downto 0 );
    PKT_IN_VALID : in STD_LOGIC;
    VAL_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    VAL_OUT_VALID : out STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_AddressableRegister_0_3;
  component ValueRouterNetworkTest_AddressableRegister_0_4 is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 19 downto 0 );
    PKT_IN_VALID : in STD_LOGIC;
    VAL_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    VAL_OUT_VALID : out STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_AddressableRegister_0_4;
  component ValueRouterNetworkTest_AddressableRegister_0_5 is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 19 downto 0 );
    PKT_IN_VALID : in STD_LOGIC;
    VAL_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    VAL_OUT_VALID : out STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_AddressableRegister_0_5;
  component ValueRouterNetworkTest_AddressableRegister_0_6 is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 19 downto 0 );
    PKT_IN_VALID : in STD_LOGIC;
    VAL_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    VAL_OUT_VALID : out STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_AddressableRegister_0_6;
  component ValueRouterNetworkTest_AddressableRegister_0_7 is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 19 downto 0 );
    PKT_IN_VALID : in STD_LOGIC;
    VAL_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    VAL_OUT_VALID : out STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_AddressableRegister_0_7;
  component ValueRouterNetworkTest_AddressableRegister_0_8 is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 19 downto 0 );
    PKT_IN_VALID : in STD_LOGIC;
    VAL_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    VAL_OUT_VALID : out STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_AddressableRegister_0_8;
  component ValueRouterNetworkTest_AddressableRegister_0_9 is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 19 downto 0 );
    PKT_IN_VALID : in STD_LOGIC;
    VAL_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    VAL_OUT_VALID : out STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_AddressableRegister_0_9;
  component ValueRouterNetworkTest_Or2_2_2 is
  port (
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    O : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_Or2_2_2;
  component ValueRouterNetworkTest_Or2_5_0 is
  port (
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    O : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_Or2_5_0;
  component ValueRouterNetworkTest_Or2_5_1 is
  port (
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    O : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_Or2_5_1;
  component ValueRouterNetworkTest_Or2_5_2 is
  port (
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    O : out STD_LOGIC
  );
  end component ValueRouterNetworkTest_Or2_5_2;
  signal AddressableRegister_0_DONE_OUT : STD_LOGIC;
  signal AddressableRegister_0_VAL_OUT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal AddressableRegister_0_VAL_OUT_VALID : STD_LOGIC;
  signal AddressableRegister_1_DONE_OUT : STD_LOGIC;
  signal AddressableRegister_1_VAL_OUT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal AddressableRegister_1_VAL_OUT_VALID : STD_LOGIC;
  signal AddressableRegister_2_DONE_OUT : STD_LOGIC;
  signal AddressableRegister_2_VAL_OUT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal AddressableRegister_3_DONE_OUT : STD_LOGIC;
  signal AddressableRegister_3_VAL_OUT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal AddressableRegister_4_DONE_OUT : STD_LOGIC;
  signal AddressableRegister_4_VAL_OUT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal AddressableRegister_5_DONE_OUT : STD_LOGIC;
  signal AddressableRegister_5_VAL_OUT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal AddressableRegister_6_DONE_OUT : STD_LOGIC;
  signal AddressableRegister_6_VAL_OUT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal AddressableRegister_7_DONE_OUT : STD_LOGIC;
  signal AddressableRegister_7_VAL_OUT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal AddressableRegister_8_DONE_OUT : STD_LOGIC;
  signal AddressableRegister_8_VAL_OUT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal AddressableRegister_9_DONE_OUT : STD_LOGIC;
  signal AddressableRegister_9_VAL_OUT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal CLK_1 : STD_LOGIC;
  signal GND_1 : STD_LOGIC;
  signal LayerRouter0_DONE_OUT : STD_LOGIC;
  signal LayerRouter0_PKT_OUT : STD_LOGIC_VECTOR ( 25 downto 0 );
  signal LayerRouter0_PKT_OUT_VALID : STD_LOGIC;
  signal LayerRouter1_DONE_OUT : STD_LOGIC;
  signal LayerRouter1_PKT_OUT : STD_LOGIC_VECTOR ( 25 downto 0 );
  signal LayerRouter1_PKT_OUT_VALID : STD_LOGIC;
  signal NeuronRouter0_DONE_OUT : STD_LOGIC;
  signal NeuronRouter0_PKT_OUT : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal NeuronRouter0_PKT_OUT_VALID : STD_LOGIC;
  signal NeuronRouter1_DONE_OUT : STD_LOGIC;
  signal NeuronRouter1_PKT_OUT : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal NeuronRouter1_PKT_OUT_VALID : STD_LOGIC;
  signal NeuronRouter2_DONE_OUT : STD_LOGIC;
  signal NeuronRouter2_PKT_OUT : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal NeuronRouter2_PKT_OUT_VALID : STD_LOGIC;
  signal NeuronRouter3_DONE_OUT : STD_LOGIC;
  signal NeuronRouter3_PKT_OUT : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal NeuronRouter3_PKT_OUT_VALID : STD_LOGIC;
  signal Or2_0_O : STD_LOGIC;
  signal Or2_1_O : STD_LOGIC;
  signal Or2_2_O : STD_LOGIC;
  signal Or2_3_O : STD_LOGIC;
  signal Or2_4_O : STD_LOGIC;
  signal Or2_5_O : STD_LOGIC;
  signal Or2_6_O : STD_LOGIC;
  signal Or2_7_O : STD_LOGIC;
  signal Or2_8_O : STD_LOGIC;
  signal PKT_IN_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PKT_IN_VALID_1 : STD_LOGIC;
  signal RST_1 : STD_LOGIC;
  signal TypeRouter0_DONE_OUT : STD_LOGIC;
  signal TypeRouter0_PKT_OUT : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal TypeRouter0_PKT_OUT_VALID : STD_LOGIC;
  signal TypeRouter1_DONE_OUT : STD_LOGIC;
  signal TypeRouter1_PKT_OUT : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal TypeRouter1_PKT_OUT_VALID : STD_LOGIC;
  signal NLW_AddressableRegister_2_VAL_OUT_VALID_UNCONNECTED : STD_LOGIC;
  signal NLW_AddressableRegister_3_VAL_OUT_VALID_UNCONNECTED : STD_LOGIC;
  signal NLW_AddressableRegister_4_VAL_OUT_VALID_UNCONNECTED : STD_LOGIC;
  signal NLW_AddressableRegister_5_VAL_OUT_VALID_UNCONNECTED : STD_LOGIC;
  signal NLW_AddressableRegister_6_VAL_OUT_VALID_UNCONNECTED : STD_LOGIC;
  signal NLW_AddressableRegister_7_VAL_OUT_VALID_UNCONNECTED : STD_LOGIC;
  signal NLW_AddressableRegister_8_VAL_OUT_VALID_UNCONNECTED : STD_LOGIC;
  signal NLW_AddressableRegister_9_VAL_OUT_VALID_UNCONNECTED : STD_LOGIC;
begin
  CLK_1 <= CLK;
  DONE <= Or2_4_O;
  PKT_IN_1(31 downto 0) <= PKT_IN(31 downto 0);
  PKT_IN_VALID_1 <= PKT_IN_VALID;
  RST_1 <= RST;
  SYN_0_DATA(15 downto 0) <= AddressableRegister_0_VAL_OUT(15 downto 0);
  SYN_0_VALID <= AddressableRegister_0_VAL_OUT_VALID;
  SYN_1_DATA(15 downto 0) <= AddressableRegister_1_VAL_OUT(15 downto 0);
  SYN_1_VALID <= AddressableRegister_1_VAL_OUT_VALID;
  WEIGHT_0_DATA(15 downto 0) <= AddressableRegister_2_VAL_OUT(15 downto 0);
  WEIGHT_1_DATA(15 downto 0) <= AddressableRegister_3_VAL_OUT(15 downto 0);
  WEIGHT_2_DATA(15 downto 0) <= AddressableRegister_4_VAL_OUT(15 downto 0);
  WEIGHT_3_DATA(15 downto 0) <= AddressableRegister_5_VAL_OUT(15 downto 0);
  WEIGHT_4_DATA(15 downto 0) <= AddressableRegister_6_VAL_OUT(15 downto 0);
  WEIGHT_5_DATA(15 downto 0) <= AddressableRegister_7_VAL_OUT(15 downto 0);
  WEIGHT_6_DATA(15 downto 0) <= AddressableRegister_8_VAL_OUT(15 downto 0);
  WEIGHT_7_DATA(15 downto 0) <= AddressableRegister_9_VAL_OUT(15 downto 0);
AddressableRegister_0: component ValueRouterNetworkTest_AddressableRegister_0_0
    port map (
      CLK => CLK_1,
      DONE_OUT => AddressableRegister_0_DONE_OUT,
      PKT_IN(30 downto 0) => TypeRouter1_PKT_OUT(30 downto 0),
      PKT_IN_VALID => TypeRouter1_PKT_OUT_VALID,
      RST => RST_1,
      VAL_OUT(15 downto 0) => AddressableRegister_0_VAL_OUT(15 downto 0),
      VAL_OUT_VALID => AddressableRegister_0_VAL_OUT_VALID
    );
AddressableRegister_1: component ValueRouterNetworkTest_AddressableRegister_0_1
    port map (
      CLK => CLK_1,
      DONE_OUT => AddressableRegister_1_DONE_OUT,
      PKT_IN(30 downto 0) => TypeRouter1_PKT_OUT(30 downto 0),
      PKT_IN_VALID => TypeRouter1_PKT_OUT_VALID,
      RST => RST_1,
      VAL_OUT(15 downto 0) => AddressableRegister_1_VAL_OUT(15 downto 0),
      VAL_OUT_VALID => AddressableRegister_1_VAL_OUT_VALID
    );
AddressableRegister_2: component ValueRouterNetworkTest_AddressableRegister_0_2
    port map (
      CLK => CLK_1,
      DONE_OUT => AddressableRegister_2_DONE_OUT,
      PKT_IN(19 downto 0) => NeuronRouter2_PKT_OUT(19 downto 0),
      PKT_IN_VALID => NeuronRouter2_PKT_OUT_VALID,
      RST => RST_1,
      VAL_OUT(15 downto 0) => AddressableRegister_2_VAL_OUT(15 downto 0),
      VAL_OUT_VALID => NLW_AddressableRegister_2_VAL_OUT_VALID_UNCONNECTED
    );
AddressableRegister_3: component ValueRouterNetworkTest_AddressableRegister_0_3
    port map (
      CLK => CLK_1,
      DONE_OUT => AddressableRegister_3_DONE_OUT,
      PKT_IN(19 downto 0) => NeuronRouter2_PKT_OUT(19 downto 0),
      PKT_IN_VALID => NeuronRouter2_PKT_OUT_VALID,
      RST => RST_1,
      VAL_OUT(15 downto 0) => AddressableRegister_3_VAL_OUT(15 downto 0),
      VAL_OUT_VALID => NLW_AddressableRegister_3_VAL_OUT_VALID_UNCONNECTED
    );
AddressableRegister_4: component ValueRouterNetworkTest_AddressableRegister_0_4
    port map (
      CLK => CLK_1,
      DONE_OUT => AddressableRegister_4_DONE_OUT,
      PKT_IN(19 downto 0) => NeuronRouter0_PKT_OUT(19 downto 0),
      PKT_IN_VALID => NeuronRouter0_PKT_OUT_VALID,
      RST => RST_1,
      VAL_OUT(15 downto 0) => AddressableRegister_4_VAL_OUT(15 downto 0),
      VAL_OUT_VALID => NLW_AddressableRegister_4_VAL_OUT_VALID_UNCONNECTED
    );
AddressableRegister_5: component ValueRouterNetworkTest_AddressableRegister_0_5
    port map (
      CLK => CLK_1,
      DONE_OUT => AddressableRegister_5_DONE_OUT,
      PKT_IN(19 downto 0) => NeuronRouter0_PKT_OUT(19 downto 0),
      PKT_IN_VALID => NeuronRouter0_PKT_OUT_VALID,
      RST => RST_1,
      VAL_OUT(15 downto 0) => AddressableRegister_5_VAL_OUT(15 downto 0),
      VAL_OUT_VALID => NLW_AddressableRegister_5_VAL_OUT_VALID_UNCONNECTED
    );
AddressableRegister_6: component ValueRouterNetworkTest_AddressableRegister_0_6
    port map (
      CLK => CLK_1,
      DONE_OUT => AddressableRegister_6_DONE_OUT,
      PKT_IN(19 downto 0) => NeuronRouter1_PKT_OUT(19 downto 0),
      PKT_IN_VALID => NeuronRouter1_PKT_OUT_VALID,
      RST => RST_1,
      VAL_OUT(15 downto 0) => AddressableRegister_6_VAL_OUT(15 downto 0),
      VAL_OUT_VALID => NLW_AddressableRegister_6_VAL_OUT_VALID_UNCONNECTED
    );
AddressableRegister_7: component ValueRouterNetworkTest_AddressableRegister_0_7
    port map (
      CLK => CLK_1,
      DONE_OUT => AddressableRegister_7_DONE_OUT,
      PKT_IN(19 downto 0) => NeuronRouter1_PKT_OUT(19 downto 0),
      PKT_IN_VALID => NeuronRouter1_PKT_OUT_VALID,
      RST => RST_1,
      VAL_OUT(15 downto 0) => AddressableRegister_7_VAL_OUT(15 downto 0),
      VAL_OUT_VALID => NLW_AddressableRegister_7_VAL_OUT_VALID_UNCONNECTED
    );
AddressableRegister_8: component ValueRouterNetworkTest_AddressableRegister_0_8
    port map (
      CLK => CLK_1,
      DONE_OUT => AddressableRegister_8_DONE_OUT,
      PKT_IN(19 downto 0) => NeuronRouter3_PKT_OUT(19 downto 0),
      PKT_IN_VALID => NeuronRouter3_PKT_OUT_VALID,
      RST => GND_1,
      VAL_OUT(15 downto 0) => AddressableRegister_8_VAL_OUT(15 downto 0),
      VAL_OUT_VALID => NLW_AddressableRegister_8_VAL_OUT_VALID_UNCONNECTED
    );
AddressableRegister_9: component ValueRouterNetworkTest_AddressableRegister_0_9
    port map (
      CLK => CLK_1,
      DONE_OUT => AddressableRegister_9_DONE_OUT,
      PKT_IN(19 downto 0) => NeuronRouter3_PKT_OUT(19 downto 0),
      PKT_IN_VALID => NeuronRouter3_PKT_OUT_VALID,
      RST => RST_1,
      VAL_OUT(15 downto 0) => AddressableRegister_9_VAL_OUT(15 downto 0),
      VAL_OUT_VALID => NLW_AddressableRegister_9_VAL_OUT_VALID_UNCONNECTED
    );
GND: unisim.vcomponents.GND
    port map (
      G => GND_1
    );
LayerRouter0: component ValueRouterNetworkTest_TypeRouter0_1
    port map (
      CLK => CLK_1,
      DONE_IN => Or2_1_O,
      DONE_OUT => LayerRouter0_DONE_OUT,
      PKT_IN(30 downto 0) => TypeRouter0_PKT_OUT(30 downto 0),
      PKT_IN_VALID => TypeRouter0_PKT_OUT_VALID,
      PKT_OUT(25 downto 0) => LayerRouter0_PKT_OUT(25 downto 0),
      PKT_OUT_VALID => LayerRouter0_PKT_OUT_VALID
    );
LayerRouter1: component ValueRouterNetworkTest_LayerRouter0_0
    port map (
      CLK => CLK_1,
      DONE_IN => Or2_2_O,
      DONE_OUT => LayerRouter1_DONE_OUT,
      PKT_IN(30 downto 0) => TypeRouter0_PKT_OUT(30 downto 0),
      PKT_IN_VALID => TypeRouter0_PKT_OUT_VALID,
      PKT_OUT(25 downto 0) => LayerRouter1_PKT_OUT(25 downto 0),
      PKT_OUT_VALID => LayerRouter1_PKT_OUT_VALID
    );
NeuronRouter0: component ValueRouterNetworkTest_LayerRouter0_1
    port map (
      CLK => CLK_1,
      DONE_IN => Or2_7_O,
      DONE_OUT => NeuronRouter0_DONE_OUT,
      PKT_IN(25 downto 0) => LayerRouter0_PKT_OUT(25 downto 0),
      PKT_IN_VALID => LayerRouter0_PKT_OUT_VALID,
      PKT_OUT(19 downto 0) => NeuronRouter0_PKT_OUT(19 downto 0),
      PKT_OUT_VALID => NeuronRouter0_PKT_OUT_VALID
    );
NeuronRouter1: component ValueRouterNetworkTest_NeuronRouter0_0
    port map (
      CLK => CLK_1,
      DONE_IN => Or2_8_O,
      DONE_OUT => NeuronRouter1_DONE_OUT,
      PKT_IN(25 downto 0) => LayerRouter1_PKT_OUT(25 downto 0),
      PKT_IN_VALID => LayerRouter1_PKT_OUT_VALID,
      PKT_OUT(19 downto 0) => NeuronRouter1_PKT_OUT(19 downto 0),
      PKT_OUT_VALID => NeuronRouter1_PKT_OUT_VALID
    );
NeuronRouter2: component ValueRouterNetworkTest_NeuronRouter0_1
    port map (
      CLK => CLK_1,
      DONE_IN => Or2_6_O,
      DONE_OUT => NeuronRouter2_DONE_OUT,
      PKT_IN(25 downto 0) => LayerRouter0_PKT_OUT(25 downto 0),
      PKT_IN_VALID => LayerRouter0_PKT_OUT_VALID,
      PKT_OUT(19 downto 0) => NeuronRouter2_PKT_OUT(19 downto 0),
      PKT_OUT_VALID => NeuronRouter2_PKT_OUT_VALID
    );
NeuronRouter3: component ValueRouterNetworkTest_NeuronRouter0_2
    port map (
      CLK => CLK_1,
      DONE_IN => Or2_5_O,
      DONE_OUT => NeuronRouter3_DONE_OUT,
      PKT_IN(25 downto 0) => LayerRouter1_PKT_OUT(25 downto 0),
      PKT_IN_VALID => LayerRouter1_PKT_OUT_VALID,
      PKT_OUT(19 downto 0) => NeuronRouter3_PKT_OUT(19 downto 0),
      PKT_OUT_VALID => NeuronRouter3_PKT_OUT_VALID
    );
Or2_0: component ValueRouterNetworkTest_Or2_0_0
    port map (
      A => LayerRouter1_DONE_OUT,
      B => LayerRouter0_DONE_OUT,
      O => Or2_0_O
    );
Or2_1: component ValueRouterNetworkTest_Or2_0_1
    port map (
      A => NeuronRouter0_DONE_OUT,
      B => NeuronRouter2_DONE_OUT,
      O => Or2_1_O
    );
Or2_2: component ValueRouterNetworkTest_Or2_1_0
    port map (
      A => NeuronRouter3_DONE_OUT,
      B => NeuronRouter1_DONE_OUT,
      O => Or2_2_O
    );
Or2_3: component ValueRouterNetworkTest_Or2_2_0
    port map (
      A => AddressableRegister_1_DONE_OUT,
      B => AddressableRegister_0_DONE_OUT,
      O => Or2_3_O
    );
Or2_4: component ValueRouterNetworkTest_Or2_2_1
    port map (
      A => TypeRouter0_DONE_OUT,
      B => TypeRouter1_DONE_OUT,
      O => Or2_4_O
    );
Or2_5: component ValueRouterNetworkTest_Or2_2_2
    port map (
      A => AddressableRegister_9_DONE_OUT,
      B => AddressableRegister_8_DONE_OUT,
      O => Or2_5_O
    );
Or2_6: component ValueRouterNetworkTest_Or2_5_0
    port map (
      A => AddressableRegister_2_DONE_OUT,
      B => AddressableRegister_3_DONE_OUT,
      O => Or2_6_O
    );
Or2_7: component ValueRouterNetworkTest_Or2_5_1
    port map (
      A => AddressableRegister_5_DONE_OUT,
      B => AddressableRegister_4_DONE_OUT,
      O => Or2_7_O
    );
Or2_8: component ValueRouterNetworkTest_Or2_5_2
    port map (
      A => AddressableRegister_6_DONE_OUT,
      B => AddressableRegister_7_DONE_OUT,
      O => Or2_8_O
    );
TypeRouter0: component ValueRouterNetworkTest_ValueRouter_0_0
    port map (
      CLK => CLK_1,
      DONE_IN => Or2_0_O,
      DONE_OUT => TypeRouter0_DONE_OUT,
      PKT_IN(31 downto 0) => PKT_IN_1(31 downto 0),
      PKT_IN_VALID => PKT_IN_VALID_1,
      PKT_OUT(30 downto 0) => TypeRouter0_PKT_OUT(30 downto 0),
      PKT_OUT_VALID => TypeRouter0_PKT_OUT_VALID
    );
TypeRouter1: component ValueRouterNetworkTest_TypeRouter0_0
    port map (
      CLK => CLK_1,
      DONE_IN => Or2_3_O,
      DONE_OUT => TypeRouter1_DONE_OUT,
      PKT_IN(31 downto 0) => PKT_IN_1(31 downto 0),
      PKT_IN_VALID => PKT_IN_VALID_1,
      PKT_OUT(30 downto 0) => TypeRouter1_PKT_OUT(30 downto 0),
      PKT_OUT_VALID => TypeRouter1_PKT_OUT_VALID
    );
end STRUCTURE;
