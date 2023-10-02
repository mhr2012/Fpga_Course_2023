
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX4_1 is
    Port (
            I       : in STD_LOGIC_VECTOR (3 downto 0);
            S       : in STD_LOGIC_VECTOR (1 downto 0);
            O       : out STD_LOGIC
        );
end MUX4_1;

architecture Behavioral of MUX4_1 is

begin


    O       <=  I(0) when S="00" else
                I(1) when S="01" else
                I(2) when S="10" else
                I(3);



    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

end Behavioral;
