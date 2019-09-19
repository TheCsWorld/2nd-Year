----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2019 11:33:26
-- Design Name: 
-- Module Name: MemoryM-tb - Behavioral
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


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
 
ENTITY memoryM_tb IS
END memoryM_tb;
 
ARCHITECTURE behavior OF memoryM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memoryM
    PORT(
         address_mem : IN  std_logic_vector(15 downto 0);
         write_data : IN  std_logic_vector(15 downto 0);
         mem_write : IN  std_logic;
         read_data : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address_mem : std_logic_vector(15 downto 0) := (others => '0');
   signal write_data : std_logic_vector(15 downto 0) := (others => '0');
   signal mem_write : std_logic := '0';

 	--Outputs
   signal read_data : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memoryM PORT MAP (
          address_mem => address_mem,
          write_data => write_data,
          mem_write => mem_write,
          read_data => read_data
        );

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 10ns;
		address_mem <= x"0000";
		
		wait for 10ns;
		address_mem <= x"0001";
		
		wait for 10ns;
		address_mem <= x"0002";
		
		wait for 10ns;
		address_mem <= x"0003";

      wait;
   end process;

END;
