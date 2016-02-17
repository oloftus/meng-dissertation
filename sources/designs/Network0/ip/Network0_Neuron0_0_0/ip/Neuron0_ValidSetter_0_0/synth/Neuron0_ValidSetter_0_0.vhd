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

-- IP VLNV: oloftus.com:prif:ValidSetter:1.0
-- IP Revision: 3

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Neuron0_ValidSetter_0_0 IS
  PORT (
    CLK : IN STD_LOGIC;
    RST : IN STD_LOGIC;
    SYN_IN_VALID : IN STD_LOGIC;
    SYN_OUT_VALID : OUT STD_LOGIC;
    SYN_IN_CLR : OUT STD_LOGIC
  );
END Neuron0_ValidSetter_0_0;

ARCHITECTURE Neuron0_ValidSetter_0_0_arch OF Neuron0_ValidSetter_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : string;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF Neuron0_ValidSetter_0_0_arch: ARCHITECTURE IS "yes";

  COMPONENT ValidSetter IS
    GENERIC (
      latency : INTEGER
    );
    PORT (
      CLK : IN STD_LOGIC;
      RST : IN STD_LOGIC;
      SYN_IN_VALID : IN STD_LOGIC;
      SYN_OUT_VALID : OUT STD_LOGIC;
      SYN_IN_CLR : OUT STD_LOGIC
    );
  END COMPONENT ValidSetter;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF Neuron0_ValidSetter_0_0_arch: ARCHITECTURE IS "ValidSetter,Vivado 2014.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF Neuron0_ValidSetter_0_0_arch : ARCHITECTURE IS "Neuron0_ValidSetter_0_0,ValidSetter,{}";
BEGIN
  U0 : ValidSetter
    GENERIC MAP (
      latency => 2
    )
    PORT MAP (
      CLK => CLK,
      RST => RST,
      SYN_IN_VALID => SYN_IN_VALID,
      SYN_OUT_VALID => SYN_OUT_VALID,
      SYN_IN_CLR => SYN_IN_CLR
    );
END Neuron0_ValidSetter_0_0_arch;
