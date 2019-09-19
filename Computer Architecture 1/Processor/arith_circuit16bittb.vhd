----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2019 13:04:06
-- Design Name: 
-- Module Name: arith_circuit16bittb - Behavioral
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

entity arith_circuit16bittb is
--  Port ( );
end arith_circuit16bittb;

architecture Behavioral of arith_circuit16bittb is
        component arith_circuit16bit
    port(
           C_in : inout STD_LOGIC;
           S1 : in STD_LOGIC;
           S0 : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR(15 downto 0);
           B : in STD_LOGIC_VECTOR(15 downto 0);
           YB : inout STD_LOGIC_VECTOR(15 downto 0);
           C_out : out STD_LOGIC;
           V_out : out std_logic;
           G : out STD_LOGIC_VECTOR(15 downto 0)
    
    );
    
    end component;
    
    --Inputs
   signal C_in : std_logic := '0';
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal YB : std_logic_vector(15 downto 0) := (others => '0');
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';

 	--Outputs
   signal C_out : STD_LOGIC;
   signal V_out : STD_LOGIC;
   signal G : std_logic_vector(15 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
   uut: arith_circuit16bit PORT MAP (
          C_in => C_in,
          A => A,
          B => B,
          YB => YB,
          S0 => S0,
          S1 => S1,
          C_out => C_out,
          V_out => V_out,
          G => G
        );

   -- Stimulus process
   stim_proc: process
   begin		
		C_in <= '0';
		A <= x"0000";
		B <= x"0000";
		S0 <= '0';
		S1 <= '0';
		
		wait for 5ns;
		A <= x"0005";
		S1 <= '1';
		
		wait for 5ns;
		C_in <= '1';
		
		wait for 5ns;
		C_in <= '0';
		B <= x"ffff";
		S1 <= '0';
		S0 <= '1';
		
		wait for 5ns;
		C_in <= '1';
		S1 <= '1';
		S0 <= '1';
		
		wait for 5ns;
		S1 <= '0';
		S0 <= '0';

      wait;
   end process;


end Behavioral;
