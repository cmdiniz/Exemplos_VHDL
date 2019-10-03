--------------------------------------------------
-- Registrador de deslocamento circular
-- com sequencia rotativa "0001"
--------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------------
ENTITY circular_shiftreg IS
	PORT (
		clk, rst: IN STD_LOGIC;
		q0, q1, q2, q3: OUT std_logic
	);
END circular_shiftreg;
--------------------------------------------------

ARCHITECTURE behavior OF circular_shiftreg IS

	SIGNAL internal0: STD_LOGIC;
	SIGNAL internal1: STD_LOGIC;
	SIGNAL internal2: STD_LOGIC;
	SIGNAL internal3: STD_LOGIC;

BEGIN

	PROCESS (clk, rst)
	BEGIN
		IF (rst='1') THEN
			internal3 <= '1';
			internal2 <= '0';
			internal1 <= '0';
			internal0 <= '0';
		ELSIF (clk'EVENT AND clk='1') THEN
			internal3 <= internal2;
			internal2 <= internal1;
			internal1 <= internal0;
			internal0 <= internal3;
		END IF;
	END PROCESS;
	
	q0 <= internal0;
	q1 <= internal1;
	q2 <= internal2;
	q3 <= internal3;

END behavior;
--------------------------------------------------