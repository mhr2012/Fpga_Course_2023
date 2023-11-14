

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_Tx232 is
--  Port ( );
end tb_Tx232;

architecture Behavioral of tb_Tx232 is

signal Clock										:  	std_logic:='0';
signal s_Data										:	std_logic_Vector(7 downto 0):=(Others=>'0');
signal s_Write										:	std_logic:='0';
signal s_BaudRate                     				:	unsigned(15 downto 0):=(Others=>'0');
signal s_Serial_TX									:	std_logic:='0';
signal s_Busy										:	std_logic:='0';
signal s_Busy_Pre									:	std_logic:='0';
signal start_Send_GUI   							:	std_logic:='0';

signal Cnt                                          : unsigned(31 downto 0):=(Others=>'0');
signal No_Pkt                                       : unsigned(07 downto 0):=(Others=>'0');



begin


TX_Rs232_Inst:entity work.TX_Rs232 

port map(
			Clock					=>Clock			,						
			i_Data					=>s_Data		,					
			i_Write					=>s_Write		,					
            i_BaudRate              =>s_BaudRate    ,     				
			o_Serial_TX				=>s_Serial_TX	,					
			o_Busy					=>s_Busy							
		);
		
		
	


Clock_Gen:process
begin
	Clock	<= '0';
	wait for 5 ns;
	Clock	<= '1';
	wait for 5 ns;
end process;	


sim:process(Clock)
begin
	if rising_edge(Clock)then
		
		s_BaudRate        <= to_unsigned(868,16);
		Cnt <= Cnt + to_unsigned(1,32);
		if	cnt = to_unsigned(100_000_00-1,32)	then
			start_Send_GUI		<= '1';
			Cnt					<= (others=>'0');
		end if;
		
		
		
		-- FA 70 08 5C
		
		
		
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
				if	s_Busy_Pre = '1'  and s_Busy = '0' then
					s_Write		<= '1';
					s_Data		<= x"70";
					No_Pkt		<= No_Pkt + to_unsigned(1,8);

				end if;
			end if;		
			if	No_Pkt = to_unsigned(2,8)	then
				if	s_Busy_Pre = '1'  and s_Busy = '0' then
					s_Write		<= '1';
					s_Data		<= x"08";
					No_Pkt		<= No_Pkt + to_unsigned(1,8);

				end if;
			end if;			
		
			if	No_Pkt = to_unsigned(3,8)	then
				if	s_Busy_Pre = '1'  and s_Busy = '0' then
					s_Write		<= '1';
					s_Data		<= x"5C";
					No_Pkt		<= No_Pkt + to_unsigned(1,8);

				end if;
			end if;			
			if	No_Pkt = to_unsigned(4,8)	then
				if	s_Busy_Pre = '1'  and s_Busy = '0' then
					start_Send_GUI	<= '0';	
					No_Pkt			<= (others=>'0');

				end if;
			end if;				
		end if;
		
	
	
	end if;
end process;


end Behavioral;
