library ieee;
use ieee.std_logic_1164.all;

entity dff_unit is
port(
	rst: in std_logic;
	clk: in std_logic;
	d: in std_logic;
	output: out std_logic
	);

end dff_unit;

architecture dff_logic of dff_unit is

begin

process(rst,clk)
	begin
	if rst = '0' then
		output <= '0';
	elsif clk='1' and clk'event then
		output <= d;
	end if;
end process;

end dff_logic;