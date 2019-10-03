-----------------------------------------------
-- Divisor de clock
-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------
ENTITY divisor_clock IS
PORT (
	clk		: IN std_logic; -- clock (relogio)
	q			: OUT std_logic
);
END divisor_clock;
-----------------------------------------------

ARCHITECTURE rtl OF divisor_clock IS

SIGNAL d, saida : std_logic;
 
BEGIN
		PROCESS(clk)
		BEGIN
			IF (clk'EVENT AND clk = '1') THEN
				saida <= d;
			END IF;
		END PROCESS;
		
		d <= not saida;
		
		q <= saida;
END rtl;
-----------------------------------------------