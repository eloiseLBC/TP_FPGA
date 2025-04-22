library ieee;
use ieee.std_logic_1164.all;

entity tb_full_adder_4b is
end tb_full_adder_4b;

architecture tb of tb_full_adder_4b is
	signal Cin : std_logic;
	signal A0, A1, A2, A3 : std_logic;
	signal B0, B1, B2, B3 : std_logic;
	signal S0, S1, S2, S3 : std_logic;
	signal Cout : std_logic;
begin

	UUT: entity work.full_adder_4b
	port map (
		Cin => Cin,
		A0 => A0, A1 => A1, A2 => A2, A3 => A3,
		B0 => B0, B1 => B1, B2 => B2, B3 => B3,
		S0 => S0, S1 => S1, S2 => S2, S3 => S3,
		Cout => Cout
	);

	stim_proc: process
	begin
		-- Test 1 : 0000 + 0000 + 0 = 0000, Cout = 0
		A3 <= '0'; A2 <= '0'; A1 <= '0'; A0 <= '0';
		B3 <= '0'; B2 <= '0'; B1 <= '0'; B0 <= '0';
		Cin <= '0';
		wait for 10 ns;
		assert S3 = '0' and S2 = '0' and S1 = '0' and S0 = '0' report "Erreur somme 0+0+0" severity error;
		assert Cout = '0' report "Erreur carry 0+0+0" severity error;

		-- Test 2 : 0001 + 0001 + 1 = 0011, Cout = 0
		A3 <= '0'; A2 <= '0'; A1 <= '0'; A0 <= '1';
		B3 <= '0'; B2 <= '0'; B1 <= '0'; B0 <= '1';
		Cin <= '1';
		wait for 10 ns;
		assert S3 = '0' and S2 = '0' and S1 = '1' and S0 = '1' report "Erreur somme 1+1+1" severity error;
		assert Cout = '0' report "Erreur carry 1+1+1" severity error;

		-- Test 3 : 1111 + 0001 + 0 = 0000, Cout = 1
		A3 <= '1'; A2 <= '1'; A1 <= '1'; A0 <= '1';
		B3 <= '0'; B2 <= '0'; B1 <= '0'; B0 <= '1';
		Cin <= '0';
		wait for 10 ns;
		assert S3 = '0' and S2 = '0' and S1 = '0' and S0 = '0' report "Erreur somme 15+1+0" severity error;
		assert Cout = '1' report "Erreur carry 15+1+0" severity error;

		-- Test 4 : 1000 + 0111 + 1 = 0000, Cout = 1
		A3 <= '1'; A2 <= '0'; A1 <= '0'; A0 <= '0';
		B3 <= '0'; B2 <= '1'; B1 <= '1'; B0 <= '1';
		Cin <= '1';
		wait for 10 ns;
		assert S3 = '0' and S2 = '0' and S1 = '0' and S0 = '0' report "Erreur somme 8+7+1" severity error;
		assert Cout = '1' report "Erreur carry 8+7+1" severity error;

		-- Test 5 : 0101 + 0101 + 0 = 1010, Cout = 0
		A3 <= '0'; A2 <= '1'; A1 <= '0'; A0 <= '1';
		B3 <= '0'; B2 <= '1'; B1 <= '0'; B0 <= '1';
		Cin <= '0';
		wait for 10 ns;
		assert S3 = '1' and S2 = '0' and S1 = '1' and S0 = '0' report "Erreur somme 5+5+0" severity error;
		assert Cout = '0' report "Erreur carry 5+5+0" severity error;

		-- Test 6 : 1001 + 0110 + 1 = 0000, Cout = 1
		A3 <= '1'; A2 <= '0'; A1 <= '0'; A0 <= '1';
		B3 <= '0'; B2 <= '1'; B1 <= '1'; B0 <= '0';
		Cin <= '1';
		wait for 10 ns;
		assert S3 = '0' and S2 = '0' and S1 = '0' and S0 = '0' report "Erreur somme 9+6+1" severity error;
		assert Cout = '1' report "Erreur carry 9+6+1" severity error;

		wait;
	end process;
end tb;
