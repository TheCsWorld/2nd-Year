----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Chloe Conneely 17323080
-- 
-- Create Date: 25.02.2019 11:34:54
-- Design Name: 
-- Module Name: B_logic - Behavioral
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

entity B_logic is
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           B : in STD_LOGIC;
           Y : out STD_LOGIC);
end B_logic;

architecture Behavioral of B_logic is

begin
    Y <= (S0 and B) or (S1 and (not B));

end Behavioral;
