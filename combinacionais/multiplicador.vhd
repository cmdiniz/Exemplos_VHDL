LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_signed.all;

ENTITY multiplicador IS
PORT (
	a, b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	s : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END multiplicador;

ARCHITECTURE comportamento OF multiplicador IS
BEGIN
	
	s <= a*b;

END comportamento;