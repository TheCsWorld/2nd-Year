----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Chloe Conneely 17323080
-- 
-- Create Date: 27.02.2019 20:30:37
-- Design Name: 
-- Module Name: shifter_16bit - Behavioral
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

entity shifter_16bit is
    Port ( B : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           H : out STD_LOGIC_VECTOR (15 downto 0));
end shifter_16bit;

architecture Behavioral of shifter_16bit is

    component mux3to1
    Port(
        in0: in STD_LOGIC;
        in1: in STD_LOGIC;
        in2: in STD_LOGIC;
        sel: in STD_LOGIC_VECTOR(1 downto 0);
        H: out STD_LOGIC
    );
    end component;

begin
    
    --bit shift
    mux0: mux3to1 PORT MAP(
    in0 => B(0),
    in1 => B(1),
    in2 => B(15),
    sel => sel,
    H => H(0) 
    );
    
    mux1: mux3to1 PORT MAP(
    in0 => B(1),
    in1 => B(2),
    in2 => B(0),
    sel => sel,
    H => H(1) 
    );
    
    mux2: mux3to1 PORT MAP(
    in0 => B(2),
    in1 => B(3),
    in2 => B(1),
    sel => sel,
    H => H(2) 
    );
    
    mux3: mux3to1 PORT MAP(
    in0 => B(3),
    in1 => B(4),
    in2 => B(2),
    sel => sel,
    H => H(3) 
    );
    
    mux4: mux3to1 PORT MAP(
    in0 => B(4),
    in1 => B(5),
    in2 => B(3),
    sel => sel,
    H => H(4) 
    );
    
    mux5: mux3to1 PORT MAP(
    in0 => B(5),
    in1 => B(6),
    in2 => B(4),
    sel => sel,
    H => H(5) 
    );
    
    mux6: mux3to1 PORT MAP(
    in0 => B(6),
    in1 => B(7),
    in2 => B(5),
    sel => sel,
    H => H(6) 
    );
    
    mux7: mux3to1 PORT MAP(
    in0 => B(7),
    in1 => B(8),
    in2 => B(6),
    sel => sel,
    H => H(7) 
    );
    
    mux8: mux3to1 PORT MAP(
    in0 => B(8),
    in1 => B(9),
    in2 => B(7),
    sel => sel,
    H => H(8) 
    );
    
    mux9: mux3to1 PORT MAP(
    in0 => B(9),
    in1 => B(10),
    in2 => B(8),
    sel => sel,
    H => H(9) 
    );
    
    mux10: mux3to1 PORT MAP(
    in0 => B(10),
    in1 => B(11),
    in2 => B(9),
    sel => sel,
    H => H(10) 
    );
    
    mux11: mux3to1 PORT MAP(
    in0 => B(11),
    in1 => B(12),
    in2 => B(10),
    sel => sel,
    H => H(11) 
    );
    
    mux12: mux3to1 PORT MAP(
    in0 => B(12),
    in1 => B(13),
    in2 => B(11),
    sel => sel,
    H => H(12) 
    );
    
    mux13: mux3to1 PORT MAP(
    in0 => B(13),
    in1 => B(14),
    in2 => B(12),
    sel => sel,
    H => H(13) 
    );
    
    mux14: mux3to1 PORT MAP(
    in0 => B(14),
    in1 => B(15),
    in2 => B(13),
    sel => sel,
    H => H(14) 
    );
    
    mux15: mux3to1 PORT MAP(
    in0 => B(15),
    in1 => B(0),
    in2 => B(14),
    sel => sel,
    H => H(15) 
    );


end Behavioral;
