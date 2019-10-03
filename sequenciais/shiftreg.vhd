-------------------------------------------------------------
-- Registrador de deslocamento com no. de estagios generico
-------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------------
ENTITY shiftreg IS
	GENERIC (n: INTEGER := 4); -- numero de estagios
	PORT (
		d, clk, rst: IN STD_LOGIC;
		q: OUT STD_LOGIC
	);
END shiftreg;
--------------------------------------------------

ARCHITECTURE behavior OF shiftreg IS

	SIGNAL internal: STD_LOGIC_VECTOR (n-1 DOWNTO 0);

BEGIN

	PROCESS (clk, rst)
	BEGIN
		IF (rst='1') THEN
			internal <= (OTHERS => '0');
		ELSIF (clk'EVENT AND clk='1') THEN
			internal <= d & internal(internal'LEFT DOWNTO 1);
		END IF;
	END PROCESS;
	
	q <= internal(0);

END behavior;
-------------------------