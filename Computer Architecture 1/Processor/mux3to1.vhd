----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Chloe Conneely 17323080
-- 
-- Create Date: 27.02.2019 20:23:56
-- Design Name: 
-- Module Name: mux3to1 - Behavioral
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

entity mux3to1 is
    Port ( in0 : in STD_LOGIC;
           in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           sel : in STD_LOGIC_VECTOR(1 downto 0);
           H : out STD_LOGIC);
end mux3to1;

architecture Behavioral of mux3to1 is

begin
    H <= in0 after 5ns when sel = "00" else
         in1 after 5ns when sel="01" else
         in2 after 5ns when sel="10" else
         '0' after 5ns;
end Behavioral;
