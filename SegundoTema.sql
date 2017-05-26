/*
En este segundo tema veremos como se guardan los registro usando
un procedimiento almacenado, pero antes veremos lo que es
un bloque PL SQL
*/

--ESTRUCTURA BASICA DE UN BLOQUE PL SQL
SET SERVEROUTPUT ON;
DECLARE
MENSAJE VARCHAR2(80);
BEGIN
MENSAJE:='HOLA';
DBMS_OUTPUT.PUT_LINE(MENSAJE);
DBMS_OUTPUT.PUT_LINE('MUNDO');
END;
/