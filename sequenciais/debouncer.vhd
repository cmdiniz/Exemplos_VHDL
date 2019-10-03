---------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
---------------------------------------------------------------------------------
ENTITY debouncer IS
    GENERIC (fclk:    INTEGER := 1;      -- frequencia de clock em kHz
	         twindow: INTEGER := 10 );   -- janela de tempo em milisegundos (ms)
	PORT ( x   : IN STD_LOGIC;
	       clk : IN STD_LOGIC;
		   y   : BUFFER STD_LOGIC);
END debouncer;
----------------------------------------------------------------------------------
ARCHITECTURE debouncer OF debouncer IS
   CONSTANT max: INTEGER := fclk * twindow;
BEGIN
	PROCESS (clk)
		VARIABLE count: INTEGER RANGE 0 to max;
	BEGIN
		IF (clk'EVENT AND clk='1') THEN
			IF (y /= x) THEN
				count := count + 1;
				IF (count=max) THEN
					y <= x;
					count := 0;
				END IF;
			ELSE
				count := 0;
			END IF;
		END IF;
	END PROCESS;
END debouncer;
----------------------------------------------------------------------------------