-----------------------------------------------
-- Registrador de 8 bits
-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------
ENTITY registrador8bits IS
PORT (
	clk			: IN std_logic; -- clock (relogio)
	d			: IN std_logic_vector(7 downto 0);
	q			: OUT std_logic_vector(7 downto 0)
);
END registrador8bits;
-----------------------------------------------

ARCHITECTURE rtl OF registrador8bits IS
BEGIN
		PROCESS(clk)
		BEGIN
			IF (clk'EVENT AND clk = '1') THEN
				q <= d;
			END IF;
		END PROCESS;
	
END rtl;
-----------------------------------------------