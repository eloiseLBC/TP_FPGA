library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bistable is
	port(
        -- ENTREES
		clk : in std_logic;
		rst : in std_logic;
		x   : in std_logic;
		-- SORTIES
		y   : out std_logic
	);
end entity;

architecture behavioral of bistable is
	type state_type is (A, B, C, D);    -- Enumérer tous les états de la FSM ici
	signal future_state  : state_type; -- Etat futur, calculé à partir des entrées et de l'état présent
	signal current_state : state_type; -- Etat présent, reçoit future_state à chaque coup d'horloge

	begin

	-- Description du registre d'états
	-- Fonction SEQUENTIELLE
	process(clk, rst)
	begin
		if rst = '1' then
			current_state <= A;
		elsif (clk'event and clk ='1') then
			current_state <= future_state;
		end if;
	end process;

	-- Description du calcul de l'état futur
	-- Fonction COMBINATOIRE
	process(x, current_state)
	begin
		case current_state is
			when A =>                                   -- when 1er état ...
				if    x = '0' then future_state <= A; --   if entrée = valeur1 then future_state <= état suivant1
				elsif x = '1' then future_state <= B; --   if entrée = valeur2 then future_state <= état suivant2
				else                 future_state <= A; --   etc.
				end if;
			when B =>                                   -- when 2ème état ...
				if    x = '0' then future_state <= C; --   if entrée = valeur1 then future_state <= état suivant1
				elsif x = '1' then future_state <= B; --   if entrée = valeur2 then future_state <= état suivant2
				else                 future_state <= B; --   etc.
				end if;
			when C =>                                   -- when 2ème état ...
				if    x = '0' then future_state <= C; --   if entrée = valeur1 then future_state <= état suivant1
				elsif x = '1' then future_state <= D; --   if entrée = valeur2 then future_state <= état suivant2
				else                 future_state <= C; --   etc.
				end if;
			when D =>                                   -- when 2ème état ...
				if    x = '0' then future_state <= A; --   if entrée = valeur1 then future_state <= état suivant1
				elsif x = '1' then future_state <= D; --   if entrée = valeur2 then future_state <= état suivant2
				else                 future_state <= D; --   etc.
				end if;
			when others =>
				future_state <= current_state;
		end case;
	end process;

	-- Description du calcul des sorties
	-- Fonction COMBINATOIRE
	process(current_state)
	begin
		case current_state is
			when A =>     -- when 1er état
                y <= '0'; --   assignation Sortie1 <= valeur1
			when B =>     -- when 2ème état
                y <= '1'; --   assignation Sortie1 <= valeur1
		   when C =>     -- when 3ème état
                y <= '1'; --   assignation Sortie1 <= valeur1
			when D =>     -- when 4ème état
                y <= '0'; --   assignation Sortie1 <= valeur1
			when others =>
                y <= '0'; 
		end case;
	end process;
end behavioral;
