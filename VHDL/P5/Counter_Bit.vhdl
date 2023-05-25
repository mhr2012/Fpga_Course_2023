library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY debounce IS
  PORT(
    Clock_24MHz     		: IN  STD_LOGIC; 
    LED  					: OUT STD_LOGIC
	); 
END debounce;

ARCHITECTURE Behavioral OF debounce IS

  SIGNAL 	Counter 					: unsigned(31 DOWNTO 0) := (OTHERS => '0');
  
BEGIN

  
  PROCESS(Clock_24MHz)
  BEGIN
    if rising_edge(Clock_24MHz) THEN
	
	
	  
	  Counter							<= Counter + to_unsigned(1,32);



	     
    END IF;
  END PROCESS;
  
  
  
  
  LED								<= Counter(0);		-- Clock / 2 	=	12MHZ
--  LED								<= Counter_10ms(1);		-- Clock / 4	= 	6MHz
--  LED								<= Counter_10ms(2);		-- Clock / 8	=	4MHz
--  LED								<= Counter_10ms(3);		-- Clock / 16	= 	..
--  LED								<= Counter_10ms(4);		-- Clock / 32	=	..
--  LED								<= Counter_10ms(5);		-- Clock / 64	=	..
--  LED								<= Counter_10ms(6);		-- Clock / 128	=	..
--  LED								<= Counter_10ms(7);		-- Clock / 256	=	..
--  LED								<= Counter_10ms(8);		-- Clock / 512  =	..
  
END Behavioral;
