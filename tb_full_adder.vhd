library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_full_adder is
end tb_full_adder;

architecture tb of tb_full_adder is
	signal A, B, Cin : std_logic;
	signal S, Cout : std_logic;
begin
	-- Instanciation de l'unité à tester (UUT)
	UUT : entity work.full_adder port map(
		A => A,
		B => B,
		Cin => Cin,
		S => S,
		Cout => Cout
	);

	-- Processus de test
	stim_proc: process
	begin
		-- Test 0 + 0 + 0 = 0 (Cout=0)
		A <= '0'; B <= '0'; Cin <= '0';
		wait for 10 ns;
		assert S = '0' report "Erreur sur S pour 0+0+0" severity error;
		assert Cout = '0' report "Erreur sur Cout pour 0+0+0" severity error;

		-- Test 0 + 1 + 0 = 1 (Cout=0)
		A <= '0'; B <= '1'; Cin <= '0';
		wait for 10 ns;
		assert S = '1' report "Erreur sur S pour 0+1+0" severity error;
		assert Cout = '0' report "Erreur sur Cout pour 0+1+0" severity error;

		-- Test 1 + 0 + 0 = 1 (Cout=0)
		A <= '1'; B <= '0'; Cin <= '0';
		wait for 10 ns;
		assert S = '1' report "Erreur sur S pour 1+0+0" severity error;
		assert Cout = '0' report "Erreur sur Cout pour 1+0+0" severity error;

		-- Test 1 + 1 + 0 = 0 (Cout=1)
		A <= '1'; B <= '1'; Cin <= '0';
		wait for 10 ns;
		assert S = '0' report "Erreur sur S pour 1+1+0" severity error;
		assert Cout = '1' report "Erreur sur Cout pour 1+1+0" severity error;

		-- Test 0 + 0 + 1 = 1 (Cout=0)
		A <= '0'; B <= '0'; Cin <= '1';
		wait for 10 ns;
		assert S = '1' report "Erreur sur S pour 0+0+1" severity error;
		assert Cout = '0' report "Erreur sur Cout pour 0+0+1" severity error;

		-- Test 0 + 1 + 1 = 0 (Cout=1)
		A <= '0'; B <= '1'; Cin <= '1';
		wait for 10 ns;
		assert S = '0' report "Erreur sur S pour 0+1+1" severity error;
		assert Cout = '1' report "Erreur sur Cout pour 0+1+1" severity error;

		-- Test 1 + 0 + 1 = 0 (Cout=1)
		A <= '1'; B <= '0'; Cin <= '1';
		wait for 10 ns;
		assert S = '0' report "Erreur sur S pour 1+0+1" severity error;
		assert Cout = '1' report "Erreur sur Cout pour 1+0+1" severity error;

		-- Test 1 + 1 + 1 = 1 (Cout=1)
		A <= '1'; B <= '1'; Cin <= '1';
		wait for 10 ns;
		assert S = '1' report "Erreur sur S pour 1+1+1" severity error;
		assert Cout = '1' report "Erreur sur Cout pour 1+1+1" severity error;

		wait;
	end process;
end tb;
