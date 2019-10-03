-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------
ENTITY address_decoder IS
PORT (
	x: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	y: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END address_decoder;

-----------------------------------------------

ARCHITECTURE with_SELECT OF address_decoder IS
BEGIN
	WITH x SELECT
		y <= "00000001" WHEN "000",
			 "00000010" WHEN "001",
			 "00000100" WHEN "010",
			 "00001000" WHEN "011",
			 "00010000" WHEN "100",
			 "00100000" WHEN "101",
			 "01000000" WHEN "110",
			 "10000000" WHEN OTHERS;
END with_SELECT;
-----------------------------------------------