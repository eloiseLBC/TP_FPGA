library ieee;
use ieee.std_logic_1164.all;

entity tb_bistable is
end tb_bistable;

architecture tb of tb_bistable is
	signal clk : std_logic := '0';
	signal rst : std_logic := '0';
	signal x   : std_logic := '0';
	signal y   : std_logic;
begin

	-- Instanciation
	UUT : entity work.bistable
		port map (
			clk => clk,
			rst => rst,
			x   => x,
			y   => y
		);

	-- Horloge : 20 ns
	clk_process : process
	begin
		while true loop
			clk <= '0'; wait for 10 ns;
			clk <= '1'; wait for 10 ns;
		end loop;
	end process;

	-- Stimuli
	stim_proc : process
	begin
		-- Reset
		rst <= '1'; wait for 25 ns;
		rst <= '0'; wait for 20 ns;

		-- Test : x=1 → A → B
		x <= '1'; wait for 20 ns;

		-- x=0 → B → C
		x <= '0'; wait for 20 ns;

		-- x=1 → C → D
		x <= '1'; wait for 20 ns;

		-- x=0 → D → A
		x <= '0'; wait for 20 ns;

		-- Boucle
		x <= '1'; wait for 20 ns; -- A → B
		x <= '0'; wait for 20 ns; -- B → C
		x <= '1'; wait for 20 ns; -- C → D
		x <= '0'; wait for 20 ns; -- D → A

		wait;
	end process;
end tb;
