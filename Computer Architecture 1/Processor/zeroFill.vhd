----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2019 14:29:50
-- Design Name: 
-- Module Name: zeroFill - Behavioral
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


entity zeroFill is
	Port(	SB_in : in STD_LOGIC_VECTOR(2 downto 0);
			zero_fill_out : out STD_LOGIC_VECTOR(15 downto 0)
			);
end zeroFill;

architecture Behavioral of zeroFill is
	signal zeroFill : STD_LOGIC_VECTOR(15 downto 0);
begin
	zero_fill_out(2 downto 0) <= SB_in;
	zero_fill_out(15 downto 3) <= "0000000000000";
end Behavioral;

