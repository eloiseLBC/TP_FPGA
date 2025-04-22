library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Fonctionnement de la bascule JK
-- Table caractéristique
-- J | K | Q+
-- 0 | 0 | Q
-- 0 | 1 | 0
-- 1 | 0 | 1
-- 1 | 1 | Q_
-- Elle est sensible au front montant de l'horloge

entity flipflop_JK is
	port (
		Clk : in std_logic;
		J : in std_logic;
		K : in std_logic;
		Q : out std_logic
	);
end flipflop_JK;

architecture behavorial of flipflop_JK is 
	signal Qn : std_logic := '0';
begin
	proc_dff: process(Clk)
	variable v_concatenated : std_logic_vector(1 downto 0);
	begin
		if rising_edge(Clk) then
			v_concatenated := J & K;
            case (v_concatenated) is
                when "00" =>
                    Qn <= Qn; -- Pas de changement
                when "01" =>
                    Qn <= '0'; -- Reset
                when "10" =>
                    Qn <= '1'; -- Set
                when "11" =>
                    Qn <= not Qn; -- Toggle
                when others =>
                    Qn <= Qn;
            end case;
		end if;
    end process proc_dff;
	 Q <= Qn;
end behavorial;