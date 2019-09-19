----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Chloe Conneely 17323080
-- 
-- Create Date: 12.02.2019 19:51:21
-- Design Name: 
-- Module Name: mux16to16bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments: Despite it's ood sounding name, this file takes in 8 inputs
-- from the registers and has one output. The 16to16bit refers to the 16 bit vectors
-- that are the inputs and outputs
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

entity mux16to16bit is
    Port ( in0 : in STD_LOGIC_VECTOR(15 downto 0);
           in1 : in STD_LOGIC_VECTOR(15 downto 0);
           in2 : in STD_LOGIC_VECTOR(15 downto 0);
           in3 : in STD_LOGIC_VECTOR(15 downto 0);
           in4 : in STD_LOGIC_VECTOR(15 downto 0);
           in5 : in STD_LOGIC_VECTOR(15 downto 0);
           in6 : in STD_LOGIC_VECTOR(15 downto 0);
           in7 : in STD_LOGIC_VECTOR(15 downto 0);
           in8 : in STD_LOGIC_VECTOR(15 downto 0);
           s0 : in STD_LOGIC;
           s1 : in STD_LOGIC;
           T : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR(15 downto 0));
end mux16to16bit;

architecture Behavioral of mux16to16bit is

begin
    Z<=in0 after 5 ns when s0='0' and s1='0' else
        in1 after 5 ns when s0='1' and s1='0' else
        in2 after 5 ns when s0='0' and s1='1' else
        in3 after 5 ns when s0='1' and s1='1' else
        in4 after 5 ns when s0='0' and s1='0' else
        in5 after 5 ns when s0='1' and s1='0' else
        in6 after 5 ns when s0='0' and s1='1' else
        in7 after 5 ns when s0='1' and s1='1' else
        in8 after 5 ns when T='1' else
        "0000000000000000" after 5 ns;

end Behavioral;
