----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2019 11:33:51
-- Design Name: 
-- Module Name: instuctionRegtb - Behavioral
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

 
ENTITY instuctionRegtb IS
END instuctionRegtb;
 
ARCHITECTURE behavior OF instuctionRegtb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instuctionReg
    PORT(
         IR_in : IN  std_logic_vector(15 downto 0);
         IL_in : IN  std_logic;
         Opcode : OUT  std_logic_vector(6 downto 0);
         DR : OUT  std_logic_vector(2 downto 0);
         SA : OUT  std_logic_vector(2 downto 0);
         SB : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal IR_in : std_logic_vector(15 downto 0) := (others => '0');
   signal IL_in : std_logic := '0';

 	--Outputs
   signal Opcode : std_logic_vector(6 downto 0);
   signal DR : std_logic_vector(2 downto 0);
   signal SA : std_logic_vector(2 downto 0);
   signal SB : std_logic_vector(2 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: instuctionReg PORT MAP (
          IR_in => IR_in,
          IL_in => IL_in,
          Opcode => Opcode,
          DR => DR,
          SA => SA,
          SB => SB
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
		wait for 10ns;
		IR_in <= "1111111000001010";
		
		wait for 5ns;
		IL_in <= '1';
		
		wait for 10ns;
		IR_in <= "0000000110110000";
		IL_in <= '0';
		
		wait for 5ns;
		IL_in <= '1';

      wait;
   end process;

END;
