library ieee;
use ieee.std_logic_1164.all;

entity DriverCounter is
port(
	button: in std_logic;
	rst: in std_logic;
	clk: in std_logic;
	output_device: out std_logic_vector(6 downto 0)
	);
end DriverCounter;

architecture DriverCounter_logic of DriverCounter is
signal der,sig_button: std_logic;
signal register_output: std_logic_vector(6 downto 0);
signal counter_output: std_logic_vector(3 downto 0);
signal decoder_output: std_logic_vector(6 downto 0);

component falldetect
port(
	rst: in std_logic;
	sig: in std_logic;
	clk:in std_logic;
	der: out std_logic
	);
end component;


component fourbitupcounter 

port(enable_counter : in std_logic;
	 rstn : in std_logic;
	 clk : in std_logic;
	 output : out std_logic_vector(3 downto 0)
	 );
end component;

component decoder_4bit_to_7seg
Port( 
	binary_in : in STD_LOGIC_VECTOR (3 downto 0);
	seven_Seg_out : out STD_LOGIC_VECTOR (6 downto 0)
	);
end component;

component seven_register
-- insert code
port(
	d : in std_logic_vector(6 downto 0);
	rst_n: in std_logic;
	clk: in std_logic;
	output: out std_logic_vector(6 downto 0)
	);
end component;
begin


falldetect_unit: falldetect 
port map(

			rst => rst,
			sig => button,
			clk => clk,
			der => der
	    );



fourbitupcounter_unit: fourbitupcounter 
port map(
			enable_counter => der,
			rstn => rst,
			clk => clk,
			output => counter_output
	    );



decoder_4bit_to_7seg_unit: decoder_4bit_to_7seg 
port map(
			binary_in => counter_output,
			seven_Seg_out => decoder_output
	    );

seven_register_unit: seven_register 
port map(
			d => decoder_output,
			rst_n => rst, 
			clk => clk,
			output => output_device
			
			
	    );

--button => sig;

end DriverCounter_logic;

