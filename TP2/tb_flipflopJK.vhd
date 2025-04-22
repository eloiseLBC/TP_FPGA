library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_flipflopJK is
end tb_flipflopJK;

architecture tb of tb_flipflopJK is
	signal Clk : std_logic := '0';
	signal J, K : std_logic := '0';
	signal Q : std_logic;
begin

	-- Instanciation de l'unité à tester (UUT)
	UUT : entity work.flipflop_JK port map(
		Clk => Clk,
		J   => J,
		K   => K,
		Q   => Q
	);

	-- Génération de l'horloge : période = 20 ns
	clk_process: process
	begin
		while true loop
			Clk <= '0';
			wait for 10 ns;
			Clk <= '1';
			wait for 10 ns;
		end loop;
	end process;

	-- Processus de test
	stim_proc: process
	begin
		wait for 15 ns; -- attendre un front montant d'horloge

		-- Test J=0, K=0 : Q ne change pas (reste à 0 au début)
		J <= '0'; K <= '0'; wait for 20 ns;
		assert Q = '0' report "Erreur : J=0 K=0 devrait garder Q=0" severity error;

		-- Test J=1, K=0 : Q passe à 1 (Set)
		J <= '1'; K <= '0'; wait for 20 ns;
		assert Q = '1' report "Erreur : J=1 K=0 devrait mettre Q=1" severity error;

		-- Test J=0, K=1 : Q passe à 0 (Reset)
		J <= '0'; K <= '1'; wait for 20 ns;
		assert Q = '0' report "Erreur : J=0 K=1 devrait mettre Q=0" severity error;

		-- Test J=1, K=1 : Q toggle (0 → 1)
		J <= '1'; K <= '1'; wait for 20 ns;
		assert Q = '1' report "Erreur : J=1 K=1 devrait toggler Q à 1" severity error;

		-- Test J=1, K=1 : Q toggle (1 → 0)
		wait for 20 ns;
		assert Q = '0' report "Erreur : J=1 K=1 devrait toggler Q à 0" severity error;

		-- Test retour J=0, K=0 : Q reste à 0
		J <= '0'; K <= '0'; wait for 20 ns;
		assert Q = '0' report "Erreur : J=0 K=0 devrait garder Q=0" severity error;

		wait;
	end process;

end tb;
