

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity subtractor_4Bit_TB is
--  Port ( );
end subtractor_4Bit_TB;

architecture Behavioral of subtractor_4Bit_TB is

signal A            : std_logic_vector(3 downto 0):=(Others=>'0');
signal B            : std_logic_vector(3 downto 0):=(Others=>'0');
signal S            : std_logic_vector(3 downto 0):=(Others=>'0');
signal Ctrl         : std_logic:='0';
signal Cin          : std_logic:='0';
signal Cout         : std_logic:='0';

begin



process
begin

    A           <= "0010";
    B           <= "0001";
    Ctrl        <= '1';
    wait for 100 ns;
    A           <= "0011";
    B           <= "0000";
    wait ;

    
end process;

subtractor_4Bit_Inst:entity work.subtractor_4Bit 
    Port map(  
            A               =>A,
            B               =>B,
            Ctrl            =>Ctrl,
            S               =>S,
            Cout            =>Cout    
        );



end Behavioral;
