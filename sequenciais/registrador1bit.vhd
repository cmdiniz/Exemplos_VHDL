-----------------------------------------------
-- Registrador de 1 bit (flip-flop)
-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------
ENTITY registrador1bit IS
PORT (
	clk			: IN std_logic; -- clock (relogio)
	d			: IN std_logic;
	q			: OUT std_logic
);
END registrador1bit;
-----------------------------------------------

ARCHITECTURE rtl OF registrador1bit IS
BEGIN
		PROCESS(clk)
		BEGIN
			IF (clk'EVENT AND clk = '1') THEN
				q <= d;
			END IF;
		END PROCESS;
	
END rtl;
-----------------------------------------------