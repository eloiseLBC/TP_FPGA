library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_shift_register_universal8 is
end tb_shift_register_universal8;

architecture tb of tb_shift_register_universal8 is
    signal CLK   : std_logic := '0';
    signal SETn  : std_logic := '1';
    signal RSTn  : std_logic := '1';
    signal SEL   : std_logic_vector(2 downto 0) := (others => '0');
    signal SSR   : std_logic := '0';
    signal SSL   : std_logic := '0';
    signal Pi    : std_logic_vector(7 downto 0) := (others => '0');
    signal SOR   : std_logic;
    signal SOL   : std_logic;
    signal Qo    : std_logic_vector(7 downto 0);
begin

    -- Instanciation de l'unité à tester (UUT)
    UUT : entity work.shift_register_universal8 port map(
        SSR => SSR,
        SSL => SSL,
        Pi  => Pi,
        SEL => SEL,
        CLK => CLK,
        SETn => SETn,
        RSTn => RSTn,
        SOR => SOR,
        SOL => SOL,
        Qo  => Qo
    );

    -- Génération d'horloge (20 ns de période)
    clk_process : process
    begin
        while true loop
            CLK <= '0'; wait for 10 ns;
            CLK <= '1'; wait for 10 ns;
        end loop;
    end process;

    -- Processus de stimulation
    stim_proc : process
    begin
        wait for 15 ns;

        -- Test 1 : Reset asynchrone
        RSTn <= '0'; wait for 5 ns;
        assert Qo = "00000000" report "Erreur : après RSTn=0, Qo devrait être 00000000" severity error;
        RSTn <= '1'; wait for 20 ns;

        -- Test 2 : Set asynchrone
        SETn <= '0'; wait for 5 ns;
        assert Qo = "11111111" report "Erreur : après SETn=0, Qo devrait être 11111111" severity error;
        SETn <= '1'; wait for 20 ns;

        -- Test 3 : Parallel load
        Pi <= "10101010"; -- Exemple de donnée à charger
        SEL <= "011"; -- Mode parallel load
        wait for 20 ns; -- Laisser passer un front
        assert Qo = "10101010" report "Erreur : Parallel load incorrect" severity error;

        -- Test 4 : Hold (mémorisation)
        Pi <= "00000000"; -- Pi change mais pas censé charger
        SEL <= "000"; -- Mode hold
        wait for 20 ns;
        assert Qo = "10101010" report "Erreur : Hold devrait conserver la valeur précédente" severity error;

        -- Test 5 : Shift right
        SSR <= '1'; -- On injecte '1' à gauche
        SEL <= "001"; -- Shift right
        wait for 20 ns;
        assert Qo(7) = '1' report "Erreur : après Shift right, bit 7 devrait être 1" severity error;

        -- Test 6 : Shift left
        SSL <= '0'; -- On injecte '0' à droite
        SEL <= "010"; -- Shift left
        wait for 20 ns;
        assert Qo(0) = '0' report "Erreur : après Shift left, bit 0 devrait être 0" severity error;

        -- Test 7 : Rotate right
        SEL <= "101"; -- Rotate right
        wait for 20 ns;
        -- Pas d'assert direct ici car dépend du contenu, à vérifier visuellement

        -- Test 8 : Rotate left
        SEL <= "110"; -- Rotate left
        wait for 20 ns;
        -- Pas d'assert direct ici car dépend du contenu, à vérifier visuellement

        wait;
    end process;

end tb;
