----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2019 08:58:52
-- Design Name: 
-- Module Name: controlAddressRegister - Behavioral
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



entity controlAddressRegister is
	Port(	car_in : in STD_LOGIC_VECTOR(7 downto 0);
			s_car, reset : in STD_LOGIC;
			car_out : out STD_LOGIC_VECTOR(7 downto 0)
			);
end controlAddressRegister;

architecture Behavioral of controlAddressRegister is

begin
	process(reset, car_in)
	variable curr_car : STD_LOGIC_VECTOR(7 downto 0);
	variable temp_curr_car : integer;
	variable temp_inc_car : STD_LOGIC_VECTOR(7 downto 0);
	
	begin
		if(reset = '1') then curr_car := x"C0";
		elsif(s_car = '1') then curr_car := car_in;
		elsif(s_car = '0') then
			temp_curr_car := conv_integer(curr_car);
			temp_curr_car := temp_curr_car + conv_integer(1);
			temp_inc_car := conv_std_logic_vector(temp_curr_car, 8);
			curr_car := temp_inc_car;
		end if;
		car_out <= curr_car after 20ns;
	end process;
end Behavioral;

