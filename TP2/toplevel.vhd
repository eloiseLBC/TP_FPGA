library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity toplevel is
    port(
        -- Entrées de la carte FPGA
        SW  : in  std_logic_vector(9 downto 0);  -- SW9 à SW0
        KEY : in  std_logic_vector(3 downto 0);  -- KEY3 à KEY0

        -- Sorties de la carte FPGA
        LEDG : out std_logic_vector(7 downto 0)  -- LEDG7 à LEDG0
    );
end toplevel;

architecture behavioral of toplevel is

    -- Signaux internes si besoin
    signal clk_internal : std_logic;

begin

    -- L'horloge est inversée sur KEY0
    clk_internal <= not(KEY(0));

    -- Instanciation de ton registre universel
    UUT : entity work.shift_register_universal8
        port map (
            SSR  => SW(9),       -- SW9
            SSL  => SW(8),       -- SW8
            Pi   => (others => '0'), -- Pas utilisé ici (chargement parallèle désactivé)
            SEL  => SW(2 downto 0), -- SW2 à SW0
            CLK  => clk_internal, -- not(KEY0)
            SETn => KEY(2),      -- KEY2
            RSTn => KEY(3),      -- KEY3
            SOR  => open,        -- Pas utilisé
            SOL  => open,        -- Pas utilisé
            Qo   => LEDG         -- LEDG7 à LEDG0
        );

end behavioral;
