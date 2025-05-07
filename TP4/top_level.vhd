library ieee;
use ieee.std_logic_1164.all;

entity toplevel is
    port (
        CLOCK_50_B6A : in  std_logic;
        KEY          : in  std_logic_vector(3 downto 0); -- KEY(0) = reset, KEY(1 à 3) = boutons
        HEX0         : out std_logic_vector(6 downto 0);
        HEX1         : out std_logic_vector(6 downto 0);
        HEX2         : out std_logic_vector(6 downto 0);
        HEX3         : out std_logic_vector(6 downto 0)
    );
end entity;

architecture behavioral of toplevel is
    signal writen_bites : std_logic_vector(3 downto 0);
    signal any_button   : std_logic;
    
    constant DASH : std_logic_vector(6 downto 0) := "0111111"; -- '-'
    constant OFF  : std_logic_vector(6 downto 0) := "1111111"; -- éteint
begin

    -- N’importe quel bouton appuyé sauf reset
    any_button <= KEY(1) or KEY(2) or KEY(3);

    -- Instance de writing_code
    inst_code : entity work.writing_code
        port map (
            clk           => CLOCK_50_B6A,
            reset         => KEY(0),          -- Bouton KEY(0) = reset
            btn_pressed   => any_button,      -- N’importe quel autre bouton
            writen_bites  => writen_bites
        );

    -- Affichage en fonction des bits activés
    HEX0 <= DASH when writen_bites(0) = '1' else OFF;
    HEX1 <= DASH when writen_bites(1) = '1' else OFF;
    HEX2 <= DASH when writen_bites(2) = '1' else OFF;
    HEX3 <= DASH when writen_bites(3) = '1' else OFF;

end behavioral;
