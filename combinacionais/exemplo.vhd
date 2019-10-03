LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY exemplo IS
PORT (
	a, b, c : IN BIT;
	d : OUT BIT
  );
END exemplo;

ARCHITECTURE comportamento OF exemplo IS
BEGIN
	
	d <= (a NAND ((a AND b) OR NOT (c)));

END comportamento;
