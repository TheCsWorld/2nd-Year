----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Chloe Conneely 17323080
-- 
-- Create Date: 25.02.2019 11:13:16
-- Design Name: 
-- Module Name: full_adder - Behavioral
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

entity full_adder is
    Port ( X : in STD_LOGIC;
           Y : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is
    --signal S0, S1, S2 : STD_LOGIC;
begin
    S <= X xor Y xor C_in;
    C_out <= (X and Y) or (X and C_in) or (Y and C_in);
   
	--S0 <= (X xor Y) after 1ns;
	--S1 <= (C_in and S0) after 1ns;
	--S2 <= (X and Y) after 1ns;
	--S <= (S0 xor C_in) after 1ns;
	--C_out <= (S1 or S2) after 1ns;

end Behavioral;
