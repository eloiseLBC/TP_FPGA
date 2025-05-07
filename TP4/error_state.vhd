library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity open_state is 
	port(
		clock : in std_logic;
		hex0 : out std_logic_vector(6 downto 0);
		hex1 : out std_logic_vector(6 downto 0);
		hex2 : out std_logic_vector(6 downto 0);
		hex3 : out std_logic_vector(6 downto 0);
		ledr : out std_logic_vector(9 downto 0)
	);
end entity;

architecture behavioral of open_state is 
	constant MAX_COUNT : unsigned(3 downto 0) := to_unsigned(250_000, 26);
	signal counter     : unsigned(25 downto 0) := (others => '0');
	signal led_state   : std_logic_vector(9 down to 0) := (others => '0');
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
	
	ledr <= led_state;	
	-- Affichage de "Err"
    hex0 <= "1111111"; 
    hex1 <= "0101111";
    hex2 <= "0101111";
    hex3 <= "0000110";
end architecture;