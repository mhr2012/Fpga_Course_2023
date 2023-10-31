LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
--use ieee.std_logic_unsigned.all;
--USE ieee.std_logic_arith.all;
----------------------------
PACKAGE My_Package IS
	constant X32     : integer := 31;
	constant X16     : integer := 15;
	constant X8     : integer := 7;
	
    subtype STD_32 is std_logic_vector(X32 downto 0);  -- simple name
    subtype STD_16 is std_logic_vector(X16 downto 0);  -- simple name
    subtype STD_8 is std_logic_vector(X8 downto 0);  -- simple name
    subtype UN_8 is std_logic_vector(X8 downto 0);  -- simple name
    subtype SIG_32 is signed(31 downto 0);  -- simple name
	TYPE RAM_STD IS ARRAY (NATURAL RANGE <>) OF STD_8;
	TYPE RAM_UN IS ARRAY (NATURAL RANGE <>) OF UN_8;
	TYPE RAM_SI IS ARRAY (NATURAL RANGE <>) OF SIG_32;
	TYPE RAM_SI32 IS ARRAY (NATURAL RANGE <>) OF signed(31 downto 0);


	
END My_Package;