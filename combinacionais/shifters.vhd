-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------

ENTITY shifters IS
   PORT ( 
		entrada 	  : in std_logic_vector(7 downto 0);
		desloca_dir   : out std_logic_vector(7 downto 0);
		desloca_esq   : out std_logic_vector(7 downto 0);
		rotaciona_dir : out std_logic_vector(7 downto 0);
		rotaciona_esq : out std_logic_vector(7 downto 0)
	);
END shifters;

ARCHITECTURE comportamental OF shifters IS
BEGIN

	desloca_dir   <= '0' & entrada(7 downto 1);
	desloca_esq   <= entrada(6 downto 0) & '0';
	rotaciona_dir <= entrada(0) & entrada(7 downto 1);
	rotaciona_esq <= entrada(6 downto 0) & entrada(7);

END comportamental;
