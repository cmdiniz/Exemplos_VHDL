LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------
ENTITY counter_Nstages IS
	GENERIC (N: NATURAL := 8);
	PORT (
		clk, rst: IN STD_LOGIC;
		q: BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0)
	);
END ENTITY;
-----------------------------------------------------------------------------------------
ARCHITECTURE structural OF counter_Nstages IS

	SIGNAL c: STD_LOGIC_VECTOR(N-1 DOWNTO 0);

	COMPONENT counter_cell IS
		PORT (
			a, b, clk, rst: IN STD_LOGIC;
			c, q: BUFFER STD_LOGIC
		);
	END COMPONENT;

BEGIN

	cell0: counter_cell PORT MAP (clk => clk, rst => rst, a => '1', b => '1', c => c(0), q => q(0) );
	
	other_cells: FOR i IN 1 TO N-1 GENERATE
		gen_cells: counter_cell PORT MAP (clk => clk, rst => rst, a => c(i-1), b => q(i-1), c => c(i), q => q(i) );
	END GENERATE;

END structural;
-----------------------------------------------------------------------------------------