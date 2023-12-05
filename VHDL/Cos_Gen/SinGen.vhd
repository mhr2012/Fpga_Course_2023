------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SinGen is
    Port ( 
        Clock_50MHz     : in STD_LOGIC;
        addra           : in unsigned(7 downto 0):=(Others=>'0');
        douta           : OUT std_logic_vector(15 downto 0):=(Others=>'0')
        
        
        );
end SinGen;

architecture Behavioral of SinGen is
COMPONENT blk_mem_gen_0
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;



begin




Cos_Inst : blk_mem_gen_0
  PORT MAP (
    clka => Clock_50MHz,
    ena => '1',
    addra => std_logic_vector(addra),
    douta => douta
  );
  
  
  
end Behavioral;
