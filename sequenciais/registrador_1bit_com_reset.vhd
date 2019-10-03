----------------------------------------------------------
-- Registrador de 1 bit (flip-flop) com reset assíncrono
----------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------
ENTITY registrador_1bit_com_reset IS
PORT (
	clk			: IN std_logic; -- clock (relogio)
	rst			: IN std_logic; -- reset
	d			: IN std_logic;
	q			: OUT std_logic
);
END registrador_1bit_com_reset;
-----------------------------------------------

ARCHITECTURE rtl OF registrador_1bit_com_reset IS
BEGIN
		PROCESS(clk,rst)
		BEGIN
			IF (rst = '1') THEN
				q <= '0';
			ELSIF (clk'EVENT AND clk = '1') THEN
				q <= d;
			END IF;
		END PROCESS;
	
END rtl;
-----------------------------------------------