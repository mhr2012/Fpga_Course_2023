
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity com_TB is
--  Port ( );
end com_TB;

architecture Behavioral of com_TB is


signal A            : STD_LOGIC_VECTOR (3 downto 0);              
signal B            : STD_LOGIC_VECTOR (3 downto 0);              
signal result       : STD_LOGIC;


begin

process
begin
    A   <= "0001";
    B   <= "0010";
    wait for 10 us;
    A   <= "0001";
    B   <= "0001";    
    wait for 10 us;
    A   <= "1001";
    B   <= "0111";
    wait;
end process;

comp_inst:entity work.comp
    Port map( 
            A       =>A,                  
            B       =>B,                    
            result  =>result                 
        );



end Behavioral;
