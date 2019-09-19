----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Chloe Conneely 17323080
-- 
-- Create Date: 12.02.2019 20:08:24
-- Design Name: 
-- Module Name: register_file - Behavioral
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

entity register_file is
    Port ( src_s0 : in STD_LOGIC;
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
           reg0 : out STD_LOGIC_VECTOR(15 downto 0);
           reg1 : out STD_LOGIC_VECTOR(15 downto 0);
           reg2 : out STD_LOGIC_VECTOR(15 downto 0);
           reg3 : out STD_LOGIC_VECTOR(15 downto 0);
           reg4 : out STD_LOGIC_VECTOR(15 downto 0);
           reg5 : out STD_LOGIC_VECTOR(15 downto 0);
           reg6 : out STD_LOGIC_VECTOR(15 downto 0);
           reg7 : out STD_LOGIC_VECTOR(15 downto 0);
           reg8 : out STD_LOGIC_VECTOR(15 downto 0);
           Address_out : out STD_LOGIC_VECTOR(15 downto 0);
           BtoD : out STD_LOGIC_VECTOR(15 downto 0)
           );
end register_file;

architecture Behavioral of register_file is
--components
    
    --16bit register for register file
    component reg16
    port(
         D: in std_logic_vector(15 downto 0);
         load: in std_logic;
         Clk: in std_logic;
         Q: out std_logic_vector(15 downto 0)
         );
    end component;
    
    --3 to 8 decoder
    component decoder3to8
    port(
         A0: in std_logic;
         A1: in std_logic;
         A2: in std_logic;
         TD : in std_logic;
         Q0: out std_logic;
         Q1: out std_logic;
         Q2: out std_logic;
         Q3: out std_logic;
         Q4: out std_logic;
         Q5: out std_logic;
         Q6: out std_logic;
         Q7: out std_logic;
         Q8: out std_logic
         );
   end component;
         
   --2 to 1 16bit multiplexer
    component mux2to16bit
    port(
         in0: in std_logic_vector(15 downto 0);
         in1: in std_logic_vector(15 downto 0);
         s: in std_logic;
         Z: out std_logic_vector(15 downto 0)
         );
    end component;
    
    -- 8 to 1 16bit multiplexer
    component mux16to16bit
    port(
         in0: in std_logic_vector(15 downto 0);
         in1: in std_logic_vector(15 downto 0);
         in2: in std_logic_vector(15 downto 0);
         in3: in std_logic_vector(15 downto 0);
         in4: in std_logic_vector(15 downto 0);
         in5: in std_logic_vector(15 downto 0);
         in6: in std_logic_vector(15 downto 0);
         in7: in std_logic_vector(15 downto 0);
         in8: in std_logic_vector(15 downto 0);
         s0: in std_logic;
         s1: in std_logic;
         T: in std_logic;
         Z: out std_logic_vector(15 downto 0)
         );
         end component;
         
     component mux2to1vects
     port(
       in0: in std_logic_vector(15 downto 0);
       in1: in std_logic_vector(15 downto 0);
       sel : in std_logic;
       outvec: out std_logic_vector(15 downto 0)
     );
     end component;
         
   --signals
   signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7, load_reg8: std_logic;
   signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q, reg8_q, data_src_mux_out, src_reg : std_logic_vector(15 downto 0);
   signal TA_sig, TB_sig : std_logic;
begin
   --port maps
   
   --register 0
   reg00: reg16 port map(
            D=>data_src_mux_out,
            load=>load_reg0,
            Clk=>Clk,
            Q=>reg0_q
    );
    --register 1
    reg01: reg16 port map(
            D=>data_src_mux_out,
            load=>load_reg1,
            Clk=>Clk,
            Q=>reg1_q
    );
    --register 2
    reg02: reg16 port map(
            D=>data_src_mux_out,
            load=>load_reg2,
            Clk=>Clk,
            Q=>reg2_q
    );
    --register 3
    reg03: reg16 port map(
            D=>data_src_mux_out,
            load=>load_reg3,
            Clk=>Clk,
            Q=>reg3_q
    );
    --register 4
    reg04: reg16 port map(
            D=>data_src_mux_out,
            load=>load_reg4,
            Clk=>Clk,
            Q=>reg4_q
    );
    --register 5
    reg05: reg16 port map(
            D=>data_src_mux_out,
            load=>load_reg5,
            Clk=>Clk,
            Q=>reg5_q
    );
    --register 6
    reg06: reg16 port map(
            D=>data_src_mux_out,
            load=>load_reg6,
            Clk=>Clk,
            Q=>reg6_q
    );
    --register7
    reg07: reg16 port map(
            D=>data_src_mux_out,
            load=>load_reg7,
            Clk=>Clk,
            Q=>reg7_q
    );
     --register8
    reg08: reg16 port map(
            D=>data_src_mux_out,
            load=>load_reg8,
            Clk=>Clk,
            Q=>reg8_q
    );
    --Destination register decoder
    des_decoder3to8: decoder3to8 port map(
                A0=>des_A0,
                A1=>des_A1,
                A2=>des_A2,
                TD=> des_TD,
                Q0=>load_reg0,
                Q1=>load_reg1,
                Q2=>load_reg2,
                Q3=>load_reg3,
                Q4=>load_reg4,
                Q5=>load_reg5,
                Q6=>load_reg6,
                Q7=>load_reg7,
                Q8=>load_reg8
      );
      -- 2 to 1 16bit data source multiplexer
      data_src_mux2to16bit: mux2to16bit port map(
                    in0=>data,
                    in1=>src_reg,
                    s=>data_src,
                    Z=>data_src_mux_out
       );
       --8 to 1 16bit source register multiplexer
       inst_mux16to16bitA: mux16to16bit port map(
                    in0=>reg0_q,
                    in1=>reg1_q,
                    in2=>reg2_q,
                    in3=>reg3_q,
                    in4=>reg4_q,
                    in5=>reg5_q,
                    in6=>reg6_q, 
                    in7=>reg7_q,
                    in8=>reg8_q,
                    s0=>src_s0,
                    s1=>src_s1,
                    T=>src_TA,
                    Z=>Address_out
      );
      --8 to 1 16bit source register multiplexer
       inst_mux16to16bitB: mux16to16bit port map(
                    in0=>reg0_q,
                    in1=>reg1_q,
                    in2=>reg2_q,
                    in3=>reg3_q,
                    in4=>reg4_q,
                    in5=>reg5_q,
                    in6=>reg6_q, 
                    in7=>reg7_q,
                    in8=>reg8_q,
                    s0=>src_s3,
                    s1=>src_s4,
                    T=>src_TB,
                    Z=>BtoD
      );
      
      --control mux A
      control_mux_A: mux2to1vects port map(
                    in0=>data_src_mux_out,
                    in1=> reg8_q,
                    sel=> src_TA,
                    outvec=>Address_out
      );
      
           --control mux B
      control_mux_B: mux2to1vects port map(
                    in0=>data_src_mux_out,
                    in1=> reg8_q,
                    sel=>src_TB,
                    outvec=>BtoD
      );
      reg0<=reg0_q;
      reg1<=reg1_q;
      reg2<=reg2_q; 
      reg3<=reg3_q;
      reg4<=reg4_q;
      reg5<=reg5_q; 
      reg6<=reg6_q;  
      reg7<=reg7_q;  
                                                 


end Behavioral;
