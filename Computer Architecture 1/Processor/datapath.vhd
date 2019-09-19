----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.03.2019 12:10:09
-- Design Name: 
-- Module Name: datapath - Behavioral
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

entity datapath is
    Port ( data_in : in STD_LOGIC_VECTOR (15 downto 0);
           constant_in : in STD_LOGIC_VECTOR (15 downto 0);     --pc
           control_word : in STD_LOGIC_VECTOR(17 downto 0);
           Clk, TD, TA, TB : in std_logic;
           address_out : out STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC_VECTOR (15 downto 0);
           status_out : out STD_LOGIC_VECTOR(3 downto 0);
           V : out std_logic;
           C : out std_logic;
           Z : out std_logic;
           N : out std_logic
           );
end datapath;

architecture Behavioral of datapath is
        --functional unit
        component function_unit
        Port(
          inA : in std_logic_vector(15 downto 0);
          inB : in std_logic_vector(15 downto 0);
          F : out STD_LOGIC_VECTOR (15 downto 0);
          F_sel : in STD_LOGIC_VECTOR (4 downto 0);
          N_fu, Z_fu, V_fu, C_fu : out STD_LOGIC
        );
        end component;
         
           --mux d
           component mux16to4
            Port ( in0 : in STD_LOGIC_VECTOR (15 downto 0);
           in1 : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (15 downto 0));
           end component;
           
           
           
           --mux b
           component muxB2to4
           port(in0 : in STD_LOGIC_VECTOR (15 downto 0);
           in1 : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           B : out STD_LOGIC_VECTOR (15 downto 0)
           );
           end component;
           
           component muxM
           port(in0 : in STD_LOGIC_VECTOR (15 downto 0);
           in1 : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (15 downto 0)
           );
           end component;
           --reg file
           component register_file
           port(
           src_s0 : in STD_LOGIC;
           src_s1 : in STD_LOGIC;
           src_s2 : in STD_LOGIC;
           src_s3 : in STD_LOGIC;
           src_s4 : in STD_LOGIC;
           src_s5 : in STD_LOGIC;
           des_A0 : in STD_LOGIC;
           des_A1 : in STD_LOGIC;
           des_A2 : in STD_LOGIC;
           des_TD : in std_logic;
           src_TA: in std_logic;
           src_TB: in std_logic;
           Clk : in STD_LOGIC;
           data_src : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR(15 downto 0);
           --reg0 : out STD_LOGIC_VECTOR(15 downto 0);
           --reg1 : out STD_LOGIC_VECTOR(15 downto 0);
           --reg2 : out STD_LOGIC_VECTOR(15 downto 0);
           --reg3 : out STD_LOGIC_VECTOR(15 downto 0);
           --reg4 : out STD_LOGIC_VECTOR(15 downto 0);
           --reg5 : out STD_LOGIC_VECTOR(15 downto 0);
           --reg6 : out STD_LOGIC_VECTOR(15 downto 0);
           --reg7 : out STD_LOGIC_VECTOR(15 downto 0);
           Address_out : out STD_LOGIC_VECTOR(15 downto 0);
           BtoD : out STD_LOGIC_VECTOR(15 downto 0)
           );
           end component;
           
           component ZeroFill
		Port(	SB_in : in STD_LOGIC_VECTOR(2 downto 0);
				zero_fill_out : out STD_LOGIC_VECTOR(15 downto 0)
				);
		end component;
           
           
           
           --signal H_out, ALU_out, mux_out : STD_LOGIC_VECTOR(15 downto 0);
           signal G_out, H_out, F_out, busB, BtoD, addr_out, zero_fill_sig, pc_sig, AtoM : STD_LOGIC_VECTOR(15 downto 0);
           signal A_sig, B_sig, des_sig : STD_LOGIC_VECTOR(3 downto 0);
begin
          des_sig <= TD & control_word(17 downto 15);          
	       A_sig <= TA & control_word(14 downto 12);
	       B_sig <= TB & control_word(11 downto 9);
	       
	       zero_fill : ZeroFill PORT MAP(
		SB_in => control_word(11 downto 9),
		zero_fill_out => zero_fill_sig
	);
	       
        functionunit : function_unit PORT MAP(
           inA => constant_in,
           inB => busB,
           F => F_out,
           F_sel => control_word(6 downto 2),
           N_fu => N,
           Z_fu => Z,
           V_fu => V,
           C_fu => C
        );
        
        muxD : mux16to4 PORT MAP ( 
           in0 => F_out,
           in1 => data_in,
           sel => control_word(1),
           Z  => BtoD
           );
           
        muxB : muxB2to4 PORT MAP(
           in0 => BtoD,
           in1 => zero_fill_sig,
           sel  => control_word(7),
           B  => busB
        );
        mux_M : muxM PORT MAP(
        in0=>AtoM,
        in1=>constant_in,
        sel=>control_word(0),
        Z=>Address_out
        );
        
       reg_file : register_file PORT MAP(
           src_s0  => control_word(13),
           src_s1 => control_word(12),
           src_s2 => control_word(11),
           src_s3 => control_word(10),
           src_s4 => control_word(9),
           src_s5 => control_word(8),
           des_A0 => control_word(14),
           des_A1 => control_word(15),
           des_A2 => control_word(16),
           des_TD => TD,
           src_TA =>TA,
           src_TB=> TB,
           Clk => Clk,
           data_src =>F_out(0),   --might need to adjust (vector v bit)
           data =>data_in,
           Address_out => address_out,
           BtoD => data_out
        );
        
        pc_sig <= constant_in;
        --address_out <= addr_out;  --need to fix (mux M)
        data_out <= BtoD;
        
       

end Behavioral;
