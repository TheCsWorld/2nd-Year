----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2019 14:32:15
-- Design Name: 
-- Module Name: zeroFilltb - Behavioral
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
 
ENTITY zeroFilltb IS
END zeroFilltb;
 
ARCHITECTURE behavior OF zeroFilltb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT zeroFill
    PORT(
         SB_in : IN  std_logic_vector(2 downto 0);
         zero_fill_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SB_in : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal zero_fill_out : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: zeroFill PORT MAP (
          SB_in => SB_in,
          zero_fill_out => zero_fill_out
        );

   -- Stimulus process
   stim_proc: process
   begin	
		wait for 10ns;
		SB_in <= "001";
		
		wait for 10ns;
		SB_in <= "010";
		wait;
   end process;

END;
