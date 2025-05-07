library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity writing_code is 
	port (
		writing_bites : in std_logic_vector(3 downto 0);
		writen_bites : out std_logic_vector(3 downto 0)
	);
end entity;

architecture behavioral of writing_code is 
begin
	process(writing_bites)
	begin
	writen_bites <= (others => '0'); -- défaut à 0
	
	if writing_bites(0) = '1' then -- si le 1er bit est à l'état haut
		writen_bites(0) <= '1'; -- le 1er bit de sortie est à l'état haut
	end if;
	
	if writing_bites(1) = '1' then
		writen_bites(1) <= '1';
	end if;
	
	if writing_bites(2) = '1' then
		writen_bites(2) <= '1';
	end if;
	
	if writing_bites(3) = '1' then
		writen_bites(3) <= '1';
	end if;
end architecture;