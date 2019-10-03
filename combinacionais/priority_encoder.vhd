-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------

ENTITY priority_encoder IS
   PORT ( 
		x : in std_logic_vector(7 downto 0);
		y : out std_logic_vector(2 downto 0)
	);
END priority_encoder;

ARCHITECTURE comportamental OF priority_encoder IS
BEGIN
   y <= "111" when x(7) = '1' else
 	    "110" when x(6) = '1' else
		"101" when x(5) = '1' else
		"100" when x(4) = '1' else
		"011" when x(3) = '1' else
		"010" when x(2) = '1' else
		"001" when x(1) = '1' else
		"000";

END comportamental;
