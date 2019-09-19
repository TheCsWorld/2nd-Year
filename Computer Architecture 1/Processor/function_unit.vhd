----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2019 11:13:36
-- Design Name: 
-- Module Name: function_unit - Behavioral
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

entity function_unit is
    Port ( inA : in STD_LOGIC_VECTOR (15 downto 0);
           inB : in STD_LOGIC_VECTOR (15 downto 0);
           F : out STD_LOGIC_VECTOR (15 downto 0);
           F_sel : in STD_LOGIC_VECTOR (4 downto 0);
           N_fu, Z_fu, V_fu, C_fu : out STD_LOGIC
           );
end function_unit;

architecture Behavioral of function_unit is

    --2 to 1 mux
	component mux2to1vects
		Port(
			in0 : in STD_LOGIC_VECTOR(15 downto 0);
			in1 : in STD_LOGIC_VECTOR(15 downto 0);
			sel : in STD_LOGIC;
			outvec : out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;
	
	--shifter
	component shifter_16bit
		Port(
			B : in STD_LOGIC_VECTOR(15 downto 0);
			sel : in STD_LOGIC_VECTOR(1 downto 0);
			H : out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;
	
	--alu
	component arithmetic_logic_unit
		Port(
		    C_in : in STD_LOGIC;
			A : in STD_LOGIC_VECTOR(15 downto 0);
			B : in STD_LOGIC_VECTOR(15 downto 0);
			sela : in STD_LOGIC_VECTOR(3 downto 0);
			C_out : out STD_LOGIC;
            V : out std_logic;
			G : out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;
	
	signal H_out, ALU_out, mux_out : STD_LOGIC_VECTOR(15 downto 0);
	signal C, V, Z, N : std_logic;


begin
        shifter: shifter_16bit PORT MAP(
		B => inB,
		sel => F_sel(3 downto 2),
		H => H_out
	);
	
	mux_2_1600: mux2to1vects PORT MAP(
		in0 => ALU_out,
		in1 => H_out,
		sel => F_sel(4),
		outvec => mux_out
	);
	
	alu: arithmetic_logic_unit PORT MAP(
	    C_in => inA(15),
		A => inA,
		B => inB,
		sela(0) => F_sel(0),
		sela(1) => F_sel(1),
		sela(2) => F_sel(2),
		sela(3) => F_sel(3),
		C_out => C,
        V => V,
		G => ALU_out
	);
	
	
	F <= mux_out;
	C_fu <= C;
	V_fu <= V;
	N_fu <= mux_out(15);
	Z_fu <= (mux_out(15) or mux_out(14) or mux_out(13) or mux_out(12) or mux_out(11) 
				or mux_out(10) or mux_out(9) or mux_out(8) or mux_out(7) or mux_out(6) 
				or mux_out(5) or mux_out(4) or mux_out(3) or mux_out(2) or mux_out(1) or mux_out(0));
    
end Behavioral;
