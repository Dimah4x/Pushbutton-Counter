library ieee;
use ieee.std_logic_1164.all;

entity seven_register is
-- insert code
port(d : in std_logic_vector(6 downto 0);
	 rst_n: in std_logic;
	 clk: in std_logic;
	 output: out std_logic_vector(6 downto 0)
	 );
end seven_register;

architecture seven_register_logic of seven_register is

begin

process(clk,rst_n)
begin 
	if rst_n='0' then 
		output <= (others => '0'); 
	elsif clk='1' and clk'event then 
		output <= d;  
	end if;
end process;

end seven_register_logic;