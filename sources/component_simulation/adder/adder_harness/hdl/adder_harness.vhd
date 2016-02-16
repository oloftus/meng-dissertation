--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.2 (win32) Build 932637 Wed Jun 11 13:24:38 MDT 2014
--Date        : Sat Jan 30 12:57:19 2016
--Host        : Oli-Windows7VM running 32-bit Service Pack 1  (build 7601)
--Command     : generate_target adder_harness.bd
--Design      : adder_harness
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adder_harness is
  port (
    A : in STD_LOGIC_VECTOR ( 3 downto 0 );
    B : in STD_LOGIC_VECTOR ( 3 downto 0 );
    CLK : in STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of adder_harness : entity is "adder_harness,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0}";
end adder_harness;

architecture STRUCTURE of adder_harness is
  component adder_harness_c_addsub_0_0 is
  port (
    A : in STD_LOGIC_VECTOR ( 3 downto 0 );
    B : in STD_LOGIC_VECTOR ( 3 downto 0 );
    CLK : in STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component adder_harness_c_addsub_0_0;
  signal A_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal B_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal CLK_1 : STD_LOGIC;
  signal c_addsub_0_S : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  A_1(3 downto 0) <= A(3 downto 0);
  B_1(3 downto 0) <= B(3 downto 0);
  CLK_1 <= CLK;
  S(3 downto 0) <= c_addsub_0_S(3 downto 0);
c_addsub_0: component adder_harness_c_addsub_0_0
    port map (
      A(3 downto 0) => A_1(3 downto 0),
      B(3 downto 0) => B_1(3 downto 0),
      CLK => CLK_1,
      S(3 downto 0) => c_addsub_0_S(3 downto 0)
    );
end STRUCTURE;
