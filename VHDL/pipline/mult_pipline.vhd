

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mult_pipline is
    Port ( 
			Clock 								: in STD_LOGIC;
			i_Data 								: in signed (15 downto 0);
			o_Data 								: out signed (63 downto 0)
		);
end mult_pipline;

architecture Behavioral of mult_pipline is


signal temp1    						:  signed (31 downto 0);
signal temp2    						:  signed (47 downto 0);
signal a 								:  signed (15 downto 0):=to_signed(5,16);
signal b 								:  signed (15 downto 0):=to_signed(7,16);
signal c 								:  signed (15 downto 0):=to_signed(36,16);



begin
process(Clock)
begin
	if rising_edge(Clock)then
	
		temp1						<= i_data * a ;
		temp2						<= temp1  * b ;
		o_Data						<= temp2  * c ;
	
		

	end if;
end process;


end Behavioral;
