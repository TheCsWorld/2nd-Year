----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2019 09:08:36
-- Design Name: 
-- Module Name: programCountertb - Behavioral
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
 
ENTITY programCountertb IS
END programCountertb;
 
ARCHITECTURE behavior OF programCountertb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT programCounter
    PORT(
         PC_in : IN  std_logic_vector(15 downto 0);
         PL_in : IN  std_logic;
         PI_in : IN  std_logic;
         reset : IN  std_logic;
         PC_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PC_in : std_logic_vector(15 downto 0) := (others => '0');
   signal PL_in : std_logic := '0';
   signal PI_in : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal PC_out : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: programCounter PORT MAP (
          PC_in => PC_in,
          PL_in => PL_in,
          PI_in => PI_in,
          reset => reset,
          PC_out => PC_out
        );

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 5ns;
		reset <= '1';
		PC_in <= x"0000";
		
		wait for 5ns;
		reset <= '0';
		
		wait for 5ns;
		PI_in <= '1';
		PC_in <= x"0002";
		
		wait for 20ns;
		PI_in <= '0';
		PL_in <= '1';
		PC_in <= x"0105";

      wait;
   end process;

END;
