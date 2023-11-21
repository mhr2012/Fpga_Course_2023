

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Packetize is
    Port ( 
            Clock_100Mhz 					: in STD_LOGIC;
			i_valid 						: in STD_LOGIC;
			i_Data 							: in STD_LOGIC_VECTOR (7 downto 0);
			i_Length 						: in integer;
			
			o_Data 							: out STD_LOGIC_VECTOR (7 downto 0):=(Others=>'0');
			o_valid 						: out STD_LOGIC
           
           );
end Packetize;

architecture Behavioral of Packetize is


type RAM0 is array (0 to 63) of STD_LOGIC_VECTOR(7 downto 0);
signal Data_Register				: RAM0 :=(others=>(others=>'0'));
signal index						: integer:=0;
signal cnt_index					: integer:=0;
signal cnt   						: integer:=0;
signal Start_send_PKT				: std_logic:='0';
signal s_valid_pre  				: std_logic:='0';


begin


process(Clock_100Mhz)
begin

	if rising_edge(Clock_100Mhz)then

		s_valid_pre				<= i_valid;
		if	s_valid_pre = '0' and i_valid = '1'	then
		
			Data_Register(index) 		<=  i_Data;
			index						<= index + 1;
			if	index = i_Length- 1	then
				Start_send_PKT			<= '1';
				index					<= 0;
			end if;
		end if;

		o_valid					<= '0';
		if	Start_send_PKT = '1'	then

			--	Header
			if	cnt = 0 then
				o_Data			<= x"FA";
				o_valid			<= '1';
				cnt				<= cnt + 1;
			end if;
			
			if	cnt = 1 then
				o_Data			<= x"70";
				o_valid			<= '1';
				cnt				<= cnt + 1;
			end if;
			
			-- Data 
			if	cnt = 2 then
				cnt_index		<= cnt_index + 1;
				
				o_Data			<= Data_Register(cnt_index);
				o_valid			<= '1';
				if	cnt_index = i_Length- 1	then
					cnt			<= cnt + 1;
					cnt_index	<=0;
				end if;

			end if;			
		
			--	footer
			if	cnt = 3 then
				o_Data			<= x"8C";
				o_valid			<= '1';
				cnt				<= cnt + 1;
			end if;
			
			if	cnt = 4 then
				o_Data			<= x"2D";
				o_valid			<= '1';
				cnt				<= cnt + 1;
			end if;
			if	cnt = 5 then
				cnt				<= 0;
				Start_send_PKT	<= '0';
			end if;
		end if;




	end if;
end process;


end Behavioral;
