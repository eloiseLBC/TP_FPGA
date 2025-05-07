library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
-- Diviseur d'horloge par 2^(N+1)

entity clock_divider is
	generic(
		data_width : integer := 5
	);
    port(
        CLKin  : in  std_logic;               					  -- Horloge d'entrée
        N      : in  std_logic_vector(data_width-1 downto 0); -- Sélection du rythme de division
        CLKout : out std_logic                					  -- Horloge divisée
    );
end clock_divider;

architecture behavioral of clock_divider is
    signal counter : std_logic_vector(23 downto 0) := (others => '0'); -- Compteur 24 bits
begin

    process(CLKin)
    begin
        if rising_edge(CLKin) then
            counter <= counter + 1;     -- Incrément du compteur à chaque front
        end if;
    end process;

    -- Multiplexage du bit en fonction de N
    CLKout <= counter(to_integer(unsigned(N)));

end behavioral;

