----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.02.2019 19:31:29
-- Design Name: 
-- Module Name: mux2to16 - Behavioral
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

entity mux2to16bittb is
--  Port ( );
end mux2to16bittb;

architecture Behavioral of mux2to16bittb is
    -- Component Declaration for the Unit Under Test (UUT)
 
    component mux2to16
    port(
         s : in  STD_LOGIC;
         in0 : in  STD_LOGIC_VECTOR(15 downto 0);
         in1 : in  STD_LOGIC_VECTOR(15 downto 0);
         z : out  STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;
    
   --Inputs
   signal s : STD_LOGIC;
   signal in0 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
   signal in1 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
   

 	--Outputs
   signal z : STD_LOGIC_VECTOR(15 downto 0);
 
begin
	-- Instantiate the Unit Under Test (UUT)
   uut: mux2to16 port map (
          s => s,
          in0 => in0,
          in1 => in1,
          z => z
        ); 

-- Stimulus process
   stim_proc: process
   begin		
		in0 <= "1010101010101010";
		in1 <= "0101010101010101";
		
		wait for 10ns;
		s <= '0';
		
		wait for 10ns;
		s <= '1';
	
   end process;

end;
