----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2019 19:26:24
-- Design Name: 
-- Module Name: logic_parttb - Behavioral
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

entity logic_parttb is
end logic_parttb;

architecture Behavioral of logic_parttb is

    component logic_part
    port(
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           O0 : out STD_LOGIC;
           O1 : out STD_LOGIC;
           O2 : out STD_LOGIC;
           O3 : out STD_LOGIC
    );
    
    end component;
    
    --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal O0 : std_logic := '0';
   signal O1 : std_logic := '0';
   signal O2 : std_logic := '0';
   signal O3 : std_logic := '0';

begin

-- Instantiate the Unit Under Test (UUT)
   uut: logic_part PORT MAP (
          A => A,
          B => B,
          O0 => O0,
          O1 => O1,
          O2 => O2,
          O3 => O3
        );

   -- Stimulus process
   stim_proc: process
   begin		
		A <= '0';
		B <= '0';
		
		wait for 5ns;
		A <= '1';
		--sel <= '1';
		
		wait for 5ns;
		B <= '1';
		--sel <= '0';

      wait;
   end process;


end Behavioral;
