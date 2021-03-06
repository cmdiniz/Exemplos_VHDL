--------------------------------------------------
-- Registrador de deslocamento de 4 bits
--------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------------
ENTITY shiftreg_4bits IS
	PORT (
		d, clk, rst: IN STD_LOGIC;
		q: OUT STD_LOGIC
	);
END shiftreg_4bits;
--------------------------------------------------

ARCHITECTURE behavior OF shiftreg_4bits IS

	SIGNAL internal: STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN

	PROCESS (clk, rst)
	BEGIN
		IF (rst='1') THEN
			internal <= (OTHERS => '0');
		ELSIF (clk'EVENT AND clk='1') THEN
			internal <= d & internal(3 DOWNTO 1);
		END IF;
	END PROCESS;
	
	q <= internal(0);

END behavior;
--------------------------------------------------