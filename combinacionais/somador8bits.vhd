LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY somador8bits IS
PORT ( 
	a, b : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
	s : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
);
END somador8bits;

ARCHITECTURE dataflow OF somador8bits IS
BEGIN

s <= a + b;

END dataflow;
