---------------------------------------------------
-- Memória RAM com Entrada e Saída em 
-- Barramentos Separados
---------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
---------------------------------------------------
ENTITY ram IS
GENERIC ( bits: INTEGER := 8; -- numero de bits por palavra (word)
		  words: INTEGER := 16); -- numero de palavras na memoria
PORT ( wr_ena, clk: IN STD_LOGIC;
	   addr: IN INTEGER RANGE 0 TO words-1;
	   data_in: IN STD_LOGIC_VECTOR (bits-1 DOWNTO 0);
	   data_out: OUT STD_LOGIC_VECTOR (bits-1 DOWNTO 0)
	  );
END ram;
---------------------------------------------------

ARCHITECTURE ram OF ram IS

TYPE vector_array IS ARRAY (0 TO words-1) OF STD_LOGIC_VECTOR (bits-1 DOWNTO 0);

SIGNAL memory: vector_array;

BEGIN
	PROCESS (clk, wr_ena)
	BEGIN
		IF (wr_ena='1') THEN
			IF (clk'EVENT AND clk='1') THEN
				memory(addr) <= data_in;
			END IF;
		END IF;
	END PROCESS;

	data_out <= memory(addr);
	
END ram;
---------------------------------------------------