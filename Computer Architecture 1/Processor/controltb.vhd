----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2019 12:01:28
-- Design Name: 
-- Module Name: controltb - Behavioral
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

ENTITY controltb IS
END controltb;
 
ARCHITECTURE behavior OF controltb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control
    PORT(
         IR : in STD_LOGIC_VECTOR(15 downto 0);
			status_bits : in STD_LOGIC_VECTOR(3 downto 0);   --flags
			reset : in STD_LOGIC;                            --in CAR and PC
			control_word : out STD_LOGIC_VECTOR(17 downto 0);
			PC_out : out STD_LOGIC_VECTOR(15 downto 0);
			TD_mpc, TA_mpc, TB_mpc, MW_mpc : out STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal IR_sig : std_logic_vector(15 downto 0) := (others => '0');
   signal status_sig :std_logic_vector(3 downto 0) := (others => '0');
   signal reset_sig : std_logic := '0';
   
 	--Outputs
   signal control_word_sig : std_logic_vector(17 downto 0) := (others => '0');
   signal PC_sig :  STD_LOGIC_VECTOR(15 downto 0);
   signal TD_sig, TA_sig, TB_sig, MW_sig : std_logic := '0';
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control PORT MAP (
          IR => IR_sig,
          status_bits => status_sig,
          reset => reset_sig,
          control_word => control_word_sig,
          PC_out => PC_sig,
          TD_mpc => TD_sig,
          TA_mpc => TA_sig,
          TB_mpc => TB_sig,
          MW_mpc => MW_sig
        );

   -- Stimulus process
   stim_proc: process
   begin		
		
		wait for 5ns;
		reset_sig <= '1';
		IR_sig <= x"1111";
		status_sig <= x"1";
		
      wait;
   end process;

END;
