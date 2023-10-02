

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Fill_Adder_4Bit is
    Port (  
            A               : in STD_LOGIC_VECTOR (3 downto 0);
            B               : in STD_LOGIC_VECTOR (3 downto 0);
            Cin             : in STD_LOGIC;
            S               : out STD_LOGIC_VECTOR (3 downto 0);
            Cout            : out STD_LOGIC
        );
end Fill_Adder_4Bit;

architecture Behavioral of Fill_Adder_4Bit is


signal c1               : std_logic:='0';
signal c2               : std_logic:='0';
signal c3               : std_logic:='0';

begin





Full_Adder_1:entity work.Full_Adder 
    Port map( 
            A           =>A(0),
            B           =>B(0),
            Cin         =>Cin,
            S           =>S(0),
            Cout        =>C1
            
        );



Full_Adder_2:entity work.Full_Adder 
    Port map( 
            A           =>A(1),
            B           =>B(1),
            Cin         =>C1,
            S           =>S(1),
            Cout        =>C2
            
        );





Full_Adder_3:entity work.Full_Adder 
    Port map( 
            A           =>A(2),
            B           =>B(2),
            Cin         =>C2,
            S           =>S(2),
            Cout        =>C3
            
        );




Full_Adder_4:entity work.Full_Adder 
    Port map( 
            A           =>A(3),
            B           =>B(3),
            Cin         =>C3,
            S           =>S(3),
            Cout        =>Cout
            
        );




end Behavioral;
