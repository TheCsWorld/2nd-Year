----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Chloe Conneely 1733080
-- 
-- Create Date: 13.02.2019 20:01:39
-- Design Name: 
-- Module Name: regtb - Behavioral
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

entity regtb is
--  Port ( );
end regtb;

architecture Behavioral of regtb is

-- Component Declaration for the Unit Under Test (UUT)
 
    component reg16
    port(
         D : in  STD_LOGIC_VECTOR(15 downto 0);
         load : in  STD_LOGIC;
         clk : in  STD_LOGIC;
         Q : out  STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;
    
    --Inputs
   signal D : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
   signal load : STD_LOGIC := '0';
   signal clk : STD_LOGIC := '0';

 	--Outputs
   signal Q : STD_LOGIC_VECTOR(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
   uut: reg16 port map (
          D => D,
          load => load,
          clk => clk,
          Q => Q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 10ns;
		D <= x"FFFF";
		load <= '1';
		
		wait for 10ns;
		load <= '0';
		
		wait for 10ns;
		D <= x"AAAA";
		load <= '1';
		
		wait for 10ns;
		load <= '0';
   end process;


end Behavioral;
