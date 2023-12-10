

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity WaveGen is
    Port ( 
            Clock_50MHz             : in STD_LOGIC;
            o_LED1                  : out STD_LOGIC
            );
end WaveGen;

architecture Behavioral of WaveGen is

COMPONENT blk_mem_gen_2
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
  );
END COMPONENT;
COMPONENT ila_1

PORT (
	clk : IN STD_LOGIC;



	probe0 : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
	probe1 : IN STD_LOGIC_VECTOR(9 DOWNTO 0)
);
END COMPONENT  ;

COMPONENT blk_mem_gen_1
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
  );
END COMPONENT;

COMPONENT vio_0
  PORT (
    clk : IN STD_LOGIC;
    probe_out0 : OUT STD_LOGIC
  );
END COMPONENT;


signal addra                : unsigned(9 downto 0):=(Others=>'0');
signal douta1               : std_logic_vector(8 downto 0):=(Others=>'0');
signal douta2               : std_logic_vector(8 downto 0):=(Others=>'0');
signal Data_Out_ILA         : std_logic_vector(8 downto 0):=(Others=>'0');
signal Select_Wave          : std_logic:='0';
begin



process(Clock_50MHz)
begin
    if rising_edge(Clock_50MHz)then


        addra       <= addra + to_unsigned(1,10);
        o_LED1      <= '0';
        
        if  Select_Wave = '0' then
            Data_Out_ILA            <= douta1;
        end if;
        
        if  Select_Wave = '1' then
            Data_Out_ILA            <= douta2;
        end if;
        
        

    end if;
end process;



ila_inst1 : ila_1
PORT MAP (
	clk => Clock_50MHz,

	probe0 => Data_Out_ILA,
	probe1 => std_logic_vector(addra)
);


blk_mem_gen_inst1 : blk_mem_gen_1
  PORT MAP (
    clka => Clock_50MHz,
    ena => '1',
    addra => std_logic_vector(addra),
    douta => douta1
  );


blk_mem_gen_inst2 : blk_mem_gen_2
  PORT MAP (
    clka => Clock_50MHz,
    ena => '1',
    addra => std_logic_vector(addra),
    douta => douta2
  );
 your_instance_name : vio_0
  PORT MAP (
    clk => Clock_50MHz,
    probe_out0 => Select_Wave
  ); 
  
end Behavioral;
