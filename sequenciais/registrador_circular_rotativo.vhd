LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY registrador_circular_rotativo IS
    PORT (
        clk, rst: IN STD_LOGIC;
        q0,q1,q2,q3: OUT std_logic
    );
END registrador_circular_rotativo;

ARCHITECTURE funcionamento OF registrador_circular_rotativo IS

SIGNAL interno0, interno1, interno2, interno3: STD_LOGIC;

BEGIN
    PROCESS (clk, rst)
    BEGIN
        IF (rst='1') THEN
            interno0 <=  '0'; interno1 <=  '0'; interno2 <=  '0'; interno3 <=  '1';
        ELSIF (clk'EVENT AND clk='1') THEN
            interno0 <= interno3;
            interno1 <= interno0;
            interno2 <= interno1;
            interno3 <= interno2;
        END IF;
    END PROCESS;
    q0 <= interno0;
    q1 <= interno1;
    q2 <= interno2;
    q3 <= interno3;

END funcionamento;
