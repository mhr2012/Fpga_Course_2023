

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_4_1_TB is
--  Port ( );
end MUX_4_1_TB;

architecture Behavioral of MUX_4_1_TB is

signal i                : std_logic_vector(3 downto 0):="0000";
signal S                : std_logic_vector(1 downto 0):="00";
signal O                : std_logic:='0';



begin

    
    

process
begin
    
    I           <= "0001";
    S           <= "00";
    wait for 100 ns;
    I           <= "1101";
    S           <= "10";
    wait for 100 ns;
    I           <= "1101";
    S           <= "01";
    wait for 100 ns;     



end process;



MUX4_1_Inst:entity work.MUX4_1 
    Port map(
            I   =>I,
            S   =>S,
            O   =>O   
        );



end Behavioral;
