----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Chloe Conneely 17323080
-- 
-- Create Date: 25.02.2019 16:58:15
-- Design Name: 
-- Module Name: arith_circuit16bit - Behavioral
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

entity arith_circuit16bit is
      Port ( C_in : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S0 : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR(15 downto 0);
           B : in STD_LOGIC_VECTOR(15 downto 0);
           YB : inout STD_LOGIC_VECTOR(15 downto 0);
           C_out : out STD_LOGIC;
           G : out STD_LOGIC_VECTOR(15 downto 0);
           V_out : out STD_LOGIC
           );
end arith_circuit16bit;

architecture Behavioral of arith_circuit16bit is

          --full adder
      component full_adder
    port(
           X : in STD_LOGIC;
           Y : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC
         );
    end component;
    
    component B_logic
   port(
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           B : in STD_LOGIC;
           Y : out STD_LOGIC
   
   );
   end component; 

    signal C0,C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15: std_logic;
begin
    adder0 :full_adder PORT MAP(
             X => A(0),
             Y => YB(0),
             C_in => C_in,
             S => G(0),
             C_out => C0
       );
       
       adder1 :full_adder PORT MAP(
             X => A(1),
             Y => YB(1),
             C_in => C0,
             S => G(1),
             C_out => C1
       );
       
       adder2 :full_adder PORT MAP(
             X => A(2),
             Y => YB(2),
             C_in => C1,
             S => G(2),
             C_out => C2
       );
       
        adder3 :full_adder PORT MAP(
             X => A(3),
             Y => YB(3),
             C_in => C2,
             S => G(3),
             C_out => C3
       );
       
        adder4 :full_adder PORT MAP(
             X => A(4),
             Y => YB(4),
             C_in => C3,
             S => G(4),
             C_out => C4
       );
       
       adder5 :full_adder PORT MAP(
             X => A(5),
             Y => YB(5),
             C_in => C4,
             S => G(5),
             C_out => C5
       );
       
        adder6 :full_adder PORT MAP(
             X => A(6),
             Y => YB(6),
             C_in => C5,
             S => G(6),
             C_out => C6
       );
       
        adder7 :full_adder PORT MAP(
             X => A(7),
             Y => YB(7),
             C_in => C6,
             S => G(7),
             C_out => C7
       );
       
       adder8 :full_adder PORT MAP(
             X => A(8),
             Y => YB(8),
             C_in => C7,
             S => G(8),
             C_out => C8
       );
       
       adder9 :full_adder PORT MAP(
             X => A(9),
             Y => YB(9),
             C_in => C8,
             S => G(9),
             C_out => C9
       );
       
       adder10 :full_adder PORT MAP(
             X => A(10),
             Y => YB(10),
             C_in => C9,
             S => G(10),
             C_out => C10
       );
       
       adder11 :full_adder PORT MAP(
             X => A(11),
             Y => YB(11),
             C_in => C10,
             S => G(11),
             C_out => C11
       );
       
       adder12 :full_adder PORT MAP(
             X => A(12),
             Y => YB(12),
             C_in => C11,
             S => G(12),
             C_out => C12
       );
       
       adder13 :full_adder PORT MAP(
             X => A(13),
             Y => YB(13),
             C_in => C12,
             S => G(13),
             C_out => C13
       );
       
        adder14 :full_adder PORT MAP(
             X => A(14),
             Y => YB(14),
             C_in => C13,
             S => G(14),
             C_out => C14
       );
       
       adder15 :full_adder PORT MAP(
             X => A(15),
             Y => YB(15),
             C_in => C14,
             S => G(15),
             C_out => C15
       );
       
       select0 : B_logic PORT MAP(
            S0 => S0,
            S1 => S1,
            B  => B(0),
            Y => YB(0)
       );
       
       select1 : B_logic PORT MAP(
            S0 => S0,
            S1 => S1,
            B  => B(1),
            Y => YB(1)
       );
       
       select2 : B_logic PORT MAP(
            S0 => S0,
            S1 => S1,
            B  => B(2),
            Y => YB(2)
       );
       
       select3 : B_logic PORT MAP(
            S0 => S0,
            S1 => S1,
            B  => B(3),
            Y => YB(3)
       );
       
       select4 : B_logic PORT MAP(
            S0 => S0,
            S1 => S1,
            B  => B(4),
            Y => YB(4)
       );
       
       select5 : B_logic PORT MAP(
            S0 => S0,
            S1 => S1,
            B  => B(5),
            Y => YB(5)
       );
       
       select6 : B_logic PORT MAP(
            S0 => S0,
            S1 => S1,
            B  => B(6),
            Y => YB(6)
       );
       
       select7 : B_logic PORT MAP(
            S0 => S0,
            S1 => S1,
            B  => B(7),
            Y => YB(7)
       );
       
       select8 : B_logic PORT MAP(
            S0 => S0,
            S1 => S1,
            B  => B(8),
            Y => YB(8)
       );
       
       select9 : B_logic PORT MAP(
            S0 => S0,
            S1 => S1,
            B  => B(9),
            Y => YB(9)
       );
       
       select10 : B_logic PORT MAP(
            S0 => S0,
            S1 => S1,
            B  => B(10),
            Y => YB(10)
       );
       
       select11 : B_logic PORT MAP(
            S0 => S0,
            S1 => S1,
            B  => B(11),
            Y => YB(11)
       );
       
       select12 : B_logic PORT MAP(
            S0 => S0,
            S1 => S1,
            B  => B(12),
            Y => YB(12)
       );
       
        select13 : B_logic PORT MAP(
            S0 => S0,
            S1 => S1,
            B  => B(13),
            Y => YB(13)
       );
       
       select14 : B_logic PORT MAP(
            S0 => S0,
            S1 => S1,
            B  => B(14),
            Y => YB(14)
       );
       
       select15 : B_logic PORT MAP(
            S0 => S0,
            S1 => S1,
            B  => B(15),
            Y => YB(15)
       );
       
       C_out <= C15;
       V_out <= (C15 xor C14);

end Behavioral;
