----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2019 18:52:01
-- Design Name: 
-- Module Name: alu_mux2to1tb - Behavioral
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

entity alu_mux2to1tb is
end alu_mux2to1tb;

architecture Behavioral of alu_mux2to1tb is

    component alu_mux2to1
    port(
           in0 : in STD_LOGIC;
           in1 : in STD_LOGIC;
           Sel : in STD_LOGIC;
           G : out STD_LOGIC
    
    );
    
    end component;
    
    --Inputs
   signal in0 : std_logic := '0';
   signal in1 : std_logic := '0';
   signal sel : std_logic := '0';

 	--Outputs
   signal G : std_logic;

begin

    -- Instantiate the Unit Under Test (UUT)
   uut: alu_mux2to1 PORT MAP (
          in0 => in0,
          in1 => in1,
          sel => sel,
          G => G
        );

   -- Stimulus process
   stim_proc: process
   begin		
		in0 <= '1';
		in1 <= '0';
		
		wait for 5ns;
		sel <= '1';
		
		wait for 5ns;
		sel <= '0';

      wait;
   end process;


end Behavioral;
