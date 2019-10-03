----------------------------------------------------------
-- Registrador de 8 bits com reset assíncrono
----------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------
ENTITY registrador_8bits_com_reset IS
PORT (
	clk			: IN std_logic; -- clock (relogio)
	rst			: IN std_logic; -- reset
	d			: IN std_logic_vector(7 downto 0);
	q			: OUT std_logic_vector(7 downto 0)
);
END registrador_8bits_com_reset;
-----------------------------------------------

ARCHITECTURE rtl OF registrador_8bits_com_reset IS
BEGIN
		PROCESS(clk,rst)
		BEGIN
			IF (rst = '1') THEN
				q <= (OTHERS => '0');   --  pode ser usado também q <= "00000000";
			ELSIF (clk'EVENT AND clk = '1') THEN
				q <= d;
			END IF;
		END PROCESS;
	
END rtl;
-----------------------------------------------