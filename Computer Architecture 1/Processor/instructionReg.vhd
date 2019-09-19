----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2019 11:30:14
-- Design Name: 
-- Module Name: instructionReg - Behavioral
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

entity instructionReg is
	Port(	IR_in : in STD_LOGIC_VECTOR(15 downto 0);
			IL_in : in STD_LOGIC;
			Opcode :  out STD_LOGIC_VECTOR(6 downto 0);
			DR, SA, SB : out STD_LOGIC_VECTOR(2 downto 0)
			);
end instructionReg;

architecture Behavioral of instructionReg is

begin
	Opcode <= IR_in(15 downto 9) after 1ns when IL_in = '1';
	DR <= IR_in(8 downto 6) after 1ns when IL_in = '1';
	SA <= IR_in(5 downto 3) after 1ns when IL_in = '1';
	SB <= IR_in(2 downto 0) after 1ns when IL_in = '1';

end Behavioral;