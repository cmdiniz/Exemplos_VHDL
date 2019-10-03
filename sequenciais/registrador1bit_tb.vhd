--------------------------------------------------
-- Testbench para simular o registrador de 1-bit
-- Template gerado pelo Quartus II e modificado
--------------------------------------------------

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY registrador1bit_tb IS
END registrador1bit_tb;
ARCHITECTURE registrador1bit_arch OF registrador1bit_tb IS
                                                
	SIGNAL clk : STD_LOGIC;
	SIGNAL d : STD_LOGIC;
	SIGNAL q : STD_LOGIC;
	
	COMPONENT registrador1bit
		PORT (
			clk : IN STD_LOGIC;
			d : IN STD_LOGIC;
			q : OUT STD_LOGIC
		);
	END COMPONENT;

BEGIN
	i1 : registrador1bit
	PORT MAP (
		-- list connections between master ports and signals
		clk => clk,
		d => d,
		q => q
	);

	clock : PROCESS                                               
	BEGIN                                                        
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;		                                                         
	END PROCESS;                                           

	entrada : PROCESS                                              
	BEGIN                                                         
        d <= '1';
		wait for 45 ns;
		d <= '0';
		WAIT;                                                        
	END PROCESS;                                          
END registrador1bit_arch;
