library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity toplevel is
	port (
		CLOCK_50_B6A : in std_logic;
		KEY 			 : in std_logic_vector(3 downto 0);
		LEDR			 : out std_logic_vector(9 downto 0)
	);
end entity;

architecture behavioral of toplevel is
    signal clock: std_logic;
begin
	UUT_divider : entity work.clock_divider
		port map(
			CLKin  => CLOCK_50_B6A,
			RST    => KEY(0),
			N      => "10100", -- Sélection du rythme de division
			CLKout => clock
		);
	
	UUT_chenillard : entity work.chenillard
		port map(
			CLK  => clock,          
			RST  => KEY(0),               
			CHEN => LEDR
		);
end behavioral;
	