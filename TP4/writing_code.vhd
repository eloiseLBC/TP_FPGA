library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity writing_code is 
	port (
		clk           : in std_logic;
		btn_pressed   : in std_logic;                        -- Appui sur n'importe quel bouton
		writen_bites  : out std_logic_vector(3 downto 0)     -- Indique les digits à afficher
	);
end entity;

architecture behavioral of writing_code is
	signal press_count : integer range 0 to 4 := 0;
	signal last_btn    : std_logic := '0';
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if btn_pressed = '1' and last_btn = '0' then
				if press_count < 4 then
					press_count <= press_count + 1;
				end if;
			end if;
			last_btn <= btn_pressed;
		end if;
	end process;

	writen_bites <= "0001" when press_count = 1 else
	                "0011" when press_count = 2 else
	                "0111" when press_count = 3 else
	                "1111" when press_count = 4 else
	                "0000";
end behavioral;
