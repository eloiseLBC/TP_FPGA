library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity open_state is 
	port(
		CLOCK_50_B6A : in std_logic; 
		hex0 : out std_logic_vector(6 downto 0);
		hex1 : out std_logic_vector(6 downto 0);
		hex2 : out std_logic_vector(6 downto 0);
		hex3 : out std_logic_vector(6 downto 0);
		ledg : out std_logic_vector(7 downto 0)
	);
end entity;

architecture behavioral of open_state is 
signal clock: std_logic;
begin
	  UUT_divider : entity work.clock_divider
		port map(
			CLKin  => CLOCK_50_B6A,
			N      => "10100", -- Sélection du rythme de division
			CLKout => clock
		);

	chenillard_inst : entity work.chenillard
        port map (
				CLK           => clock,
            CHEN  => ledg
        );
	-- Affichage de "OPEN"
    hex0 <= "0101011"; 
    hex1 <= "0000110";
    hex2 <= "0001100";
    hex3 <= "1000000";
end architecture;