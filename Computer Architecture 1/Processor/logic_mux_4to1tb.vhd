----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2019 12:50:43
-- Design Name: 
-- Module Name: logic_mux_4to1tb - Behavioral
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

entity logic_mux_4to1tb is
end logic_mux_4to1tb;

architecture Behavioral of logic_mux_4to1tb is

        component logic_mux_4to1
    port(
           in0 : in STD_LOGIC;
           in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           in3 : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           G : out STD_LOGIC
    
    );
    
    end component;
    
    --Inputs
   signal in0 : std_logic := '0';
   signal in1 : std_logic := '0';
   signal in2 : std_logic := '0';
   signal in3 : std_logic := '0';
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';

 	--Outputs
   signal G : std_logic;

begin

         -- Instantiate the Unit Under Test (UUT)
   uut: logic_mux_4to1 PORT MAP (
          in0 => in0,
          in1 => in1,
          in2 => in2,
          in3 => in3,
          S0 => S0,
          S1 => S1,
          G => G
        );

   -- Stimulus process
   stim_proc: process
   begin		
		in0 <= '1';
		in1 <= '0';
		in2 <= '0';
		in3 <= '0';
		
		wait for 5ns;
		in1 <= '1';
		S1 <= '1';
		
		wait for 5ns;
		in2 <= '1';
		S1 <= '0';
		S0 <= '1';
		
		wait for 5ns;
		in3 <= '1';
		S1 <= '1';
		S0 <= '1';
		
		wait for 5ns;
		S1 <= '0';
		S0 <= '0';

      wait;
   end process;


end Behavioral;
