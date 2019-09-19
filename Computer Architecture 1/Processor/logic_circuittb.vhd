----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2019 19:40:40
-- Design Name: 
-- Module Name: logic_circuittb - Behavioral
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

entity logic_circuittb is
end logic_circuittb;

architecture Behavioral of logic_circuittb is

    component logic_circuit
    port(
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           a_n_d : inout STD_LOGIC;
           o_r : inout STD_LOGIC;
           x_o_r : inout STD_LOGIC;
           n_o_t : inout STD_LOGIC;
           G : out STD_LOGIC  
    );  
    end component;
    
       --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';
   --signal a_n_d : std_logic := '0';
   

 	--Outputs
   signal G : std_logic;

begin

       -- Instantiate the Unit Under Test (UUT)
   uut: logic_circuit PORT MAP (
          A => A,
          B => B,
          S0 => S0,
          S1 => S1,
          G => G
        );

   -- Stimulus process
   stim_proc: process
   begin		
        A <= '0';
        B <= '0';
        S0 <= '0';
        S1 <= '0';
		
		wait for 5ns;
		A <= '1';
		
		wait for 5ns;
		B <= '1';

      wait;
   end process;


end Behavioral;
