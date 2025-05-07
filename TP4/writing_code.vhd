library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity writing_code is 
	port (
		clk           : in std_logic;                        -- Horloge pour cadencer la logique
		reset         : in std_logic;                        -- Reset asynchrone
		btn_pressed   : in std_logic;                        -- N'importe quel bouton = 1 appui
		writen_bites  : out std_logic_vector(3 downto 0)     -- Afficheurs à allumer ('-' = 1)
	);
end entity;

architecture behavioral of writing_code is
	signal press_count : integer range 0 to 4 := 0;
	signal last_btn    : std_logic := '0';
begin

	process(clk, reset)
	begin
		if reset = '1' then
			press_count <= 0;
			last_btn    <= '0';
		elsif rising_edge(clk) then
			-- Détection de front montant du bouton
			if btn_pressed = '1' and last_btn = '0' then
				if press_count < 4 then
					press_count <= press_count + 1;
				end if;
			end if;
			last_btn <= btn_pressed;
		end if;
	end process;

	-- Génère les sorties
	writen_bites <= (3 => '1', 2 => '1', 1 => '1', 0 => '1') when press_count = 4 else
	                (3 => '0', 2 => '1', 1 => '1', 0 => '1') when press_count = 3 else
	                (3 => '0', 2 => '0', 1 => '1', 0 => '1') when press_count = 2 else
	                (3 => '0', 2 => '0', 1 => '0', 0 => '1') when press_count = 1 else
	                (others => '0');

end behavioral;
