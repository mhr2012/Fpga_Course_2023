library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Rs422_Transmitter is

port (
			Input_Data									:	in	std_logic_Vector(7 downto 0);
			Write_En    								:	in	std_logic;
            Each_Bit_Sample_Number                      :	in	unsigned(15 downto 0);
            
			Rs232_Tx        							:	out	std_logic;
			Busy										:	out	std_logic;
			Clock_24MHz									:  	in 	std_logic
		);

end Rs422_Transmitter;

architecture Behavioral of Rs422_Transmitter is

			signal 	Write_En_Pre					        :		std_logic						:=	'0';
			signal 	Rs232_Tx_Int         				    :		std_logic						:=	'1';
			signal 	Busy_Internal							:		std_logic						:=	'0';
			signal	Each_Bit_Sample_Number_Int			    :		unsigned	(15 downto 0)		:=	to_unsigned(3000,16);

			----- Internal Signals ----
			---------------------------
			signal 	PKT_Data								:		std_logic_vector(10 downto 0)	:=	(others=>'0');	

			signal 	Current_Index							:		unsigned	(3 downto 0)		:=	(others=>'0');
			signal 	Samples_Counter							:		unsigned	(15 downto 0)		:=	(others=>'0');

begin


			Rs232_Tx 								        <=		Rs232_Tx_Int;
			Busy											<=		Busy_Internal;
			
			Each_Bit_Sample_Number_Int                      <=      Each_Bit_Sample_Number;
			
			process(Clock_24MHz)
			begin						
				if rising_edge(Clock_24MHz) then
					Write_En_Pre        					<=		Write_En;



					Rs232_Tx_Int				           <= 		'1';
														

					
					

					if  Write_En = '1' and     Write_En_Pre = '0'   then
						Busy_Internal						   <= 		'1';
						PKT_Data(0)						         <=		'0';                --  start bit
						PKT_Data(8 downto 1)				  <=		Input_Data;         --  Data
						PKT_Data(9)						     <=		Input_Data(7) xor Input_Data(6) xor Input_Data(5) xor Input_Data(4) xor Input_Data(3) xor Input_Data(2) xor Input_Data(1) xor Input_Data(0) ;                --  parity
						PKT_Data(10)						<=		'1';                --  stop bit
						Current_Index 						<= 		(others=>'0');
						Samples_Counter						<= 		(others=>'0');
					end if;

					---------- Output Data Generaton ----------
					-------------------------------------------
					if (Busy_Internal = '1') then

						Rs232_Tx_Int      			         <= 		PKT_Data(0);
						Samples_Counter 					 <= 		Samples_Counter + to_unsigned(1,16);
						
						----- Bit Rate is defined by "Each_Bit_Sample_Number" ----
						----------------------------------------------------------
						if (Samples_Counter = Each_Bit_Sample_Number_Int) then
							Final_Data						<=		'1' & Final_Data(9 downto 1);
							Samples_Counter					<= 		(others=>'0');
							Current_Index 					<= 		Current_Index + to_unsigned(1,4);
							if (Current_Index = to_unsigned(10,4)) then
								Current_Index 				<= 		(others=>'0');
								Busy_Internal				<= 		'0';								
							end if;
						end if;
						
					end if;
				
				end if; ---- end if for Rising Edge ----
			end process;

end Behavioral;