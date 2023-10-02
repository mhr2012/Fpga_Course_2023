

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Full_Adder_TB is
--  Port ( );
end Full_Adder_TB;

architecture Behavioral of Full_Adder_TB is

signal  A               : std_logic:='0';
signal  B               : std_logic:='0';
signal  Cin             : std_logic:='0';
signal  S               : std_logic:='0';
signal  Cout            : std_logic:='0';


begin



process
begin
    A       <= '1';
    B       <= '1';
    Cin     <= '0';
    wait for 20 ns;
    A       <= '1';
    B       <= '1';
    Cin     <= '1';
    wait for 20 ns;

end process;




Full_Adder_Inst:entity work.Full_Adder 
    Port map( 
            A           =>A,  
            B           =>B,    
            Cin         =>Cin,
            S           =>s,
            Cout        =>Cout
            
        );



end Behavioral;
