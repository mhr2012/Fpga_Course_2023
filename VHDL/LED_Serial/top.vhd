
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( 
				clock : in  STD_LOGIC;
				i_Rx				 : in  STD_LOGIC;
				led				 : out  STD_LOGIC
	 
	 
	 
	 );
end top;

architecture Behavioral of top is


signal	o_Data                  :  unsigned (7 downto 0);
signal	s_data_int0             :  unsigned (7 downto 0);
signal	s_data_int1             :  unsigned (7 downto 0);
signal	s_data_int2             :  unsigned (7 downto 0);
signal	o_valid                 :  STD_LOGIC;
signal	o_error                 :  STD_LOGIC;
signal	o_valid_Pre             :  STD_LOGIC;
	
	
	
	
begin

Reciver_232_Inst:entity work.Reciver_232
    Port map( 
            Clock                   =>Clock,
            i_Rx                    =>i_Rx,
            o_Data                  =>o_Data,
            o_valid                =>o_valid,
            o_error                 =>o_error

        );



process(Clock)
begin
	if rising_edge(Clock)then

		o_valid_Pre		<= o_valid;
		if	o_valid_Pre = '0' and o_valid = '1'	then
			s_data_int0			<= o_Data;
			s_data_int1			<= s_data_int0;
			s_data_int2			<= s_data_int1;
		
		end if;
		
		
		if	s_data_int2 = x"FA" and s_data_int1 = x"70" and s_data_int0 = x"00" then
			LED		<= '0';
		end if;


		if	s_data_int2 = x"FA" and s_data_int1 = x"70" and s_data_int0 = x"01" then
			LED		<= '1';
		end if;



	end if;
end process;

end Behavioral;

