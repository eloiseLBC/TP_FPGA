library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_clock_divider is
end tb_clock_divider;

architecture tb of tb_clock_divider is
    signal CLKin  : std_logic := '0';
    signal RST    : std_logic := '1';
    signal N      : std_logic_vector(4 downto 0) := (others => '0');
    signal CLKout : std_logic;
begin

    -- Instanciation du diviseur d'horloge
    UUT : entity work.clock_divider
        port map (
            CLKin  => CLKin,
            RST    => RST,
            N      => N,
            CLKout => CLKout
        );

    -- Génération de l'horloge d'entrée (CLKin = 50 MHz -> période 20 ns)
    clk_process : process
    begin
        while true loop
            CLKin <= '0'; wait for 10 ns;
            CLKin <= '1'; wait for 10 ns;
        end loop;
    end process;

    -- Stimuli de test
    stim_proc : process
    begin
        -- Reset
        RST <= '0'; wait for 20 ns;
        RST <= '1'; wait for 20 ns;

        -- Test 1 : Division par 2^(0+1) = 2
        N <= "00000"; -- Bit 0
        wait for 200 ns; -- Attendre pour observer plusieurs bascules

        -- Test 2 : Division par 2^(2+1) = 8
        N <= "00010"; -- Bit 2
        wait for 500 ns; -- Plus lent, attendre plus longtemps

        -- Test 3 : Division par 2^(5+1) = 64
        N <= "00101"; -- Bit 5
        wait for 2000 ns; -- Encore plus lent, attendre longtemps

        -- Fin
        wait;
    end process;

end tb;
