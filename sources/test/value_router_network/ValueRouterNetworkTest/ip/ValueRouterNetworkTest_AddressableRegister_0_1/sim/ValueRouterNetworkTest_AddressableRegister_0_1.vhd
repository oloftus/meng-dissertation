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

-- IP VLNV: oloftus.com:prif:AddressableRegister:1.0
-- IP Revision: 3

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ValueRouterNetworkTest_AddressableRegister_0_1 IS
  PORT (
    CLK : IN STD_LOGIC;
    RST : IN STD_LOGIC;
    PKT_IN : IN STD_LOGIC_VECTOR(30 DOWNTO 0);
    PKT_IN_VALID : IN STD_LOGIC;
    VAL_OUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    VAL_OUT_VALID : OUT STD_LOGIC;
    DONE_OUT : OUT STD_LOGIC
  );
END ValueRouterNetworkTest_AddressableRegister_0_1;

ARCHITECTURE ValueRouterNetworkTest_AddressableRegister_0_1_arch OF ValueRouterNetworkTest_AddressableRegister_0_1 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : string;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF ValueRouterNetworkTest_AddressableRegister_0_1_arch: ARCHITECTURE IS "yes";

  COMPONENT AddressableRegister IS
    GENERIC (
      dataWidth : INTEGER;
      addressWidth : INTEGER;
      address : INTEGER
    );
    PORT (
      CLK : IN STD_LOGIC;
      RST : IN STD_LOGIC;
      PKT_IN : IN STD_LOGIC_VECTOR(30 DOWNTO 0);
      PKT_IN_VALID : IN STD_LOGIC;
      VAL_OUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      VAL_OUT_VALID : OUT STD_LOGIC;
      DONE_OUT : OUT STD_LOGIC
    );
  END COMPONENT AddressableRegister;
BEGIN
  U0 : AddressableRegister
    GENERIC MAP (
      dataWidth => 16,
      addressWidth => 15,
      address => 16385
    )
    PORT MAP (
      CLK => CLK,
      RST => RST,
      PKT_IN => PKT_IN,
      PKT_IN_VALID => PKT_IN_VALID,
      VAL_OUT => VAL_OUT,
      VAL_OUT_VALID => VAL_OUT_VALID,
      DONE_OUT => DONE_OUT
    );
END ValueRouterNetworkTest_AddressableRegister_0_1_arch;