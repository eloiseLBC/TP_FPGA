library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_idle is 
	port(
		clock : in std_logic;
		led : out std_logic
	);
end entity;

architecture behavioral of clock_idle is
	-- constant MAX_COUNT : unsigned(25 downto 0) := to_unsigned(100_000_000, 26); -- 50 MHz × 2s
	constant MAX_COUNT : unsigned(3 downto 0) := to_unsigned(10, 4); -- pour test rapide
	signal counter     : unsigned(25 downto 0) := (others => '0');
	signal led_state   : std_logic := '0';
begin
	process(clock)
	begin
		if rising_edge(clock) then
			if counter = MAX_COUNT then
				counter   <= (others => '0');
				led_state <= not led_state;
			else
				counter <= counter + 1;
			end if;
		end if;
	end process;
	
	led <= led_state;
end behavioral;