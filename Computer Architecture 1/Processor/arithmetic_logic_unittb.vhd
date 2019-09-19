----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2019 13:26:28
-- Design Name: 
-- Module Name: arithmetic_logic_unittb - Behavioral
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

entity arithmetic_logic_unittb is
end arithmetic_logic_unittb;

architecture Behavioral of arithmetic_logic_unittb is

    component arithmetic_logic_unit
    port(
           C_in : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           sela : in STD_LOGIC_VECTOR(3 downto 0);
           C_out : out STD_LOGIC;
           V : out STD_LOGIC;
           G : out STD_LOGIC_VECTOR (15 downto 0)   
    );
    
    end component;
    
    --Inputs
   signal C_in : std_logic;
   signal A : std_logic_VECTOR(15 downto 0) := (others => '0');
   signal B : std_logic_VECTOR(15 downto 0) := (others => '0');
   signal sela :  STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

 	--Outputs
   signal C_out : STD_LOGIC;
   signal V : STD_LOGIC;
   signal G : std_logic_VECTOR (15 downto 0);

begin

        -- Instantiate the Unit Under Test (UUT)
   uut: arithmetic_logic_unit PORT MAP (
          C_in => C_in,
          A => A,
          B => B,
          sela => sela,
          C_out => C_out,
          V => V,
          G => G
        );

   -- Stimulus process
   stim_proc: process
   begin	
        C_in <= '0';	
		A <= x"0001";
		B <= x"0000";
		sela <= x"0";
		
		wait for 5ns;
		C_in <= '1';
        sela <= x"1";
		
		wait for 5ns;
		sela <= x"2";
		
		wait for 5ns;
		A <= x"0005";
		sela <= x"0";
		
		wait for 5ns;
		A<= x"ffff";
		B<=x"0004";
        sela <= x"1";

		wait for 5ns;
		C_in <= '0';
		sela <= x"0";
		
		wait for 5ns;
		A <= x"0005";
		sela <= x"2";
		
		wait for 5ns;
		A <= x"0700";
		sela <= x"1";
		
		wait for 5ns;
		C_in <= '0';
		B <= x"0000";
		sela <= x"0";
		
        wait for 5ns;
		sela <= x"1";
		
		wait for 5ns;
		sela <= x"2";
		
		
      wait;
   end process;


end Behavioral;
