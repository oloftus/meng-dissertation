library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.Constants.all;

package AdderInputType is
    type AdderInput is array (INTEGER range <>) of UNSIGNED (precisionConst - 1 downto 0);
end package AdderInputType;
