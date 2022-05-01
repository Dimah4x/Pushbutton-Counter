library ieee;
use ieee.std_logic_1164.all;

entity falldetect is
port(
	rst: in std_logic;
	sig: in std_logic;
	clk:in std_logic;
	der: out std_logic);
end falldetect;

architecture falldetect_logic of falldetect is
signal clk_s,sig_s, sig_f:std_logic;
component dff_unit
port( 
	rst: in std_logic;
	clk: in std_logic;
	d: in std_logic;
	output: out std_logic
	);
end component;
begin
dff_unit_unit: dff_unit port map(
	clk=>clk_s,
	d=>sig_f,
	rst=>rst,
	output => sig_s
	);

clk_s <= clk;
sig_f<= sig;
der <= sig_s and not(sig);
end falldetect_logic;