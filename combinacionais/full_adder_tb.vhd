LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY full_adder_tb IS
END full_adder_tb;

ARCHITECTURE full_adder_arch OF full_adder_tb IS

SIGNAL a, b, cin, cout, s : STD_LOGIC;

COMPONENT full_adder
PORT (
	cin, a, b : IN STD_LOGIC;
	s, cout : OUT STD_LOGIC
  );
END COMPONENT;

BEGIN
	i1 : full_adder
	PORT MAP ( a => a, b => b, cin => cin, cout => cout, s => s	);

init : PROCESS                                               

BEGIN  
	a <= '0';
	b <= '0';
	cin <= '0';
	
	wait for 10 ns;
	
	a <= '1';
	b <= '0';
	cin <= '0';
	
	wait for 10 ns;
	
	a <= '0';
	b <= '1';
	cin <= '0';
	
	wait for 10 ns;	
	
	a <= '1';
	b <= '1';
	cin <= '0';
	
	wait for 10 ns;
	
	a <= '0';
	b <= '0';
	cin <= '1';
	
	wait for 10 ns;

	a <= '1';
	b <= '0';
	cin <= '1';

	wait for 10 ns;

	a <= '0';
	b <= '1';
	cin <= '1';

	wait for 10 ns;

	a <= '1';
	b <= '1';
	cin <= '1';
	
	assert false report "Fim do teste";
	wait;
	
END PROCESS init;                                          

END full_adder_arch;
