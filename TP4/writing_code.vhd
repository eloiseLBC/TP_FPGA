library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity writing_code is 
	port (
		clk           : in std_logic;
		writing_bites : in std_logic_vector(3 downto 0); 
		writen_bites  : out std_logic_vector(3 downto 0)
	);
end entity;

architecture behavioral of writing_code is
	signal writen_state     : std_logic_vector(3 downto 0) := "0000";
	signal step             : integer range 0 to 4 := 0;
	signal last_bites_state : std_logic_vector(3 downto 0) := "1111";
begin
	process(clk)
	begin
		if rising_edge(clk) then
			-- Détection front descendant sur au moins 1 bouton
			if writing_bites /= "1111" and last_bites_state = "1111" then
				if step < 4 then
					writen_state(step) <= '1';
					step <= step + 1;
				end if;
			end if;
			last_bites_state <= writing_bites; -- mémorise l’état pour la détection
		end if;
	end process;

	writen_bites <= writen_state;
end architecture;

