----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.02.2019 11:38:14
-- Design Name: 
-- Module Name: bit_slice - Behavioral
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

entity bit_slice is
    Port ( C_in : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S0 : in STD_LOGIC;
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           G : out STD_LOGIC);
end bit_slice;

architecture Behavioral of bit_slice is
--components

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
   signal Y_signal, S0_signal, S1_signal,B_signal, X_signal, Cin_signal :std_logic;
begin
    Blogic : B_logic port map(
    S0 => S0_signal,
    S1 => S1_signal,
    B => B_signal
    );
  
    fulladder : full_adder port map(
    X => X_signal,
    Y => Y_signal,
    C_in => Cin_signal
    );

    Y_signal <= Y;
end Behavioral;
