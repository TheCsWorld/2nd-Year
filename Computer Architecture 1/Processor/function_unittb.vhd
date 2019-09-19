----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2019 15:15:41
-- Design Name: 
-- Module Name: function_unittb - Behavioral
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

entity function_unittb is
end function_unittb;

architecture Behavioral of function_unittb is

component function_unit
    port(
           inA : in STD_LOGIC_VECTOR (15 downto 0);
           inB : in STD_LOGIC_VECTOR (15 downto 0);
           F : out STD_LOGIC_VECTOR (15 downto 0);
           F_sel : in STD_LOGIC_VECTOR (4 downto 0);
           N_fu, Z_fu, V_fu, C_fu : out STD_LOGIC
    );
    
    end component;
    
    --Inputs
   signal F_sel : std_logic_vector(4 downto 0) := (others => '0');
   signal inA : std_logic_vector(15 downto 0) := (others => '0');
   signal inB : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal N_fu : std_logic;
   signal Z_fu : std_logic;
   signal V_fu : std_logic;
   signal C_fu : std_logic;
   signal F : std_logic_vector(15 downto 0);

begin

        -- Instantiate the Unit Under Test (UUT)
   uut: function_unit PORT MAP (
          F_sel => F_sel,
          inA => inA,
          inB => inB,
          N_fu => N_fu,
          Z_fu => Z_fu,
          V_fu => V_fu,
          C_fu => C_fu,
          F => F
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
		inA <= x"AAAA";
		inB <= x"BBBB";
		
		wait for 20ns;
		F_sel <= "00000";
		
		wait for 10ns;
		F_sel <= "00001";
		
		wait for 10ns;
		F_sel <= "00010";
		inA <= x"FFFF";
		
		wait for 10ns;
		F_sel <= "00011";
		
		wait for 10ns;
		F_sel <= "00100";
		
		wait for 10ns;
		F_sel <= "00101";
		
		wait for 10ns;
		F_sel <= "00110";
		
		wait for 10ns;
		F_sel <= "00111";
		
		wait for 10ns;
		F_sel <= "01000";
		
		wait for 10ns;
		F_sel <= "01010";
		
		wait for 10ns;
		F_sel <= "01100";
		
		wait for 10ns;
		F_sel <= "01110";
		
		wait for 10ns;
		F_sel <= "10000";
		
		wait for 10ns;
		F_sel <= "10100";
		
		wait for 10ns;
		F_sel <= "11000";
		
		wait;
   end process;


end Behavioral;
