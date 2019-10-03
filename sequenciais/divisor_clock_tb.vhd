-----------------------------------------------
-- Testbench do divisor de clock
-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------
ENTITY divisor_clock_tb IS
END divisor_clock_tb;
-----------------------------------------------

ARCHITECTURE test OF divisor_clock_tb IS

SIGNAL clk : std_logic;
SIGNAL q   : std_logic;

COMPONENT divisor_clock IS
PORT (
	clk			: IN std_logic; -- clock (relogio)
	q			: OUT std_logic
);
END COMPONENT;
 
BEGIN

	i1 : divisor_clock
	PORT MAP (
		clk => clk,
		q => q
	);

	PROCESS
	BEGIN
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
	END PROCESS;

	process
	begin
		wait for 100 ns;
		
		assert false report "Fim do teste";
	end process;
	
END test;
-----------------------------------------------