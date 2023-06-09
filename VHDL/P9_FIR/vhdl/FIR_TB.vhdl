

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_textio.all;
use std.textio.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FIR_TB is
--  Port ( );
end FIR_TB;

architecture Behavioral of FIR_TB is
signal Input_Signal                        : signed(13 downto 0):=(Others=>'0');
signal Output_Signal                        : signed(13 downto 0):=(Others=>'0');
signal Clock                        :std_logic:='0';

begin

FIR_Ins:entity work.FIR 
    Port map( 
            Clock                   =>Clock,
            Input_Signal            =>Input_Signal,    
            Output_Signal           =>Output_Signal 
                      
            );
            
            
 process
 begin
    Clock   <= '0';
    wait for 10 ns;
    Clock   <= '1';
    wait for 10 ns;
 
 end process;
            
            
            
 process(Clock)
 begin
    if rising_edge(Clock)then
        Input_Signal            <= to_signed(8191,14);  
        
    end if;
 end process;
            
write_Output_Vector: process(Clock)

    file 		output_text	: text open write_mode is "E:\Projects\text_file\lo.txt";
    variable LO1			: line;
    
begin

    if rising_edge(Clock) then
    
        write(LO1, to_integer(Output_Signal));
        writeline(output_text , LO1);
        
    end if;
end process;           
            
end Behavioral;
