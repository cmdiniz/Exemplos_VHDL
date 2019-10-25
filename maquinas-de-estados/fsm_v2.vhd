----------------------------------------------------------
-- Máquina de Estados Finitos 
-- Finite State Machine (FSM): primeiro exemplo versão 2
-- Máquina do tipo Mealy
-- Usa 2 processos para implementar a máquina
----------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------
ENTITY fsm_v2 IS
PORT (
	clk			: IN std_logic; -- clock (relogio)
	rst			: IN std_logic; -- reset
	entrada		: IN std_logic;
	saida		: OUT std_logic
);
END fsm_v2;
-----------------------------------------------

ARCHITECTURE rtl OF fsm_v2 IS

type tipo_estados is (PAR, IMPAR);

signal estado_atual, proximo_estado : tipo_estados;

BEGIN

-- Processo 1: registrador de estado
PROCESS(clk, rst)
BEGIN
	IF (rst = '1') THEN
		estado_atual <= PAR;
	ELSIF (clk'EVENT AND clk = '1') THEN
		estado_atual <= proximo_estado;
	END IF;
END PROCESS;
		
-- Processo 2: logicas de proximo estado e de saida
PROCESS(estado_atual, entrada)
BEGIN
   CASE estado_atual IS
      WHEN PAR =>
         CASE entrada IS
             WHEN '0' =>
                 proximo_estado <= PAR;
                 saida <= '1';
             WHEN OTHERS => 
                 proximo_estado <= IMPAR;
                 saida <= '0';
         END CASE;
       WHEN IMPAR =>
          CASE entrada IS
             WHEN '0' =>
                proximo_estado <= IMPAR;
                saida <= '0';
             WHEN OTHERS => 
                proximo_estado <= PAR;
                saida <= '1';
          END CASE;
   END CASE;
END PROCESS;
		
END rtl;
-----------------------------------------------
