library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_writing_code is
end tb_writing_code;

architecture tb of tb_writing_code is
	signal clk           : std_logic := '0';
	signal writing_bites : std_logic_vector(3 downto 0) := (others => '1'); -- inactif
	signal writen_bites  : std_logic_vector(3 downto 0);
begin

	-- Instanciation
	dut : entity work.writing_code
		port map (
			clk           => clk,
			writing_bites => writing_bites,
			writen_bites  => writen_bites
		);

	-- Horloge 100 MHz
	clk_process : process
	begin
		while true loop
			clk <= '0'; wait for 5 ns;
			clk <= '1'; wait for 5 ns;
		end loop;
	end process;

	-- Stimulus
	stim_proc : process
	begin
		wait for 20 ns;
		
		-- 1er appui (simulate pressing any button, e.g. KEY(0))
		writing_bites <= "1101"; -- KEY(0) press
		wait for 20 ns;
		writing_bites <= "1111"; -- release
		wait for 20 ns;

		-- 2e appui
		writing_bites <= "1011"; -- KEY(1)
		wait for 20 ns;
		writing_bites <= "1111";
		wait for 20 ns;

		-- 3e appui
		writing_bites <= "0111"; -- KEY(2)
		wait for 20 ns;
		writing_bites <= "1111";
		wait for 20 ns;

		-- 4e appui
		writing_bites <= "1110"; -- KEY(3)
		wait for 20 ns;
		writing_bites <= "1111";
		wait for 20 ns;

		wait;
	end process;

end tb;
