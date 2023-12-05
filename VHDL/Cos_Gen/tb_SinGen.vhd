

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_SinGen is
--  Port ( );
end tb_SinGen;

architecture Behavioral of tb_SinGen is

 signal Clock_50MHz     :  STD_LOGIC:='0';
 signal addra           :  unsigned(7 downto 0):=(Others=>'0');
 signal douta           :  std_logic_vector(15 downto 0):=(Others=>'0');
 
 
begin



SinGen_Inst:entity work.SinGen 
    Port map( 
        Clock_50MHz     =>Clock_50MHz, 
        addra           =>addra,
        douta           =>douta  
       
        );
        

process
begin
	Clock_50MHz	<= '0';
	wait for 10 ns;
	Clock_50MHz	<= '1';
	wait for 10 ns;
end process;
        
        
process(Clock_50MHz)
begin
    if rising_edge(Clock_50MHz)then
    
        addra       <= addra + to_unsigned(1,8);

    end if;
    
end process;
        
        
        
end Behavioral;
