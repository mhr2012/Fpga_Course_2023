----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/16/2023 08:46:33 PM
-- Design Name: 
-- Module Name: SPI - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SPI is
  Port (
            clk                     :  in std_logic ;
            i_data                  :  in  std_logic_vector(31 downto 0);
            --address                 :  in  std_logic_vector(7 downto 0);
            i_valid                 :  in  std_logic:='0' ;
            i_RW                    :  in  std_logic:='0' ;
            --MISO                    :  IN std_logic;
            --o_data                  :  OUT  std_logic ;
            sclk                    :  out std_logic ;
            MOSI                    :  OUT std_logic ;
            --busy                    :  OUT std_logic ;
            LE                      :  out std_logic 

         );
end SPI;

architecture Behavioral of SPI is
signal cnt1         : unsigned(7 downto 0):=(others=>'0');
signal cnt2         : integer:=0;
signal i_valid_per  : std_logic;
signal s_i_data     : std_logic_vector(31 downto 0);
--signal s_address    : std_logic_vector(7 downto 0);
signal s_sclk       : std_logic := '0';
signal s_sclk_per   : std_logic := '0';
signal i_rw_per     : std_logic;
signal start_send   : std_logic;
--signal start_read   : std_logic;
signal start_sclk   : std_logic;

begin
process (clk)
begin
        if rising_edge(clk) then
            le              <= '1';
            --busy        <='1';
            i_valid_per     <= i_valid;
            i_rw_per        <= i_rw;
            s_sclk_per      <= s_sclk;
            
            if i_valid_per = '0' and i_valid = '1' then
                s_i_data       <= i_data;
                --busy            <='0';
                --s_address      <= address;
            end if;
            
            
            if i_rw='1' and i_rw_per='0' then
                start_send  <= '1';
                start_sclk   <= '1';
            end if;
            
--            if i_rw='0' then
--                start_read  <= '1';          
--            end if;
            
--            if start_read   ='1' then
--                o_data      <= MISO;
--            end if;                          
            
            
            if start_send   ='1' then
                    le      <= '0';
                    
                    if start_sclk ='1' then
                        MOSI            <= s_i_data(31);
                        s_i_data        <= s_i_data(30 downto 0) & '1';
                        start_sclk <='0';
                    end if;
                    cnt1 <= to_unsigned(1,8);
                    sclk  <= s_sclk;
                    if cnt1(0) = '1' then           
                        cnt1    <= to_unsigned(0,8);          
                        s_sclk  <= not s_sclk;
                    end if;
                    
                    if s_sclk_per ='1' and s_sclk='0' then
                            MOSI            <= s_i_data(31);
                            s_i_data        <= s_i_data(30 downto 0) & '1';
                            cnt2            <= cnt2 +1;
                            if cnt2 = 31 then
                                start_send <= '0';
                                cnt2       <= 0;
                                --s_sclk     <= '0';
                            end if;
                    end if;                  
            end if;       
        end if;


end process;
end Behavioral;
