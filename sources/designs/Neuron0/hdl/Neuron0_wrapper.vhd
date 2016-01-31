--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.2 (win32) Build 932637 Wed Jun 11 13:24:38 MDT 2014
--Date        : Sun Jan 31 22:39:38 2016
--Host        : Oli-Windows7VM running 32-bit Service Pack 1  (build 7601)
--Command     : generate_target Neuron0_wrapper.bd
--Design      : Neuron0_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Neuron0_wrapper is
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
end Neuron0_wrapper;

architecture STRUCTURE of Neuron0_wrapper is
  component Neuron0 is
  port (
    RST : in STD_LOGIC;
    SYN_1_DIN : in STD_LOGIC_VECTOR ( 12 downto 0 );
    SYN_1_VALID : in STD_LOGIC;
    SYN_2_DIN : in STD_LOGIC_VECTOR ( 12 downto 0 );
    SYN_2_VALID : in STD_LOGIC;
    SYN_OUT : out STD_LOGIC_VECTOR ( 11 downto 0 );
    CLK : in STD_LOGIC;
    SYN_OUT_VALID : out STD_LOGIC
  );
  end component Neuron0;
begin
Neuron0_i: component Neuron0
    port map (
      CLK => CLK,
      RST => RST,
      SYN_1_DIN(12 downto 0) => SYN_1_DIN(12 downto 0),
      SYN_1_VALID => SYN_1_VALID,
      SYN_2_DIN(12 downto 0) => SYN_2_DIN(12 downto 0),
      SYN_2_VALID => SYN_2_VALID,
      SYN_OUT(11 downto 0) => SYN_OUT(11 downto 0),
      SYN_OUT_VALID => SYN_OUT_VALID
    );
end STRUCTURE;
