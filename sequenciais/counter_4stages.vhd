LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------
ENTITY counter_4stages IS
	PORT (
		clk, rst: IN STD_LOGIC;
		q: BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END ENTITY;
-----------------------------------------------------------------------------------------
ARCHITECTURE structural OF counter_4stages IS

	SIGNAL c: STD_LOGIC_VECTOR(3 DOWNTO 0);

	COMPONENT counter_cell IS
		PORT (
			a, b, clk, rst: IN STD_LOGIC;
			c, q: BUFFER STD_LOGIC
		);
	END COMPONENT;

BEGIN

	cell0: counter_cell PORT MAP (clk => clk, rst => rst, a => '1', b => '1', c => c(0), q => q(0));
	cell1: counter_cell PORT MAP (clk => clk, rst => rst, a => c(0), b => q(0), c => c(1), q => q(1));
	cell2: counter_cell PORT MAP (clk => clk, rst => rst, a => c(1), b => q(1), c => c(2), q => q(2));
	cell3: counter_cell PORT MAP (clk => clk, rst => rst, a => c(2), b => q(2), c => c(3), q => q(3));

END structural;