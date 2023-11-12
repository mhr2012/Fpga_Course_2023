library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TX_Rs232 is

port (
			Clock										:  	in 	std_logic;
			i_Volage									:	in	std_logic_Vector(31 downto 0);
			i_Write										:	in	std_logic
            
		);

end TX_Rs232;

architecture Behavioral of TX_Rs232 is
signal Clock										:  	std_logic;
signal i_Data										:	std_logic_Vector(7 downto 0);
signal i_Write_Pre									:	std_logic;
signal i_BaudRate                     				:	unsigned(15 downto 0);            
signal o_Serial_TX									:	std_logic;
signal o_Busy										:	std_logic;
		


begin


------------- Beginning the Program ------------

TX_Rs232_Inst:entity work.TX_Rs232 

port map(
			Clock					=>Clock			,					
			i_Data					=>i_Data		,					
			i_Write					=>i_Write		,					
            i_BaudRate              =>i_BaudRate    ,     				
			o_Serial_TX				=>o_Serial_TX	,					
			o_Busy					=>o_Busy							
		);
		
		




process(Clock)
begin						
	if rising_edge(Clock) then

		i_Write_Pre					<= i_Write;
		if	i_Write_Pre = '1' and i_Write = '0'	then
			s_PKT					<= i_PKT;
			Start_Send_PKT			<= '1';
		end if;


		s_busy						<= busy;
		i_Write						<= '0';
		if	Start_Send_PKT = '1' then
		
			if	Cnt = to_unsigned(0,8)	then
				if	busy = '0'	then
					i_Write			<= '1';
					i_Data			<= x"FA";
					Cnt 			<= Cnt + to_unsigned(1,8);
				end if;
			end if;
				
			if	Cnt = to_unsigned(1,8)	then
				if	busy = '0'	and s_busy = '1' then		-- falling edge busy
					i_Write			<= '1';
					i_Data			<= x"70";
				end if;
			end if;			
			
			if	Cnt = to_unsigned(2,8)	then
				if	busy = '0'	and s_busy = '1' then		-- falling edge busy
					i_Write			<= '1';
					i_Data			<= s_PKT(31 downto 24);
				end if;
			end if;				
		
			if	Cnt = to_unsigned(3,8)	then
				if	busy = '0'	and s_busy = '1' then		-- falling edge busy
					i_Write			<= '1';
					i_Data			<= s_PKT(23 downto 16);
				end if;
			end if;				


			if	Cnt = to_unsigned(4,8)	then
				if	busy = '0'	and s_busy = '1' then		-- falling edge busy
					i_Write			<= '1';
					i_Data			<= s_PKT(15 downto 08);
				end if;
			end if;		
			
			
			
			if	Cnt = to_unsigned(5,8)	then
				if	busy = '0'	and s_busy = '1' then		-- falling edge busy
					i_Write			<= '1';
					i_Data			<= s_PKT(07 downto 00);
				end if;
			end if;		

			-- footer 
			if	Cnt = to_unsigned(6,8)	then
				if	busy = '0'	and s_busy = '1' then		-- falling edge busy
					i_Write			<= '1';
					i_Data			<= x"8C";
				end if;
			end if;		
			
			if	Cnt = to_unsigned(7,8)	then
				if	busy = '0'	and s_busy = '1' then		-- falling edge busy
					i_Write			<= '1';
					i_Data			<= x"9D";
				end if;
			end if;		
			if	Cnt = to_unsigned(8,8)	then
				if	busy = '0'	and s_busy = '1' then		-- falling edge busy
					Start_Send_PKT	<= '0';
					Cnt				<= (others=>'0');
				end if;
			end if;		
		
		end if;



	
	end if; ---- end if for Rising Edge ----
end process;

end Behavioral;
