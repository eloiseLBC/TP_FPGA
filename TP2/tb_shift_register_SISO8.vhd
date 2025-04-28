library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_shift_register_SISO8 is
end tb_shift_register_SISO8;

architecture tb of tb_shift_register_SISO8 is
	signal CLK   : std_logic := '0';
	signal SETn  : std_logic := '1';
	signal RSTn  : std_logic := '1';
	signal Si    : std_logic := '0';
	signal So    : std_logic;
begin

	-- Instanciation de l'unité à tester (UUT)
	UUT : entity work.shift_register_SISO8 port map(
		Si    => Si,
		CLK   => CLK,
		SETn  => SETn,
		RSTn  => RSTn,
		So    => So
	);

	-- Génération de l'horloge (20 ns de période)
	clk_process: process
	begin
		while true loop
			CLK <= '0'; wait for 10 ns;
			CLK <= '1'; wait for 10 ns;
		end loop;
	end process;

	-- Processus de stimulation
	stim_proc: process
	begin
		wait for 15 ns;

		-- Test 1 : Reset asynchrone
		RSTn <= '0'; wait for 5 ns;
		RSTn <= '1'; wait for 20 ns;

		-- Test 2 : Set asynchrone
		SETn <= '0'; wait for 5 ns;
		SETn <= '1'; wait for 20 ns;

		-- Test 3 : Décalages normaux

		-- Envoyer '1' en série
		Si <= '1'; wait for 20 ns;
		assert So = '1' report "Erreur : après 1er shift, So devrait être 1" severity error;

		-- Envoyer '0' en série
		Si <= '0'; wait for 20 ns;
		assert So = '1' report "Erreur : après 2e shift, So devrait être 1 (décalage)" severity error;

		-- Envoyer '1' en série
		Si <= '1'; wait for 20 ns;
		assert So = '1' report "Erreur : après 3e shift, So devrait être 1" severity error;

		-- Envoyer '0' en série
		Si <= '0'; wait for 20 ns;
		assert So = '1' report "Erreur : après 4e shift, So devrait être 1" severity error;

		-- Envoyer '0' en série
		Si <= '0'; wait for 20 ns;
		assert So = '0' report "Erreur : après 5e shift, So devrait être 0" severity error;

		wait;
	end process;

end tb;
