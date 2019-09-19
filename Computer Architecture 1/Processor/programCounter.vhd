----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2019 09:06:26
-- Design Name: 
-- Module Name: programCounter - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;



entity programCounter is
	Port(	PC_in : in STD_LOGIC_VECTOR(15 downto 0);
			PL_in, PI_in, reset : in STD_LOGIC;
			PC_out : out STD_LOGIC_VECTOR(15 downto 0)
			);
end programCounter;

architecture Behavioral of programCounter is
begin
	process(reset, PL_in, PI_in)
	variable current_PC : STD_LOGIC_VECTOR(15 downto 0);
	variable temp_curr_PC : integer;
	variable temp_inc_PC : STD_LOGIC_VECTOR(15 downto 0);
	
	begin
		if(reset = '1') then current_PC := x"0000";
		elsif(PL_in = '1') then 
			current_PC := current_PC + PC_in;
		elsif(PI_in = '1') then
			temp_curr_PC := conv_integer(current_PC); -- get current allocation
			temp_curr_PC := temp_curr_PC + conv_integer(1); -- increment
			temp_inc_PC := conv_std_logic_vector(temp_curr_PC, 16); -- cast from int to vector
			current_PC := temp_inc_PC; -- store as current PC
		end if;
		PC_out <= current_PC after 2ns;
	end process;

end Behavioral;