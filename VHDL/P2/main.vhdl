

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port ( 
        Clock                                       : IN STD_LOGIC;
        LED                                         : OUT STD_LOGIC
        );
end main;

architecture Behavioral of main is

begin
process(Clock)
begin

    if rising_edge(Clock)then
        LED             <= '1';
    end if;
end process;

end Behavioral;
