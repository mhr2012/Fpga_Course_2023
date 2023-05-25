

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Rs422_Transmitter_TB is
--  Port ( );
end Rs422_Transmitter_TB;

architecture Behavioral of Rs422_Transmitter_TB is

signal Input_Data               		: std_logic_Vector(7 downto 0):=(Others=>'0');
signal Sample_No_Per_Bit               	: unsigned(15 downto 0):=(Others=>'0');
signal Write_En               			:std_logic:='0';
signal Rs232_Tx               			:std_logic:='0';
signal Busy               				:std_logic:='0';
signal Clock_24MHz               		:std_logic:='0';


begin


Rs422_Transmitter_Int:entity work.Rs422_Transmitter 

port map(
			Input_Data		         		=>Input_Data,						
			Write_En    				 	=>Write_En,			
            Sample_No_Per_Bit              	=>Sample_No_Per_Bit,       
            
			Rs232_Tx        			  	=>Rs232_Tx,			
			Busy							=>Busy,		
			Clock_24MHz						=>Clock_24MHz			
		);
		
		
	
	

process
begin
   Clock_24MHz   <='0';
   wait for 20.83 ns;
   Clock_24MHz   <='1';
   wait for 20.83 ns;
end process;	




process
begin

    Input_Data      	<= x"57";
    Write_En        	<= '0';
    Sample_No_Per_Bit   <= to_unsigned(2500,16);
    wait for 1 us;
    Write_En        	<= '1';
    wait;


end process;	




end Behavioral;
