----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2019 09:16:25
-- Design Name: 
-- Module Name: extendedPC - Behavioral
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

entity extendedPC is
	Port(	SR_SB : in STD_LOGIC_VECTOR(5 downto 0);
			extendedPC : out STD_LOGIC_VECTOR(15 downto 0)
			);
end extendedPC;

architecture Behavioral of extendedPC is
	signal extended_sig : STD_LOGIC_VECTOR(15 downto 0);
begin
	extended_sig(5 downto 0) <= SR_SB;
	extended_sig(15 downto 6) <= "0000000000" when SR_SB(5) = '0' else "1111111111";
	extendedPC <= extended_sig;

end Behavioral;
