library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_chenillard is
end tb_chenillard;

architecture tb of tb_chenillard is
    signal CLK  : std_logic := '0';
    signal RST  : std_logic := '0';
    signal CHEN : std_logic_vector(9 downto 0);
begin

    -- Instanciation de l'unité à tester
    UUT : entity work.chenillard
        port map (
            CLK  => CLK,
            RST  => RST,
            CHEN => CHEN
        );

    -- Génération de l'horloge (20 ns de période)
    clk_process : process
    begin
        while true loop
            CLK <= '0'; wait for 10 ns;
            CLK <= '1'; wait for 10 ns;
        end loop;
    end process;

    -- Stimuli de test
    stim_proc : process
    begin
        -- Reset initial
        RST <= '1'; wait for 25 ns;
        RST <= '0'; wait for 20 ns; -- Sortie du reset après quelques fronts

        -- Laisse tourner le chenillard pour 20 cycles
        wait for 20 * 20 ns * 11; -- 20 cycles × 11 fronts pour être sûr

        wait;
    end process;

end tb;
