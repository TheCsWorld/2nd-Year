
--adder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
entity full_addertb is
end full_addertb;
 
architecture behavior of full_addertb is 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    component full_adder
    port(
         X : IN  std_logic;
         Y : IN  std_logic;
         C_in : IN  std_logic;
         C_out : OUT  std_logic;
         S : OUT  std_logic
        );
    end component;
    

   --Inputs
   signal X : std_logic := '0';
   signal Y : std_logic := '0';
   signal C_in : std_logic := '0';

 	--Outputs
   signal C_out : std_logic;
   signal S : std_logic;
 
begin
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder port map (
          X => X,
          Y => Y,
          C_in => C_in,
          C_out => C_out,
          S => S
        );

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 5ns;
		X <= '1';
		
		wait for 5ns;
		X <= '0';
		Y <= '1';
		
		wait for 5ns;
		X <= '1';
		
		wait for 5ns;
		C_in <= '1';
		
		wait for 5ns;
		Y <= '0';
		
		wait for 5ns;
		X <= '0';

      wait;
   end process;

end;