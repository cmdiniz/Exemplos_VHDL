ENTITY exemplo2 IS
PORT (
	a, b, c : IN BIT;     -- entradas
	d 	: OUT BIT  -- saídas
);
END exemplo2;

ARCHITECTURE comportamento OF exemplo2 IS
SIGNAL e, f : BIT;
BEGIN
	e <= a AND b;	
	f <= e OR NOT (c);
	d <= a NAND f;
END comportamento;

