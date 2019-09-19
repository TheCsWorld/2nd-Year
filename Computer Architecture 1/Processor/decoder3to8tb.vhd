----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Chloe Conneely 17323080
-- 
-- Create Date: 13.02.2019 13:11:42
-- Design Name: 
-- Module Name: decoder3to8tb - Behavioral
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

entity decoder3to8tb is
end decoder3to8tb;

architecture Behavioral of decoder3to8tb is
    component decoder3to8
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           Q0 : out STD_LOGIC;
           Q1 : out STD_LOGIC;
           Q2 : out STD_LOGIC;
           Q3 : out STD_LOGIC;
           Q4 : out STD_LOGIC;
           Q5 : out STD_LOGIC;
           Q6 : out STD_LOGIC;
           Q7 : out STD_LOGIC);
    end component;
    
    --inputs
    signal A0 : std_logic := '0';
    signal A1 : std_logic := '0';
    signal A2 : std_logic := '0';
    
    --outputs
    signal Q0 : std_logic;
    signal Q1 : std_logic;
    signal Q2 : std_logic;
    signal Q3 : std_logic;
    signal Q4 : std_logic;
    signal Q5 : std_logic;
    signal Q6 : std_logic;
    signal Q7 : std_logic;
begin
-- Instantiate the Unit Under Test (UUT)
   uut: decoder3to8 PORT MAP (
          A0=>A0,
          A1=>A1,
          A2=>A2,
          Q0=>Q0,
          Q1=>Q1,
          Q2=>Q2,
          Q3=>Q3,
          Q4=>Q4,
          Q5=>Q5,
          Q6=>Q6,
          Q7=>Q7
        );
   stim_proc: process
   begin	
       --000
        wait for 10 ns;	
        A0 <= '0';
		A1 <= '0';
		A2 <= '0';
      wait for 10 ns;	
      --001
		wait for 10ns;
		A0 <= '1';
		A1 <= '0';
		A2 <= '0';
		--010
		wait for 10ns;
		A0 <= '0';
		A1 <= '1';
		A2 <= '0';
		--011
		wait for 10ns;
		a0 <= '1';
		a1 <= '1';
		a2 <= '0';
		--100
		wait for 10ns;
		A0 <= '0';
		A1 <= '0';
		A2 <= '1';
		--101
		wait for 10ns;
		A0 <= '1';
		A1 <= '0';
		A2 <= '1';
		--110
		wait for 10ns;
		A0 <= '0';
		A1 <= '1';
		A2 <= '1';
		--111
		wait for 10ns;
		A0 <= '1';
		A1 <= '1';
		A2 <= '1';
           
 --     wait;
   end process;
end Behavioral;