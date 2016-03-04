-- (c) Copyright 1995-2016 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:ip:Neuron_wrapper:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Network_Neuron_0_1_0 IS
  PORT (
    CLK : IN STD_LOGIC;
    DONE_OUT : OUT STD_LOGIC;
    NEURON_ADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    PKT_IN : IN STD_LOGIC_VECTOR(25 DOWNTO 0);
    PKT_IN_VALID : IN STD_LOGIC;
    RST : IN STD_LOGIC;
    SYN_0_DIN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    SYN_0_VALID : IN STD_LOGIC;
    SYN_1_DIN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    SYN_1_VALID : IN STD_LOGIC;
    SYN_OUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    SYN_OUT_VALID : OUT STD_LOGIC
  );
END Network_Neuron_0_1_0;

ARCHITECTURE Network_Neuron_0_1_0_arch OF Network_Neuron_0_1_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : string;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF Network_Neuron_0_1_0_arch: ARCHITECTURE IS "yes";

  COMPONENT Neuron_wrapper IS
    PORT (
      CLK : IN STD_LOGIC;
      DONE_OUT : OUT STD_LOGIC;
      NEURON_ADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      PKT_IN : IN STD_LOGIC_VECTOR(25 DOWNTO 0);
      PKT_IN_VALID : IN STD_LOGIC;
      RST : IN STD_LOGIC;
      SYN_0_DIN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      SYN_0_VALID : IN STD_LOGIC;
      SYN_1_DIN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      SYN_1_VALID : IN STD_LOGIC;
      SYN_OUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      SYN_OUT_VALID : OUT STD_LOGIC
    );
  END COMPONENT Neuron_wrapper;
BEGIN
  U0 : Neuron_wrapper
    PORT MAP (
      CLK => CLK,
      DONE_OUT => DONE_OUT,
      NEURON_ADDR => NEURON_ADDR,
      PKT_IN => PKT_IN,
      PKT_IN_VALID => PKT_IN_VALID,
      RST => RST,
      SYN_0_DIN => SYN_0_DIN,
      SYN_0_VALID => SYN_0_VALID,
      SYN_1_DIN => SYN_1_DIN,
      SYN_1_VALID => SYN_1_VALID,
      SYN_OUT => SYN_OUT,
      SYN_OUT_VALID => SYN_OUT_VALID
    );
END Network_Neuron_0_1_0_arch;