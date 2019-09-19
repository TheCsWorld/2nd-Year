----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2019 09:30:19
-- Design Name: 
-- Module Name: muxCtb - Behavioral
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

entity muxCtb is
--  Port ( );
end muxCtb;

architecture Behavioral of muxCtb is
        component muxC
           port(
           in0 : in STD_LOGIC_VECTOR (7 downto 0);
           in1 : in STD_LOGIC_VECTOR (7 downto 0);
           sel : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (7 downto 0)   
    );
    end component;
    
    --Inputs
   signal in0 : std_logic_vector(7 downto 0) := (others => '0');
   signal in1 : std_logic_vector(7 downto 0) := (others => '0');
   signal sel : std_logic := '0';
   
   --Outputs
   signal Z : std_logic_vector(7 downto 0);


begin
    -- Instantiate the Unit Under Test (UUT)
   uut: muxC PORT MAP (
         in0 => in0,
         in1 => in1,
         sel => sel,
         Z => Z
        );

   -- Stimulus process
   stim_proc: process
   begin		
        in0 <= x"FF";
		in1 <= x"AA";
		
		wait for 10ns;
		sel <= '1';
		
		wait for 10ns;
		sel <= '0';
		
		wait for 10ns;
		sel <= '1';

      wait;
   end process;


end Behavioral;
