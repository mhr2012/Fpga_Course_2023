

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
signal LED_Int												: std_logic:='0';
signal Counter 												: unsigned(31 downto 0):=(Others=>'0');
begin
process(Clock)
begin

    if rising_edge(Clock)then
		Counter 							<= Counter + to_unsigned(1,32);
		if Counter = to_unsigned(24_000_000,32)	then
			LED_Int             			<= NOT LED_Int;
			Counter							<= (others=>'0');
		end if;
    end if;
end process;


LED											<= LED_Int;

end Behavioral;
