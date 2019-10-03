LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux4para1_8bits IS
PORT ( 
	a, b, c, d: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	sel: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
	y: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END mux4para1_8bits;

ARCHITECTURE dataflow OF mux4para1_8bits IS
BEGIN
	y <= a WHEN sel="00" ELSE
		 b WHEN sel="01" ELSE
		 c WHEN sel="10" ELSE
		 d;
END dataflow;