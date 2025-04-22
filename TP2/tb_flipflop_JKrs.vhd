library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_flipflop_JKrs is
end tb_flipflop_JKrs;

architecture tb of tb_flipflop_JKrs is
	signal Clk   : std_logic := '0';
	signal J, K  : std_logic := '0';
	signal SETn  : std_logic := '1';
	signal RSTn  : std_logic := '1';
	signal Q     : std_logic;
	signal Qn    : std_logic;
begin

	-- Instanciation de l'unité à tester (UUT)
	UUT : entity work.flipflop_JKrs port map(
		J     => J,
		K     => K,
		CLK   => CLK,
		SETn  => SETn,
		RSTn  => RSTn,
		Q     => Q,
		Qn    => Qn
	);

	-- Génération de l'horloge (20 ns de période)
	clk_process: process
	begin
		while true loop
			Clk <= '0'; wait for 10 ns;
			Clk <= '1'; wait for 10 ns;
		end loop;
	end process;

	-- Stimuli de test
	stim_proc: process
	begin
		wait for 15 ns;

		-- Reset asynchrone
		RSTn <= '0'; wait for 5 ns;
		assert Q = '0' report "Erreur : RSTn=0 devrait forcer Q à 0" severity error;
		RSTn <= '1'; wait for 20 ns;

		-- Set asynchrone
		SETn <= '0'; wait for 5 ns;
		assert Q = '1' report "Erreur : SETn=0 devrait forcer Q à 1" severity error;
		SETn <= '1'; wait for 20 ns;

		-- J=0, K=0 → Q reste inchangé (Q=1 ici)
		J <= '0'; K <= '0'; wait for 20 ns;
		assert Q = '1' report "Erreur : J=0 K=0 devrait garder Q=1" severity error;

		-- J=0, K=1 → Reset synchrone (Q=0)
		J <= '0'; K <= '1'; wait for 20 ns;
		assert Q = '0' report "Erreur : J=0 K=1 devrait mettre Q=0" severity error;

		-- J=1, K=0 → Set synchrone (Q=1)
		J <= '1'; K <= '0'; wait for 20 ns;
		assert Q = '1' report "Erreur : J=1 K=0 devrait mettre Q=1" severity error;

		-- J=1, K=1 → Toggle (Q=0)
		J <= '1'; K <= '1'; wait for 20 ns;
		assert Q = '0' report "Erreur : J=1 K=1 devrait toggler Q=0" severity error;

		-- Toggle à nouveau (Q=1)
		wait for 20 ns;
		assert Q = '1' report "Erreur : J=1 K=1 devrait toggler Q=1" severity error;

		wait;
	end process;

end tb;
