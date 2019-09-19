----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Chloe Conneely 17323080
-- 
-- Create Date: 14.02.2019 19:50:17
-- Design Name: 
-- Module Name: mux16to16bittest - Behavioral
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

entity mux16to16bittest is
--  Port ( );
end mux16to16bittest;

architecture Behavioral of mux16to16bittest is

component mux16to16bit
    port(
         s0 : in  STD_LOGIC;
         s1 : in  STD_LOGIC;
         s2 : in  STD_LOGIC;
         in0 : in  STD_LOGIC_VECTOR(15 downto 0);
         in1 : in  STD_LOGIC_VECTOR(15 downto 0);
         in2 : in  STD_LOGIC_VECTOR(15 downto 0);
         in3 : in  STD_LOGIC_VECTOR(15 downto 0);
         in4 : in  STD_LOGIC_VECTOR(15 downto 0);
         in5 : in  STD_LOGIC_VECTOR(15 downto 0);
         in6 : in  STD_LOGIC_VECTOR(15 downto 0);
         in7 : in  STD_LOGIC_VECTOR(15 downto 0);
         z : out  STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;
    
    --Inputs
   signal s0 : STD_LOGIC := '0';
   signal s1 : STD_LOGIC := '0';
   signal s2 : STD_LOGIC := '0';
   signal in0 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
   signal in1 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
   signal in2 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
   signal in3 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
   signal in4 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
   signal in5 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
   signal in6 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
   signal in7 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

 	--Outputs
   signal z : STD_LOGIC_VECTOR(15 downto 0);

begin

-- Instantiate the Unit Under Test (UUT)
   uut: mux16to16bit port map (
          s0 => s0,
          s1 => s1,
          s2 => s2,
          in0 => in0,
          in1 => in1,
          in2 => in2,
          in3 => in3,
          in4 => in4,
          in5 => in5,
          in6 => in6,
          in7 => in7,
          z => z
        );

   -- Stimulus process
   stim_proc: process
   begin		
		in0 <= x"FFFF";
		in1 <= x"EEEE";
		in2 <= x"DDDD";
		in3 <= x"CCCC";
		in4 <= x"BBBB";
		in5 <= x"AAAA";
		in6 <= x"9999";
		in7 <= x"8888";
		
		wait for 10ns;
		s0 <= '1';
		s1 <= '0';
		s2 <= '0';
		
		wait for 10ns;
		s0 <= '0';
		s1 <= '1';
		s2 <= '0';
		
		wait for 10ns;
		s0 <= '1';
		s1 <= '1';
		s2 <= '0';
		
		wait for 10ns;
		s0 <= '0';
		s1 <= '0';
		s2 <= '1';
		
		wait for 10ns;
		s0 <= '1';
		s1 <= '0';
		s2 <= '1';
		
		wait for 10ns;
		s0 <= '0';
		s1 <= '1';
		s2 <= '1';
		
		wait for 10ns;
		s0 <= '1';
		s1 <= '1';
		s2 <= '1';
   end process;

end Behavioral;
