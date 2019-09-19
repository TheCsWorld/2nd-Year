----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.03.2019 14:36:24
-- Design Name: 
-- Module Name: datapathtb - Behavioral
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

entity datapathtb is
--  Port ( );
end datapathtb;

architecture Behavioral of datapathtb is

   COMPONENT datapath
    PORT(
         data_in : IN  std_logic_vector(15 downto 0);
         constant_in : IN  std_logic_vector(15 downto 0);
         control_word : IN  std_logic_vector(16 downto 0);
         Clk : IN  std_logic;
         data_out : OUT  std_logic_vector(15 downto 0);
         address_out : OUT  std_logic_vector(15 downto 0);
         V, C, Z, N : OUT  std_logic
         );
    END COMPONENT;
    
    --Inputs
   signal data_in : std_logic_vector(15 downto 0) := (others => '0');
   signal constant_in : std_logic_vector(15 downto 0) := (others => '0');
   signal control_word : std_logic_vector(16 downto 0) := (others => '0');
   signal Clk : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(15 downto 0);
   signal address_out : std_logic_vector(15 downto 0);
   signal V : std_logic;
   signal C : std_logic;
   signal Z : std_logic;
   signal N : std_logic;

begin

    -- Instantiate the Unit Under Test (UUT)
   uut: datapath PORT MAP (
          data_in => data_in,
          constant_in => constant_in,
          control_word => control_word,
          Clk => Clk,
          data_out => data_out,
          address_out => address_out,
          V => V,
          C => C,
          Z => Z,
          N => N
        );

   -- Clock process definitions
   Clk_sig_process :process
   begin
		Clk <= '0';
		wait for 10ns;
		Clk <= '1';
		wait for 10ns;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		data_in <= x"2222";
		constant_in <= x"0000";
		control_word <= "00000000100000011";
		
		wait for 40ns;
		--data_in <= x"5486";
		control_word <= "00000000101000011";
		
		wait for 40ns;
		control_word <= "00000000100010011";
		
		wait for 40ns;
		control_word <= "00000000100100011";
		
		wait;
   end process;


end Behavioral;
