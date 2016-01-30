--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.2 (win32) Build 932637 Wed Jun 11 13:24:38 MDT 2014
--Date        : Sat Jan 30 13:43:58 2016
--Host        : Oli-Windows7VM running 32-bit Service Pack 1  (build 7601)
--Command     : generate_target Neuron0.bd
--Design      : Neuron0
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Neuron0 is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of Neuron0 : entity is "Neuron0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLanguage=VHDL,numBlks=9,numReposBlks=9,numNonXlnxBlks=4,numHierBlks=0,maxHierDepth=0}";
end Neuron0;

architecture STRUCTURE of Neuron0 is
  component Neuron0_mult_gen_0_0 is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 12 downto 0 );
    B : in STD_LOGIC_VECTOR ( 12 downto 0 );
    P : out STD_LOGIC_VECTOR ( 12 downto 0 )
  );
  end component Neuron0_mult_gen_0_0;
  component Neuron0_PlanWrapper_0_0 is
  port (
    X : in STD_LOGIC_VECTOR ( 12 downto 0 );
    Y : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  end component Neuron0_PlanWrapper_0_0;
  component Neuron0_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 12 downto 0 )
  );
  end component Neuron0_xlconstant_0_0;
  component Neuron0_c_addsub_0_0 is
  port (
    A : in STD_LOGIC_VECTOR ( 12 downto 0 );
    B : in STD_LOGIC_VECTOR ( 12 downto 0 );
    CLK : in STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 12 downto 0 )
  );
  end component Neuron0_c_addsub_0_0;
  component Neuron0_Latch_0_2 is
  port (
    CLK : in STD_LOGIC;
    SET : in STD_LOGIC;
    RST : in STD_LOGIC;
    DIN : in STD_LOGIC_VECTOR ( 12 downto 0 );
    DOUT : out STD_LOGIC_VECTOR ( 12 downto 0 )
  );
  end component Neuron0_Latch_0_2;
  component Neuron0_Multiplier_1_0 is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 12 downto 0 );
    B : in STD_LOGIC_VECTOR ( 12 downto 0 );
    P : out STD_LOGIC_VECTOR ( 12 downto 0 )
  );
  end component Neuron0_Multiplier_1_0;
  component Neuron0_Synapse_Latch_1_0 is
  port (
    CLK : in STD_LOGIC;
    SET : in STD_LOGIC;
    RST : in STD_LOGIC;
    DIN : in STD_LOGIC_VECTOR ( 12 downto 0 );
    DOUT : out STD_LOGIC_VECTOR ( 12 downto 0 )
  );
  end component Neuron0_Synapse_Latch_1_0;
  component Neuron0_Weight_1_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 12 downto 0 )
  );
  end component Neuron0_Weight_1_0;
  component Neuron0_Valid_Setter_2_0 is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    P_OUT : out STD_LOGIC
  );
  end component Neuron0_Valid_Setter_2_0;
  signal Adder_1_S : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal CLK_1 : STD_LOGIC;
  signal Multiplier_1_P : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal Multiplier_2_P : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal PlanWrapper_0_Y : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal RST_1 : STD_LOGIC;
  signal SYN_1_DIN_1 : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal SYN_1_VALID_1 : STD_LOGIC;
  signal SYN_2_DIN_1 : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal SYN_2_VALID_1 : STD_LOGIC;
  signal Synapse_Latch_1_DOUT : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal Synapse_Latch_2_DOUT : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal Valid_Setter_Adder_P_OUT : STD_LOGIC;
  signal Weight_2_dout : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 12 downto 0 );
begin
  CLK_1 <= CLK;
  RST_1 <= RST;
  SYN_1_DIN_1(12 downto 0) <= SYN_2_DIN(12 downto 0);
  SYN_1_VALID_1 <= SYN_1_VALID;
  SYN_2_DIN_1(12 downto 0) <= SYN_1_DIN(12 downto 0);
  SYN_2_VALID_1 <= SYN_2_VALID;
  SYN_OUT(11 downto 0) <= PlanWrapper_0_Y(11 downto 0);
  SYN_OUT_VALID <= Valid_Setter_Adder_P_OUT;
Activation_Function: component Neuron0_PlanWrapper_0_0
    port map (
      X(12 downto 0) => Adder_1_S(12 downto 0),
      Y(11 downto 0) => PlanWrapper_0_Y(11 downto 0)
    );
Multiplier_Syn_1: component Neuron0_mult_gen_0_0
    port map (
      A(12 downto 0) => Synapse_Latch_1_DOUT(12 downto 0),
      B(12 downto 0) => xlconstant_0_dout(12 downto 0),
      CLK => CLK_1,
      P(12 downto 0) => Multiplier_1_P(12 downto 0)
    );
Multiplier_Syn_2: component Neuron0_Multiplier_1_0
    port map (
      A(12 downto 0) => Synapse_Latch_2_DOUT(12 downto 0),
      B(12 downto 0) => Weight_2_dout(12 downto 0),
      CLK => CLK_1,
      P(12 downto 0) => Multiplier_2_P(12 downto 0)
    );
Sum_Junction: component Neuron0_c_addsub_0_0
    port map (
      A(12 downto 0) => Multiplier_1_P(12 downto 0),
      B(12 downto 0) => Multiplier_2_P(12 downto 0),
      CLK => CLK_1,
      S(12 downto 0) => Adder_1_S(12 downto 0)
    );
Synapse_Latch_Syn_1: component Neuron0_Latch_0_2
    port map (
      CLK => CLK_1,
      DIN(12 downto 0) => SYN_2_DIN_1(12 downto 0),
      DOUT(12 downto 0) => Synapse_Latch_1_DOUT(12 downto 0),
      RST => RST_1,
      SET => SYN_1_VALID_1
    );
Synapse_Latch_Syn_2: component Neuron0_Synapse_Latch_1_0
    port map (
      CLK => CLK_1,
      DIN(12 downto 0) => SYN_1_DIN_1(12 downto 0),
      DOUT(12 downto 0) => Synapse_Latch_2_DOUT(12 downto 0),
      RST => RST_1,
      SET => SYN_2_VALID_1
    );
Valid_Setter_Adder: component Neuron0_Valid_Setter_2_0
    port map (
      CLK => CLK_1,
      P_OUT => Valid_Setter_Adder_P_OUT,
      RST => RST_1
    );
Weight_Syn_1: component Neuron0_xlconstant_0_0
    port map (
      dout(12 downto 0) => xlconstant_0_dout(12 downto 0)
    );
Weight_Syn_2: component Neuron0_Weight_1_0
    port map (
      dout(12 downto 0) => Weight_2_dout(12 downto 0)
    );
end STRUCTURE;
