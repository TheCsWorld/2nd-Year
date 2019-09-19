----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.02.2019 19:43:25
-- Design Name: 
-- Module Name: arithmetic_logic_unit - Behavioral
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

entity arithmetic_logic_unit is
    Port ( C_in : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           sela : in STD_LOGIC_VECTOR(3 downto 0);
           C_out : out STD_LOGIC;
           V : out STD_LOGIC;
           G : out STD_LOGIC_VECTOR (15 downto 0));
end arithmetic_logic_unit;
      

architecture Behavioral of arithmetic_logic_unit is

        component arith_circuit16bit
      Port ( C_in : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S0 : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR(15 downto 0);
           B : in STD_LOGIC_VECTOR(15 downto 0);
           C_out : out STD_LOGIC;
           G : inout STD_LOGIC_VECTOR(15 downto 0);
           V_out : out std_logic
           );
      end component;
      
      component logic_circuit
      Port ( 
           lA : in STD_LOGIC_VECTOR(15 downto 0);
           B : in STD_LOGIC_VECTOR(15 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           G : out STD_LOGIC_VECTOR(15 downto 0)
           );
      
      end component;
      
      component alu_mux2to1
      Port ( in0 : in STD_LOGIC;
           in1 : in STD_LOGIC;
           Sel : in STD_LOGIC;
           G : out STD_LOGIC);
      end component;
      
      signal lineG0a, lineG1a, lineG2a, lineG3a, lineG4a, lineG5a, lineG6a, LineG7a, lineG8a, lineG9a, lineG10a, lineG11a, lineG12a, lineG13a, lineG14a, lineG15a : STD_LOGIC_VECTOR(15 downto 0);
      signal lineG0L, lineG1L, lineG2L, lineG3L, lineG4L, lineG5L, lineG6L, lineG7L, lineG8L, lineG9L, lineG10L, lineG11L, lineG12L, lineG13L, lineG14L, lineG15L : STD_LOGIC_VECTOR(15 downto 0);

begin
        --arith bits
        arith0: arith_circuit16bit PORT MAP(
        S0 => sela(0),
        S1 => sela(1),
        A => A,
        B => B,
        C_in => C_in,
        C_out => C_out,
        G => lineG0a,
        V_out => V
        );
        
        
        --logic bits
        logic0: logic_circuit PORT MAP(
        S0 => sela(2),
        S1 => sela(3),
        lA => A,
        B => B,
        G => lineG0L
        );
        
        logic1: logic_circuit PORT MAP(
        S0 => sela(2),
        S1 => sela(3),
        lA => A,
        B => B,
        G => lineG1L
        );
        
        logic2: logic_circuit PORT MAP(
        S0 => sela(2),
        S1 => sela(3),
        lA => A,
        B => B,
        G => lineG2L
        );
        
        logic3: logic_circuit PORT MAP(
        S0 => sela(2),
        S1 => sela(3),
        lA => A,
        B => B,
        G => lineG3L
        );
        
        logic4: logic_circuit PORT MAP(
        S0 => sela(2),
        S1 => sela(3),
        lA => A,
        B => B,
        G => lineG4L
        );
        
        logic5: logic_circuit PORT MAP(
        S0 => sela(2),
        S1 => sela(3),
        lA => A,
        B => B,
        G => lineG5L
        );
        
        logic6: logic_circuit PORT MAP(
        S0 => sela(2),
        S1 => sela(3),
        lA => A,
        B => B,
        G => lineG6L
        );
        
        logic7: logic_circuit PORT MAP(
        S0 => sela(2),
        S1 => sela(3),
        lA => A,
        B => B,
        G => lineG7L
        );
        
        logic8: logic_circuit PORT MAP(
        S0 => sela(2),
        S1 => sela(3),
        lA => A,
        B => B,
        G => lineG8L
        );
        
        logic9: logic_circuit PORT MAP(
        S0 => sela(2),
        S1 => sela(3),
        lA => A,
        B => B,
        G => lineG9L
        );
        
        logic10: logic_circuit PORT MAP(
        S0 => sela(2),
        S1 => sela(3),
        lA => A,
        B => B,
        G => lineG10L
        );
        
        logic11: logic_circuit PORT MAP(
        S0 => sela(2),
        S1 => sela(3),
        lA => A,
        B => B,
        G => lineG11L
        );
        
        logic12: logic_circuit PORT MAP(
        S0 => sela(2),
        S1 => sela(3),
        lA => A,
        B => B,
        G => lineG12L
        );
        
        logic13: logic_circuit PORT MAP(
        S0 => sela(2),
        S1 => sela(3),
        lA => A,
        B => B,
        G => lineG13L
        );
        
        logic14: logic_circuit PORT MAP(
        S0 => sela(2),
        S1 => sela(3),
        lA => A,
        B => B,
        G => lineG14L
        );
        
        logic15: logic_circuit PORT MAP(
        S0 => sela(2),
        S1 => sela(3),
        lA => A,
        B => B,
        G => lineG15L
        );
        
        --muxbits
        mux0: alu_mux2to1 PORT MAP(
        in0 => lineG0a(0),
        in1 => lineG0L(0),
        sel => sela(2),
        G => G(0)
        );
        
        mux1: alu_mux2to1 PORT MAP(
        in0 => lineG0a(1),
        in1 => lineG0L(1),
        sel => sela(2),
        G => G(1)
        );
        
        mux2: alu_mux2to1 PORT MAP(
        in0 => lineG0a(2),
        in1 => lineG0L(2),
        sel => sela(2),
        G => G(2)
        );
        
        mux3: alu_mux2to1 PORT MAP(
        in0 => lineG0a(3),
        in1 => lineG0L(3),
        sel => sela(2),
        G => G(3)
        );
        
        mux4: alu_mux2to1 PORT MAP(
        in0 => lineG0a(4),
        in1 => lineG0L(4),
        sel => sela(2),
        G => G(4)
        );
        
        mux5: alu_mux2to1 PORT MAP(
        in0 => lineG0a(5),
        in1 => lineG0L(5),
        sel => sela(2),
        G => G(5)
        );
        
        mux6: alu_mux2to1 PORT MAP(
        in0 => lineG0a(6),
        in1 => lineG0L(6),
        sel => sela(2),
        G => G(6)
        );
        
        mux7: alu_mux2to1 PORT MAP(
        in0 => lineG0a(7),
        in1 => lineG0L(7),
        sel => sela(2),
        G => G(7)
        );
        
        mux8: alu_mux2to1 PORT MAP(
        in0 => lineG0a(8),
        in1 => lineG0L(8),
        sel => sela(2),
        G => G(8)
        );
        
        mux9: alu_mux2to1 PORT MAP(
        in0 => lineG0a(9),
        in1 => lineG0L(9),
        sel => sela(2),
        G => G(9)
        );
        
        mux10: alu_mux2to1 PORT MAP(
        in0 => lineG0a(10),
        in1 => lineG0L(10),
        sel => sela(2),
        G => G(10)
        );
        
        mux11: alu_mux2to1 PORT MAP(
        in0 => lineG0a(11),
        in1 => lineG0L(11),
        sel => sela(2),
        G => G(11)
        );
        
        mux12: alu_mux2to1 PORT MAP(
        in0 => lineG0a(12),
        in1 => lineG0L(12),
        sel => sela(2),
        G => G(12)
        );
        
        mux13: alu_mux2to1 PORT MAP(
        in0 => lineG0a(13),
        in1 => lineG0L(13),
        sel => sela(2),
        G => G(13)
        );
        
        mux14: alu_mux2to1 PORT MAP(
        in0 => lineG0a(14),
        in1 => lineG0L(14),
        sel => sela(2),
        G => G(14)
        );
        
        mux15: alu_mux2to1 PORT MAP(
        in0 => lineG0a(15),
        in1 => lineG0L(15),
        sel => sela(2),
        G => G(15)
        );
        
       


end Behavioral;
