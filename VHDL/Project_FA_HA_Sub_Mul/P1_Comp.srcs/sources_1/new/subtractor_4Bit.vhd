

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity subtractor_4Bit is
    Port (  
            A                   : in STD_LOGIC_VECTOR (3 downto 0);
            B                   : in STD_LOGIC_VECTOR (3 downto 0);
            Ctrl                : in STD_LOGIC;
            S                   : out STD_LOGIC_VECTOR (3 downto 0);
            Cout                : out STD_LOGIC
        );
end subtractor_4Bit;

architecture Behavioral of subtractor_4Bit is

signal BS                   : std_logic_Vector(3 downto 0):=(Others=>'0');
signal C1                   : std_logic:='0';
signal C2                   : std_logic:='0';
signal C3                   : std_logic:='0';



begin



BS(0)           <= Ctrl xor B(0);
BS(1)           <= Ctrl xor B(1);
BS(2)           <= Ctrl xor B(2);
BS(3)           <= Ctrl xor B(3);

            
Full_Adder_Inst1:entity work.Full_Adder 
    Port map( 
            A       =>A(0),
            B       =>BS(0),
            Cin     =>Ctrl,
            S       =>S(0),
            Cout    =>C1
            
        );



Full_Adder_Inst2:entity work.Full_Adder 
    Port map( 
            A       =>A(1),
            B       =>BS(1),
            Cin     =>C1,
            S       =>S(1), 
            Cout    =>C2
            
        );




Full_Adder_Inst3:entity work.Full_Adder 
    Port map( 
            A       =>A(2),
            B       =>BS(2),
            Cin     =>C2,
            S       =>S(2),
            Cout    =>C3
            
        );


Full_Adder_Inst4:entity work.Full_Adder 
    Port map( 
            A       =>A(3),
            B       =>BS(3),
            Cin     =>C3,
            S       =>S(3),
            Cout    =>Cout
            
        );






end Behavioral;
