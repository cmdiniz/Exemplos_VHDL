ENTITY somador4bits IS

PORT (
	cin 	: IN STD_LOGIC;
	a, b	: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	s 		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
	cout 	: OUT STD_LOGIC
);
END somador4bits;

ARCHITECTURE dataflow OF somador4bits IS

SIGNAL c : STD_LOGIC_VECTOR (3 DOWNTO 1);

COMPONENT full_adder
PORT (
	cin, a, b 	: IN STD_LOGIC;
	s, cout 	: OUT STD_LOGIC
);
END COMPONENT;

BEGIN

circuito0: full_adder PORT MAP (cin, a(0), b(0), s(0), c(1));
circuito1: full_adder PORT MAP (c(1), a(1), b(1), s(1), c(2));
circuito2: full_adder PORT MAP (c(2), a(2), b(2), s(2), c(3));
circuito3: full_adder PORT MAP (c(3), a(3), b(3), s(3), cout);

END dataflow;