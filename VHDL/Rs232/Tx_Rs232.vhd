library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TX_Rs232 is

port (
			Clock										:  	in 	std_logic;
			i_Data										:	in	std_logic_Vector(7 downto 0);
			i_Write										:	in	std_logic;
            i_BaudRate                     				:	in	unsigned(15 downto 0);
            
			o_Serial_TX									:	out	std_logic;
			o_Busy										:	out	std_logic
		);

end TX_Rs232;

architecture Behavioral of TX_Rs232 is

signal PKT_Data 									: std_logic_vector(10 downto 0);
signal i_Write_pre									: std_logic:='0';
signal s_busy    									: std_logic:='0';
signal s_BaudRate									: unsigned(15 downto 0):=(Others=>'0');
signal Cnt_baudRate									: unsigned(15 downto 0):=(Others=>'0');
signal Cnt_Index									: unsigned(03 downto 0):=(Others=>'0');



begin

o_Busy													<= s_busy;
------------- Beginning the Program ------------
process(Clock)
begin						
	if rising_edge(Clock) then

		o_Serial_TX										<= '1';		-- idle

		i_Write_pre										<= i_Write;
		if	i_Write_pre = '0' and i_Write = '1'	then
			PKT_Data(0)									<= '0'; 	-- start bit 
			PKT_Data(8 downto 1)						<= i_Data; 	-- Data
			PKT_Data(9)									<= i_Data(7) XOR i_Data(6)XOR i_Data(5)XOR i_Data(4)XOR i_Data(3)XOR i_Data(2)XOR i_Data(1)XOR i_Data(0); -- Data
			PKT_Data(10)								<= '1';		-- STOP BIT
			s_busy 										<= '1';
			s_BaudRate									<= i_BaudRate;
		end if;
		
		
		if	s_busy = '1'	then
			o_Serial_TX									<= PKT_Data(0);
			Cnt_baudRate								<= Cnt_baudRate + to_unsigned(1,16);
			
			if	Cnt_baudRate = s_BaudRate	then
				
				PKT_Data								<= '1' & PKT_Data(10 downto 1);
				Cnt_Index								<= Cnt_Index + to_unsigned(1,4);
				Cnt_baudRate							<= (Others=>'0');
				if	Cnt_Index = to_unsigned(10,8)	then
					Cnt_Index							<= (Others=>'0');
					s_busy								<= '0';
				end if;

			end if;
		
		
		
		
		
		end if;
		
		
		




	
	end if; ---- end if for Rising Edge ----
end process;

end Behavioral;
