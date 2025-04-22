library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Bascule JK avec entrées asynchrones
-- Preset | Reset | J | K |    Q     | Comportement
--   0	 |   1	| X | X |    1 	 | Set asynchrone
--   1	 |   0	| X |	X |    0	    | Reset asynchrone
--   0	 |   0	| X |	X | indéfini |	État interdit (les deux actifs)
--   1	 |   1	| 0 |	0 |	 Q     |	Pas de changement (Hold)
--   1	 |   1	| 0 |	1 |	 0     |	Reset synchrone
--   1	 |   1	| 1 |	0 |	 1	    | Set synchrone
--   1	 |   1	| 1 |	1 |	~Q	    | Toggle synchrone

entity flipflop_JKrs is
	port(
	J : in std_logic;
	K : in std_logic;
	Clk : in std_logic;
	SETn : in std_logic;
	RSTn : in std_logic;
	Q : out std_logic;
	Qn : out std_logic
	);
end flipflop_JKrs;

architecture behavioral of flipflop_JKrs is
    signal Q_reg : std_logic := '0';
begin

    process(Clk, SETn, RSTn)
	 variable v_concatenate : std_logic_vector(1 downto 0);
    begin
		v_concatenate := J & K;
        -- Priorité : reset asynchrone
        if RSTn = '0' then
            Q_reg <= '0';

        -- Puis set asynchrone 
        elsif SETn = '0' then
            Q_reg <= '1';

        -- Comportement synchrone au front montant
        elsif rising_edge(Clk) then
            case v_concatenate is
                when "00" =>
                    Q_reg <= Q_reg;      -- Pas de changement
                when "01" =>
                    Q_reg <= '0';        -- Reset synchrone
                when "10" =>
                    Q_reg <= '1';        -- Set synchrone
                when "11" =>
                    Q_reg <= not Q_reg;  -- Toggle
                when others =>
                    Q_reg <= Q_reg;
            end case;
        end if;
    end process;

    -- Assignation des sorties
    Q  <= Q_reg;
    Qn <= not Q_reg;

end behavioral;
