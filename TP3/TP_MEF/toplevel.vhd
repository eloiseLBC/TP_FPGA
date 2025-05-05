library ieee;
use ieee.std_logic_1164.all;

entity toplevel is
    port (
        CLOCK_50_B6A : in std_logic;
        KEY          : in std_logic_vector(3 downto 0); -- KEY(0) est le bouton utilisé
        LEDG         : out std_logic_vector(7 downto 0) -- LEDs vertes
    );
end entity;

architecture behavioral of toplevel is
    signal y_bistable : std_logic;
begin
    bistable_inst : entity work.bistable
        port map (
            clk => CLOCK_50_B6A,
            rst => '0',           -- Pas de reset
            x   => KEY(0),        
            y   => y_bistable    
        );

    -- Toutes les LED vertes suivent la sortie
    LEDG <= (others => y_bistable);

end behavioral;
