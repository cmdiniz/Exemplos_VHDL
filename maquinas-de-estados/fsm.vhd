----------------------------------------------------------
-- Máquina de Estados Finitos 
-- Finite State Machine (FSM): primeiro exemplo
-- Máquina do tipo Mealy
-- Usa 3 processos para implementar a máquina
----------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------
ENTITY fsm IS
PORT (
	clk		: IN std_logic; -- clock (relogio)
	rst		: IN std_logic; -- reset
	entrada		: IN std_logic;
	saida		: OUT std_logic
);
END fsm;
-----------------------------------------------

ARCHITECTURE rtl OF fsm IS

type tipo_estados is (PAR, IMPAR);

signal estado_atual, proximo_estado : tipo_estados;

BEGIN

-- Processo 1: registrador de estado
PROCESS(clk, rst)
BEGIN
	IF (rst = '1') THEN                     -- reset assincrono ativo em '1'
		estado_atual <= PAR;            -- estado inicial PAR
	ELSIF (clk'EVENT AND clk = '1') THEN    -- na borda de subida do relogio
		estado_atual <= proximo_estado; -- estado atual eh atualizado com o proximo estado
	END IF;
END PROCESS;

-- Processo 2: logica de proximo estado
PROCESS(estado_atual, entrada)
BEGIN
   CASE estado_atual IS
      WHEN PAR =>
         CASE entrada IS
            WHEN '0' 	=> proximo_estado <= PAR;
            WHEN OTHERS => proximo_estado <= IMPAR; -- WHEN '1', usa-se OTHERS por causa do std_logic
         END CASE;
      WHEN IMPAR =>
         CASE entrada IS
            WHEN '0' 	=> proximo_estado <= IMPAR;
            WHEN OTHERS => proximo_estado <= PAR; -- WHEN '1', usa-se OTHERS por causa do std_logic
         END CASE;
    END CASE;
END PROCESS;

-- Processo 3: logica de saida
PROCESS(estado_atual, proximo_estado, entrada)
BEGIN
   CASE estado_atual IS
      WHEN PAR =>
          CASE entrada IS
             WHEN '0' 	=> saida <= '1';
             WHEN OTHERS => saida <= '0';	-- WHEN '1', usa-se OTHERS por causa do std_logic
          END CASE;
      WHEN IMPAR =>
          CASE entrada IS
             WHEN '0' 	=> saida <= '0';
             WHEN OTHERS => saida <= '1';	-- WHEN '1', usa-se OTHERS por causa do std_logic
          END CASE;
    END CASE;
END PROCESS;
		
END rtl;
-----------------------------------------------
