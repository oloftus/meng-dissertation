--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.2 (win32) Build 932637 Wed Jun 11 13:24:38 MDT 2014
--Date        : Wed Mar 02 16:56:25 2016
--Host        : Oli-Windows7VM running 32-bit Service Pack 1  (build 7601)
--Command     : generate_target Neuron_wrapper.bd
--Design      : Neuron_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Neuron_wrapper is
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
end Neuron_wrapper;

architecture STRUCTURE of Neuron_wrapper is
  component Neuron is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    DONE_OUT : out STD_LOGIC;
    SYN_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 );
    SYN_OUT_VALID : out STD_LOGIC;
    PKT_IN_VALID : in STD_LOGIC;
    PKT_IN : in STD_LOGIC_VECTOR ( 25 downto 0 );
    NEURON_ADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    SYN_0_VALID : in STD_LOGIC;
    SYN_0_DIN : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SYN_1_VALID : in STD_LOGIC;
    SYN_1_DIN : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component Neuron;
begin
Neuron_i: component Neuron
    port map (
      CLK => CLK,
      DONE_OUT => DONE_OUT,
      NEURON_ADDR(5 downto 0) => NEURON_ADDR(5 downto 0),
      PKT_IN(25 downto 0) => PKT_IN(25 downto 0),
      PKT_IN_VALID => PKT_IN_VALID,
      RST => RST,
      SYN_0_DIN(15 downto 0) => SYN_0_DIN(15 downto 0),
      SYN_0_VALID => SYN_0_VALID,
      SYN_1_DIN(15 downto 0) => SYN_1_DIN(15 downto 0),
      SYN_1_VALID => SYN_1_VALID,
      SYN_OUT(15 downto 0) => SYN_OUT(15 downto 0),
      SYN_OUT_VALID => SYN_OUT_VALID
    );
end STRUCTURE;
