library ieee;
use ieee.std_logic_1164.all;

entity idle_state is
    port (
        CLOCK_50_B6A : in  std_logic;               -- Horloge principale 50 MHz de la carte
        LEDR        : out std_logic_vector(7 downto 0)  -- LEDs vertes
    );
end entity;

architecture behavioral of idle_state is
    signal led_out : std_logic;
begin

    -- Instance du clignotement d'horloge
    UUT : entity work.clock_idle
        port map (
            clock => CLOCK_50_B6A,
            led   => led_out
        );

    -- LEDG(0) clignote, les autres sont éteintes
    LEDR(0) <= led_out;

end behavioral;