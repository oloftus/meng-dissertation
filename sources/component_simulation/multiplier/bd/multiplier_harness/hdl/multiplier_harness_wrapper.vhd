--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.2 (win32) Build 932637 Wed Jun 11 13:24:38 MDT 2014
--Date        : Tue Jan 26 18:18:40 2016
--Host        : Oli-Windows7VM running 32-bit Service Pack 1  (build 7601)
--Command     : generate_target multiplier_harness_wrapper.bd
--Design      : multiplier_harness_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity multiplier_harness_wrapper is
  port (
    A : in STD_LOGIC_VECTOR ( 3 downto 0 );
    B : in STD_LOGIC_VECTOR ( 3 downto 0 );
    CLK : in STD_LOGIC;
    P : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end multiplier_harness_wrapper;

architecture STRUCTURE of multiplier_harness_wrapper is
  component multiplier_harness is
  port (
    A : in STD_LOGIC_VECTOR ( 3 downto 0 );
    B : in STD_LOGIC_VECTOR ( 3 downto 0 );
    CLK : in STD_LOGIC;
    P : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component multiplier_harness;
begin
multiplier_harness_i: component multiplier_harness
    port map (
      A(3 downto 0) => A(3 downto 0),
      B(3 downto 0) => B(3 downto 0),
      CLK => CLK,
      P(3 downto 0) => P(3 downto 0)
    );
end STRUCTURE;
