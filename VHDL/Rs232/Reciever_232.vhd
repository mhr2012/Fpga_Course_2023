

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Reciver_232 is
    Port ( 
            Clock                   : in STD_LOGIC;
            i_Rx                    : in STD_LOGIC;
            o_Data                  : out unsigned (7 downto 0);
            o_valid                 : out STD_LOGIC;
            o_error                 : out STD_LOGIC
        );
end Reciver_232;

architecture Behavioral of Reciver_232 is

signal index                    : integer:=0;
signal Data_reg                 : unsigned(08 downto 0):=(Others=>'0');
signal cnt                      : unsigned(15 downto 0):=(Others=>'0');
signal baud_rate                : unsigned(15 downto 0):=to_unsigned(868,16);
signal i_Rx_Pre                 : std_logic:='0';
signal Start_bit                : std_logic:='0';
signal Start_Data               : std_logic:='0';
signal parity                 	: std_logic:='0';
signal check_valid                 	: std_logic:='0';

begin
process(Clock)
begin
    if rising_edge(Clock)then
        o_valid                 <= '0';
        i_Rx_Pre                <= i_Rx;
        if  i_Rx_Pre = '1' and i_Rx = '0'   then
            Start_bit       	<= '1';
        end if;    
        if  Start_Bit = '1' then
            cnt    <= Cnt + to_unsigned(1,16);
            if  cnt = baud_rate(15 downto 1)    then
                Start_Data  	<= '1';
                Cnt 			<= (Others=>'0');
                Start_Bit       <= '0';
            end if;
            
        end if;
        
        if  Start_Data = '1'    then
            Cnt     			<= Cnt + to_unsigned(1,16);
			parity 				<= Data_reg(0) xor Data_reg(1) xor Data_reg(2) xor Data_reg(3) xor Data_reg(4) xor Data_reg(5) xor Data_reg(6) xor Data_reg(7) ;
            if  cnt = baud_rate then
                Cnt     		<= (Others=>'0');
                index   		<= index + 1;
                Data_reg(index) <= i_RX;
                
                if  index = 8 then
					Start_Data       <= '0';
                    check_valid      <= '1';

                end if;
            end if;
            
        
        end if;

        if check_valid = '1'    then
        
            o_error		<= '1';
            if	parity = Data_reg(8) then
                o_Data  <= Data_reg(7 downto 0);  
                o_error	<= '0';
                o_valid <= '1';
            end if;
            index   <= 0;
            Start_Data  <= '0';
            check_valid  <= '0';
        end if;


    end if;
end process;    


end Behavioral;
