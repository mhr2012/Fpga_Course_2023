

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Full_Adder is
    Port ( 
            A   : in STD_LOGIC;
            B   : in STD_LOGIC;
            Cin : in STD_LOGIC;
            S   : out STD_LOGIC;
            Cout: out STD_LOGIC
            
        );
end Full_Adder;

architecture Behavioral of Full_Adder is


signal S1            : std_logic:='0';
signal C1               : std_logic:='0';
signal C2               : std_logic:='0';

begin

HA_Inst1:entity work.HA 
    Port map( 
            A       =>A,
            B       =>B, 
            S       =>S1,
            C       =>C1
        );

HA_Inst2:entity work.HA 
    Port map( 
            A       =>S1,
            B       =>Cin, 
            S       =>S,
            C       =>C2
        );

Cout            <= C1 OR C2;


end Behavioral;
