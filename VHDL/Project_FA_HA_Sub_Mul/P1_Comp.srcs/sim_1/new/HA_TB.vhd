----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/01/2023 03:07:57 PM
-- Design Name: 
-- Module Name: HA_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HA_TB is
--  Port ( );
end HA_TB;

architecture Behavioral of HA_TB is


signal A            : std_logic:='0';
signal B            : std_logic:='0';
signal S            : std_logic:='0';
signal C            : std_logic:='0';

begin



process
begin
    A   <= '0';
    B   <= '0';
    wait for 20 ns;
    A   <= '1';
    B   <= '0';
    wait for 20 ns;
    A   <= '0';
    B   <= '1';
    wait for 20 ns;    
    A   <= '1';
    B   <= '1';
    wait for 20 ns;
end process;


HA_Inst:entity work.HA 
    Port map( 
            A       =>A,
            B       =>B,
            S       =>S,
            C       =>C
        );

end Behavioral;
