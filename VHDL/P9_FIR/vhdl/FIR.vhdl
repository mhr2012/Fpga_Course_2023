

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FIR is
    Port ( 
            Clock                       : in STD_LOGIC;
            Input_Signal                : in signed(13 downto 0);
            Output_Signal               : Out signed(13 downto 0)
                      
            );
end FIR;

architecture Behavioral of FIR is

--	Clock is 50MHz , Fpass = 5MHz , Fstop = 21MHz , Apass = 1	, Astop = 60	--
--	coefficient = s.0.8
signal b0                                       : signed(8 downto 0):=to_signed(31,9);
signal b1                                       : signed(8 downto 0):=to_signed(87,9);
signal b2                                       : signed(8 downto 0):=to_signed(87,9);
signal b3                                       : signed(8 downto 0):=to_signed(31,9);


signal Input_Signal_Int1                        : signed(13 downto 0):=(Others=>'0');
signal Input_Signal_Int2                        : signed(13 downto 0):=(Others=>'0');
signal Input_Signal_Int3                        : signed(13 downto 0):=(Others=>'0');
signal Input_Signal_Int4                        : signed(13 downto 0):=(Others=>'0');
signal Input_Signal_Int5                        : signed(13 downto 0):=(Others=>'0');
signal Output_Signal_Int1                       : signed(24 downto 0):=(Others=>'0');
signal Output_Signal_Int2                       : signed(13 downto 0):=(Others=>'0');

begin

process(Clock)
begin
    if rising_edge(Clock)then

        
        Input_Signal_Int1                           <= Input_Signal;
        Input_Signal_Int2                           <= Input_Signal_Int1;
        Input_Signal_Int3                           <= Input_Signal_Int2;
        Input_Signal_Int4                           <= Input_Signal_Int3;
        
        
        Output_Signal_Int1                          <= b0 * resize(Input_Signal,16) +  b1 * Input_Signal_Int1 + b2 * Input_Signal_Int2 + b3 * Input_Signal_Int3 ;


        Output_Signal_Int2                          <= Output_Signal_Int1(23) & Output_Signal_Int1(20 downto 8);
        if Output_Signal_Int2 > to_signed(8180,14)  then
            Output_Signal_Int2                      <= to_signed(8191,14);     
        end if;

    end if;
end process;

Output_Signal   <= Output_Signal_Int2;


end Behavioral;
