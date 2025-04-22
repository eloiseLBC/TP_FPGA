library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity toplevel is 
	port (
		LEDR : out std_logic_vector (9 downto 0);
		LEDG : out std_logic_vector (7 downto 0);
		SW : in std_logic_vector (9 downto 0)
	);
end entity;

architecture behavorial of toplevel is
begin
	instance_full_adder_4b: entity work.full_adder_4b port map (
		A0 => SW(0),
		A1 => SW(1),
		A2 => SW(2),
		A3 => SW(3),
		B0 => SW(4),
		B1 => SW(5),
		B2 => SW(6),
		B3 => SW(7),
		Cin => SW(9),
		S0 => LEDG(0),
		S1 => LEDG(1),
		S2 => LEDG(2),
		S3 => LEDG(3),
		Cout => LEDG(7)
	);
	LEDR <= SW;
end architecture;