 library IEEE;
use IEEE.std_logic_1164.all;

-------------------------------
entity push_button_driver_counter_tb is
end entity push_button_driver_counter_tb;
 
architecture arc_push_button_driver_counter_tb of push_button_driver_counter_tb is
component DriverCounter is
port(
	button: in std_logic;
	rst: in std_logic;
	clk: in std_logic;
	output_device: out std_logic_vector(6 downto 0)
	);
 
end component DriverCounter;

signal button_tb  : std_logic:='1';
signal rst_tb  : std_logic:='1';
signal output_device_tb  : std_logic_vector(6 downto 0);
signal clk_tb : std_logic:='0';

begin
clock : process
	begin
		wait for 5 ns; clk_tb  <= not clk_tb;
    end process clock;
	
	
dut: DriverCounter
port map(
	button  => button_tb,
	rst  => rst_tb,
	output_device  => output_device_tb,
    clk => clk_tb
   	);
stimulus : process
   begin

wait for 10 ns; 
rst_tb <= '0';
wait for 10 ns;
rst_tb <= '1';
wait for 10 ns; 
button_tb <= '0';
wait for 10 ns;
button_tb <= '1';
wait for 10 ns; 
button_tb <= '0';
wait for 10 ns;
button_tb <= '1';
wait for 10 ns; 
button_tb <= '0';
wait for 10 ns;
button_tb <= '1';
wait for 10 ns; 
button_tb <= '0';
wait for 10 ns;
button_tb <= '1';
wait for 10 ns; 
button_tb <= '0';
wait for 10 ns;
button_tb <= '1';
wait for 10 ns; 
button_tb <= '0';
wait for 10 ns;
button_tb <= '1';

end process stimulus;
end architecture arc_push_button_driver_counter_tb;

