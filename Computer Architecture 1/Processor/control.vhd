----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2019 14:40:49
-- Design Name: 
-- Module Name: control - Behavioral
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

entity control is
	Port(	IR : in STD_LOGIC_VECTOR(15 downto 0);
			status_bits : in STD_LOGIC_VECTOR(3 downto 0);   --flags
			reset : in STD_LOGIC;                            --in CAR and PC
			control_word : out STD_LOGIC_VECTOR(17 downto 0);
			PC_out : out STD_LOGIC_VECTOR(15 downto 0);
			TD_mpc, TA_mpc, TB_mpc, MW_mpc : out STD_LOGIC
			);
end control;

architecture Behavioral of control is
	component controlMemory
		Port(	in_car : in STD_LOGIC_VECTOR(7 downto 0);
				MW, MM, RW, MD, MB, TB, TA, TD, PL, PI, IL, MC : out STD_LOGIC;
				FS_cm : out STD_LOGIC_VECTOR(4 downto 0);
				MS_cm : out STD_LOGIC_VECTOR(2 downto 0);
				NA : out STD_LOGIC_VECTOR(7 downto 0)
				);
	end component;
	
	component muxC
		Port(	In0, In1 : in STD_LOGIC_VECTOR(7 downto 0);
				sel : in STD_LOGIC;
				Z : out STD_LOGIC_VECTOR(7 downto 0)
				);
	end component;
	
	component muxS
		Port(	In_zero, In_one, In_n, In_z, In_c, In_v, In_not_c, In_not_z : in STD_LOGIC;
				MS : in STD_LOGIC_VECTOR(2 downto 0);
				outS : out STD_LOGIC
				);
	end component;
	
	component controlAddressRegister
		Port(	car_in : in STD_LOGIC_VECTOR(7 downto 0);
				s_car, reset : in STD_LOGIC;
				car_out : out STD_LOGIC_VECTOR(7 downto 0)
				);
	end component;
	
	component instructionReg
		Port(	IR_in : in STD_LOGIC_VECTOR(15 downto 0);
				IL_in : in STD_LOGIC;
				Opcode :  out STD_LOGIC_VECTOR(6 downto 0);
				DR, SA, SB : out STD_LOGIC_VECTOR(2 downto 0)
				);
	end component;
	
	component programCounter
		Port(	PC_in : in STD_LOGIC_VECTOR(15 downto 0);
				PL_in, PI_in, reset : in STD_LOGIC;
				PC_out : out STD_LOGIC_VECTOR(15 downto 0)
				);
	end component;
	
	component extendedPC
		Port(	SR_SB : in STD_LOGIC_VECTOR(5 downto 0);
				extendedPC : out STD_LOGIC_VECTOR(15 downto 0)
				);
	end component;
	
	--signals
	signal control_word_sig : STD_LOGIC_VECTOR(17 downto 0);
	signal opcode_sig, car_out_sig, out_car_sig, na_sig : STD_LOGIC_VECTOR(7 downto 0);
	signal out_s_car_sig, mc_sig, il_sig, pl_sig, pi_sig : STD_LOGIC;
	signal ms_cm_sig, sa_sig, sb_sig, dr_sig : STD_LOGIC_VECTOR(2 downto 0);
	signal extend_in : STD_LOGIC_VECTOR(5 downto 0);
	signal extend_out : STD_LOGIC_VECTOR(15 downto 0);
	signal notC, notZ : STD_LOGIC;
	
begin
	controlMem : controlMemory PORT MAP(
		in_car => car_out_sig,
		MW => mw_mpc,
		MM => control_word_sig(0),
		RW => control_word_sig(1),
		MD => control_word_sig(2),
		MB => control_word_sig(8),
		TB => tb_mpc,
		TA => ta_mpc,
		TD => td_mpc,
		PL => pl_sig,
		PI => pi_sig,
		IL => il_sig,
		MC => mc_sig,
		FS_cm => control_word_sig(7 downto 3),
		MS_cm => ms_cm_sig,
		NA => na_sig
	);
	
	CARmux : muxC PORT MAP(
		In0 => na_sig,
		In1 => opcode_sig,
		sel => mc_sig,
		Z => out_car_sig
	);
	
	statusMux : muxS PORT MAP(
		In_zero => '0',
		In_one => '1',
		In_z => status_bits(0),
		In_n => status_bits(1),
		In_c => status_bits(2),
		In_v => status_bits(3),
		In_not_z => notZ,--not status_bits(0), temporary
		In_not_c => notC,--not status_bits(2),
		MS => ms_cm_sig,
		outS => out_s_car_sig
	);
	
	CAR : controlAddressRegister PORT MAP(
		car_in => out_car_sig,
		s_car => out_s_car_sig,
		reset => reset,
		car_out => car_out_sig
	);
	
	instructionRegister : instructionReg PORT MAP(
		IR_in => IR,
		IL_in => il_sig,
		Opcode => opcode_sig(6 downto 0),
		DR => dr_sig,
		SA => sa_sig,
		SB => sb_sig
	);
	
	EPC : extendedPC PORT MAP(
		SR_SB => extend_in,
		extendedPC => extend_out
	);
	
	ProgramC : programCounter PORT MAP(
		PC_in => extend_out,
		PL_in => pl_sig,
		PI_in => pi_sig,
		reset => reset,
		PC_out => pc_out
	);
	
	extend_in(5 downto 3) <= dr_sig;
	extend_in(2 downto 0) <= sb_sig;
	opcode_sig(7) <= '0';
	
	control_word_sig(17 downto 15) <= dr_sig;
	control_word_sig(14 downto 12) <= sa_sig;
	control_word_sig(11 downto 9) <= sb_sig;
	control_word <= control_word_sig;
	
	notZ<=not status_bits(0);
	notC<=not status_bits(2);

end Behavioral;
