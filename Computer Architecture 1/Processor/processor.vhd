----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2019 19:42:57
-- Design Name: 
-- Module Name: processor - Behavioral
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

entity processor is
	Port(	Clk, reset : in STD_LOGIC
			);
end processor;

architecture Behavioral of processor is
	
	component datapath     --fix this name
		Port(	data_in, constant_in : in STD_LOGIC_VECTOR(15 downto 0);
				control_word : in STD_LOGIC_VECTOR(17 downto 0);
				clk, TD, TA, TB : in STD_LOGIC;
				data_out, address_out : out STD_LOGIC_VECTOR(15 downto 0);
				V : out std_logic;
                C : out std_logic;
                Z : out std_logic;
                N : out std_logic
				);
	end component;
	
	component control
		Port(	IR : in STD_LOGIC_VECTOR(15 downto 0);
				status_bits : in STD_LOGIC_VECTOR(3 downto 0);
				reset : in STD_LOGIC;
				control_word : out STD_LOGIC_VECTOR(17 downto 0);
				PC_out : out STD_LOGIC_VECTOR(15 downto 0);
				TD_mpc, TA_mpc, TB_mpc, MW_mpc : out STD_LOGIC
				);
	end component;
	
	component memoryM
		Port(	address_mem : in STD_LOGIC_VECTOR(15 downto 0);
				write_data : in STD_LOGIC_VECTOR(15 downto 0);
				mem_write : in STD_LOGIC;
				read_data : out STD_LOGIC_VECTOR(15 downto 0)
				);
	end component;
	
	signal mem_read_data, mp_pc_out, dp_data_out, dp_address_out : STD_LOGIC_VECTOR(15 downto 0);
	signal mp_control_word : STD_LOGIC_VECTOR(17 downto 0);
	signal dp_status_out : STD_LOGIC_VECTOR(3 downto 0);
	signal mpc_TD, mpc_TA, mpc_TB, mpc_MW : STD_LOGIC;

begin
	data_path : datapath PORT MAP(
		data_in => mem_read_data,
		constant_in => mp_pc_out,
		control_word => mp_control_word,
		clk => Clk,
		TD => mpc_TD,
		TA => mpc_TA,
		TB => mpc_TB,
		data_out => dp_data_out,
		address_out => dp_address_out,
		V => dp_status_out(3),
		C=>dp_status_out(2),
		Z=>dp_status_out(0),
		N=>dp_status_out(1)
	);
	
	micro_control : control PORT MAP(
		IR => mem_read_data,
		status_bits => dp_status_out,
		reset => reset,
		control_word => mp_control_word,
		PC_out => mp_pc_out,
		TD_mpc => mpc_TD,
		TA_mpc => mpc_TA,
		TB_mpc => mpc_TB,
		MW_mpc => mpc_MW
	);
	
	memM : memoryM PORT MAP(
		address_mem => dp_address_out,
		write_data => dp_data_out,
		mem_write => mpc_MW,
		read_data => mem_read_data
	);

end Behavioral;