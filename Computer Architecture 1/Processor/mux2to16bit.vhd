----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Chloe Conneely 17323080
-- 
-- Create Date: 12.02.2019 19:37:43
-- Design Name: 
-- Module Name: mux2to16bit - Behavioral
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

entity mux2to16bit is
    Port ( in0 : in STD_LOGIC_VECTOR(15 downto 0);
           in1 : in STD_LOGIC_VECTOR(15 downto 0);
           s : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR(15 downto 0));
end mux2to16bit;

architecture Behavioral of mux2to16bit is

begin
    Z<= in0 when s='0' else
        in1 when s='1' else
        x"0000";

end Behavioral;
