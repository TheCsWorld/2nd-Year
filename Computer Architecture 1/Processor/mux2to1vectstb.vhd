----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2019 12:11:09
-- Design Name: 
-- Module Name: mux2to1vectstb - Behavioral
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

entity mux2to1vectstb is
end mux2to1vectstb;

architecture Behavioral of mux2to1vectstb is

    component mux2to1vects
    port(
           in0 : in STD_LOGIC_VECTOR (15 downto 0);
           in1 : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           outvec : out STD_LOGIC_VECTOR (15 downto 0)   
    );
    
    end component;
    --Inputs
  -- signal in0 : std_logic_vector := (others => '0');
  signal in0 : std_logic_vector(15 downto 0) := (others => '0');
   signal in1 : std_logic_vector(15 downto 0) := (others => '0');
   signal sel : std_logic := '0';
   
   --Outputs
   signal outvec : std_logic_vector(15 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
   uut: mux2to1vects PORT MAP (
         in0 => in0,
         in1 => in1,
         sel => sel,
         outvec => outvec
        );

   -- Stimulus process
   stim_proc: process
   begin		
        in0 <= x"FFFF";
		in1 <= x"AAAA";
		
		wait for 10ns;
		sel <= '1';
		
		wait for 10ns;
		sel <= '0';
		
		wait for 10ns;
		sel <= '1';

      wait;
   end process;


end Behavioral;
