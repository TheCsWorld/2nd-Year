----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Chloe Conneely 17323080
-- 
-- Create Date: 26.02.2019 11:39:05
-- Design Name: 
-- Module Name: logic_mux_4to1 - Behavioral
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

entity logic_mux_4to1 is
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           in0 : in STD_LOGIC;
           in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           in3 : in STD_LOGIC;
           G : out STD_LOGIC);
end logic_mux_4to1;

architecture Behavioral of logic_mux_4to1 is

begin
        G <= in0 after 5ns when s0 ='0' and s1 = '0' else
             in1 after 5ns when s0 = '0' and s1 = '1' else
             in2 after 5ns when s0 = '1' and s1 = '0' else
             in3 after 5ns when s0 = '1' and s1 = '1' else
             '0' after 5ns;

end Behavioral;
