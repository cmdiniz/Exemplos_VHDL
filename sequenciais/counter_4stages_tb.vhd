LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY counter_4stages_tb IS
END counter_4stages_tb;
ARCHITECTURE counter_4stages_arch OF counter_4stages_tb IS

SIGNAL clk, rst : STD_LOGIC;
SIGNAL q : STD_LOGIC_VECTOR(0 TO 3);

COMPONENT counter_4stages
	PORT (
	clk, rst : IN STD_LOGIC;
	q : BUFFER STD_LOGIC_VECTOR(0 TO 3)
	);
END COMPONENT;
BEGIN
	i1 : counter_4stages
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	rst => rst,
	q => q
	);

	reset: PROCESS
	BEGIN
		rst <= '1';
		wait for 40 ns;
		rst <= '0';
		wait;
	END PROCESS;
	
	clock : PROCESS                                               
	BEGIN                                                        
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;		                                                         
	END PROCESS;                                           
	
END counter_4stages_arch;
