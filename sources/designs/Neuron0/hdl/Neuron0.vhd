--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.2 (win32) Build 932637 Wed Jun 11 13:24:38 MDT 2014
--Date        : Fri Feb 05 19:02:03 2016
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
    SYN_0_DIN : in STD_LOGIC_VECTOR ( 12 downto 0 );
    SYN_0_VALID : in STD_LOGIC;
    SYN_1_DIN : in STD_LOGIC_VECTOR ( 12 downto 0 );
    SYN_1_VALID : in STD_LOGIC;
    SYN_OUT : out STD_LOGIC_VECTOR ( 11 downto 0 );
    SYN_OUT_VALID : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of Neuron0 : entity is "Neuron0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLanguage=VHDL,numBlks=10,numReposBlks=10,numNonXlnxBlks=5,numHierBlks=0,maxHierDepth=0}";
end Neuron0;

architecture STRUCTURE of Neuron0 is
  component Neuron0_Synapse_0_0 is
  port (
    CLK : in STD_LOGIC;
    CLR : in STD_LOGIC;
    RST : in STD_LOGIC;
    SYN_IN_VALID : in STD_LOGIC;
    SYN_IN : in STD_LOGIC_VECTOR ( 12 downto 0 );
    SYN_OUT_VALID : out STD_LOGIC;
    SYN_OUT : out STD_LOGIC_VECTOR ( 12 downto 0 )
  );
  end component Neuron0_Synapse_0_0;
  component Neuron0_mult_gen_0_0 is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 12 downto 0 );
    B : in STD_LOGIC_VECTOR ( 12 downto 0 );
    CE : in STD_LOGIC;
    P : out STD_LOGIC_VECTOR ( 12 downto 0 )
  );
  end component Neuron0_mult_gen_0_0;
  component Neuron0_c_addsub_0_0 is
  port (
    A : in STD_LOGIC_VECTOR ( 12 downto 0 );
    B : in STD_LOGIC_VECTOR ( 12 downto 0 );
    CLK : in STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 12 downto 0 )
  );
  end component Neuron0_c_addsub_0_0;
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
  component Neuron0_ValidSetter_0_0 is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    SYN_IN_VALID : in STD_LOGIC;
    SYN_OUT_VALID : out STD_LOGIC;
    SYN_IN_CLR : out STD_LOGIC
  );
  end component Neuron0_ValidSetter_0_0;
  component Neuron0_Synapse_0_1 is
  port (
    CLK : in STD_LOGIC;
    CLR : in STD_LOGIC;
    RST : in STD_LOGIC;
    SYN_IN_VALID : in STD_LOGIC;
    SYN_IN : in STD_LOGIC_VECTOR ( 12 downto 0 );
    SYN_OUT_VALID : out STD_LOGIC;
    SYN_OUT : out STD_LOGIC_VECTOR ( 12 downto 0 )
  );
  end component Neuron0_Synapse_0_1;
  component Neuron0_And2_0_0 is
  port (
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    O : out STD_LOGIC
  );
  end component Neuron0_And2_0_0;
  component Neuron0_mult_gen_0_1 is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 12 downto 0 );
    B : in STD_LOGIC_VECTOR ( 12 downto 0 );
    CE : in STD_LOGIC;
    P : out STD_LOGIC_VECTOR ( 12 downto 0 )
  );
  end component Neuron0_mult_gen_0_1;
  component Neuron0_xlconstant_0_1 is
  port (
    dout : out STD_LOGIC_VECTOR ( 12 downto 0 )
  );
  end component Neuron0_xlconstant_0_1;
  signal And2_0_O : STD_LOGIC;
  signal CLK_1 : STD_LOGIC;
  signal PlanWrapper_0_Y : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal RST_1 : STD_LOGIC;
  signal SYN_0_DIN_1 : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal SYN_0_VALID_1 : STD_LOGIC;
  signal SYN_1_DIN_1 : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal SYN_1_VALID_1 : STD_LOGIC;
  signal Synapse_0_SYN_OUT : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal Synapse_0_SYN_OUT_VALID : STD_LOGIC;
  signal Synapse_1_SYN_OUT : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal Synapse_1_SYN_OUT_VALID : STD_LOGIC;
  signal ValidSetter_0_SYN_IN_CLR : STD_LOGIC;
  signal ValidSetter_0_SYN_OUT_VALID : STD_LOGIC;
  signal c_addsub_0_S : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal mult_gen_0_P : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal mult_gen_1_P : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 12 downto 0 );
begin
  CLK_1 <= CLK;
  RST_1 <= RST;
  SYN_0_DIN_1(12 downto 0) <= SYN_0_DIN(12 downto 0);
  SYN_0_VALID_1 <= SYN_0_VALID;
  SYN_1_DIN_1(12 downto 0) <= SYN_1_DIN(12 downto 0);
  SYN_1_VALID_1 <= SYN_1_VALID;
  SYN_OUT(11 downto 0) <= PlanWrapper_0_Y(11 downto 0);
  SYN_OUT_VALID <= ValidSetter_0_SYN_OUT_VALID;
And2_0: component Neuron0_And2_0_0
    port map (
      A => Synapse_0_SYN_OUT_VALID,
      B => Synapse_1_SYN_OUT_VALID,
      O => And2_0_O
    );
PlanWrapper_0: component Neuron0_PlanWrapper_0_0
    port map (
      X(12 downto 0) => c_addsub_0_S(12 downto 0),
      Y(11 downto 0) => PlanWrapper_0_Y(11 downto 0)
    );
Synapse_0: component Neuron0_Synapse_0_0
    port map (
      CLK => CLK_1,
      CLR => ValidSetter_0_SYN_IN_CLR,
      RST => RST_1,
      SYN_IN(12 downto 0) => SYN_0_DIN_1(12 downto 0),
      SYN_IN_VALID => SYN_0_VALID_1,
      SYN_OUT(12 downto 0) => Synapse_0_SYN_OUT(12 downto 0),
      SYN_OUT_VALID => Synapse_0_SYN_OUT_VALID
    );
Synapse_1: component Neuron0_Synapse_0_1
    port map (
      CLK => CLK_1,
      CLR => ValidSetter_0_SYN_IN_CLR,
      RST => RST_1,
      SYN_IN(12 downto 0) => SYN_1_DIN_1(12 downto 0),
      SYN_IN_VALID => SYN_1_VALID_1,
      SYN_OUT(12 downto 0) => Synapse_1_SYN_OUT(12 downto 0),
      SYN_OUT_VALID => Synapse_1_SYN_OUT_VALID
    );
ValidSetter_0: component Neuron0_ValidSetter_0_0
    port map (
      CLK => CLK_1,
      RST => RST_1,
      SYN_IN_CLR => ValidSetter_0_SYN_IN_CLR,
      SYN_IN_VALID => And2_0_O,
      SYN_OUT_VALID => ValidSetter_0_SYN_OUT_VALID
    );
c_addsub_0: component Neuron0_c_addsub_0_0
    port map (
      A(12 downto 0) => mult_gen_0_P(12 downto 0),
      B(12 downto 0) => mult_gen_1_P(12 downto 0),
      CLK => CLK_1,
      S(12 downto 0) => c_addsub_0_S(12 downto 0)
    );
mult_gen_0: component Neuron0_mult_gen_0_0
    port map (
      A(12 downto 0) => Synapse_0_SYN_OUT(12 downto 0),
      B(12 downto 0) => xlconstant_0_dout(12 downto 0),
      CE => And2_0_O,
      CLK => CLK_1,
      P(12 downto 0) => mult_gen_0_P(12 downto 0)
    );
mult_gen_1: component Neuron0_mult_gen_0_1
    port map (
      A(12 downto 0) => Synapse_1_SYN_OUT(12 downto 0),
      B(12 downto 0) => xlconstant_1_dout(12 downto 0),
      CE => And2_0_O,
      CLK => CLK_1,
      P(12 downto 0) => mult_gen_1_P(12 downto 0)
    );
xlconstant_0: component Neuron0_xlconstant_0_0
    port map (
      dout(12 downto 0) => xlconstant_0_dout(12 downto 0)
    );
xlconstant_1: component Neuron0_xlconstant_0_1
    port map (
      dout(12 downto 0) => xlconstant_1_dout(12 downto 0)
    );
end STRUCTURE;
