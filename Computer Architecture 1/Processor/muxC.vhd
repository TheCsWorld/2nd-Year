----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2019 09:26:32
-- Design Name: 
-- Module Name: muxC - Behavioral
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

entity muxC is
    Port ( in0 : in STD_LOGIC_VECTOR (7 downto 0);
           in1 : in STD_LOGIC_VECTOR (7 downto 0);
           sel : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (7 downto 0));
--  Port ( );
end muxC;

architecture Behavioral of muxC is

begin
        Z <= in0 after 1ns when sel = '0' else
             in1 after 1ns when sel = '1' else
             x"00" after 5ns;


end Behavioral;
