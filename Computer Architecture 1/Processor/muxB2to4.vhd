----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.03.2019 12:36:28
-- Design Name: 
-- Module Name: muxB2to4 - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity muxB2to4 is
    Port ( in0 : in STD_LOGIC_VECTOR (15 downto 0);
           in1 : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           B : out STD_LOGIC_VECTOR (15 downto 0));
end muxB2to4;

architecture Behavioral of muxB2to4 is
        

begin
        B <= in0 after 1ns when sel = '0' else
             in1 after 1ns when sel = '1' else
             x"0000" after 5ns;


end Behavioral;
