library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- Opérations logiques permettant de calculer S et C 
--	Table de vérité
--	A | B | Cint | S | Cout
--	0 | 0 |  0   | 0 |  0
--	0 | 1 |  0   | 1 |  0
--	1 | 0 |  0   | 1 |  0
--	1 | 1 |  0   | 0 |  1
--	0 | 0 |  1   | 1 |  0
--	0 | 1 |  1   | 0 |  1
--	1 | 0 |  1   | 0 |  1
--	1 | 1 |  1   | 1 |  1


entity full_adder is
	port (
		-- Description des signaux d’entrée/sortie
		A : in std_logic;
		B : in std_logic;
		Cin : in std_logic;
		S : out std_logic;
		Cout : out std_logic
	);
end full_adder;


architecture behavorial of full_adder is
	signal Sum : std_logic;
	signal Cout1 : std_logic;
	signal Cout2 : std_logic;
begin
	instance_half_adder1 : entity work.half_adder port map(
		A => A,
		B => B,
		S => Sum,
		C => Cout1		
	);
	instance_half_adder2 : entity work.half_adder port map(
		A => Sum,
		B => Cin,
		S => S,
		C => Cout2	
	);
	Cout <= Cout1 or Cout2;
end architecture;