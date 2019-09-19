----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2019 19:14:54
-- Design Name: 
-- Module Name: mux_3to1tb - Behavioral
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

entity mux_3to1tb is
--  Port ( );
end mux_3to1tb;

architecture Behavioral of mux_3to1tb is

    component mux3to1
    port(
           in0 : in STD_LOGIC;
           in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           sel : in STD_LOGIC_VECTOR(1 downto 0);
           H : out STD_LOGIC
    );
    end component;
    
    --Inputs
   signal in0 : std_logic := '0';
   signal in1 : std_logic := '0';
   signal in2 : std_logic := '0';
   signal sel : std_logic_vector(1 downto 0) := "00";

 	--Outputs
   signal H : std_logic;

begin

      -- Instantiate the Unit Under Test (UUT)
   uut: mux3to1 PORT MAP (
          in0 => in0,
          in1 => in1,
          in2 => in2,
          sel => sel,
          H => H
        );

   -- Stimulus process
   stim_proc: process
   begin		
		in0 <= '1';
		in1 <= '0';
		in2 <= '0';
		
		wait for 5ns;
		sel <= "01";
		
		wait for 5ns;
		--in0 <= '0';
		in1 <= '1';
		sel <= "10";
		
		wait for 5ns;
		in0 <= '0';
		in2 <= '1';
		
		wait for 5ns;
		sel <= "11";

      wait;
   end process;


end Behavioral;
