--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.2 (win32) Build 932637 Wed Jun 11 13:24:38 MDT 2014
--Date        : Wed Mar 02 22:27:24 2016
--Host        : Oli-Windows7VM running 32-bit Service Pack 1  (build 7601)
--Command     : generate_target Network.bd
--Design      : Network
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Network is
  port (
    CLK : in STD_LOGIC;
    DONE_OUT : out STD_LOGIC;
    NXT_SYN_OUT : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 31 downto 0 );
    PKT_IN_VALID : in STD_LOGIC;
    RST : in STD_LOGIC;
    SYN_OUTS : out STD_LOGIC_VECTOR ( 31 downto 0 );
    SYN_OUTS_READY : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of Network : entity is "Network,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLanguage=VHDL,numBlks=31,numReposBlks=31,numNonXlnxBlks=12,numHierBlks=0,maxHierDepth=0}";
end Network;

architecture STRUCTURE of Network is
  component Network_TypeRouter_Stimulus_0 is
  port (
    CLK : in STD_LOGIC;
    PKT_IN_VALID : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 31 downto 0 );
    PKT_OUT_VALID : out STD_LOGIC;
    PKT_OUT : out STD_LOGIC_VECTOR ( 30 downto 0 );
    DONE_IN : in STD_LOGIC;
    DONE_OUT : out STD_LOGIC;
    ADDR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component Network_TypeRouter_Stimulus_0;
  component Network_TypeRouter_Stimulus_Address_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component Network_TypeRouter_Stimulus_Address_0;
  component Network_TypeRouter_Weight_0 is
  port (
    CLK : in STD_LOGIC;
    PKT_IN_VALID : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 31 downto 0 );
    PKT_OUT_VALID : out STD_LOGIC;
    PKT_OUT : out STD_LOGIC_VECTOR ( 30 downto 0 );
    DONE_IN : in STD_LOGIC;
    DONE_OUT : out STD_LOGIC;
    ADDR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component Network_TypeRouter_Weight_0;
  component Network_TypeRouter_Weight_Address_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component Network_TypeRouter_Weight_Address_0;
  component Network_PktRcvd_Layers_0 is
  port (
    DIN : in STD_LOGIC_VECTOR ( 1 downto 0 );
    DOUT : out STD_LOGIC
  );
  end component Network_PktRcvd_Layers_0;
  component Network_PktRcvdConcat_Layers_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component Network_PktRcvdConcat_Layers_0;
  component Network_PktRcvd_StimulusRegisters_0 is
  port (
    DIN : in STD_LOGIC_VECTOR ( 1 downto 0 );
    DOUT : out STD_LOGIC
  );
  end component Network_PktRcvd_StimulusRegisters_0;
  component Network_PktRcvdConcat_StimulusRegisters_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component Network_PktRcvdConcat_StimulusRegisters_0;
  component Network_PktRcvd_0 is
  port (
    DIN : in STD_LOGIC_VECTOR ( 1 downto 0 );
    DOUT : out STD_LOGIC
  );
  end component Network_PktRcvd_0;
  component Network_PktRcvdConcat_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component Network_PktRcvdConcat_0;
  component Network_SynOutConcat_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    In1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component Network_SynOutConcat_0;
  component Network_SynOutValidConcat_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component Network_SynOutValidConcat_0;
  component Network_SynOutBuffer_0 is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    DIN : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DVALID : in STD_LOGIC_VECTOR ( 1 downto 0 );
    NXT : in STD_LOGIC;
    DOUT : out STD_LOGIC_VECTOR ( 31 downto 0 );
    READY : out STD_LOGIC
  );
  end component Network_SynOutBuffer_0;
  component Network_LayerRouter_0_0 is
  port (
    CLK : in STD_LOGIC;
    PKT_IN_VALID : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 30 downto 0 );
    PKT_OUT_VALID : out STD_LOGIC;
    PKT_OUT : out STD_LOGIC_VECTOR ( 25 downto 0 );
    DONE_IN : in STD_LOGIC;
    DONE_OUT : out STD_LOGIC;
    ADDR : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component Network_LayerRouter_0_0;
  component Network_LayerRouter_0_Address_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component Network_LayerRouter_0_Address_0;
  component Network_PktRcvd_Layer_0_0 is
  port (
    DIN : in STD_LOGIC_VECTOR ( 1 downto 0 );
    DOUT : out STD_LOGIC
  );
  end component Network_PktRcvd_Layer_0_0;
  component Network_PktRcvdConcat_Layer_0_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component Network_PktRcvdConcat_Layer_0_0;
  component Network_Neuron_0_0_0 is
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
  end component Network_Neuron_0_0_0;
  component Network_Neuron_0_0_Address_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  end component Network_Neuron_0_0_Address_0;
  component Network_Neuron_0_1_0 is
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
  end component Network_Neuron_0_1_0;
  component Network_Neuron_0_1_Address_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  end component Network_Neuron_0_1_Address_0;
  component Network_LayerRouter_1_0 is
  port (
    CLK : in STD_LOGIC;
    PKT_IN_VALID : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 30 downto 0 );
    PKT_OUT_VALID : out STD_LOGIC;
    PKT_OUT : out STD_LOGIC_VECTOR ( 25 downto 0 );
    DONE_IN : in STD_LOGIC;
    DONE_OUT : out STD_LOGIC;
    ADDR : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component Network_LayerRouter_1_0;
  component Network_LayerRouter_1_Address_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component Network_LayerRouter_1_Address_0;
  component Network_PktRcvd_Layer_1_0 is
  port (
    DIN : in STD_LOGIC_VECTOR ( 1 downto 0 );
    DOUT : out STD_LOGIC
  );
  end component Network_PktRcvd_Layer_1_0;
  component Network_PktRcvdConcat_Layer_1_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component Network_PktRcvdConcat_Layer_1_0;
  component Network_Neuron_1_0_0 is
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
  end component Network_Neuron_1_0_0;
  component Network_Neuron_1_0_Address_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  end component Network_Neuron_1_0_Address_0;
  component Network_Neuron_1_1_0 is
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
  end component Network_Neuron_1_1_0;
  component Network_Neuron_1_1_Address_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  end component Network_Neuron_1_1_Address_0;
  component Network_StimulusRegister_0_0 is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 30 downto 0 );
    PKT_IN_VALID : in STD_LOGIC;
    VAL_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    VAL_OUT_VALID : out STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component Network_StimulusRegister_0_0;
  component Network_StimulusRegister_1_0 is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 30 downto 0 );
    PKT_IN_VALID : in STD_LOGIC;
    VAL_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    VAL_OUT_VALID : out STD_LOGIC;
    DONE_OUT : out STD_LOGIC
  );
  end component Network_StimulusRegister_1_0;
  signal CLK_1 : STD_LOGIC;
  signal LayerRouter_0_Address_dout : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal LayerRouter_0_DONE_OUT : STD_LOGIC;
  signal LayerRouter_0_PKT_OUT : STD_LOGIC_VECTOR ( 25 downto 0 );
  signal LayerRouter_0_PKT_OUT_VALID : STD_LOGIC;
  signal LayerRouter_1_Address_dout : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal LayerRouter_1_DONE_OUT : STD_LOGIC;
  signal LayerRouter_1_PKT_OUT : STD_LOGIC_VECTOR ( 25 downto 0 );
  signal LayerRouter_1_PKT_OUT_VALID : STD_LOGIC;
  signal NXT_SYN_OUT_1 : STD_LOGIC;
  signal Neuron_0_0_Address_dout : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal Neuron_0_0_DONE_OUT : STD_LOGIC;
  signal Neuron_0_0_SYN_OUT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Neuron_0_0_SYN_OUT_VALID : STD_LOGIC;
  signal Neuron_0_1_Address_dout : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal Neuron_0_1_DONE_OUT : STD_LOGIC;
  signal Neuron_0_1_SYN_OUT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Neuron_0_1_SYN_OUT_VALID : STD_LOGIC;
  signal Neuron_1_0_Address_dout : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal Neuron_1_0_DONE_OUT : STD_LOGIC;
  signal Neuron_1_0_SYN_OUT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Neuron_1_0_SYN_OUT_VALID : STD_LOGIC;
  signal Neuron_1_1_Address_dout : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal Neuron_1_1_DONE_OUT : STD_LOGIC;
  signal Neuron_1_1_SYN_OUT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Neuron_1_1_SYN_OUT_VALID : STD_LOGIC;
  signal PKT_IN_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PKT_IN_VALID_1 : STD_LOGIC;
  signal PktRcvdConcat_Layer_0_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PktRcvdConcat_Layer_1_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PktRcvdConcat_Layers_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PktRcvdConcat_StimulusRegisters_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PktRcvdConcat_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal PktRcvd_DOUT : STD_LOGIC;
  signal PktRcvd_Layer_0_DOUT : STD_LOGIC;
  signal PktRcvd_Layer_1_DOUT : STD_LOGIC;
  signal PktRcvd_Layers_DOUT : STD_LOGIC;
  signal PktRcvd_StimulusRegisters_DOUT : STD_LOGIC;
  signal RST_1 : STD_LOGIC;
  signal StimulusRegister_0_DONE_OUT : STD_LOGIC;
  signal StimulusRegister_0_VAL_OUT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StimulusRegister_0_VAL_OUT_VALID : STD_LOGIC;
  signal StimulusRegister_1_DONE_OUT : STD_LOGIC;
  signal StimulusRegister_1_VAL_OUT : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal StimulusRegister_1_VAL_OUT_VALID : STD_LOGIC;
  signal SynOutBuffer_DOUT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SynOutBuffer_READY : STD_LOGIC;
  signal SynOutConcat_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SynOutValidConcat_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal TypeRouter_Stimulus_Address_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal TypeRouter_Stimulus_DONE_OUT : STD_LOGIC;
  signal TypeRouter_Stimulus_PKT_OUT : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal TypeRouter_Stimulus_PKT_OUT_VALID : STD_LOGIC;
  signal TypeRouter_Weight_Address_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal TypeRouter_Weight_DONE_OUT : STD_LOGIC;
  signal TypeRouter_Weight_PKT_OUT : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal TypeRouter_Weight_PKT_OUT_VALID : STD_LOGIC;
begin
  CLK_1 <= CLK;
  DONE_OUT <= PktRcvd_DOUT;
  NXT_SYN_OUT_1 <= NXT_SYN_OUT;
  PKT_IN_1(31 downto 0) <= PKT_IN(31 downto 0);
  PKT_IN_VALID_1 <= PKT_IN_VALID;
  RST_1 <= RST;
  SYN_OUTS(31 downto 0) <= SynOutBuffer_DOUT(31 downto 0);
  SYN_OUTS_READY <= SynOutBuffer_READY;
LayerRouter_0: component Network_LayerRouter_0_0
    port map (
      ADDR(4 downto 0) => LayerRouter_0_Address_dout(4 downto 0),
      CLK => CLK_1,
      DONE_IN => PktRcvd_Layer_0_DOUT,
      DONE_OUT => LayerRouter_0_DONE_OUT,
      PKT_IN(30 downto 0) => TypeRouter_Weight_PKT_OUT(30 downto 0),
      PKT_IN_VALID => TypeRouter_Weight_PKT_OUT_VALID,
      PKT_OUT(25 downto 0) => LayerRouter_0_PKT_OUT(25 downto 0),
      PKT_OUT_VALID => LayerRouter_0_PKT_OUT_VALID
    );
LayerRouter_0_Address: component Network_LayerRouter_0_Address_0
    port map (
      dout(4 downto 0) => LayerRouter_0_Address_dout(4 downto 0)
    );
LayerRouter_1: component Network_LayerRouter_1_0
    port map (
      ADDR(4 downto 0) => LayerRouter_1_Address_dout(4 downto 0),
      CLK => CLK_1,
      DONE_IN => PktRcvd_Layer_1_DOUT,
      DONE_OUT => LayerRouter_1_DONE_OUT,
      PKT_IN(30 downto 0) => TypeRouter_Weight_PKT_OUT(30 downto 0),
      PKT_IN_VALID => TypeRouter_Weight_PKT_OUT_VALID,
      PKT_OUT(25 downto 0) => LayerRouter_1_PKT_OUT(25 downto 0),
      PKT_OUT_VALID => LayerRouter_1_PKT_OUT_VALID
    );
LayerRouter_1_Address: component Network_LayerRouter_1_Address_0
    port map (
      dout(4 downto 0) => LayerRouter_1_Address_dout(4 downto 0)
    );
Neuron_0_0: component Network_Neuron_0_0_0
    port map (
      CLK => CLK_1,
      DONE_OUT => Neuron_0_0_DONE_OUT,
      NEURON_ADDR(5 downto 0) => Neuron_0_0_Address_dout(5 downto 0),
      PKT_IN(25 downto 0) => LayerRouter_0_PKT_OUT(25 downto 0),
      PKT_IN_VALID => LayerRouter_0_PKT_OUT_VALID,
      RST => RST_1,
      SYN_0_DIN(15 downto 0) => StimulusRegister_0_VAL_OUT(15 downto 0),
      SYN_0_VALID => StimulusRegister_0_VAL_OUT_VALID,
      SYN_1_DIN(15 downto 0) => StimulusRegister_1_VAL_OUT(15 downto 0),
      SYN_1_VALID => StimulusRegister_1_VAL_OUT_VALID,
      SYN_OUT(15 downto 0) => Neuron_0_0_SYN_OUT(15 downto 0),
      SYN_OUT_VALID => Neuron_0_0_SYN_OUT_VALID
    );
Neuron_0_0_Address: component Network_Neuron_0_0_Address_0
    port map (
      dout(5 downto 0) => Neuron_0_0_Address_dout(5 downto 0)
    );
Neuron_0_1: component Network_Neuron_0_1_0
    port map (
      CLK => CLK_1,
      DONE_OUT => Neuron_0_1_DONE_OUT,
      NEURON_ADDR(5 downto 0) => Neuron_0_1_Address_dout(5 downto 0),
      PKT_IN(25 downto 0) => LayerRouter_0_PKT_OUT(25 downto 0),
      PKT_IN_VALID => LayerRouter_0_PKT_OUT_VALID,
      RST => RST_1,
      SYN_0_DIN(15 downto 0) => StimulusRegister_0_VAL_OUT(15 downto 0),
      SYN_0_VALID => StimulusRegister_0_VAL_OUT_VALID,
      SYN_1_DIN(15 downto 0) => StimulusRegister_1_VAL_OUT(15 downto 0),
      SYN_1_VALID => StimulusRegister_1_VAL_OUT_VALID,
      SYN_OUT(15 downto 0) => Neuron_0_1_SYN_OUT(15 downto 0),
      SYN_OUT_VALID => Neuron_0_1_SYN_OUT_VALID
    );
Neuron_0_1_Address: component Network_Neuron_0_1_Address_0
    port map (
      dout(5 downto 0) => Neuron_0_1_Address_dout(5 downto 0)
    );
Neuron_1_0: component Network_Neuron_1_0_0
    port map (
      CLK => CLK_1,
      DONE_OUT => Neuron_1_0_DONE_OUT,
      NEURON_ADDR(5 downto 0) => Neuron_1_0_Address_dout(5 downto 0),
      PKT_IN(25 downto 0) => LayerRouter_1_PKT_OUT(25 downto 0),
      PKT_IN_VALID => LayerRouter_1_PKT_OUT_VALID,
      RST => RST_1,
      SYN_0_DIN(15 downto 0) => Neuron_0_0_SYN_OUT(15 downto 0),
      SYN_0_VALID => Neuron_0_0_SYN_OUT_VALID,
      SYN_1_DIN(15 downto 0) => Neuron_0_1_SYN_OUT(15 downto 0),
      SYN_1_VALID => Neuron_0_1_SYN_OUT_VALID,
      SYN_OUT(15 downto 0) => Neuron_1_0_SYN_OUT(15 downto 0),
      SYN_OUT_VALID => Neuron_1_0_SYN_OUT_VALID
    );
Neuron_1_0_Address: component Network_Neuron_1_0_Address_0
    port map (
      dout(5 downto 0) => Neuron_1_0_Address_dout(5 downto 0)
    );
Neuron_1_1: component Network_Neuron_1_1_0
    port map (
      CLK => CLK_1,
      DONE_OUT => Neuron_1_1_DONE_OUT,
      NEURON_ADDR(5 downto 0) => Neuron_1_1_Address_dout(5 downto 0),
      PKT_IN(25 downto 0) => LayerRouter_1_PKT_OUT(25 downto 0),
      PKT_IN_VALID => LayerRouter_1_PKT_OUT_VALID,
      RST => RST_1,
      SYN_0_DIN(15 downto 0) => Neuron_0_0_SYN_OUT(15 downto 0),
      SYN_0_VALID => Neuron_0_0_SYN_OUT_VALID,
      SYN_1_DIN(15 downto 0) => Neuron_0_1_SYN_OUT(15 downto 0),
      SYN_1_VALID => Neuron_0_1_SYN_OUT_VALID,
      SYN_OUT(15 downto 0) => Neuron_1_1_SYN_OUT(15 downto 0),
      SYN_OUT_VALID => Neuron_1_1_SYN_OUT_VALID
    );
Neuron_1_1_Address: component Network_Neuron_1_1_Address_0
    port map (
      dout(5 downto 0) => Neuron_1_1_Address_dout(5 downto 0)
    );
PktRcvd: component Network_PktRcvd_0
    port map (
      DIN(1 downto 0) => PktRcvdConcat_dout(1 downto 0),
      DOUT => PktRcvd_DOUT
    );
PktRcvdConcat: component Network_PktRcvdConcat_0
    port map (
      In0(0) => TypeRouter_Weight_DONE_OUT,
      In1(0) => TypeRouter_Stimulus_DONE_OUT,
      dout(1 downto 0) => PktRcvdConcat_dout(1 downto 0)
    );
PktRcvdConcat_Layer_0: component Network_PktRcvdConcat_Layer_0_0
    port map (
      In0(0) => Neuron_0_0_DONE_OUT,
      In1(0) => Neuron_0_1_DONE_OUT,
      dout(1 downto 0) => PktRcvdConcat_Layer_0_dout(1 downto 0)
    );
PktRcvdConcat_Layer_1: component Network_PktRcvdConcat_Layer_1_0
    port map (
      In0(0) => Neuron_1_0_DONE_OUT,
      In1(0) => Neuron_1_1_DONE_OUT,
      dout(1 downto 0) => PktRcvdConcat_Layer_1_dout(1 downto 0)
    );
PktRcvdConcat_Layers: component Network_PktRcvdConcat_Layers_0
    port map (
      In0(0) => LayerRouter_0_DONE_OUT,
      In1(0) => LayerRouter_1_DONE_OUT,
      dout(1 downto 0) => PktRcvdConcat_Layers_dout(1 downto 0)
    );
PktRcvdConcat_StimulusRegisters: component Network_PktRcvdConcat_StimulusRegisters_0
    port map (
      In0(0) => StimulusRegister_0_DONE_OUT,
      In1(0) => StimulusRegister_1_DONE_OUT,
      dout(1 downto 0) => PktRcvdConcat_StimulusRegisters_dout(1 downto 0)
    );
PktRcvd_Layer_0: component Network_PktRcvd_Layer_0_0
    port map (
      DIN(1 downto 0) => PktRcvdConcat_Layer_0_dout(1 downto 0),
      DOUT => PktRcvd_Layer_0_DOUT
    );
PktRcvd_Layer_1: component Network_PktRcvd_Layer_1_0
    port map (
      DIN(1 downto 0) => PktRcvdConcat_Layer_1_dout(1 downto 0),
      DOUT => PktRcvd_Layer_1_DOUT
    );
PktRcvd_Layers: component Network_PktRcvd_Layers_0
    port map (
      DIN(1 downto 0) => PktRcvdConcat_Layers_dout(1 downto 0),
      DOUT => PktRcvd_Layers_DOUT
    );
PktRcvd_StimulusRegisters: component Network_PktRcvd_StimulusRegisters_0
    port map (
      DIN(1 downto 0) => PktRcvdConcat_StimulusRegisters_dout(1 downto 0),
      DOUT => PktRcvd_StimulusRegisters_DOUT
    );
StimulusRegister_0: component Network_StimulusRegister_0_0
    port map (
      CLK => CLK_1,
      DONE_OUT => StimulusRegister_0_DONE_OUT,
      PKT_IN(30 downto 0) => TypeRouter_Stimulus_PKT_OUT(30 downto 0),
      PKT_IN_VALID => TypeRouter_Stimulus_PKT_OUT_VALID,
      RST => RST_1,
      VAL_OUT(15 downto 0) => StimulusRegister_0_VAL_OUT(15 downto 0),
      VAL_OUT_VALID => StimulusRegister_0_VAL_OUT_VALID
    );
StimulusRegister_1: component Network_StimulusRegister_1_0
    port map (
      CLK => CLK_1,
      DONE_OUT => StimulusRegister_1_DONE_OUT,
      PKT_IN(30 downto 0) => TypeRouter_Stimulus_PKT_OUT(30 downto 0),
      PKT_IN_VALID => TypeRouter_Stimulus_PKT_OUT_VALID,
      RST => RST_1,
      VAL_OUT(15 downto 0) => StimulusRegister_1_VAL_OUT(15 downto 0),
      VAL_OUT_VALID => StimulusRegister_1_VAL_OUT_VALID
    );
SynOutBuffer: component Network_SynOutBuffer_0
    port map (
      CLK => CLK_1,
      DIN(31 downto 0) => SynOutConcat_dout(31 downto 0),
      DOUT(31 downto 0) => SynOutBuffer_DOUT(31 downto 0),
      DVALID(1 downto 0) => SynOutValidConcat_dout(1 downto 0),
      NXT => NXT_SYN_OUT_1,
      READY => SynOutBuffer_READY,
      RST => RST_1
    );
SynOutConcat: component Network_SynOutConcat_0
    port map (
      In0(15 downto 0) => Neuron_1_0_SYN_OUT(15 downto 0),
      In1(15 downto 0) => Neuron_1_1_SYN_OUT(15 downto 0),
      dout(31 downto 0) => SynOutConcat_dout(31 downto 0)
    );
SynOutValidConcat: component Network_SynOutValidConcat_0
    port map (
      In0(0) => Neuron_1_0_SYN_OUT_VALID,
      In1(0) => Neuron_1_1_SYN_OUT_VALID,
      dout(1 downto 0) => SynOutValidConcat_dout(1 downto 0)
    );
TypeRouter_Stimulus: component Network_TypeRouter_Stimulus_0
    port map (
      ADDR(0) => TypeRouter_Stimulus_Address_dout(0),
      CLK => CLK_1,
      DONE_IN => PktRcvd_StimulusRegisters_DOUT,
      DONE_OUT => TypeRouter_Stimulus_DONE_OUT,
      PKT_IN(31 downto 0) => PKT_IN_1(31 downto 0),
      PKT_IN_VALID => PKT_IN_VALID_1,
      PKT_OUT(30 downto 0) => TypeRouter_Stimulus_PKT_OUT(30 downto 0),
      PKT_OUT_VALID => TypeRouter_Stimulus_PKT_OUT_VALID
    );
TypeRouter_Stimulus_Address: component Network_TypeRouter_Stimulus_Address_0
    port map (
      dout(0) => TypeRouter_Stimulus_Address_dout(0)
    );
TypeRouter_Weight: component Network_TypeRouter_Weight_0
    port map (
      ADDR(0) => TypeRouter_Weight_Address_dout(0),
      CLK => CLK_1,
      DONE_IN => PktRcvd_Layers_DOUT,
      DONE_OUT => TypeRouter_Weight_DONE_OUT,
      PKT_IN(31 downto 0) => PKT_IN_1(31 downto 0),
      PKT_IN_VALID => PKT_IN_VALID_1,
      PKT_OUT(30 downto 0) => TypeRouter_Weight_PKT_OUT(30 downto 0),
      PKT_OUT_VALID => TypeRouter_Weight_PKT_OUT_VALID
    );
TypeRouter_Weight_Address: component Network_TypeRouter_Weight_Address_0
    port map (
      dout(0) => TypeRouter_Weight_Address_dout(0)
    );
end STRUCTURE;
