
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Full_Adder_4Bit_TB is
--  Port ( );
end Full_Adder_4Bit_TB;

architecture Behavioral of Full_Adder_4Bit_TB is

signal A            : std_logic_vector(3 downto 0):=(Others=>'0');
signal B            : std_logic_vector(3 downto 0):=(Others=>'0');
signal S            : std_logic_vector(3 downto 0):=(Others=>'0');
signal Cin          : std_logic:='0';
signal Cout         : std_logic:='0';


begin



process
begin
    A       <= "0001";
    B       <= "0010";
    Cin     <= '0';
    wait for 10 ns;
    A       <= "0011";
    B       <= "0011";
    Cin     <= '0';
    wait;
    
    
    
end process;





Fill_Adder_4Bit_Int:entity work.Fill_Adder_4Bit 
    Port map(  
            A               =>A,        
            B               =>B,
            Cin             =>Cin,
            S               =>S,
            Cout            =>Cout
        );






end Behavioral;
