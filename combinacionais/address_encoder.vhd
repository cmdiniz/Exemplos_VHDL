-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------
ENTITY address_encoder IS
PORT (
	x: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	y: OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
);
END address_encoder;

-----------------------------------------------

ARCHITECTURE with_SELECT OF address_encoder IS
BEGIN
	WITH x SELECT
		y <= "000" WHEN "00000001",
			 "001" WHEN "00000010",
			 "010" WHEN "00000100",
			 "011" WHEN "00001000",
			 "100" WHEN "00010000",
			 "101" WHEN "00100000",
			 "110" WHEN "01000000",
             "111" WHEN OTHERS;
END with_SELECT;
-----------------------------------------------