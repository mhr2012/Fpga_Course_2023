library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY debounce IS
  PORT(
    Clock_24MHz     		: IN  STD_LOGIC; 
    Push_Button  			: IN  STD_LOGIC;  
    LED  					: OUT STD_LOGIC
	); 
END debounce;

ARCHITECTURE Behavioral OF debounce IS
  SIGNAL 	Counter_reset 		: STD_LOGIC;                    
  SIGNAL 	Push_Button_Pre1 	: STD_LOGIC;                   
  SIGNAL 	Counter_10ms 		: unsigned(31 DOWNTO 0) := (OTHERS => '0');
BEGIN

  Counter_reset <= Push_Button xor Push_Button_Pre1;   
  
  PROCESS(Clock_24MHz)
  BEGIN
    if rising_edge(Clock_24MHz) THEN
	
	
      Push_Button_Pre1 				<= Push_Button;
	  
	  Counter_10ms					<= Counter_10ms + to_unsigned(1,32);

	  if Counter_reset = '1'	then
		Counter_10ms				<= (others=>'0');
	  end if;
	  
	  
	  if Counter_10ms = to_unsigned(240_000)	then
		LED							<= Push_Button_Pre1;
		Counter_10ms				<= (others=>'0');
	  end if;
	  
	  
--	  if Counter_10ms(5) = '1'	then
--		LED							<= Push_Button_Pre1;
--	  end if;	  
	     
    END IF;
  END PROCESS;
END Behavioral;
