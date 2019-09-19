----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Chloe Conneely 17323080
-- 
-- Create Date: 14.02.2019 20:10:44
-- Design Name: 
-- Module Name: register_filetb - Behavioral
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

entity register_filetb is
--  Port ( );
end register_filetb;

architecture Behavioral of register_filetb is

component register_file
    port(
         src_s0 : in  STD_LOGIC;
         src_s1 : in  STD_LOGIC;
         src_s2 : in  STD_LOGIC;
         des_A0 : in  STD_LOGIC;
         des_A1 : in  STD_LOGIC;
         des_A2 : in  STD_LOGIC;
         data_src : in  STD_LOGIC;
         Clk : in  STD_LOGIC;
         data : in  STD_LOGIC_VECTOR(15 downto 0);
         --Q : out  STD_LOGIC_VECTOR(15 downto 0);
         reg0 : out  STD_LOGIC_VECTOR(15 downto 0);
         reg1 : out  STD_LOGIC_VECTOR(15 downto 0);
         reg2 : out  STD_LOGIC_VECTOR(15 downto 0);
         reg3 : out  STD_LOGIC_VECTOR(15 downto 0);
         reg4 : out  STD_LOGIC_VECTOR(15 downto 0);
         reg5 : out  STD_LOGIC_VECTOR(15 downto 0);
         reg6 : out  STD_LOGIC_VECTOR(15 downto 0);
         reg7 : out  STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;
    
    --Inputs
   signal src_s0 : STD_LOGIC := '0';
   signal src_s1 : STD_LOGIC := '0';
   signal src_s2 : STD_LOGIC := '0';
   signal des_A0 : STD_LOGIC := '0';
   signal des_A1 : STD_LOGIC := '0';
   signal des_A2 : STD_LOGIC := '0';
   signal data_src : STD_LOGIC := '0';
   signal Clk : STD_LOGIC := '0';
   signal data : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

 	--Outputs
   --signal Q : STD_LOGIC_VECTOR(15 downto 0);
   signal reg0 : STD_LOGIC_VECTOR(15 downto 0);
   signal reg1 : STD_LOGIC_VECTOR(15 downto 0);
   signal reg2 : STD_LOGIC_VECTOR(15 downto 0);
   signal reg3 : STD_LOGIC_VECTOR(15 downto 0);
   signal reg4 : STD_LOGIC_VECTOR(15 downto 0);
   signal reg5 : STD_LOGIC_VECTOR(15 downto 0);
   signal reg6 : STD_LOGIC_VECTOR(15 downto 0);
   signal reg7 : STD_LOGIC_VECTOR(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;

begin
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file port map (
          src_s0 => src_s0,
          src_s1 => src_s1,
          src_s2 => src_s2,
          des_A0 => des_A0,
          des_A1 => des_A1,
          des_A2 => des_A2,
          data_src => data_src,
          Clk => Clk,
          data => data,
         -- Q => Q,
          reg0 => reg0,
          reg1 => reg1,
          reg2 => reg2,
          reg3 => reg3,
          reg4 => reg4,
          reg5 => reg5,
          reg6 => reg6,
          reg7 => reg7
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
   
		wait for 20ns;
		des_A0 <= '0';
		des_A1 <= '0';
		des_A2 <= '0';
		data <= x"FFFF";
		
		data_src <= '0';
		wait for 20ns;
		des_A0 <= '0';
		des_A1 <= '0';
		des_A2 <= '1';
		data <= x"EEEE";
		
		wait for 20ns;
		des_A0 <= '0';
		des_A1 <= '1';
		des_A2 <= '0';
		data <= x"DDDD";
		
		wait for 20ns;
		des_A0 <= '0';
		des_A1 <= '1';
		des_A2 <= '1';
		data <= x"CCCC";
		
		wait for 20ns;
		des_A0 <= '1';
		des_A1 <= '0';
		des_A2 <= '0';
		data <= x"BBBB";
		
		wait for 20ns;
		des_A0 <= '1';
		des_A1 <= '0';
		des_A2 <= '1';
		data <= x"AAAA";
		
		wait for 20ns;
		des_A0 <= '1';
		des_A1 <= '1';
		des_A2 <= '0';
		data <= x"9999";
		
		wait for 20ns;
		des_A0 <= '1';
		des_A1 <= '1';
		des_A2 <= '1';
		data <= x"8888";
		
		wait for 40ns;
		des_A0 <= '1';
		des_A1 <= '1';
		des_A2 <= '1';
		
		src_s0 <= '0';
		src_s1 <= '0';
		src_s2 <= '0';
		
	    data_src <= '1';
	    wait for 40ns;
   end process;

end Behavioral;
