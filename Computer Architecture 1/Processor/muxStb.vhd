----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2019 11:12:15
-- Design Name: 
-- Module Name: muxStb - Behavioral
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
 
ENTITY muxStb IS
END muxStb;
 
ARCHITECTURE behavior OF muxStb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT muxS
    PORT(
         In_zero : IN  std_logic;
         In_one : IN  std_logic;
         In_n : IN  std_logic;
         In_z : IN  std_logic;
         In_c : IN  std_logic;
         In_v : IN  std_logic;
         In_not_c : IN  std_logic;
         In_not_z : IN  std_logic;
         MS : IN  std_logic_vector(2 downto 0);
         outS : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal In_zero : std_logic := '0';
   signal In_one : std_logic := '0';
   signal In_n : std_logic := '0';
   signal In_z : std_logic := '0';
   signal In_c : std_logic := '0';
   signal In_v : std_logic := '0';
   signal In_not_c : std_logic := '0';
   signal In_not_z : std_logic := '0';
   signal MS : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal outS : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: muxS PORT MAP (
          In_zero => In_zero,
          In_one => In_one,
          In_n => In_n,
          In_z => In_z,
          In_c => In_c,
          In_v => In_v,
          In_not_c => In_not_c,
          In_not_z => In_not_z,
          MS => MS,
          outS => outS
        );

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 5ns;
		In_one <= '1';
		In_c <= '1';
		In_v <= '1';
		In_not_z <= '1';
		
		wait for 5ns;
		MS <= "001";
		
		wait for 5ns;
		MS <= "010";
		
		wait for 5ns;
		MS <= "011";
		
		wait for 5ns;
		MS <= "100";
		
		wait for 5ns;
		MS <= "101";
		
		wait for 5ns;
		MS <= "110";
		
		wait for 5ns;
		MS <= "111";
		
		wait for 5ns;
		
      wait;
   end process;

END;