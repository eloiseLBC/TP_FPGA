library ieee;
use ieee.std_logic_1164.all;

entity idle_state is
    port (
        clock : in  std_logic;               -- Horloge principale 50 MHz de la carte
        LEDsortie        : out std_logic_vector(9 downto 0)  
    );
end entity;

architecture behavioral of idle_state is
    signal led_out : std_logic;
begin

    -- Instance du clignotement d'horloge
    UUT : entity work.clock_idle
        port map (
            clock => clock,
            led   => led_out
        );

    -- LEDG(0) clignote, les autres sont éteintes
    LEDsortie(0) <= led_out;

end behavioral;