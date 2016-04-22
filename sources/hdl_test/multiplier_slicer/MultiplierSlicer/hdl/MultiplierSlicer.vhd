--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.2 (win32) Build 932637 Wed Jun 11 13:24:38 MDT 2014
--Date        : Tue Feb 23 18:02:04 2016
--Host        : Oli-Windows7VM running 32-bit Service Pack 1  (build 7601)
--Command     : generate_target MultiplierSlicer.bd
--Design      : MultiplierSlicer
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MultiplierSlicer is
  port (
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CLK : in STD_LOGIC;
    P : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of MultiplierSlicer : entity is "MultiplierSlicer,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLanguage=VHDL,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0}";
end MultiplierSlicer;

architecture STRUCTURE of MultiplierSlicer is
  component MultiplierSlicer_mult_gen_0_0 is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    P : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component MultiplierSlicer_mult_gen_0_0;
  component MultiplierSlicer_xlslice_0_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component MultiplierSlicer_xlslice_0_0;
  signal A_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal B_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal CLK_1 : STD_LOGIC;
  signal mult_gen_0_P : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xlslice_0_Dout : STD_LOGIC_VECTOR ( 15 downto 0 );
begin
  A_1(15 downto 0) <= A(15 downto 0);
  B_1(15 downto 0) <= B(15 downto 0);
  CLK_1 <= CLK;
  P(15 downto 0) <= xlslice_0_Dout(15 downto 0);
mult_gen_0: component MultiplierSlicer_mult_gen_0_0
    port map (
      A(15 downto 0) => A_1(15 downto 0),
      B(15 downto 0) => B_1(15 downto 0),
      CLK => CLK_1,
      P(31 downto 0) => mult_gen_0_P(31 downto 0)
    );
xlslice_0: component MultiplierSlicer_xlslice_0_0
    port map (
      Din(31 downto 0) => mult_gen_0_P(31 downto 0),
      Dout(15 downto 0) => xlslice_0_Dout(15 downto 0)
    );
end STRUCTURE;
