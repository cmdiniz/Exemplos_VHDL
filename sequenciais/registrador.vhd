-----------------------------------------------
-- Registrador com numero de bits generico
-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------
ENTITY registrador IS
GENERIC (N: INTEGER := 16); -- numero de bits do registrador
PORT (
	clk			: IN std_logic; -- clock (relogio)
	d			: IN std_logic_vector(N-1 DOWNTO 0);
	q			: OUT std_logic_vector(N-1 DOWNTO 0)
);
END registrador;
-----------------------------------------------

ARCHITECTURE rtl OF registrador IS
BEGIN
		PROCESS(clk)
		BEGIN
			IF (clk'EVENT AND clk = '1') THEN
				q <= d;
			END IF;
		END PROCESS;
	
END rtl;
-----------------------------------------------