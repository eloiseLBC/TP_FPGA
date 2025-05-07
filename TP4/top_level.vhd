library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity toplevel is
    port (
        CLOCK_50_B6A : in std_logic;
        KEY          : in std_logic_vector(3 downto 0);  -- N'importe quel bouton
        HEX0         : out std_logic_vector(6 downto 0);
        HEX1         : out std_logic_vector(6 downto 0);
        HEX2         : out std_logic_vector(6 downto 0);
        HEX3         : out std_logic_vector(6 downto 0)
    );
end entity;

architecture behavioral of toplevel is
    signal key_pressed   : std_logic := '0';
    signal last_key      : std_logic := '0';
    signal press_counter : integer range 0 to 4 := 0;

    constant DASH : std_logic_vector(6 downto 0) := "0111111";  -- '-'
    constant OFF  : std_logic_vector(6 downto 0) := "1111111";  -- rien 
begin

    -- Détection front montant sur n'importe quel bouton
    process(CLOCK_50_B6A)
    begin
        if rising_edge(CLOCK_50_B6A) then
            key_pressed <= KEY(0) or KEY(1) or KEY(2) or KEY(3);

            if key_pressed = '1' and last_key = '0' then
                if press_counter < 4 then
                    press_counter <= press_counter + 1;
                end if;
            end if;

            last_key <= key_pressed;
        end if;
    end process;

    -- Affectation des HEX selon le nombre d'appuis
    HEX0 <= DASH when press_counter > 0 else OFF;
    HEX1 <= DASH when press_counter > 1 else OFF;
    HEX2 <= DASH when press_counter > 2 else OFF;
    HEX3 <= DASH when press_counter > 3 else OFF;

end behavioral;
