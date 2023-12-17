----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/16/2023 11:00:52 PM
-- Design Name: 
-- Module Name: TB_SPI - Behavioral
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

entity TB_SPI is
--  Port ( );
end TB_SPI;

architecture Behavioral of TB_SPI is

signal            clk                     :     std_logic ;
signal            i_data                  :     std_logic_vector(31 downto 0);
--signal            address                 :     std_logic_vector(7 downto 0);
signal            i_valid                 :     std_logic:='0' ;
signal            i_RW                    :     std_logic:='0' ;
--signal            MISO                    :     std_logic;
--signal            o_data                  :     std_logic ;
signal            sclk                    :     std_logic ;
signal            MOSI                    :     std_logic ;
--signal            busy                    :     std_logic ;
signal            LE                      :     std_logic ;

begin


process 
begin
    clk <= '0';
    wait for 10ns;
     clk <= '1';
      wait for 10ns;

end process;

process 
begin
    i_data <=x"12345678";
    i_valid  <= '0';
    i_rw    <= '0';
    wait for 1 us;
    i_valid  <= '1';
    wait for 100 ns;
    i_rw    <= '1';    
    wait;
    
    

end process;


SPI_INST:entity work.SPI
  Port map(
            clk                  =>   clk     ,      
            i_data               =>   i_data  ,    
            --address              =>   address ,    
            i_valid              =>   i_valid ,    
            i_RW                 =>   i_RW    ,    
            --MISO                 =>   MISO    ,    
            --o_data               =>   o_data  ,  
            sclk                 =>   sclk    ,    
            MOSI                 =>   MOSI    ,
            --busy                 =>   busy    ,    
            LE                   =>   LE         

         );

end Behavioral;
