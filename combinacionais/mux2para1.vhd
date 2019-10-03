LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux2para1 IS
PORT ( 
	sel, a, b : IN STD_LOGIC;
	y : OUT STD_LOGIC
);
END mux2para1;

ARCHITECTURE dataflow OF mux2para1 IS

BEGIN

	WITH sel SELECT
		y <= a WHEN '0',
		b WHEN OTHERS;
		
END dataflow;