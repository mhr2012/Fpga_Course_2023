
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity top is
    Port ( 
        Clock_50MHz                     : in STD_LOGIC;
        LED                             : out STD_LOGIC;
        o_Serial_TX                     : out STD_LOGIC
        
    
    
    );
end top;

architecture Behavioral of top is


signal i_Vol1                           : std_logic_vector(15 downto 0);
signal i_Vol2                           : std_logic_vector(15 downto 0);
signal i_Volt1_Valid                    : std_logic;
signal i_Volt2_Valid                    : std_logic;
signal Cnt                              : unsigned(7 downto 0);


begin



   
   
   
FDRE_inst : FDRE
generic map (
   INIT => '0',          -- Initial value of register, '0', '1'
   -- Programmable Inversion Attributes: Specifies the use of the built-in programmable inversion
   IS_C_INVERTED => '0', -- Optional inversion for C
   IS_D_INVERTED => '0', -- Optional inversion for D
   IS_R_INVERTED => '0'  -- Optional inversion for R
)
port map (
   Q => Q,   -- 1-bit output: Data
   C => C,   -- 1-bit input: Clock
   CE => CE, -- 1-bit input: Clock enable
   D => D,   -- 1-bit input: Data
   R => R    -- 1-bit input: Synchronous reset
);


Command_Inst:entity work.Command 

port map(
			Clock					=>Clock_50MHz				,						 
			i_Vol1					=>i_Vol1			,				     
			i_Volt1_Valid			=>i_Volt1_Valid		,				 
			i_Vol2					=>i_Vol2			,				     
			i_Volt2_Valid			=>i_Volt2_Valid		,				 
			o_Serial_TX				=>o_Serial_TX						  	

            
		);
		
		
process(Clock_50MHz)
begin
    if rising_edge(Clock_50MHz)then
        i_Vol1      <= x"0051";  
        i_Vol2      <= x"0051";  
        i_Volt1_Valid   <= '1';
        i_Volt2_Valid   <= '1';
        
        Cnt             <= Cnt + to_unsigned(1,8);
        LED             <= cnt(7) ; 
        
    
    end if;
    
end process;


end Behavioral;
