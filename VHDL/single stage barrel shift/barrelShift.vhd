-- copyright 2019 Hexalinx.com
-- simple 8 bit barrel shifter / shift zero or one bit

library ieee;
use ieee.std_logic_1164.all;

entity barrel is
    generic (N: integer := 8);
    port (     inp: in std_logic_vector (N-1 downto 0);
            shift: in std_logic;
            outp: out std_logic_vector (N-1 downto 0));
end barrel;

architecture behavior of barrel is
begin
    process (inp, shift)
    begin
        if (shift='0') then
            outp <= inp;
        else
            outp(0) <= '0';
            for i in 1 to inp'high loop
                outp(i) <= inp(i-1);
            end loop;
        end if;
    end process;
end behavior;