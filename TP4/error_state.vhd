library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity error_state is 
	port(
		CLOCK_50_B6A : in std_logic; 
		hex0 : out std_logic_vector(6 downto 0);
		hex1 : out std_logic_vector(6 downto 0);
		hex2 : out std_logic_vector(6 downto 0);
		hex3 : out std_logic_vector(6 downto 0);
		ledr : out std_logic_vector(9 downto 0)
	);
end entity;

architecture behavioral of error_state is 
	signal counter     : unsigned(25 downto 0) := (others => '0');
	signal led_state   : std_logic_vector(9 downto 0) := (others => '0');
	signal clock: std_logic;
begin
	UUT_divider : entity work.clock_divider
		port map(
			CLKin  => CLOCK_50_B6A,
			N      => "10100", -- Sélection du rythme de division
			CLKout => clock
		);


	process(clock)
	begin
		if rising_edge(clock) then
				led_state <= not led_state;
		end if;
	end process;
	
	ledr <= led_state;	
	-- Affichage de "Err"
    hex0 <= "1111111"; 
    hex1 <= "0101111";
    hex2 <= "0101111";
    hex3 <= "0000110";
end architecture;