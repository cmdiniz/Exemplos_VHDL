LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY full_adder IS

PORT (
	cin, a, b : IN STD_LOGIC;
	s, cout : OUT STD_LOGIC
  );
END full_adder;

ARCHITECTURE comportamento OF full_adder IS
BEGIN

s <= a XOR b XOR cin;
cout <= (a AND b) or (a AND cin) or (b and cin);

END comportamento;
