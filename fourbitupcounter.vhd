library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity fourbitupcounter is

port(enable_counter : in std_logic;
	 rstn : in std_logic;
	 clk : in std_logic;
	 output : out std_logic_vector(3 downto 0)
	 );

end fourbitupcounter;

architecture fourbitupcounter_logic of fourbitupcounter is
signal tmp : std_logic_vector(3 downto 0);
begin

	process(clk,rstn, enable_counter)
	begin
		if rstn = '0' then
			tmp <= (others => '0');
		elsif enable_counter = '0' then	
			if clk='1' and clk'event then
				tmp <= tmp+1;
			end if;
		end if;
		
end process;
output<=tmp;
end fourbitupcounter_logic;