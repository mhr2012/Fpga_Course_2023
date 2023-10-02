

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comp is
    Port ( 
            A                               : in STD_LOGIC_VECTOR (3 downto 0);
            B                               : in STD_LOGIC_VECTOR (3 downto 0);
            result                          : out STD_LOGIC
        );
end comp;

architecture Behavioral of comp is

begin


    result <= '1' when (A = B) else '0';
    
    


end Behavioral;
