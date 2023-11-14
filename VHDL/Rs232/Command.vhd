library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Command is

port (
			Clock										  :  	in 	std_logic;
			i_Vol1									      :	    in	std_logic_Vector(15 downto 0);
			i_Volt1_Valid								  :	    in	std_logic;
			i_Vol2									      :	    in	std_logic_Vector(15 downto 0);
			i_Volt2_Valid								  :	    in	std_logic;
			o_Serial_TX								  	:	    out	std_logic

            
		);

end Command;

architecture Behavioral of Command is


signal s_Data										:	std_logic_Vector(7 downto 0):=(Others=>'0');  
signal s_Vol1										:	std_logic_Vector(15 downto 0):=(Others=>'0');  
signal s_Vol2										:	std_logic_Vector(15 downto 0):=(Others=>'0');  
signal s_Write   									:	std_logic:='0';
signal s_Write_Pre									:	std_logic:='0';
signal No_Pkt                     					:	unsigned(07 downto 0):=(Others=>'0');           
signal s_BaudRate                     				:	unsigned(15 downto 0):=(Others=>'0');          
signal Cnt                     						:	unsigned(31 downto 0):=(Others=>'0');            
signal s_Busy										:	std_logic:='0';
signal s_Busy_Pre									:	std_logic:='0';
signal s_Volt1_Valid_Pre							:	std_logic:='0';
signal s_Volt2_Valid_Pre							:	std_logic:='0';
signal start_Send_GUI								:	std_logic:='0';
		


begin


------------- Beginning the Program ------------

TX_Rs232_Inst:entity work.TX_Rs232 

port map(
			Clock					=>Clock			,					
			i_Data					=>s_Data		,					
			i_Write					=>s_Write		,					
            i_BaudRate              =>s_BaudRate    ,     				
			o_Serial_TX				=>o_Serial_TX	,					
			o_Busy					=>s_Busy							
		);
		
		


sim:process(Clock)
begin
	if rising_edge(Clock)then
		
		s_BaudRate            <= to_unsigned(434,16);
		Cnt <= Cnt + to_unsigned(1,32);
		if	cnt = to_unsigned(100_000_0-1,32)	then
			start_Send_GUI		<= '1';
			Cnt					<= (others=>'0');
		end if;
		
		
		
		-- FA 70 08 5C
		
		
		s_Volt1_Valid_Pre		<= i_Volt1_Valid;
		s_Volt2_Valid_Pre		<= i_Volt2_Valid;
		if	s_Volt1_Valid_Pre = '0' and i_Volt1_Valid = '1'	then -- rising valid
			s_Vol1				<= i_Vol1;
		end if;
		if	s_Volt2_Valid_Pre = '0' and i_Volt2_Valid = '1'	then -- rising valid
			s_Vol2				<= i_Vol2;
		end if;		
		
		
		
		s_Busy_Pre				<= s_Busy;
		s_Write					<= '0';
		if start_Send_GUI = '1'	then
			
			if	No_Pkt = to_unsigned(0,8)	then
				if	s_Busy = '0' then
					s_Write		<= '1';
					s_Data		<= x"FA";
					No_Pkt		<= No_Pkt + to_unsigned(1,8);
				end if;
			end if;
		
			if	No_Pkt = to_unsigned(1,8)	then
				if	s_Busy_Pre = '1'  and s_Busy = '0' then --- faling edge busy detected
					s_Write		<= '1';
					s_Data		<= x"70";
					No_Pkt		<= No_Pkt + to_unsigned(1,8);

				end if;
			end if;		
			if	No_Pkt = to_unsigned(2,8)	then
				if	s_Busy_Pre = '1'  and s_Busy = '0' then
					s_Write		<= '1';
					s_Data		<= s_Vol1(07 downto 00);
					No_Pkt		<= No_Pkt + to_unsigned(1,8);

				end if;
			end if;			
		
			if	No_Pkt = to_unsigned(3,8)	then
				if	s_Busy_Pre = '1'  and s_Busy = '0' then
					s_Write		<= '1';
					s_Data		<= s_Vol1(15 downto 08);
					No_Pkt		<= No_Pkt + to_unsigned(1,8);

				end if;
			end if;	

			if	No_Pkt = to_unsigned(4,8)	then
				if	s_Busy_Pre = '1'  and s_Busy = '0' then
					s_Write		<= '1';
					s_Data		<= s_Vol2(07 downto 00);
					No_Pkt		<= No_Pkt + to_unsigned(1,8);

				end if;
			end if;			
		
			if	No_Pkt = to_unsigned(5,8)	then
				if	s_Busy_Pre = '1'  and s_Busy = '0' then
					s_Write		<= '1';
					s_Data		<= s_Vol2(15 downto 08);
					No_Pkt		<= No_Pkt + to_unsigned(1,8);

				end if;
			end if;	






			----------------------------------------------
			if	No_Pkt = to_unsigned(6,8)	then
				if	s_Busy_Pre = '1'  and s_Busy = '0' then
					start_Send_GUI	<= '0';	
					No_Pkt			<= (others=>'0');

				end if;
			end if;				
		end if;
		
	
	
	end if;
end process;
end Behavioral;
