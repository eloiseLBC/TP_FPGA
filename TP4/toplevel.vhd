library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity toplevel is 
   port(
	key: in std_logic_vector(3 downto 0);
	CLOCK_50_B6A : in  std_logic;    -- Horloge principale 50 MHz de la carte
	
	hex0: out std_logic_vector(6 downto 0);
	hex1: out std_logic_vector(6 downto 0);
	hex2: out std_logic_vector(6 downto 0);
	hex3: out std_logic_vector(6 downto 0);
	ledr: out std_logic_vector(9 downto 0);
	ledg: out std_logic_vector(7 downto 0)
	);
end entity;

architecture behavioral of toplevel is
   signal clock: std_logic;
	signal state: integer:= 0;
begin

    UUT_divider : entity work.clock_divider
		port map(
			CLKin  => CLOCK_50_B6A,
			N      => "10100", -- Sélection du rythme de division
			CLKout => clock
		);

	
		
		 enter_digit_instance : entity work.enter_digits_state
		 port map(
			clock => CLOCK_50_B6A, -- Garde en mémoire l'état du bouton -- Attention : doit prendre la clock du fpga, pas la clock divisée
			clock_divided => clock,
			KEY => key,
			HEX0 => hex0,
			HEX1 => hex1,
			HEX2 => hex2,
			HEX3 => hex3,
			
			ledr=> ledr
		 );

		
		
end architecture;