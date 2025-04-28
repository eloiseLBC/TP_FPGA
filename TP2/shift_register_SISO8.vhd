library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Fonctionnement du registre à décalage 8 bits, Serial In Serial Out
-- SETn | RSTn | CLK ↑ | Si |     Registre                 | Comportement
-------------------------------------------------------------------------------------------------
--   0  |   1  |   X   |  X |  "11111111"                  | Set asynchrone (tous les bits à 1)
--   1  |   0  |   X   |  X |  "00000000"                  | Reset asynchrone (tous les bits à 0)
--   0  |   0  |   X   |  X |   Indéfini                   | État interdit (les deux actifs)
--   1  |   1  | front |  0 | Décalage à droite, Si inséré | Entrée série = 0
--   1  |   1  | front |  1 | Décalage à droite, Si inséré | Entrée série = 1


entity shift_register_SISO8 is
    port(
        Si    : in  std_logic;   -- Entrée série
        CLK   : in  std_logic;   -- Horloge (front montant)
        SETn  : in  std_logic;   -- Set asynchrone (actif bas)
        RSTn  : in  std_logic;   -- Reset asynchrone (actif bas)
        So    : out std_logic    -- Sortie série
    );
end shift_register_SISO8;

architecture behavioral of shift_register_SISO8 is
    signal reg : std_logic_vector(7 downto 0) := (others => '0');
begin

    process(CLK, SETn, RSTn)
    begin
        if RSTn = '0' then
            reg <= (others => '0');  
        elsif SETn = '0' then
            reg <= (others => '1'); 
        elsif rising_edge(CLK) then
            reg <= Si & reg(7 downto 1); -- Décalage à droite + nouvelle entrée
        end if;
    end process;

    So <= reg(0); 

end behavioral;
