library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


/* Opérations logiques permettant de calculer S et C 
	Table de vérité
	A | B | S | C
	0 | 0 | 0 | 0
	0 | 1 | 1 | 0
	1 | 0 | 1 | 0
	1 | 1 | 0 | 1
*/

entity half_adder is
	port (
		-- Description des signaux d’entrée/sortie
		a : in std_logic;
		b : in std_logic;
		s : out std_logic;
		c : out std_logic
	);
end half_adder;

architecture behavorial of half_adder is 
begin
	s <= a xor b;
	c <= a and b;
end architecture;