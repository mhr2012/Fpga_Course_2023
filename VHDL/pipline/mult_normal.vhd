

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mult_normal is
    Port ( 
			Clock 								: in STD_LOGIC;
			i_Data 								: in signed (15 downto 0);
			o_Data 								: out signed (63 downto 0)
		);
end mult_normal;

architecture Behavioral of mult_normal is


signal a 								:  signed (15 downto 0):=to_signed(5,16);
signal b 								:  signed (15 downto 0):=to_signed(7,16);
signal c 								:  signed (15 downto 0):=to_signed(36,16);



begin
process(Clock)
begin
	if rising_edge(Clock)then
	
		o_Data						<= i_data * a * b * c;
		
		

	end if;
end process;


end Behavioral;
