----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/21/2023 11:29:44 AM
-- Design Name: 
-- Module Name: tb_Packetize - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_Packetize is
--  Port ( );
end tb_Packetize;

architecture Behavioral of tb_Packetize is
signal Clock_100Mhz 					: STD_LOGIC:='0';
signal i_valid 							: STD_LOGIC:='0';
signal i_Length 						: integer:=0;
signal o_valid 							: STD_LOGIC:='0';
signal o_Data 							: STD_LOGIC_VECTOR (7 downto 0):=(others=>'0');
signal i_Data 							: STD_LOGIC_VECTOR (7 downto 0):=(others=>'0');

begin

Packetiz_Inst:entity work.Packetize 
    Port map( 
            Clock_100Mhz 			=>Clock_100Mhz		,	
			i_Data 					=>i_Data 			,	
			i_valid 				=>i_valid 			,
			i_Length 				=>i_Length 			,
			o_Data 					=>o_Data 			,	
			o_valid 				=>o_valid 			
           
           );
		   


process
begin
	Clock_100Mhz	<= '0';
	wait for 5 ns;
	Clock_100Mhz	<= '1';
	wait for 5 ns;
end process;


process
begin
	i_Data	<= x"75";
	i_valid	<= '0';
	i_Length<= 4;
	wait for 1 us;
	i_Data	<= x"01";
	i_valid	<= '1';
	wait for 10 ns;
	i_valid	<= '0';
	wait for 1 us;
	i_Data	<= x"05";
	i_valid	<= '1';
    wait for 10 ns;
	i_valid	<= '0';
	wait for 1 us;
	i_Data	<= x"4C";
	i_valid	<= '1';
	wait for 10 ns;
	i_valid	<= '0';
	wait for 1 us;
	i_Data	<= x"2B";
	i_valid	<= '1';
	wait for 10 ns;
	i_valid	<= '0';
	wait for 1 us;
	i_Data	<= x"AA";
	i_valid	<= '1';
	wait for 10 ns;
	i_valid	<= '0';
	wait for 1 us;
	i_Data	<= x"90";
	i_valid	<= '0';
	wait ;
	
	
	
	
	
end process;	


		   
		   
end Behavioral;
