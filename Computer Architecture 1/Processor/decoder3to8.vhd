----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.02.2019 19:13:22
-- Design Name: 
-- Module Name: decoder3to8 - Behavioral
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

entity decoder3to8 is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           TD : in std_logic;   --from control
           Q0 : out STD_LOGIC;
           Q1 : out STD_LOGIC;
           Q2 : out STD_LOGIC;
           Q3 : out STD_LOGIC;
           Q4 : out STD_LOGIC;
           Q5 : out STD_LOGIC;
           Q6 : out STD_LOGIC;
           Q7 : out STD_LOGIC;
           Q8 : out std_logic);
end decoder3to8;

architecture Behavioral of decoder3to8 is

begin
    Q0<=((not A0)and(not A1)and(not A2)); --000
    Q1<=(A0 and (not A1) and (not A2));   --001
    Q2<=((not A0) and A1 and (not A2));  --010
    Q3<=(A0 and A1 and (not A2));         --011
    Q4<=((not A0) and (not A1) and A2);  --100
    Q5<=(A0 and (not A1) and A2);        --101
    Q6<=((not A0) and A1 and A2);        --110
    Q7<=(A0 and A1 and A2);               --111
    Q8<=(TD);                             --r8

end Behavioral;
