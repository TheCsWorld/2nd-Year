----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2019 09:45:04
-- Design Name: 
-- Module Name: muxS - Behavioral
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxS is
	Port(	In_zero, In_one, In_n, In_z, In_c, In_v, In_not_c, In_not_z : in STD_LOGIC;
			MS : in STD_LOGIC_VECTOR(2 downto 0);
			outS : out STD_LOGIC
			);
end muxS;

architecture Behavioral of muxS is

begin
	outS <= 	In_zero after 1ns when MS = "000" else
						In_one after 1ns when MS = "001" else
						In_c after 1ns when MS = "010" else
						In_v after 1ns when MS = "011" else
						In_z after 1ns when MS = "100" else
						In_n after 1ns when MS = "101" else
						In_not_c after 1ns when MS = "110" else
						In_not_z after 1ns when MS = "111";

end Behavioral;
