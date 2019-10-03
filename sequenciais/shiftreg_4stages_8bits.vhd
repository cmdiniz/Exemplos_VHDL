------------------------------------------------------
-- Registrador de deslocamento de 4 estagios e 8 bits
------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------------
ENTITY shiftreg_4stages_8bits IS
	PORT (
		clk, rst: IN STD_LOGIC;
		d : IN std_logic_vector(7 DOWNTO 0);
		q: OUT std_logic_vector(7 DOWNTO 0)
	);
END shiftreg_4stages_8bits;
--------------------------------------------------

ARCHITECTURE behavior OF shiftreg_4stages_8bits IS

	SIGNAL internal0: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL internal1: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL internal2: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL internal3: STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN

	PROCESS (clk, rst)
	BEGIN
		IF (rst='1') THEN
			internal3 <= (OTHERS => '0');
			internal2 <= (OTHERS => '0');
			internal1 <= (OTHERS => '0');
			internal0 <= (OTHERS => '0');
		ELSIF (clk'EVENT AND clk='1') THEN
			internal3 <= d;
			internal2 <= internal3;
			internal1 <= internal2;
			internal0 <= internal1;
		END IF;
	END PROCESS;
	
	q <= internal0;

END behavior;
--------------------------------------------------