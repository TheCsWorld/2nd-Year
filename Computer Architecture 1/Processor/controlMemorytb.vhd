----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2019 11:45:58
-- Design Name: 
-- Module Name: controlMemorytb - Behavioral
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
 
ENTITY controlMemorytb IS
END controlMemorytb;
 
ARCHITECTURE behavior OF controlMemorytb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT controlMemory
    PORT(
         in_car : IN  std_logic_vector(7 downto 0);
         MW : OUT  std_logic;
         MM : OUT  std_logic;
         RW : OUT  std_logic;
         MD : OUT  std_logic;
         MB : OUT  std_logic;
         TB : OUT  std_logic;
         TA : OUT  std_logic;
         TD : OUT  std_logic;
         PL : OUT  std_logic;
         PI : OUT  std_logic;
         IL : OUT  std_logic;
         MC : OUT  std_logic;
         FS_cm : OUT  std_logic_vector(4 downto 0);
         MS_cm : OUT  std_logic_vector(2 downto 0);
         NA : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in_car : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal MW : std_logic;
   signal MM : std_logic;
   signal RW : std_logic;
   signal MD : std_logic;
   signal MB : std_logic;
   signal TB : std_logic;
   signal TA : std_logic;
   signal TD : std_logic;
   signal PL : std_logic;
   signal PI : std_logic;
   signal IL : std_logic;
   signal MC : std_logic;
   signal FS_cm : std_logic_vector(4 downto 0);
   signal MS_cm : std_logic_vector(2 downto 0);
   signal NA : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: controlMemory PORT MAP (
          in_car => in_car,
          MW => MW,
          MM => MM,
          RW => RW,
          MD => MD,
          MB => MB,
          TB => TB,
          TA => TA,
          TD => TD,
          PL => PL,
          PI => PI,
          IL => IL,
          MC => MC,
          FS_cm => FS_cm,
          MS_cm => MS_cm,
          NA => NA
        );

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 10ns;
		in_car <= x"00";
				
		wait for 10ns;
		in_car <= x"02";
				
		wait for 10ns;
		in_car <= x"04";
		
		wait;
   end process;

END;
