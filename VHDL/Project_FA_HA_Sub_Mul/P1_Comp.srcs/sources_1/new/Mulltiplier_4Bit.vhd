----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/02/2023 02:57:52 PM
-- Design Name: 
-- Module Name: Mulltiplier_4Bit - Behavioral
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

entity Mulltiplier_4Bit is
    Port ( 
            A               : in STD_LOGIC_VECTOR (3 downto 0);
            B               : in STD_LOGIC_VECTOR (3 downto 0);
            P               : out STD_LOGIC_VECTOR (7 downto 0)
        );
end Mulltiplier_4Bit;

architecture Behavioral of Mulltiplier_4Bit is

signal Sig1              : std_logic_vector(3 downto 0);
signal Sig2              : std_logic_vector(3 downto 0);
signal sig3              : std_logic_vector(3 downto 0);
signal sig4              : std_logic_vector(3 downto 0);
signal sig5              : std_logic_vector(3 downto 0);
signal sig6              : std_logic_vector(3 downto 0);
signal sum1              : std_logic_vector(3 downto 0);
signal sum2              : std_logic_vector(3 downto 0);
signal sum3              : std_logic_vector(3 downto 0);
signal C1                : std_logic:='0';
signal C2                : std_logic:='0';
signal C3                : std_logic:='0';

begin


P(0)                <= A(0) and B(0);
P(1)                <= sum1(0);
P(2)                <= sum2(0);
P(3)                <= sum3(0);
P(4)                <= sum3(1);
P(5)                <= sum3(2);
P(6)                <= sum3(3);
P(7)                <= C3;



Sig1(0)         <= A(1) and B(0);
Sig1(1)         <= A(2) and B(0);
Sig1(2)         <= A(3) and B(0);
Sig1(3)         <= '0';

Sig2(0)         <= A(0) and B(1);
Sig2(1)         <= A(1) and B(1);
Sig2(2)         <= A(2) and B(1);
Sig2(3)         <= A(3) and B(1);





Full_Adder_1:entity work.Fill_Adder_4Bit 
    Port map( 
            A           =>Sig1,
            B           =>Sig2,
            Cin         =>'0',
            S           =>sum1,
            Cout        =>C1
            
        );



sig3(0)             <= sum1(1);
sig3(1)             <= sum1(2);
sig3(2)             <= sum1(3);
sig3(3)             <= C1;

sig4(0)             <= A(0) and B(2);
sig4(1)             <= A(1) and B(2);
sig4(2)             <= A(2) and B(2);
sig4(3)             <= A(3) and B(2);

Full_Adder_2:entity work.Fill_Adder_4Bit 
    Port map( 
            A           =>sig4,
            B           =>sig3,
            Cin         =>'0',
            S           =>sum2,
            Cout        =>C2
            
        );


sig5(0)                 <= Sum2(1);
sig5(1)                 <= Sum2(2);
sig5(2)                 <= Sum2(3);
sig5(3)                 <= C2;

sig6(0)             <= A(0) and B(3);
sig6(1)             <= A(1) and B(3);
sig6(2)             <= A(2) and B(3);
sig6(3)             <= A(3) and B(3);

Full_Adder_3:entity work.Fill_Adder_4Bit 
    Port map( 
            A           =>sig6,
            B           =>sig5,
            Cin         =>'0',
            S           =>sum3,
            Cout        =>C3            
        );


end Behavioral;
