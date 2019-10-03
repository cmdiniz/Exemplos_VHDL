-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------

ENTITY parity_detector IS
	GENERIC (N: INTEGER := 8); -- numero de bits
	PORT (
		x: IN std_logic_vector(N–1 DOWNTO 0);
		y: OUT std_logic);
END parity_detector;

ARCHITECTURE structural OF parity_detector IS

SIGNAL internal: std_logic_vector(N–1 DOWNTO 0);

BEGIN
	internal(0) <= x(0);
	
	gen: FOR i IN 1 TO N–1 GENERATE
		internal(i) <= internal(i–1) XOR x(i);
	END GENERATE;
	
	y <= internal(N–1);

END structural;
