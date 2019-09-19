----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2019 09:18:56
-- Design Name: 
-- Module Name: extendedPCtb - Behavioral
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

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY extendedPCtb IS
END extendedPCtb;
 
ARCHITECTURE behavior OF extendedPCtb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT extendedPC
    PORT(
         SR_SB : IN  std_logic_vector(5 downto 0);
         extendedPC : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SR_SB : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal extended_PC : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: extendedPC PORT MAP (
          SR_SB => SR_SB,
          extendedPC => extended_PC
        );

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 10ns;
		SR_SB <= "000110";
		
		wait for 10ns;
		SR_SB <= "100110";
		
		wait for 10ns;
		SR_SB <= "010010";
		
      wait;
   end process;

END;
