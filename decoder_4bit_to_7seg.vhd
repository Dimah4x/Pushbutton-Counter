library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity decoder_4bit_to_7seg is
Port ( binary_in : in STD_LOGIC_VECTOR (3 downto 0);
seven_Seg_out : out STD_LOGIC_VECTOR (6 downto 0));
end decoder_4bit_to_7seg;
 
architecture decoder_4bit_to_7seg_logic of decoder_4bit_to_7seg is
 
begin
 
process(binary_in)
begin
 
case binary_in is
when "0000" => seven_Seg_out <= "0000001"; --0
when "0001" => seven_Seg_out <= "1001111"; --1
when "0010" => seven_Seg_out <= "0010010"; --2
when "0011" => seven_Seg_out <= "0000110"; --3
when "0100" => seven_Seg_out <= "1001100"; --4
when "0101" => seven_Seg_out <= "0100100"; --5
when "0110" => seven_Seg_out <= "0100000"; --6
when "0111" => seven_Seg_out <= "0001111"; --7
when "1000" => seven_Seg_out <= "0000000"; --8
when "1001" => seven_Seg_out <= "0000100"; --9
when others => seven_Seg_out <= "1111111"; --null
end case;
 
end process;
 
end decoder_4bit_to_7seg_logic;