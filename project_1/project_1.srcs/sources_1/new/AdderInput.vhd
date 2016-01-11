library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package AdderInputType is
    type AdderInput is array (INTEGER range <>) of UNSIGNED (7 downto 0); -- TODO: Shouldn't be constrained
end package AdderInputType;
