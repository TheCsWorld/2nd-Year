----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2019 14:29:23
-- Design Name: 
-- Module Name: shifter_16bittb - Behavioral
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

entity shifter_16bittb is
--  Port ( );
end shifter_16bittb;

architecture Behavioral of shifter_16bittb is

 component shifter_16bit
    port(
          B : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           H : out STD_LOGIC_VECTOR (15 downto 0)   
    );
    
    end component;
    
        --Inputs
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal sel : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal H : std_logic_vector(15 downto 0) := (others => '0');

begin

    -- Instantiate the Unit Under Test (UUT)
   uut: shifter_16bit PORT MAP (
          B => B,
          sel => sel,
          H => H
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 10ns;
		B <= x"FFFF";
		sel <= "00";
		
		wait for 16ns;
		sel <= "01";
		
		wait for 16ns;
		B <= H;
		
		wait for 16ns;
		
		B <= H;
		sel <= "10";

      wait;
   end process;


end Behavioral;
