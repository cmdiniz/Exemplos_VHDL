---The component (cell of fig. 14.5b):------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------
ENTITY counter_cell IS
	PORT (
		a, b, clk, rst: IN STD_LOGIC;
		c, q: BUFFER STD_LOGIC
	);
END ENTITY;
--------------------------------------------
ARCHITECTURE counter_cell OF counter_cell IS

signal d : STD_LOGIC;
BEGIN
	
	c <= a AND b;
	d <= q XOR c;
	
	PROCESS (clk)
	BEGIN
		IF (rst = '1') THEN
			q <= '0';
		ELSIF (clk'EVENT AND clk='1') THEN
			q <= d;
		END IF;
	END PROCESS;

END counter_cell;
--------------------------------------------