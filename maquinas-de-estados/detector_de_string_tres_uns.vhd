-----------------------------------------------
-- Modificado a partir de exemplo 
-- do livro "Circuit Design with VHDL"
-- de Volnei Pedroni
-- Detecta cadeias "111", colocando a saída
-- q em '1' nesta situação
-- Permite sobreposição de '1's de cadeias
-- diferentes
-----------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------
ENTITY detector_de_string_tres_uns IS
	PORT ( d, clk, rst: IN std_logic;
               q: OUT std_logic
	);
END detector_de_string_tres_uns;
-----------------------------------------------

ARCHITECTURE rtl OF detector_de_string_tres_uns IS

TYPE estado IS (zero, um, dois, tres);
SIGNAL estado_atual, proximo_estado: estado;

BEGIN
	----- Registrador de estado ---------------
	PROCESS (rst, clk)
	BEGIN
		IF (rst='1') THEN
			estado_atual <= zero;
		ELSIF (clk'EVENT AND clk='1') THEN
			estado_atual <= proximo_estado;
		END IF;
	END PROCESS;

	-- Logica de proximo estado e saida --------
	PROCESS (d, estado_atual)
	BEGIN
		CASE estado_atual IS
			WHEN zero =>
				q <= '0';
				IF (d='1') THEN proximo_estado <= um;
				ELSE proximo_estado <= zero;
				END IF;
			WHEN um =>
				q <= '0';
				IF (d='1') THEN proximo_estado <= dois;
				ELSE proximo_estado <= zero;
				END IF;
			WHEN dois =>
				q <= '0';
				IF (d='1') THEN proximo_estado <= tres;
				ELSE proximo_estado <= zero;
				END IF;
			WHEN tres =>
				q <= '1';
				IF (d='0') THEN proximo_estado <= zero;
				ELSE proximo_estado <= tres;
				END IF;
		END CASE;
	END PROCESS;
END rtl;
--------------------------------------------
