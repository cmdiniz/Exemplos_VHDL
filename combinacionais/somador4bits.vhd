LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY somador4bits IS
PORT (
	cin, a3, a2, a1, a0, b3, b2, b1, b0 : IN STD_LOGIC;
	s3, s2, s1, s0, cout 				: OUT STD_LOGIC
);
END somador4bits;

ARCHITECTURE dataflow OF somador4bits IS

SIGNAL c1, c2, c3: STD_LOGIC;

COMPONENT full_adder
PORT (
	cin, a, b : IN STD_LOGIC;
	s, cout   : OUT STD_LOGIC);
END COMPONENT;

BEGIN

circuito0: full_adder PORT MAP (cin, a0, b0, s0, c1);
circuito1: full_adder PORT MAP (c1, a1, b1, s1, c2);
circuito2: full_adder PORT MAP (c2, a2, b2, s2, c3);
circuito3: full_adder PORT MAP (c3, a3, b3, s3, cout);

END dataflow;