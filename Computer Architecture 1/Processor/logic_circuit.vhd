----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Chloe Conneely 17323080
-- 
-- Create Date: 26.02.2019 11:32:26
-- Design Name: 
-- Module Name: logic_circuit - Behavioral
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

entity logic_circuit is
    Port ( lA : in STD_LOGIC_VECTOR(15 downto 0);
           B : in STD_LOGIC_VECTOR(15 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           a_n_d : inout STD_LOGIC;
           o_r : inout STD_LOGIC;
           x_o_r : inout STD_LOGIC;
           n_o_t : inout STD_LOGIC;
           G : out STD_LOGIC_VECTOR(15 downto 0)
           );
end logic_circuit;

architecture Behavioral of logic_circuit is
    component logic_mux_4to1
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           in0 : in STD_LOGIC;
           in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           in3 : in STD_LOGIC;
           G : out STD_LOGIC
           );
    end component;
    
    component logic_part
    port (
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           O0 : out STD_LOGIC;
           O1 : out STD_LOGIC;
           O2 : out STD_LOGIC;
           O3 : out STD_LOGIC
           );
   end component;

begin

    logic_choice0 : logic_part PORT MAP (
        A => lA(0),
        B => B(0),
        O0 => a_n_d,
        O1 => o_r,
        O2 => x_o_r,
        O3 => n_o_t
    );
    logic_choice1 : logic_part PORT MAP (
        A => lA(1),
        B => B(1),
        O0 => a_n_d,
        O1 => o_r,
        O2 => x_o_r,
        O3 => n_o_t
    );
    logic_choice2 : logic_part PORT MAP (
        A => lA(2),
        B => B(2),
        O0 => a_n_d,
        O1 => o_r,
        O2 => x_o_r,
        O3 => n_o_t
    );
    logic_choice3 : logic_part PORT MAP (
        A => lA(3),
        B => B(3),
        O0 => a_n_d,
        O1 => o_r,
        O2 => x_o_r,
        O3 => n_o_t
    );
    logic_choice4 : logic_part PORT MAP (
        A => lA(4),
        B => B(4),
        O0 => a_n_d,
        O1 => o_r,
        O2 => x_o_r,
        O3 => n_o_t
    );
    logic_choice5 : logic_part PORT MAP (
        A => lA(5),
        B => B(5),
        O0 => a_n_d,
        O1 => o_r,
        O2 => x_o_r,
        O3 => n_o_t
    );
    logic_choice6 : logic_part PORT MAP (
        A => lA(6),
        B => B(6),
        O0 => a_n_d,
        O1 => o_r,
        O2 => x_o_r,
        O3 => n_o_t
    );
    logic_choice7 : logic_part PORT MAP (
        A => lA(7),
        B => B(7),
        O0 => a_n_d,
        O1 => o_r,
        O2 => x_o_r,
        O3 => n_o_t
    );
    logic_choice8 : logic_part PORT MAP (
        A => lA(8),
        B => B(8),
        O0 => a_n_d,
        O1 => o_r,
        O2 => x_o_r,
        O3 => n_o_t
    );
    logic_choice9 : logic_part PORT MAP (
        A => lA(9),
        B => B(9),
        O0 => a_n_d,
        O1 => o_r,
        O2 => x_o_r,
        O3 => n_o_t
    );
    logic_choice10 : logic_part PORT MAP (
        A => lA(10),
        B => B(10),
        O0 => a_n_d,
        O1 => o_r,
        O2 => x_o_r,
        O3 => n_o_t
    );
    logic_choice11 : logic_part PORT MAP (
        A => lA(11),
        B => B(11),
        O0 => a_n_d,
        O1 => o_r,
        O2 => x_o_r,
        O3 => n_o_t
    );
    logic_choice12 : logic_part PORT MAP (
        A => lA(12),
        B => B(12),
        O0 => a_n_d,
        O1 => o_r,
        O2 => x_o_r,
        O3 => n_o_t
    );
    logic_choice13 : logic_part PORT MAP (
        A => lA(13),
        B => B(13),
        O0 => a_n_d,
        O1 => o_r,
        O2 => x_o_r,
        O3 => n_o_t
    );
    logic_choice14 : logic_part PORT MAP (
        A => lA(14),
        B => B(14),
        O0 => a_n_d,
        O1 => o_r,
        O2 => x_o_r,
        O3 => n_o_t
    );
    logic_choice15 : logic_part PORT MAP (
        A => lA(15),
        B => B(15),
        O0 => a_n_d,
        O1 => o_r,
        O2 => x_o_r,
        O3 => n_o_t
    );
    
    mux0 : logic_mux_4to1 PORT MAP(
        S0 => S0,
        S1 => S1,
        in0 => a_n_d,
        in1 => o_r,
        in2 => x_o_r,
        in3 => n_o_t,
        G => G(0)
    );
    mux1 : logic_mux_4to1 PORT MAP(
        S0 => S0,
        S1 => S1,
        in0 => a_n_d,
        in1 => o_r,
        in2 => x_o_r,
        in3 => n_o_t,
        G => G(1)
    );
    mux2 : logic_mux_4to1 PORT MAP(
        S0 => S0,
        S1 => S1,
        in0 => a_n_d,
        in1 => o_r,
        in2 => x_o_r,
        in3 => n_o_t,
        G => G(2)
    );
    mux3 : logic_mux_4to1 PORT MAP(
        S0 => S0,
        S1 => S1,
        in0 => a_n_d,
        in1 => o_r,
        in2 => x_o_r,
        in3 => n_o_t,
        G => G(3)
    );
    mux4 : logic_mux_4to1 PORT MAP(
        S0 => S0,
        S1 => S1,
        in0 => a_n_d,
        in1 => o_r,
        in2 => x_o_r,
        in3 => n_o_t,
        G => G(4)
    );
    mux5 : logic_mux_4to1 PORT MAP(
        S0 => S0,
        S1 => S1,
        in0 => a_n_d,
        in1 => o_r,
        in2 => x_o_r,
        in3 => n_o_t,
        G => G(5)
    );
    mux6 : logic_mux_4to1 PORT MAP(
        S0 => S0,
        S1 => S1,
        in0 => a_n_d,
        in1 => o_r,
        in2 => x_o_r,
        in3 => n_o_t,
        G => G(6)
    );
    mux7 : logic_mux_4to1 PORT MAP(
        S0 => S0,
        S1 => S1,
        in0 => a_n_d,
        in1 => o_r,
        in2 => x_o_r,
        in3 => n_o_t,
        G => G(7)
    );
    mux8 : logic_mux_4to1 PORT MAP(
        S0 => S0,
        S1 => S1,
        in0 => a_n_d,
        in1 => o_r,
        in2 => x_o_r,
        in3 => n_o_t,
        G => G(8)
    );
    mux9 : logic_mux_4to1 PORT MAP(
        S0 => S0,
        S1 => S1,
        in0 => a_n_d,
        in1 => o_r,
        in2 => x_o_r,
        in3 => n_o_t,
        G => G(9)
    );
    mux10 : logic_mux_4to1 PORT MAP(
        S0 => S0,
        S1 => S1,
        in0 => a_n_d,
        in1 => o_r,
        in2 => x_o_r,
        in3 => n_o_t,
        G => G(10)
    );
    mux11 : logic_mux_4to1 PORT MAP(
        S0 => S0,
        S1 => S1,
        in0 => a_n_d,
        in1 => o_r,
        in2 => x_o_r,
        in3 => n_o_t,
        G => G(11)
    );
    mux12 : logic_mux_4to1 PORT MAP(
        S0 => S0,
        S1 => S1,
        in0 => a_n_d,
        in1 => o_r,
        in2 => x_o_r,
        in3 => n_o_t,
        G => G(12)
    );
    mux13 : logic_mux_4to1 PORT MAP(
        S0 => S0,
        S1 => S1,
        in0 => a_n_d,
        in1 => o_r,
        in2 => x_o_r,
        in3 => n_o_t,
        G => G(13)
    );
    mux14 : logic_mux_4to1 PORT MAP(
        S0 => S0,
        S1 => S1,
        in0 => a_n_d,
        in1 => o_r,
        in2 => x_o_r,
        in3 => n_o_t,
        G => G(14)
    );
    mux15 : logic_mux_4to1 PORT MAP(
        S0 => S0,
        S1 => S1,
        in0 => a_n_d,
        in1 => o_r,
        in2 => x_o_r,
        in3 => n_o_t,
        G => G(15)
    );


end Behavioral;
