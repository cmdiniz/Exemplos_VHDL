---------------------------------------------------
-- Memória RAM com Barramento de Entrada e Saída
-- Bidirecional
---------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-------------------------------------------------
ENTITY ram4 IS
	GENERIC ( bits: INTEGER := 8; -- numero de bits por palavra (word)
			  words: INTEGER := 16); -- numero de palavras na memoria
	PORT ( clk, wr_ena: IN STD_LOGIC;
		   addr: IN INTEGER RANGE 0 TO words-1;
		   bidir: INOUT STD_LOGIC_VECTOR (bits-1 DOWNTO 0));
END ram4;
-------------------------------------------------

ARCHITECTURE ram OF ram4 IS

TYPE vector_array IS ARRAY (0 TO words-1) OF STD_LOGIC_VECTOR (bits-1 DOWNTO 0);

SIGNAL memory: vector_array;

BEGIN
	
	PROCESS (clk, wr_ena)
	BEGIN
		IF (wr_ena='0') THEN
			bidir <= memory(addr);
		ELSE
			bidir <= (OTHERS => 'Z');
			IF (clk'EVENT AND clk='1') THEN
				memory(addr) <= bidir;
			END IF;
		END IF;
	END PROCESS;

END ram;
-------------------------------------------------