library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_level is 
	port(
		CLOCK_50_B6A : in std_logic; -- Garde en mémoire l'état du bouton
		KEY  : in std_logic_vector(3 downto 0);
		HEX0 : out std_logic_vector(6 downto 0);
		HEX1 : out std_logic_vector(6 downto 0);
		HEX2 : out std_logic_vector(6 downto 0);
		HEX3 : out std_logic_vector(6 downto 0)
		
	);
end entity;

architecture behavioral of top_level is
    signal writen_bites : std_logic_vector(3 downto 0);
	 
	 
begin

    writing_code_inst : entity work.writing_code
        port map (
				clk           => CLOCK_50_B6A,
            writing_bites => KEY,
            writen_bites  => writen_bites
        );

    -- Affichage '-' sur les afficheurs activés (segment g activé uniquement = bit 6 à 0, les autres à 1)
    HEX0 <= "0111111" when writen_bites(0) = '1' else "1111111";  -- '-' ou vide
    HEX1 <= "0111111" when writen_bites(1) = '1' else "1111111";
    HEX2 <= "0111111" when writen_bites(2) = '1' else "1111111";
    HEX3 <= "0111111" when writen_bites(3) = '1' else "1111111";

end behavioral;