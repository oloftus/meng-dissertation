--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.2 (win32) Build 932637 Wed Jun 11 13:24:38 MDT 2014
--Date        : Wed Mar 02 16:56:25 2016
--Host        : Oli-Windows7VM running 32-bit Service Pack 1  (build 7601)
--Command     : generate_target Neuron.bd
--Design      : Neuron
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Neuron is
  port (
    CLK : in STD_LOGIC;
    DONE_OUT : out STD_LOGIC;
    NEURON_ADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    PKT_IN : in STD_LOGIC_VECTOR ( 25 downto 0 );
    PKT_IN_VALID : in STD_LOGIC;
    RST : in STD_LOGIC;
    SYN_0_DIN : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SYN_0_VALID : in STD_LOGIC;
    SYN_1_DIN : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SYN_1_VALID : in STD_LOGIC;
    SYN_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    SYN_OUT_VALID : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of Neuron : entity is "Neuron,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLanguage=VHDL,numBlks=17,numReposBlks=17,numNonXlnxBlks=10,numHierBlks=0,maxHierDepth=0}";
end Neuron;

architecture STRUCTURE of Neuron is
  component Neuron_NeuronRouter_0 is
  port (
    CLK : in STD_LOGIC;
    PKT_IN_VALID : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 25 downto 0 );
    PKT_OUT_VALID : out STD_LOGIC;
    PKT_OUT : out STD_LOGIC_VECTOR ( 19 downto 0 );
    DONE_IN : in STD_LOGIC;
    DONE_OUT : out STD_LOGIC;
    ADDR : in STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  end component Neuron_NeuronRouter_0;
  component Neuron_MultiplierEnable_0 is
  port (
    DIN : in STD_LOGIC_VECTOR ( 1 downto 0 );
    DOUT : out STD_LOGIC
  );
  end component Neuron_MultiplierEnable_0;
  component Neuron_MultiplierEnableConcat_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component Neuron_MultiplierEnableConcat_0;
  component Neuron_DoneOut_0 is
  port (
    DIN : in STD_LOGIC_VECTOR ( 1 downto 0 );
    DOUT : out STD_LOGIC
  );
  end component Neuron_DoneOut_0;
  component Neuron_DoneOutConcat_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component Neuron_DoneOutConcat_0;
  component Neuron_SumJunction_0 is
  port (
    DIN : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DOUT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    CLK : in STD_LOGIC
  );
  end component Neuron_SumJunction_0;
  component Neuron_SumJunctionConcat_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    In1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component Neuron_SumJunctionConcat_0;
  component Neuron_ValidSetter_0 is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    SYN_IN_VALID : in STD_LOGIC;
    SYN_OUT_VALID : out STD_LOGIC;
    SYN_IN_CLR : out STD_LOGIC
  );
  end component Neuron_ValidSetter_0;
  component Neuron_Plan_0 is
  port (
    X : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Y : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component Neuron_Plan_0;
  component Neuron_Synapse_0_0 is
  port (
    CLK : in STD_LOGIC;
    CLR : in STD_LOGIC;
    RST : in STD_LOGIC;
    SYN_IN_VALID : in STD_LOGIC;
    SYN_IN : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SYN_OUT_VALID : out STD_LOGIC;
    SYN_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component Neuron_Synapse_0_0;
  component Neuron_WeightRegister_0_0 is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 19 downto 0 );
    PKT_IN_VALID : in STD_LOGIC;
    VAL_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    VAL_OUT_VALID : out STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component Neuron_WeightRegister_0_0;
  component Neuron_Multiplier_0_0 is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CE : in STD_LOGIC;
    P : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component Neuron_Multiplier_0_0;
  component Neuron_MultiplierSlicer_0_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component Neuron_MultiplierSlicer_0_0;
  component Neuron_Synapse_1_0 is
  port (
    CLK : in STD_LOGIC;
    CLR : in STD_LOGIC;
    RST : in STD_LOGIC;
    SYN_IN_VALID : in STD_LOGIC;
    SYN_IN : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SYN_OUT_VALID : out STD_LOGIC;
    SYN_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component Neuron_Synapse_1_0;
  component Neuron_WeightRegister_1_0 is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 19 downto 0 );
    PKT_IN_VALID : in STD_LOGIC;
    VAL_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    VAL_OUT_VALID : out STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component Neuron_WeightRegister_1_0;
  component Neuron_Multiplier_1_0 is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CE : in STD_LOGIC;
    P : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component Neuron_Multiplier_1_0;
  component Neuron_MultiplierSlicer_1_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component Neuron_MultiplierSlicer_1_0;
  signal CLK_1 : STD_LOGIC;
  signal DoneOutConcat_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal DoneOut_DOUT : STD_LOGIC;
  signal MultiplierEnableConcat_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal MultiplierEnable_DOUT : STD_LOGIC;
  signal MultiplierSlicer_0_Dout : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal MultiplierSlicer_1_Dout : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Multiplier_0_P : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Multiplier_1_P : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NEURON_ADDR_1 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NeuronRouter_DONE_OUT : STD_LOGIC;
  signal NeuronRouter_PKT_OUT : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal NeuronRouter_PKT_OUT_VALID : STD_LOGIC;
  signal PKT_IN_1 : STD_LOGIC_VECTOR ( 25 downto 0 );
  signal PKT_IN_VALID_1 : STD_LOGIC;
  signal Plan_Y : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal RST_1 : STD_LOGIC;
  signal SYN_0_DIN_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal SYN_0_VALID_1 : STD_LOGIC;
  signal SYN_1_DIN_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal SYN_1_VALID_1 : STD_LOGIC;
  signal SumJunctionConcat_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SumJunction_DOUT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Synapse_0_SYN_OUT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Synapse_0_SYN_OUT_VALID : STD_LOGIC;
  signal Synapse_1_SYN_OUT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Synapse_1_SYN_OUT_VALID : STD_LOGIC;
  signal ValidSetter_SYN_IN_CLR : STD_LOGIC;
  signal ValidSetter_SYN_OUT_VALID : STD_LOGIC;
  signal WeightRegister_0_DONE_OUT : STD_LOGIC;
  signal WeightRegister_0_VAL_OUT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal WeightRegister_1_DONE_OUT : STD_LOGIC;
  signal WeightRegister_1_VAL_OUT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_WeightRegister_0_VAL_OUT_VALID_UNCONNECTED : STD_LOGIC;
  signal NLW_WeightRegister_1_VAL_OUT_VALID_UNCONNECTED : STD_LOGIC;
begin
  CLK_1 <= CLK;
  DONE_OUT <= NeuronRouter_DONE_OUT;
  NEURON_ADDR_1(5 downto 0) <= NEURON_ADDR(5 downto 0);
  PKT_IN_1(25 downto 0) <= PKT_IN(25 downto 0);
  PKT_IN_VALID_1 <= PKT_IN_VALID;
  RST_1 <= RST;
  SYN_0_DIN_1(15 downto 0) <= SYN_0_DIN(15 downto 0);
  SYN_0_VALID_1 <= SYN_0_VALID;
  SYN_1_DIN_1(15 downto 0) <= SYN_1_DIN(15 downto 0);
  SYN_1_VALID_1 <= SYN_1_VALID;
  SYN_OUT(15 downto 0) <= Plan_Y(15 downto 0);
  SYN_OUT_VALID <= ValidSetter_SYN_OUT_VALID;
DoneOut: component Neuron_DoneOut_0
    port map (
      DIN(1 downto 0) => DoneOutConcat_dout(1 downto 0),
      DOUT => DoneOut_DOUT
    );
DoneOutConcat: component Neuron_DoneOutConcat_0
    port map (
      In0(0) => WeightRegister_0_DONE_OUT,
      In1(0) => WeightRegister_1_DONE_OUT,
      dout(1 downto 0) => DoneOutConcat_dout(1 downto 0)
    );
MultiplierEnable: component Neuron_MultiplierEnable_0
    port map (
      DIN(1 downto 0) => MultiplierEnableConcat_dout(1 downto 0),
      DOUT => MultiplierEnable_DOUT
    );
MultiplierEnableConcat: component Neuron_MultiplierEnableConcat_0
    port map (
      In0(0) => Synapse_0_SYN_OUT_VALID,
      In1(0) => Synapse_1_SYN_OUT_VALID,
      dout(1 downto 0) => MultiplierEnableConcat_dout(1 downto 0)
    );
MultiplierSlicer_0: component Neuron_MultiplierSlicer_0_0
    port map (
      Din(31 downto 0) => Multiplier_0_P(31 downto 0),
      Dout(15 downto 0) => MultiplierSlicer_0_Dout(15 downto 0)
    );
MultiplierSlicer_1: component Neuron_MultiplierSlicer_1_0
    port map (
      Din(31 downto 0) => Multiplier_1_P(31 downto 0),
      Dout(15 downto 0) => MultiplierSlicer_1_Dout(15 downto 0)
    );
Multiplier_0: component Neuron_Multiplier_0_0
    port map (
      A(15 downto 0) => Synapse_0_SYN_OUT(15 downto 0),
      B(15 downto 0) => WeightRegister_0_VAL_OUT(15 downto 0),
      CE => MultiplierEnable_DOUT,
      CLK => CLK_1,
      P(31 downto 0) => Multiplier_0_P(31 downto 0)
    );
Multiplier_1: component Neuron_Multiplier_1_0
    port map (
      A(15 downto 0) => Synapse_1_SYN_OUT(15 downto 0),
      B(15 downto 0) => WeightRegister_1_VAL_OUT(15 downto 0),
      CE => MultiplierEnable_DOUT,
      CLK => CLK_1,
      P(31 downto 0) => Multiplier_1_P(31 downto 0)
    );
NeuronRouter: component Neuron_NeuronRouter_0
    port map (
      ADDR(5 downto 0) => NEURON_ADDR_1(5 downto 0),
      CLK => CLK_1,
      DONE_IN => DoneOut_DOUT,
      DONE_OUT => NeuronRouter_DONE_OUT,
      PKT_IN(25 downto 0) => PKT_IN_1(25 downto 0),
      PKT_IN_VALID => PKT_IN_VALID_1,
      PKT_OUT(19 downto 0) => NeuronRouter_PKT_OUT(19 downto 0),
      PKT_OUT_VALID => NeuronRouter_PKT_OUT_VALID
    );
Plan: component Neuron_Plan_0
    port map (
      X(15 downto 0) => SumJunction_DOUT(15 downto 0),
      Y(15 downto 0) => Plan_Y(15 downto 0)
    );
SumJunction: component Neuron_SumJunction_0
    port map (
      CLK => CLK_1,
      DIN(31 downto 0) => SumJunctionConcat_dout(31 downto 0),
      DOUT(15 downto 0) => SumJunction_DOUT(15 downto 0)
    );
SumJunctionConcat: component Neuron_SumJunctionConcat_0
    port map (
      In0(15 downto 0) => MultiplierSlicer_0_Dout(15 downto 0),
      In1(15 downto 0) => MultiplierSlicer_1_Dout(15 downto 0),
      dout(31 downto 0) => SumJunctionConcat_dout(31 downto 0)
    );
Synapse_0: component Neuron_Synapse_0_0
    port map (
      CLK => CLK_1,
      CLR => ValidSetter_SYN_IN_CLR,
      RST => RST_1,
      SYN_IN(15 downto 0) => SYN_0_DIN_1(15 downto 0),
      SYN_IN_VALID => SYN_0_VALID_1,
      SYN_OUT(15 downto 0) => Synapse_0_SYN_OUT(15 downto 0),
      SYN_OUT_VALID => Synapse_0_SYN_OUT_VALID
    );
Synapse_1: component Neuron_Synapse_1_0
    port map (
      CLK => CLK_1,
      CLR => ValidSetter_SYN_IN_CLR,
      RST => RST_1,
      SYN_IN(15 downto 0) => SYN_1_DIN_1(15 downto 0),
      SYN_IN_VALID => SYN_1_VALID_1,
      SYN_OUT(15 downto 0) => Synapse_1_SYN_OUT(15 downto 0),
      SYN_OUT_VALID => Synapse_1_SYN_OUT_VALID
    );
ValidSetter: component Neuron_ValidSetter_0
    port map (
      CLK => CLK_1,
      RST => RST_1,
      SYN_IN_CLR => ValidSetter_SYN_IN_CLR,
      SYN_IN_VALID => MultiplierEnable_DOUT,
      SYN_OUT_VALID => ValidSetter_SYN_OUT_VALID
    );
WeightRegister_0: component Neuron_WeightRegister_0_0
    port map (
      CLK => CLK_1,
      DONE_OUT => WeightRegister_0_DONE_OUT,
      PKT_IN(19 downto 0) => NeuronRouter_PKT_OUT(19 downto 0),
      PKT_IN_VALID => NeuronRouter_PKT_OUT_VALID,
      RST => RST_1,
      VAL_OUT(15 downto 0) => WeightRegister_0_VAL_OUT(15 downto 0),
      VAL_OUT_VALID => NLW_WeightRegister_0_VAL_OUT_VALID_UNCONNECTED
    );
WeightRegister_1: component Neuron_WeightRegister_1_0
    port map (
      CLK => CLK_1,
      DONE_OUT => WeightRegister_1_DONE_OUT,
      PKT_IN(19 downto 0) => NeuronRouter_PKT_OUT(19 downto 0),
      PKT_IN_VALID => NeuronRouter_PKT_OUT_VALID,
      RST => RST_1,
      VAL_OUT(15 downto 0) => WeightRegister_1_VAL_OUT(15 downto 0),
      VAL_OUT_VALID => NLW_WeightRegister_1_VAL_OUT_VALID_UNCONNECTED
    );
end STRUCTURE;
