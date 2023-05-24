

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
signal Counter 												: unsigned(31 downto 0):=(Others=>'0');
begin
process(Clock)
begin

    if rising_edge(Clock)then
		Counter 							<= Counter + to_unsigned(1,32);
		if Counter < to_unsigned(24,32) then
			LED             				<= '0';
		end if;
		if Counter >= to_unsigned(24,32) and  Counter < to_unsigned(72,32) then
			LED             				<= '1';
			Counter							<= (others=>'0');
		end if;
		
		
		
    end if;
end process;



end Behavioral;
