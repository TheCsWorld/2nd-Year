----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2019 18:28:39
-- Design Name: 
-- Module Name: B_logictb - Behavioral
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

entity B_logictb is
end B_logictb;

architecture Behavioral of B_logictb is

    component B_logic
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           B : in STD_LOGIC;
           Y : out STD_LOGIC);
     end component;
     
     --inputs
     signal S0 : std_logic := '0';
     signal S1 : std_logic := '0';
     signal B : std_logic := '0';
     
     --outputs
     signal Y : std_logic;
begin
        -- Instantiate the Unit Under Test (UUT)
        uut: B_logic port map (
          S0 => S0,
          S1 => S1,
          B => B,
          Y => Y
        );
        
           -- Stimulus process
   stim_proc: process
   begin		
		wait for 5ns;
		S0 <= '1';
		
		wait for 5ns;
		B <= '1';
		
		wait for 5ns;
		S0 <= '0';
		S1 <= '1';
		
		wait for 5ns;
		B <= '0';

      wait;
   end process;


end Behavioral;
